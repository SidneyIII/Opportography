'use client'

import Link from 'next/link'
import { TypeBadge } from '@/components/TypeBadge'
import type { MatchResult } from '@/lib/matching-engine'

interface MatchCardProps {
  match: MatchResult
  rank?: number
  onDismiss?: (opportunityId: string) => void
}

export function MatchCard({ match, rank, onDismiss }: MatchCardProps) {
  const { opportunity, score, match_reason } = match

  const scoreColor =
    score >= 90
      ? 'bg-emerald-400/15 text-emerald-400 border-emerald-400/30'
      : score >= 75
        ? 'bg-cyan-400/15 text-cyan-400 border-cyan-400/30'
        : 'bg-slate-400/15 text-slate-400 border-slate-400/30'

  async function handleFeedback(dismissed: boolean) {
    if (dismissed && onDismiss) {
      onDismiss(opportunity.id)
    }
    // Fire-and-forget feedback update
    fetch(`/api/match/${opportunity.id}/feedback`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ dismissed }),
    }).catch(() => {})
  }

  return (
    <div className="group relative rounded-xl border border-navy-600 bg-navy-800 p-5 transition-all hover:border-cyan-400/40">
      {/* Header row */}
      <div className="mb-3 flex items-start justify-between gap-3">
        <div className="flex flex-wrap items-center gap-2">
          <span
            className={`inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold ${scoreColor}`}
          >
            {score}% Match
          </span>
          <TypeBadge type={opportunity.type as Parameters<typeof TypeBadge>[0]['type']} />
        </div>
        {onDismiss && (
          <button
            onClick={() => handleFeedback(true)}
            className="text-slate-600 transition-colors hover:text-slate-400"
            title="Not for me"
            aria-label="Dismiss this match"
          >
            ✕
          </button>
        )}
      </div>

      {/* Title & org */}
      <Link href={`/opportunities/${opportunity.id}`}>
        <h3 className="font-display text-base font-semibold text-slate-100 transition-colors group-hover:text-cyan-400">
          {opportunity.title}
        </h3>
      </Link>
      <p className="mt-0.5 text-sm text-slate-500">{opportunity.organization}</p>

      {/* Match reasoning */}
      {match_reason && (
        <p className="mt-3 text-sm italic leading-relaxed text-slate-400">
          &ldquo;{match_reason}&rdquo;
        </p>
      )}

      {/* Footer */}
      <div className="mt-4 flex items-center justify-between">
        <div className="flex items-center gap-3 text-xs text-slate-500">
          <span>{opportunity.location}</span>
          {opportunity.deadline && (
            <span>Due {new Date(opportunity.deadline).toLocaleDateString()}</span>
          )}
        </div>
        <Link
          href={`/opportunities/${opportunity.id}`}
          className="text-xs font-medium text-cyan-400 transition-colors hover:text-cyan-300"
        >
          View Details →
        </Link>
      </div>
    </div>
  )
}
