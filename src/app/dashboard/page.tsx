import { redirect } from 'next/navigation'
import Link from 'next/link'
import { createSupabaseServerClient, createSupabaseServiceClient } from '@/lib/supabase-server'
import { OpportunityCard } from '@/components/OpportunityCard'
import { ProfileCompleteness } from '@/components/ProfileCompleteness'
import { DashboardMatchSection } from './DashboardMatchSection'
import { ChatPanel } from '@/components/ChatPanel'
import type { Opportunity } from '@/lib/types'

export default async function DashboardPage() {
  const supabase = await createSupabaseServerClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) redirect('/login')

  const service = createSupabaseServiceClient()

  // Fetch profile, recent matches, saved opportunities, and upcoming deadlines in parallel
  const [profileResult, matchesResult, savedResult] = await Promise.all([
    service.from('user_profiles').select('*').eq('id', user.id).single(),
    service
      .from('match_results')
      .select(`
        id, match_score, match_reasoning, match_type, generated_at, dismissed,
        opportunities (
          id, title, organization, type, deadline, link, location,
          identity_tags, category_tags, is_active
        )
      `)
      .eq('user_id', user.id)
      .eq('dismissed', false)
      .order('generated_at', { ascending: false })
      .order('match_score', { ascending: false })
      .limit(15),
    service
      .from('saved_opportunities')
      .select(`
        opportunity_id,
        opportunities (
          id, title, organization, type, deadline, link, location,
          identity_tags, category_tags, is_active
        )
      `)
      .eq('user_id', user.id)
      .order('saved_at', { ascending: false })
      .limit(6),
  ])

  type MatchOpp = { id: string; title: string; organization: string; type: string; deadline: string | null; location: string }

  const profile = profileResult.data
  const allMatches = (matchesResult.data ?? []).filter((m) => m.opportunities)

  // Deduplicate: keep highest score per opportunity
  const seenOpportunityIds = new Set<string>()
  const topMatches = allMatches.filter((m) => {
    const opp = (m.opportunities as unknown) as MatchOpp | null
    if (!opp || seenOpportunityIds.has(opp.id)) return false
    seenOpportunityIds.add(opp.id)
    return true
  })

  const savedOpportunities = (savedResult.data ?? [])
    .map((r) => (r.opportunities as unknown) as Opportunity | null)
    .filter(Boolean) as Opportunity[]

  // Upcoming deadlines from matches (next 14 days)
  const today = new Date()
  const in14Days = new Date(today)
  in14Days.setDate(today.getDate() + 14)

  const upcomingDeadlines = topMatches.filter((m) => {
    const opp = (m.opportunities as unknown) as MatchOpp | null
    if (!opp?.deadline) return false
    const d = new Date(opp.deadline)
    return d >= today && d <= in14Days
  })

  const hasMatches = topMatches.length > 0
  const firstName = profile?.first_name ?? 'there'

  return (
    <div className="mx-auto max-w-6xl px-4 py-8">
      {/* Header */}
      <div className="mb-8 flex items-center justify-between">
        <div>
          <h1 className="font-display text-2xl font-bold text-slate-50">
            Welcome back, {firstName}
          </h1>
          <p className="mt-1 text-sm text-slate-500">
            {hasMatches
              ? `${topMatches.length} opportunities matched to your profile`
              : 'Run your first match to get personalized results'}
          </p>
        </div>
        <Link
          href="/onboarding"
          className="text-sm text-slate-500 transition-colors hover:text-slate-300"
        >
          Edit Profile
        </Link>
      </div>

      {/* Profile completeness nudge */}
      {profile && profile.profile_completeness < 80 && (
        <div className="mb-6">
          <ProfileCompleteness completeness={profile.profile_completeness ?? 0} />
        </div>
      )}

      {/* AI Matches section — client component for "Run New Match" button */}
      <DashboardMatchSection
        initialMatches={topMatches.map((m) => ({
          id: m.id,
          opportunity: (m.opportunities as unknown) as {
            id: string; title: string; organization: string; type: string;
            deadline: string | null; location: string;
          },
          match_score: m.match_score,
          match_reasoning: m.match_reasoning,
          match_type: m.match_type,
          generated_at: m.generated_at,
        }))}
      />

      {/* Upcoming deadlines */}
      {upcomingDeadlines.length > 0 && (
        <section className="mb-8">
          <h2 className="font-display mb-4 text-lg font-bold text-slate-50">
            Upcoming Deadlines
          </h2>
          <div className="space-y-2">
            {upcomingDeadlines.map((m) => {
              const opp = (m.opportunities as unknown) as MatchOpp
              const daysUntil = Math.ceil(
                (new Date(opp.deadline!).getTime() - today.getTime()) / (1000 * 60 * 60 * 24)
              )
              return (
                <Link
                  key={m.id}
                  href={`/opportunities/${opp.id}`}
                  className="flex items-center gap-3 rounded-lg border border-navy-600 bg-navy-800 px-4 py-3 transition-all hover:border-rose-400/40"
                >
                  <span className="flex-1 text-sm text-slate-200">{opp.title}</span>
                  <span className="text-xs font-medium text-rose-400">
                    {daysUntil === 0
                      ? 'Today!'
                      : daysUntil === 1
                        ? 'Tomorrow!'
                        : `${daysUntil} days left`}
                  </span>
                </Link>
              )
            })}
          </div>
        </section>
      )}

      {/* Saved opportunities */}
      {savedOpportunities.length > 0 && (
        <section className="mb-8">
          <div className="mb-4 flex items-center justify-between">
            <h2 className="font-display text-lg font-bold text-slate-50">Saved Opportunities</h2>
            <Link
              href="/saved"
              className="text-sm text-slate-500 transition-colors hover:text-cyan-400"
            >
              View all →
            </Link>
          </div>
          <div className="grid gap-4 sm:grid-cols-2">
            {savedOpportunities.slice(0, 4).map((opp) => (
              <OpportunityCard key={opp.id} opportunity={opp} />
            ))}
          </div>
        </section>
      )}

      {/* AI Counseling Chatbot */}
      <section className="mb-8">
        <h2 className="font-display mb-4 text-lg font-bold text-slate-50">
          AI Counselor
        </h2>
        <ChatPanel />
      </section>

      {/* Activity summary */}
      <section className="rounded-xl border border-navy-600 bg-navy-800 p-5">
        <h2 className="font-display mb-4 text-sm font-semibold uppercase tracking-wider text-slate-500">
          Your Activity
        </h2>
        <div className="flex flex-wrap gap-6">
          <div className="text-center">
            <p className="font-display text-2xl font-bold text-slate-50">{topMatches.length}</p>
            <p className="text-xs text-slate-500">Matches</p>
          </div>
          <div className="text-center">
            <p className="font-display text-2xl font-bold text-slate-50">
              {savedOpportunities.length}
            </p>
            <p className="text-xs text-slate-500">Saved</p>
          </div>
          <div className="text-center">
            <p className="font-display text-2xl font-bold text-slate-50">
              {profile?.profile_completeness ?? 0}%
            </p>
            <p className="text-xs text-slate-500">Profile Complete</p>
          </div>
        </div>
      </section>
    </div>
  )
}
