'use client'

import Link from 'next/link'
import { useEffect, useState, useCallback } from 'react'
import { useSaved } from '@/lib/saved-context'
import { supabase } from '@/lib/supabase'
import { Opportunity } from '@/lib/types'
import { OpportunityCard } from '@/components/OpportunityCard'
import { TypeBadge } from '@/components/TypeBadge'

type SortMode = 'date' | 'score' | 'starred'

interface SavedItem {
  id: string
  opportunity_id: string
  saved_at: string
  match_score: number | null
  match_reasoning: string | null
  starred: boolean
  opportunities: {
    id: string
    title: string
    organization: string
    type: string
    deadline: string | null
    location: string
    is_active: boolean
  } | null
}

function StarIcon({ filled }: { filled: boolean }) {
  return filled ? (
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" className="h-4 w-4">
      <path fillRule="evenodd" d="M10.788 3.21c.448-1.077 1.976-1.077 2.424 0l2.082 5.006 5.404.434c1.164.093 1.636 1.545.749 2.305l-4.117 3.527 1.257 5.273c.271 1.136-.964 2.033-1.96 1.425L12 18.354 7.373 21.18c-.996.608-2.231-.29-1.96-1.425l1.257-5.273-4.117-3.527c-.887-.76-.415-2.212.749-2.305l5.404-.434 2.082-5.005Z" clipRule="evenodd" />
    </svg>
  ) : (
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="h-4 w-4">
      <path strokeLinecap="round" strokeLinejoin="round" d="M11.48 3.499a.562.562 0 0 1 1.04 0l2.125 5.111a.563.563 0 0 0 .475.345l5.518.442c.499.04.701.663.321.988l-4.204 3.602a.563.563 0 0 0-.182.557l1.285 5.385a.562.562 0 0 1-.84.61l-4.725-2.885a.562.562 0 0 0-.586 0L6.982 20.54a.562.562 0 0 1-.84-.61l1.285-5.386a.562.562 0 0 0-.182-.557l-4.204-3.602a.562.562 0 0 1 .321-.988l5.518-.442a.563.563 0 0 0 .475-.345L11.48 3.5Z" />
    </svg>
  )
}

function ScoreBadge({ score }: { score: number }) {
  const cls =
    score >= 90
      ? 'bg-emerald-400/15 text-emerald-400 border-emerald-400/30'
      : score >= 75
        ? 'bg-cyan-400/15 text-cyan-400 border-cyan-400/30'
        : 'bg-slate-400/15 text-slate-400 border-slate-400/30'
  return (
    <span className={`inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold ${cls}`}>
      {score}% Match
    </span>
  )
}

function SavedCard({
  item,
  onUnsave,
  onToggleStar,
}: {
  item: SavedItem
  onUnsave: (opportunityId: string) => void
  onToggleStar: (opportunityId: string, starred: boolean) => void
}) {
  const opp = item.opportunities
  if (!opp) return null

  return (
    <div className="group relative rounded-xl border border-navy-600 bg-navy-800 p-5 transition-all hover:border-cyan-400/40">
      {/* Header */}
      <div className="mb-3 flex items-start justify-between gap-3">
        <div className="flex flex-wrap items-center gap-2">
          {item.match_score != null && <ScoreBadge score={Math.round(item.match_score)} />}
          <TypeBadge type={opp.type as Parameters<typeof TypeBadge>[0]['type']} />
        </div>
        {item.starred && (
          <span className="text-xs font-medium text-amber-400">Starred</span>
        )}
      </div>

      {/* Title */}
      <Link href={`/opportunities/${opp.id}`}>
        <h3 className="font-display text-base font-semibold text-slate-100 transition-colors group-hover:text-cyan-400">
          {opp.title}
        </h3>
      </Link>
      <p className="mt-0.5 text-sm text-slate-500">{opp.organization}</p>

      {/* Match reasoning */}
      {item.match_reasoning && (
        <p className="mt-3 line-clamp-2 text-sm italic leading-relaxed text-slate-400">
          &ldquo;{item.match_reasoning}&rdquo;
        </p>
      )}

      {/* Meta */}
      <div className="mt-3 flex flex-wrap items-center gap-3 text-xs text-slate-500">
        <span>{opp.location}</span>
        {opp.deadline && (
          <span>Due {new Date(opp.deadline).toLocaleDateString()}</span>
        )}
      </div>

      {/* Footer actions */}
      <div className="mt-4 flex items-center justify-between border-t border-navy-600 pt-3">
        <button
          onClick={() => onToggleStar(opp.id, !item.starred)}
          className={`flex items-center gap-1.5 rounded-lg px-2.5 py-1.5 text-xs font-medium transition-colors ${
            item.starred
              ? 'text-amber-400 hover:text-amber-300'
              : 'text-slate-500 hover:text-slate-300'
          }`}
          title={item.starred ? 'Unstar' : 'Star this opportunity'}
        >
          <StarIcon filled={item.starred} />
          {item.starred ? 'Starred' : 'Star'}
        </button>
        <div className="flex items-center gap-3">
          <Link
            href={`/opportunities/${opp.id}`}
            className="text-xs font-medium text-cyan-400 hover:text-cyan-300"
          >
            View Details &rarr;
          </Link>
          <button
            onClick={() => onUnsave(opp.id)}
            className="text-xs text-slate-600 transition-colors hover:text-rose-400"
            title="Remove from saved"
          >
            Remove
          </button>
        </div>
      </div>
    </div>
  )
}

