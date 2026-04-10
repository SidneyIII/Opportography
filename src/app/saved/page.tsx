'use client'

import Link from 'next/link'
import { useEffect, useState, useCallback } from 'react'
import { useSaved } from '@/lib/saved-context'
import { supabase } from '@/lib/supabase'
import { Opportunity } from '@/lib/types'
import { OpportunityCard } from '@/components/OpportunityCard'
import { TypeBadge } from '@/components/TypeBadge'

type SortMode = 'date' | 'score' | 'starred'
type ViewMode = 'list' | 'tracker'
type AppStatus = 'saved' | 'in_progress' | 'submitted' | 'accepted' | 'declined' | 'waitlisted'

interface SavedItem {
  id: string
  opportunity_id: string
  saved_at: string
  match_score: number | null
  match_reasoning: string | null
  starred: boolean
  status: AppStatus
  custom_deadline: string | null
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

const STATUS_COLUMNS: { key: AppStatus[]; label: string; color: string }[] = [
  { key: ['saved'], label: 'Saved', color: 'text-slate-400' },
  { key: ['in_progress'], label: 'In Progress', color: 'text-cyan-400' },
  { key: ['submitted', 'accepted', 'declined', 'waitlisted'], label: 'Done', color: 'text-emerald-400' },
]

const STATUS_OPTIONS: { value: AppStatus; label: string }[] = [
  { value: 'saved', label: 'Saved' },
  { value: 'in_progress', label: 'In Progress' },
  { value: 'submitted', label: 'Submitted' },
  { value: 'accepted', label: 'Accepted' },
  { value: 'declined', label: 'Declined' },
  { value: 'waitlisted', label: 'Waitlisted' },
]


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

function DeadlineBadge({ deadline, customDeadline }: { deadline: string | null; customDeadline: string | null }) {
  const raw = customDeadline ?? deadline
  if (!raw) return null
  const d = new Date(raw)
  const today = new Date()
  today.setHours(0, 0, 0, 0)
  const daysUntil = Math.ceil((d.getTime() - today.getTime()) / (1000 * 60 * 60 * 24))
  if (daysUntil < 0) return <span className="text-xs text-slate-600">Passed</span>
  const cls = daysUntil <= 7
    ? 'bg-rose-400/10 text-rose-400 border-rose-400/25'
    : daysUntil <= 14
      ? 'bg-amber-400/10 text-amber-400 border-amber-400/25'
      : 'bg-slate-400/10 text-slate-400 border-slate-400/20'
  const label = daysUntil === 0 ? 'Today!' : daysUntil === 1 ? '1 day left' : `${daysUntil} days left`
  return (
    <span className={`inline-flex items-center rounded-full border px-2 py-0.5 text-xs font-medium ${cls}`}>
      {label}
    </span>
  )
}

function DeadlineUrgencyBanner({ items }: { items: SavedItem[] }) {
  const today = new Date()
  today.setHours(0, 0, 0, 0)
  const in14 = new Date(today)
  in14.setDate(today.getDate() + 14)

  const urgent = items
    .filter((item) => {
      const raw = item.custom_deadline ?? item.opportunities?.deadline ?? null
      if (!raw) return false
      const d = new Date(raw)
      return d >= today && d <= in14 && !['submitted', 'accepted', 'declined'].includes(item.status)
    })
    .sort((a, b) => {
      const da = new Date(a.custom_deadline ?? a.opportunities?.deadline ?? '').getTime()
      const db = new Date(b.custom_deadline ?? b.opportunities?.deadline ?? '').getTime()
      return da - db
    })

  if (urgent.length === 0) return null

  return (
    <div className="mb-6 rounded-xl border border-amber-400/30 bg-amber-400/5 px-4 py-3">
      <div className="flex items-start gap-3">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" className="mt-0.5 h-4 w-4 shrink-0 text-amber-400">
          <path strokeLinecap="round" strokeLinejoin="round" d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126ZM12 15.75h.007v.008H12v-.008Z" />
        </svg>
        <div className="flex-1 space-y-1">
          {urgent.map((item) => {
            const opp = item.opportunities
            const raw = item.custom_deadline ?? opp?.deadline ?? ''
            const daysUntil = Math.ceil((new Date(raw).getTime() - today.getTime()) / (1000 * 60 * 60 * 24))
            const label = daysUntil === 0 ? 'closes today' : daysUntil === 1 ? 'closes tomorrow' : `closes in ${daysUntil} days`
            return (
              <p key={item.id} className="text-sm text-amber-300">
                <span className="font-semibold">{opp?.title ?? 'Opportunity'}</span>
                {' '}
                <span className="text-amber-400/70">{label}</span>
              </p>
            )
          })}
        </div>
      </div>
    </div>
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
  onStatusChange: (opportunityId: string, status: AppStatus) => void
}) {
  const opp = item.opportunities
  if (!opp) return null

  return (
    <div className="group relative rounded-xl border border-navy-600 bg-navy-800 p-5 transition-all hover:border-cyan-400/40">
      <div className="mb-3 flex items-start justify-between gap-3">
        <div className="flex flex-wrap items-center gap-2">
          {item.match_score != null && <ScoreBadge score={Math.round(item.match_score)} />}
          <TypeBadge type={opp.type as Parameters<typeof TypeBadge>[0]['type']} />
        </div>
        <DeadlineBadge deadline={opp.deadline} customDeadline={item.custom_deadline} />
      </div>

      <Link href={`/opportunities/${opp.id}`}>
        <h3 className="font-display text-base font-semibold text-slate-100 transition-colors group-hover:text-cyan-400">
          {opp.title}
        </h3>
      </Link>
      <p className="mt-0.5 text-sm text-slate-500">{opp.organization}</p>

      {item.match_reasoning && (
        <p className="mt-3 line-clamp-2 text-sm italic leading-relaxed text-slate-400">
          &ldquo;{item.match_reasoning}&rdquo;
        </p>
      )}

      <div className="mt-3 flex flex-wrap items-center gap-3 text-xs text-slate-500">
        <span>{opp.location}</span>
        {(opp.deadline || item.custom_deadline) && (
          <span>Due {new Date(item.custom_deadline ?? opp.deadline!).toLocaleDateString()}</span>
        )}
      </div>

      <div className="mt-4 flex items-center justify-between border-t border-navy-600 pt-3">
        <button
          onClick={() => onToggleStar(opp.id, !item.starred)}
          className={`flex items-center gap-1.5 rounded-lg px-2.5 py-1.5 text-xs font-medium transition-colors ${
            item.starred ? 'text-amber-400 hover:text-amber-300' : 'text-slate-500 hover:text-slate-300'
          }`}
        >
          <StarIcon filled={item.starred} />
          {item.starred ? 'Starred' : 'Star'}
        </button>
        <div className="flex items-center gap-3">
          <Link href={`/opportunities/${opp.id}`} className="text-xs font-medium text-cyan-400 hover:text-cyan-300">
            View &rarr;
          </Link>
          <button onClick={() => onUnsave(opp.id)} className="text-xs text-slate-600 transition-colors hover:text-rose-400">
            Remove
          </button>
        </div>
      </div>
    </div>
  )
}

function TrackerCard({
  item,
  onUnsave,
  onToggleStar,
  onStatusChange,
}: {
  item: SavedItem
  onUnsave: (opportunityId: string) => void
  onToggleStar: (opportunityId: string, starred: boolean) => void
  onStatusChange: (opportunityId: string, status: AppStatus) => void
}) {
  const opp = item.opportunities
  if (!opp) return null

  return (
    <div className="rounded-xl border border-navy-600 bg-navy-800 p-4 transition-all hover:border-cyan-400/30">
      <div className="mb-2 flex items-center justify-between gap-2">
        <TypeBadge type={opp.type as Parameters<typeof TypeBadge>[0]['type']} />
        <DeadlineBadge deadline={opp.deadline} customDeadline={item.custom_deadline} />
      </div>

      <Link href={`/opportunities/${opp.id}`}>
        <h3 className="font-display text-sm font-semibold text-slate-100 leading-snug transition-colors hover:text-cyan-400">
          {opp.title}
        </h3>
      </Link>
      <p className="mt-0.5 text-xs text-slate-500">{opp.organization}</p>

      {item.match_score != null && (
        <div className="mt-2">
          <ScoreBadge score={Math.round(item.match_score)} />
        </div>
      )}

      <div className="mt-3 flex items-center justify-between gap-2">
        <select
          value={item.status}
          onChange={(e) => onStatusChange(opp.id, e.target.value as AppStatus)}
          className="flex-1 rounded-lg border border-navy-600 bg-navy-900 px-2 py-1.5 text-xs text-slate-300 outline-none focus:border-cyan-400/50"
        >
          {STATUS_OPTIONS.map((opt) => (
            <option key={opt.value} value={opt.value}>{opt.label}</option>
          ))}
        </select>
        <button
          onClick={() => onToggleStar(opp.id, !item.starred)}
          className={item.starred ? 'text-amber-400' : 'text-slate-600 hover:text-slate-400'}
        >
          <StarIcon filled={item.starred} />
        </button>
        <button onClick={() => onUnsave(opp.id)} className="text-slate-600 hover:text-rose-400 transition-colors">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" className="h-3.5 w-3.5">
            <path strokeLinecap="round" strokeLinejoin="round" d="M6 18 18 6M6 6l12 12" />
          </svg>
        </button>
      </div>
    </div>
  )
}

export default function SavedPage() {
  const { savedIds, isAuthenticated, toggleSave } = useSaved()
  const [anonSaved, setAnonSaved] = useState<Opportunity[]>([])
  const [authSaved, setAuthSaved] = useState<SavedItem[]>([])
  const [loading, setLoading] = useState(true)
  const [sortMode, setSortMode] = useState<SortMode>('date')
  const [viewMode, setViewMode] = useState<ViewMode>('list')

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
      if (savedIds.length === 0) { setAnonSaved([]); setLoading(false); return }
      supabase
        .from('opportunities')
        .select('*')
        .in('id', savedIds)
        .eq('is_active', true)
        .then(({ data }) => { setAnonSaved((data as Opportunity[]) ?? []); setLoading(false) })
    }
  }, [isAuthenticated, savedIds, fetchAuthSaved])

  function handleUnsave(opportunityId: string) {
    toggleSave(opportunityId)
    if (isAuthenticated) setAuthSaved((prev) => prev.filter((s) => s.opportunity_id !== opportunityId))
  }

  async function handleToggleStar(opportunityId: string, starred: boolean) {
    setAuthSaved((prev) => prev.map((s) => s.opportunity_id === opportunityId ? { ...s, starred } : s))
    await fetch(`/api/saved?opportunity_id=${opportunityId}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ starred }),
    })
  }

  async function handleStatusChange(opportunityId: string, status: AppStatus) {
    setAuthSaved((prev) => prev.map((s) => s.opportunity_id === opportunityId ? { ...s, status } : s))
    await fetch(`/api/saved?opportunity_id=${opportunityId}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ status }),
    })
  }

  const activeItems = authSaved.filter((s) => s.opportunities?.is_active !== false)

  const sortedItems = [...activeItems].sort((a, b) => {
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
    return new Date(b.saved_at).getTime() - new Date(a.saved_at).getTime()
  })

  const hasItems = isAuthenticated ? authSaved.length > 0 : anonSaved.length > 0

  return (
    <div className="mx-auto max-w-6xl px-4 py-8">
      {/* Header */}
      <div className="mb-6 flex flex-wrap items-end justify-between gap-4">
        <div>
          <h1 className="font-display mb-1 text-2xl font-bold text-slate-50">Saved Opportunities</h1>
          <p className="text-sm text-slate-500">
            {isAuthenticated
              ? `${authSaved.length} saved${authSaved.filter((s) => s.starred).length > 0 ? ` — ${authSaved.filter((s) => s.starred).length} starred` : ''}`
              : 'Sign in to sync your saved list across devices.'}
          </p>
        </div>

        {isAuthenticated && authSaved.length > 0 && (
          <div className="flex items-center gap-2">
            {/* View toggle */}
            <div className="flex items-center gap-1 rounded-lg border border-navy-600 bg-navy-800 p-1">
              <button
                onClick={() => setViewMode('list')}
                className={`flex items-center gap-1.5 rounded-md px-3 py-1.5 text-xs font-medium transition-colors ${viewMode === 'list' ? 'bg-navy-700 text-slate-100' : 'text-slate-500 hover:text-slate-300'}`}
              >
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" className="h-3.5 w-3.5">
                  <path strokeLinecap="round" strokeLinejoin="round" d="M8.25 6.75h12M8.25 12h12m-12 5.25h12M3.75 6.75h.007v.008H3.75V6.75Zm.375 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0ZM3.75 12h.007v.008H3.75V12Zm.375 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Zm-.375 5.25h.007v.008H3.75v-.008Zm.375 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Z" />
                </svg>
                List
              </button>
              <button
                onClick={() => setViewMode('tracker')}
                className={`flex items-center gap-1.5 rounded-md px-3 py-1.5 text-xs font-medium transition-colors ${viewMode === 'tracker' ? 'bg-navy-700 text-slate-100' : 'text-slate-500 hover:text-slate-300'}`}
              >
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" className="h-3.5 w-3.5">
                  <path strokeLinecap="round" strokeLinejoin="round" d="M9 4.5v15m6-15v15m-10.875 0h15.75c.621 0 1.125-.504 1.125-1.125V5.625c0-.621-.504-1.125-1.125-1.125H4.125C3.504 4.5 3 5.004 3 5.625v12.75c0 .621.504 1.125 1.125 1.125Z" />
                </svg>
                Tracker
              </button>
            </div>

            {/* Sort controls — list view only */}
            {viewMode === 'list' && authSaved.length > 1 && (
              <div className="flex items-center gap-1 rounded-lg border border-navy-600 bg-navy-800 p-1">
                {(['date', 'score', 'starred'] as SortMode[]).map((mode) => (
                  <button
                    key={mode}
                    onClick={() => setSortMode(mode)}
                    className={`rounded-md px-3 py-1.5 text-xs font-medium transition-colors ${sortMode === mode ? 'bg-navy-700 text-slate-100' : 'text-slate-500 hover:text-slate-300'}`}
                  >
                    {mode === 'date' ? 'Date' : mode === 'score' ? 'Score' : 'Starred'}
                  </button>
                ))}
              </div>
            )}
          </div>
        )}
      </div>

      {loading ? (
        <div className="py-16 text-center text-sm text-slate-500">Loading...</div>
      ) : hasItems ? (
        isAuthenticated ? (
          <>
            <DeadlineUrgencyBanner items={activeItems} />

            {viewMode === 'list' ? (
              <div className="grid gap-4 sm:grid-cols-2">
                {sortedItems.map((item) => (
                  <SavedCard
                    key={item.id}
                    item={item}
                    onUnsave={handleUnsave}
                    onToggleStar={handleToggleStar}
                    onStatusChange={handleStatusChange}
                  />
                ))}
              </div>
            ) : (
              /* Tracker: 3-column kanban */
              <div className="grid gap-4 md:grid-cols-3">
                {STATUS_COLUMNS.map((col) => {
                  const colItems = activeItems.filter((item) => col.key.includes(item.status))
                  return (
                    <div key={col.label} className="rounded-xl border border-navy-600 bg-navy-900 p-4">
                      {/* Column header */}
                      <div className="mb-4 flex items-center justify-between">
                        <h2 className={`font-display text-sm font-semibold ${col.color}`}>{col.label}</h2>
                        <span className="rounded-full bg-navy-800 px-2 py-0.5 text-xs text-slate-500">
                          {colItems.length}
                        </span>
                      </div>
                      {/* Cards */}
                      <div className="space-y-3">
                        {colItems.length === 0 ? (
                          <p className="py-6 text-center text-xs text-slate-700">No opportunities here yet</p>
                        ) : (
                          colItems.map((item) => (
                            <TrackerCard
                              key={item.id}
                              item={item}
                              onUnsave={handleUnsave}
                              onToggleStar={handleToggleStar}
                              onStatusChange={handleStatusChange}
                            />
                          ))
                        )}
                      </div>
                    </div>
                  )
                })}
              </div>
            )}
          </>
        ) : (
          <div className="grid gap-4 sm:grid-cols-2">
            {anonSaved.map((opp) => (
              <OpportunityCard key={opp.id} opportunity={opp} />
            ))}
          </div>
        )
      ) : (
        <div className="rounded-xl border border-navy-600 bg-navy-800 px-6 py-16 text-center">
          <p className="font-display text-lg font-medium text-slate-200">No saved opportunities yet</p>
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
