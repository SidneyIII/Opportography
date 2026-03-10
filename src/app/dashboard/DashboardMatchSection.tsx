'use client'

import { useState, useEffect, useRef } from 'react'
import Link from 'next/link'
import { TypeBadge } from '@/components/TypeBadge'
import { useSaved } from '@/lib/saved-context'

interface MatchData {
  id: string
  opportunity: {
    id: string
    title: string
    organization: string
    type: string
    deadline: string | null
    location: string
  }
  match_score: number | null
  match_reasoning: string | null
  match_type: string | null
  generated_at: string | null
}

interface FreshMatch {
  opportunity_id: string
  score: number
  match_reason: string
  opportunity: {
    id: string
    title: string
    organization: string
    type: string
    deadline: string | null
    location: string
  }
}

export function DashboardMatchSection({ initialMatches }: { initialMatches: MatchData[] }) {
  const [matches] = useState<MatchData[]>(initialMatches)
  const [freshMatches, setFreshMatches] = useState<FreshMatch[]>([])
  const [loading, setLoading] = useState(false)
  const [progress, setProgress] = useState(0)
  const [error, setError] = useState<string | null>(null)
  const [dismissed, setDismissed] = useState<Set<string>>(new Set())
  const [searchContext, setSearchContext] = useState('')
  const progressRef = useRef<ReturnType<typeof setInterval> | null>(null)

  useEffect(() => {
    if (loading) {
      setProgress(0)
      let current = 0
      progressRef.current = setInterval(() => {
        // Fast at first, then slow down as it approaches 85%
        const increment = current < 30 ? 4 : current < 60 ? 2 : current < 80 ? 0.5 : 0.1
        current = Math.min(current + increment, 85)
        setProgress(current)
      }, 200)
    } else {
      if (progressRef.current) clearInterval(progressRef.current)
      if (progress > 0) {
        setProgress(100)
        setTimeout(() => setProgress(0), 600)
      }
    }
    return () => { if (progressRef.current) clearInterval(progressRef.current) }
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [loading])

  async function runNewMatch() {
    setLoading(true)
    setError(null)
    const res = await fetch('/api/match/user', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ search_context: searchContext.trim() || undefined }),
    })
    const data = await res.json()

    if (!res.ok) {
      setError(data.message ?? data.error ?? 'Something went wrong.')
      setLoading(false)
      return
    }

    setFreshMatches(data.matches ?? [])
    setLoading(false)
  }

  function handleDismiss(opportunityId: string) {
    setDismissed((prev) => new Set([...prev, opportunityId]))
  }

  const displayMatches = freshMatches.length > 0 ? freshMatches : null
  const visibleInitial = matches.filter((m) => !dismissed.has(m.opportunity.id))

  return (
    <section className="mb-8">
      <h2 className="font-display mb-4 text-lg font-bold text-slate-50">Your Top Matches</h2>

      {/* Progress bar */}
      {progress > 0 && (
        <div className="mb-4 overflow-hidden rounded-full bg-navy-700" style={{ height: 4 }}>
          <div
            className="h-full rounded-full bg-cyan-400 transition-all"
            style={{
              width: `${progress}%`,
              transitionDuration: progress === 100 ? '300ms' : '200ms',
            }}
          />
        </div>
      )}
      {loading && (
        <p className="mb-4 text-xs text-slate-500 animate-pulse">
          Searching {searchContext.trim() ? `for "${searchContext.trim()}"` : 'across all opportunities'} — this usually takes 20–30 seconds...
        </p>
      )}

      {/* Search context + submit */}
      <div className="mb-6 rounded-xl border border-navy-600 bg-navy-800 p-4">
        <p className="mb-1 text-sm font-semibold text-slate-200">What are you looking for?</p>
        <p className="mb-3 text-xs text-slate-500">
          Type a question or description — Claude will find matching verified opportunities without changing your profile.
        </p>
        <div className="flex gap-2">
          <div className="relative flex-1">
            <div className="pointer-events-none absolute left-3 top-1/2 -translate-y-1/2 text-slate-500">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="h-4 w-4">
                <path strokeLinecap="round" strokeLinejoin="round" d="m21 21-5.197-5.197m0 0A7.5 7.5 0 1 0 5.196 15.803a7.5 7.5 0 0 0 10.607 0Z" />
              </svg>
            </div>
            <input
              type="text"
              value={searchContext}
              onChange={(e) => setSearchContext(e.target.value.substring(0, 500))}
              onKeyDown={(e) => { if (e.key === 'Enter' && !loading) runNewMatch() }}
              placeholder="e.g. free evening programs, coding classes for teens..."
              className="w-full rounded-lg border border-navy-600 bg-navy-900 py-2.5 pl-9 pr-4 text-sm text-slate-100 placeholder-slate-500 transition-all focus:border-cyan-400 focus:outline-none"
            />
          </div>
          <button
            onClick={runNewMatch}
            disabled={loading}
            className="rounded-lg bg-cyan-400 px-5 py-2 text-sm font-semibold text-navy-950 transition-all hover:bg-cyan-300 disabled:opacity-60 whitespace-nowrap"
          >
            {loading ? (
              <span className="flex items-center gap-2">
                <span className="h-3 w-3 animate-spin rounded-full border-2 border-navy-900 border-t-transparent" />
                Matching...
              </span>
            ) : (
              'Find Matches'
            )}
          </button>
        </div>
        {searchContext.length > 0 && (
          <div className="mt-1.5 flex items-center justify-between">
            <span className="text-xs text-slate-600">{searchContext.length}/500</span>
            <button
              type="button"
              onClick={() => setSearchContext('')}
              className="text-xs text-slate-600 hover:text-slate-400"
            >
              Clear
            </button>
          </div>
        )}
      </div>

      {error && (
        <p className="mb-4 rounded-lg border border-rose-400/30 bg-rose-400/10 px-4 py-3 text-sm text-rose-400">
          {error}
        </p>
      )}

      {displayMatches && (
        <div className="mb-6">
          <p className="mb-3 text-xs text-slate-500">
            Just matched — {displayMatches.length} results
          </p>
          <div className="grid gap-4 sm:grid-cols-2">
            {displayMatches
              .filter((m) => !dismissed.has(m.opportunity_id))
              .map((m, i) => (
                <FreshMatchCard
                  key={m.opportunity_id}
                  match={m}
                  rank={i + 1}
                  onDismiss={handleDismiss}
                />
              ))}
          </div>
        </div>
      )}

      {!displayMatches && visibleInitial.length > 0 && (
        <div className="grid gap-4 sm:grid-cols-2">
          {visibleInitial.slice(0, 10).map((m, i) => (
            <StoredMatchCard
              key={m.id}
              match={m}
              rank={i + 1}
              onDismiss={handleDismiss}
            />
          ))}
        </div>
      )}

      {!displayMatches && visibleInitial.length === 0 && (
        <div className="rounded-xl border border-navy-600 bg-navy-800 px-6 py-12 text-center">
          <p className="font-display text-lg font-medium text-slate-200">No matches yet</p>
          <p className="mt-1 text-sm text-slate-500">
            Click &ldquo;Run New Match&rdquo; to find opportunities tailored to your profile.
          </p>
        </div>
      )}
    </section>
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

function BookmarkIcon({ filled }: { filled: boolean }) {
  return filled ? (
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" className="h-4 w-4">
      <path fillRule="evenodd" d="M6.32 2.577a49.255 49.255 0 0 1 11.36 0c1.497.174 2.57 1.46 2.57 2.93V21a.75.75 0 0 1-1.085.67L12 18.089l-7.165 3.583A.75.75 0 0 1 3.75 21V5.507c0-1.47 1.073-2.756 2.57-2.93Z" clipRule="evenodd" />
    </svg>
  ) : (
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="h-4 w-4">
      <path strokeLinecap="round" strokeLinejoin="round" d="M17.593 3.322c1.1.128 1.907 1.077 1.907 2.185V21L12 17.25 4.5 21V5.507c0-1.108.806-2.057 1.907-2.185a48.507 48.507 0 0 1 11.186 0Z" />
    </svg>
  )
}

function FreshMatchCard({
  match,
  onDismiss,
}: {
  match: FreshMatch
  rank: number
  onDismiss: (id: string) => void
}) {
  const { isSaved, toggleSave } = useSaved()
  const saved = isSaved(match.opportunity_id)

  return (
    <div className="group relative rounded-xl border border-navy-600 bg-navy-800 p-5 transition-all hover:border-cyan-400/40">
      <div className="mb-3 flex items-start justify-between gap-3">
        <div className="flex flex-wrap items-center gap-2">
          <ScoreBadge score={match.score} />
          <TypeBadge type={match.opportunity.type as Parameters<typeof TypeBadge>[0]['type']} />
        </div>
        <div className="flex items-center gap-1.5">
          <button
            onClick={() =>
              toggleSave(match.opportunity_id, {
                match_score: match.score,
                match_reasoning: match.match_reason,
              })
            }
            className={`rounded-lg p-1.5 transition-colors hover:bg-navy-700 ${
              saved ? 'text-cyan-400' : 'text-slate-600 hover:text-slate-400'
            }`}
            title={saved ? 'Remove from saved' : 'Save this match'}
          >
            <BookmarkIcon filled={saved} />
          </button>
          <button
            onClick={() => onDismiss(match.opportunity_id)}
            className="text-slate-600 transition-colors hover:text-slate-400"
            title="Dismiss"
          >
            &#x2715;
          </button>
        </div>
      </div>
      <Link href={`/opportunities/${match.opportunity_id}`}>
        <h3 className="font-display text-base font-semibold text-slate-100 transition-colors group-hover:text-cyan-400">
          {match.opportunity.title}
        </h3>
      </Link>
      <p className="mt-0.5 text-sm text-slate-500">{match.opportunity.organization}</p>
      {match.match_reason && (
        <p className="mt-3 text-sm italic leading-relaxed text-slate-400">
          &ldquo;{match.match_reason}&rdquo;
        </p>
      )}
      <div className="mt-4 flex items-center justify-between">
        <span className="text-xs text-slate-500">{match.opportunity.location}</span>
        <Link
          href={`/opportunities/${match.opportunity_id}`}
          className="text-xs font-medium text-cyan-400 hover:text-cyan-300"
        >
          View Details &rarr;
        </Link>
      </div>
    </div>
  )
}

function StoredMatchCard({
  match,
  onDismiss,
}: {
  match: MatchData
  rank: number
  onDismiss: (id: string) => void
}) {
  const { isSaved, toggleSave } = useSaved()
  const score = match.match_score ?? 0
  const saved = isSaved(match.opportunity.id)

  return (
    <div className="group relative rounded-xl border border-navy-600 bg-navy-800 p-5 transition-all hover:border-cyan-400/40">
      <div className="mb-3 flex items-start justify-between gap-3">
        <div className="flex flex-wrap items-center gap-2">
          <ScoreBadge score={Math.round(score)} />
          <TypeBadge type={match.opportunity.type as Parameters<typeof TypeBadge>[0]['type']} />
        </div>
        <div className="flex items-center gap-1.5">
          <button
            onClick={() =>
              toggleSave(match.opportunity.id, {
                match_score: Math.round(score),
                match_reasoning: match.match_reasoning ?? undefined,
              })
            }
            className={`rounded-lg p-1.5 transition-colors hover:bg-navy-700 ${
              saved ? 'text-cyan-400' : 'text-slate-600 hover:text-slate-400'
            }`}
            title={saved ? 'Remove from saved' : 'Save this match'}
          >
            <BookmarkIcon filled={saved} />
          </button>
          <button
            onClick={() => onDismiss(match.opportunity.id)}
            className="text-slate-600 transition-colors hover:text-slate-400"
            title="Dismiss"
          >
            &#x2715;
          </button>
        </div>
      </div>
      <Link href={`/opportunities/${match.opportunity.id}`}>
        <h3 className="font-display text-base font-semibold text-slate-100 transition-colors group-hover:text-cyan-400">
          {match.opportunity.title}
        </h3>
      </Link>
      <p className="mt-0.5 text-sm text-slate-500">{match.opportunity.organization}</p>
      {match.match_reasoning && (
        <p className="mt-3 text-sm italic leading-relaxed text-slate-400">
          &ldquo;{match.match_reasoning}&rdquo;
        </p>
      )}
      <div className="mt-4 flex items-center justify-between">
        <span className="text-xs text-slate-500">{match.opportunity.location}</span>
        <Link
          href={`/opportunities/${match.opportunity.id}`}
          className="text-xs font-medium text-cyan-400 hover:text-cyan-300"
        >
          View Details &rarr;
        </Link>
      </div>
    </div>
  )
}