export default function SavedPage() {
  const { savedIds, isAuthenticated, toggleSave } = useSaved()
  // Anonymous fallback state
  const [anonSaved, setAnonSaved] = useState<Opportunity[]>([])
  // Authenticated state
  const [authSaved, setAuthSaved] = useState<SavedItem[]>([])
  const [loading, setLoading] = useState(true)
  const [sortMode, setSortMode] = useState<SortMode>('date')

  // Fetch authenticated saved list
  const fetchAuthSaved = useCallback(async () => {
    const res = await fetch('/api/saved')
    if (res.ok) {
      const { saved } = await res.json()
      setAuthSaved(saved ?? [])
    }
    setLoading(false)
  }, [])

  useEffect(() => {
    if (isAuthenticated) {
      fetchAuthSaved()
    } else {
      // Anonymous: fetch by IDs from context
      if (savedIds.length === 0) {
        setAnonSaved([])
        setLoading(false)
        return
      }
      supabase
        .from('opportunities')
        .select('*')
        .in('id', savedIds)
        .eq('is_active', true)
        .then(({ data }) => {
          setAnonSaved((data as Opportunity[]) ?? [])
          setLoading(false)
        })
    }
  }, [isAuthenticated, savedIds, fetchAuthSaved])

  function handleUnsave(opportunityId: string) {
    toggleSave(opportunityId)
    if (isAuthenticated) {
      setAuthSaved((prev) => prev.filter((s) => s.opportunity_id !== opportunityId))
    }
  }

  async function handleToggleStar(opportunityId: string, starred: boolean) {
    // Optimistic update
    setAuthSaved((prev) =>
      prev.map((s) => (s.opportunity_id === opportunityId ? { ...s, starred } : s))
    )
    await fetch(`/api/saved?opportunity_id=${opportunityId}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ starred }),
    })
  }

  // Sort authenticated saved items
  const sortedAuthSaved = [...authSaved].sort((a, b) => {
    if (sortMode === 'starred') {
      if (a.starred !== b.starred) return a.starred ? -1 : 1
      return new Date(b.saved_at).getTime() - new Date(a.saved_at).getTime()
    }
    if (sortMode === 'score') {
      if (a.match_score == null && b.match_score == null) return 0
      if (a.match_score == null) return 1
      if (b.match_score == null) return -1
      return b.match_score - a.match_score
    }
    // date (default)
    return new Date(b.saved_at).getTime() - new Date(a.saved_at).getTime()
  })

  const hasItems = isAuthenticated ? authSaved.length > 0 : anonSaved.length > 0

  return (
    <div className="mx-auto max-w-6xl px-4 py-8">
      <div className="mb-6 flex flex-wrap items-end justify-between gap-4">
        <div>
          <h1 className="font-display mb-1 text-2xl font-bold text-slate-50">Saved Opportunities</h1>
          <p className="text-sm text-slate-500">
            {isAuthenticated
              ? `${authSaved.length} saved${authSaved.filter((s) => s.starred).length > 0 ? ` — ${authSaved.filter((s) => s.starred).length} starred` : ''}`
              : 'Sign in to sync your saved list across devices.'}
          </p>
        </div>

        {/* Sort controls — authenticated only */}
        {isAuthenticated && authSaved.length > 1 && (
          <div className="flex items-center gap-1 rounded-lg border border-navy-600 bg-navy-800 p-1">
            {(['date', 'score', 'starred'] as SortMode[]).map((mode) => (
              <button
                key={mode}
                onClick={() => setSortMode(mode)}
                className={`rounded-md px-3 py-1.5 text-xs font-medium transition-colors ${
                  sortMode === mode
                    ? 'bg-navy-700 text-slate-100'
                    : 'text-slate-500 hover:text-slate-300'
                }`}
              >
                {mode === 'date' ? 'Date Saved' : mode === 'score' ? 'Match Score' : 'Starred First'}
              </button>
            ))}
          </div>
        )}
      </div>

      {loading ? (
        <div className="py-16 text-center text-sm text-slate-500">Loading...</div>
      ) : hasItems ? (
        isAuthenticated ? (
          <div className="grid gap-4 sm:grid-cols-2">
            {sortedAuthSaved
              .filter((s) => s.opportunities?.is_active !== false)
              .map((item) => (
                <SavedCard
                  key={item.id}
                  item={item}
                  onUnsave={handleUnsave}
                  onToggleStar={handleToggleStar}
                />
              ))}
          </div>
        ) : (
          <div className="grid gap-4 sm:grid-cols-2">
            {anonSaved.map((opp) => (
              <OpportunityCard key={opp.id} opportunity={opp} />
            ))}
          </div>
        )
      ) : (
        <div className="rounded-xl border border-navy-600 bg-navy-800 px-6 py-16 text-center">
          <p className="font-display text-lg font-medium text-slate-200">
            No saved opportunities yet
          </p>
          <p className="mt-2 text-sm text-slate-500">
            Save opportunities from match results or while browsing — they&apos;ll appear here.
          </p>
          <Link
            href="/opportunities"
            className="mt-6 inline-block rounded-lg bg-cyan-400 px-6 py-3 text-sm font-semibold text-navy-950 transition-all hover:bg-cyan-300"
          >
            Browse Opportunities
          </Link>
        </div>
      )}
    </div>
  )
}
