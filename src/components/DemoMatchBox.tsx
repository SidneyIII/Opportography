'use client'

import { useState } from 'react'
import Link from 'next/link'
import { TypeBadge } from '@/components/TypeBadge'

interface MatchOpportunity {
  id: string
  title: string
  organization: string
  type: string
  location: string
  deadline: string | null
}

interface Match {
  opportunity_id: string
  score: number
  match_reason: string
  opportunity: MatchOpportunity
}

type State = 'idle' | 'loading' | 'results' | 'rate_limited' | 'already_used'

export function DemoMatchBox({ totalOpportunities }: { totalOpportunities: number }) {
  const [input, setInput] = useState('')
  const [state, setState] = useState<State>(() => {
    if (typeof window !== 'undefined' && sessionStorage.getItem('demo-used')) {
      return 'already_used'
    }
    return 'idle'
  })
  const [matches, setMatches] = useState<Match[]>([])
  const [error, setError] = useState<string | null>(null)

  async function handleSubmit(e?: React.FormEvent) {
    e?.preventDefault()
    if (!input.trim() || state === 'loading') return

    setState('loading')
    setError(null)

    try {
      const res = await fetch('/api/match/demo', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ input }),
      })

      const data = await res.json()

      if (res.status === 429) {
        setState('rate_limited')
        return
      }

      if (!res.ok) {
        setError(data.error ?? 'Something went wrong. Please try again.')
        setState('idle')
        return
      }

      setMatches(data.matches ?? [])
      setState('results')
      sessionStorage.setItem('demo-used', '1')
    } catch {
      setError('Something went wrong. Please try again.')
      setState('idle')
    }
  }

  if (state === 'already_used' || state === 'rate_limited') {
    return <SignupCTA reason={state === 'rate_limited' ? 'rate_limited' : 'session_used'} />
  }

  return (
    <div className="mx-auto max-w-3xl">
      <div className="mb-8 text-center">
        <h2 className="font-display text-3xl font-bold text-slate-50 md:text-4xl">
          Find Your Opportunity
        </h2>
        <p className="mt-3 text-slate-400">
          Describe who you are and what you&apos;re looking for. Our AI will match you with
          real, verified opportunities across Omaha &amp; Council Bluffs.
        </p>
      </div>

      {(state === 'idle' || state === 'loading') && (
        <form onSubmit={handleSubmit}>
          <div className="flex flex-col gap-3 sm:flex-row">
            <input
              type="text"
              value={input}
              onChange={(e) => setInput(e.target.value.substring(0, 500))}
              placeholder={`Search ${totalOpportunities}+ opportunities — e.g. I'm a student looking for STEM internships...`}
              disabled={state === 'loading'}
              className="flex-1 rounded-xl border border-navy-600 bg-navy-800 px-5 py-3.5 text-slate-100 placeholder-slate-500 transition-colors focus:border-cyan-400 focus:outline-none disabled:opacity-60"
            />
            <button
              type="submit"
              disabled={!input.trim() || state === 'loading'}
              className="rounded-xl bg-cyan-400 px-6 py-3.5 text-sm font-semibold text-navy-950 transition-all hover:bg-cyan-300 disabled:opacity-50 sm:whitespace-nowrap"
            >
              {state === 'loading' ? (
                <span className="flex items-center gap-2">
                  <span className="h-3.5 w-3.5 animate-spin rounded-full border-2 border-navy-900 border-t-transparent" />
                  Searching...
                </span>
              ) : (
                'Find Opportunities →'
              )}
            </button>
          </div>

          {error && (
            <p className="mt-3 text-sm text-rose-400">{error}</p>
          )}
        </form>
      )}

      {state === 'results' && matches.length > 0 && (
        <div className="mt-8">
          <p className="mb-4 text-sm text-slate-500">
            {matches.length} opportunit{matches.length !== 1 ? 'ies' : 'y'} matched to your search
          </p>
          <div className="space-y-4">
            {matches.map((match) => (
              <DemoMatchCard key={match.opportunity_id} match={match} />
            ))}
          </div>
          <SignupCTA reason="after_results" />
        </div>
      )}

      {state === 'results' && matches.length === 0 && (
        <div className="mt-8 text-center">
          <p className="text-slate-400">
            No strong matches found. Try describing your needs differently, or{' '}
            <Link href="/opportunities" className="text-cyan-400 hover:text-cyan-300">
              browse all opportunities
            </Link>
            .
          </p>
        </div>
      )}
    </div>
  )
}

function DemoMatchCard({ match }: { match: Match }) {
  const score = match.score
  const scoreColor =
    score >= 90
      ? 'bg-emerald-400/15 text-emerald-400 border-emerald-400/30'
      : score >= 75
        ? 'bg-cyan-400/15 text-cyan-400 border-cyan-400/30'
        : 'bg-slate-400/15 text-slate-400 border-slate-400/30'

  return (
    <div className="rounded-xl border border-navy-600 bg-navy-800 p-5">
      <div className="mb-3 flex flex-wrap items-center gap-2">
        <span className={`inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold ${scoreColor}`}>
          {score}% Match
        </span>
        <TypeBadge type={match.opportunity.type as Parameters<typeof TypeBadge>[0]['type']} />
      </div>

      <h4 className="font-display text-base font-semibold text-slate-100">
        {match.opportunity.title}
      </h4>
      <p className="mt-0.5 text-sm text-slate-500">{match.opportunity.organization}</p>

      <p className="mt-3 text-sm italic leading-relaxed text-slate-400">
        &ldquo;{match.match_reason}&rdquo;
      </p>

      <div className="mt-4 flex items-center justify-between">
        <div className="flex items-center gap-3 text-xs text-slate-500">
          <span>{match.opportunity.location}</span>
          {match.opportunity.deadline && (
            <span className="text-rose-400">
              Due {new Date(match.opportunity.deadline).toLocaleDateString()}
            </span>
          )}
        </div>
        <Link
          href={`/opportunities/${match.opportunity_id}`}
          className="text-xs font-medium text-cyan-400 transition-colors hover:text-cyan-300"
        >
          See Details →
        </Link>
      </div>
    </div>
  )
}

function SignupCTA({ reason }: { reason: 'after_results' | 'session_used' | 'rate_limited' }) {
  return (
    <div className="mt-6 rounded-xl border border-cyan-400/20 bg-cyan-400/5 p-6">
      <h4 className="font-display font-semibold text-slate-50">
        {reason === 'after_results'
          ? 'Want unlimited matches?'
          : reason === 'session_used'
            ? "You've used your free match for this session."
            : "You've reached the demo limit."}
      </h4>
      <p className="mb-4 mt-2 text-sm text-slate-400">
        Create a free account to unlock:
      </p>
      <ul className="mb-5 space-y-1.5">
        {[
          'Unlimited AI matching',
          'Personalized profile for better results',
          'Weekly match updates delivered to your inbox',
          'Deadline reminders so you never miss out',
          'Alerts when new opportunities match you',
        ].map((benefit) => (
          <li key={benefit} className="flex items-center gap-2 text-sm text-slate-300">
            <span className="text-cyan-400">+</span>
            {benefit}
          </li>
        ))}
      </ul>
      <Link
        href="/signup"
        className="block w-full rounded-lg bg-cyan-400 py-3 text-center text-sm font-semibold text-navy-950 transition-all hover:bg-cyan-300"
      >
        Create Free Account →
      </Link>
    </div>
  )
}
