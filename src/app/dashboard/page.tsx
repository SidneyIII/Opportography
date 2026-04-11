import { redirect } from 'next/navigation'
import Link from 'next/link'
import { createSupabaseServerClient, createSupabaseServiceClient } from '@/lib/supabase-server'
import { ProfileCompleteness } from '@/components/ProfileCompleteness'

import { DashboardMatchSection } from './DashboardMatchSection'


// ─── Feature cards data ───────────────────────────────────────────────────────
const FEATURE_CARDS = [
  {
    title: 'Browse Opportunities',
    description: 'Explore verified local jobs, scholarships, apprenticeships, civic programs, and more near you.',
    cta: 'Browse Now',
    href: '/opportunities',
    icon: (
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" className="h-6 w-6">
        <circle cx="11" cy="11" r="8" />
        <path d="m21 21-4.35-4.35" />
      </svg>
    ),
    iconBg: 'bg-cyan-400/10 border-cyan-400/20',
    iconColor: 'text-cyan-400',
    accent: 'hover:border-cyan-400/40',
  },
  {
    title: 'Saved & Tracker',
    description: 'View your saved opportunities and track the status of ones you\'re actively pursuing.',
    cta: 'View Saved',
    href: '/saved',
    icon: (
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" className="h-6 w-6">
        <path d="M17 3H7a2 2 0 0 0-2 2v16l7-3 7 3V5a2 2 0 0 0-2-2z" />
      </svg>
    ),
    iconBg: 'bg-indigo-400/10 border-indigo-400/20',
    iconColor: 'text-indigo-400',
    accent: 'hover:border-indigo-400/40',
  },
  {
    title: 'AI Opportunity Assistant',
    description: 'Get personalized opportunity recommendations based on your goals, skills, and interests.',
    cta: 'Get Recommendations',
    href: '#ai-guidance',
    icon: (
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" className="h-6 w-6">
        <path d="M9.813 15.904 9 18.75l-.813-2.846a4.5 4.5 0 0 0-3.09-3.09L2.25 12l2.846-.813a4.5 4.5 0 0 0 3.09-3.09L9 5.25l.813 2.846a4.5 4.5 0 0 0 3.09 3.09L15.75 12l-2.846.813a4.5 4.5 0 0 0-3.09 3.09Z" />
        <path d="M18.259 8.715 18 9.75l-.259-1.035a3.375 3.375 0 0 0-2.455-2.456L14.25 6l1.036-.259a3.375 3.375 0 0 0 2.455-2.456L18 2.25l.259 1.035a3.375 3.375 0 0 0 2.456 2.456L21.75 6l-1.035.259a3.375 3.375 0 0 0-2.456 2.456Z" />
      </svg>
    ),
    iconBg: 'bg-emerald-400/10 border-emerald-400/20',
    iconColor: 'text-emerald-400',
    accent: 'hover:border-emerald-400/40',
  },
  {
    title: 'AI Application Assistant',
    description: 'Get help writing essays, cover letters, and applications for opportunities you\'re pursuing.',
    cta: 'Start Writing',
    href: '/apply',
    icon: (
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" className="h-6 w-6">
        <path d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L10.582 16.07a4.5 4.5 0 0 1-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 0 1 1.13-1.897l8.932-8.931Z" />
        <path d="M19.5 7.125M18 14v4.75A2.25 2.25 0 0 1 15.75 21H5.25A2.25 2.25 0 0 1 3 18.75V8.25A2.25 2.25 0 0 1 5.25 6H10" />
      </svg>
    ),
    iconBg: 'bg-violet-400/10 border-violet-400/20',
    iconColor: 'text-violet-400',
    accent: 'hover:border-violet-400/40',
  },
]

const COMING_SOON_CARDS = [
  {
    title: 'Counselor Dashboard',
    description: 'New features for counselors and school partners — track student progress and surface opportunities in bulk.',
  },
  {
    title: 'Nonprofit & Civic Tools',
    description: 'Tools for nonprofits and civic institutions to connect their communities to verified opportunities.',
  },
]

export default async function DashboardPage() {
  const supabase = await createSupabaseServerClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) redirect('/login')

  const service = createSupabaseServiceClient()

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
      .select('opportunity_id, status')
      .eq('user_id', user.id),
  ])

  type MatchOpp = { id: string; title: string; organization: string; type: string; deadline: string | null; location: string }

  const profile = profileResult.data
  const allMatches = (matchesResult.data ?? []).filter((m) => m.opportunities)

  const seenOpportunityIds = new Set<string>()
  const topMatches = allMatches.filter((m) => {
    const opp = (m.opportunities as unknown) as MatchOpp | null
    if (!opp || seenOpportunityIds.has(opp.id)) return false
    seenOpportunityIds.add(opp.id)
    return true
  })

  const savedCount = savedResult.data?.length ?? 0
  const inProgressCount = savedResult.data?.filter((s) => s.status === 'in_progress').length ?? 0

  const today = new Date()
  const in14Days = new Date(today)
  in14Days.setDate(today.getDate() + 14)

  const upcomingDeadlines = topMatches.filter((m) => {
    const opp = (m.opportunities as unknown) as MatchOpp | null
    if (!opp?.deadline) return false
    const d = new Date(opp.deadline)
    return d >= today && d <= in14Days
  })

  const firstName = profile?.first_name ?? 'there'
  const initials = firstName.slice(0, 2).toUpperCase()

  return (
    <div className="mx-auto max-w-6xl px-4 py-8">

      {/* ── Profile header ─────────────────────────────────────────────────── */}
      <div className="mb-8 rounded-2xl border border-navy-600 bg-navy-800 p-6">
        <div className="flex flex-wrap items-center justify-between gap-6">
          <div className="flex items-center gap-5">
            {/* Avatar */}
            <div className="flex h-16 w-16 shrink-0 items-center justify-center rounded-full border-2 border-cyan-400/40 bg-cyan-400/10">
              <span className="font-display text-xl font-bold text-cyan-400">{initials}</span>
            </div>
            {/* Name + location */}
            <div>
              <h1 className="font-display text-2xl font-bold text-slate-50">
                Welcome back, {firstName}
              </h1>
              {profile?.city && (
                <p className="mt-1 flex items-center gap-1.5 text-sm text-slate-400">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" className="h-4 w-4">
                    <path strokeLinecap="round" strokeLinejoin="round" d="M15 10.5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                    <path strokeLinecap="round" strokeLinejoin="round" d="M19.5 10.5c0 7.142-7.5 11.25-7.5 11.25S4.5 17.642 4.5 10.5a7.5 7.5 0 1 1 15 0Z" />
                  </svg>
                  {profile.city}
                </p>
              )}
            </div>
          </div>

          {/* Stats + Edit Profile */}
          <div className="flex flex-wrap items-center gap-6">
            <div className="text-center">
              <p className="font-display text-3xl font-bold text-slate-50">{savedCount}</p>
              <p className="text-sm text-slate-500">Saved</p>
            </div>
            <div className="text-center">
              <p className="font-display text-3xl font-bold text-slate-50">{inProgressCount}</p>
              <p className="text-sm text-slate-500">In Progress</p>
            </div>
            <div className="text-center">
              <p className="font-display text-3xl font-bold text-slate-50">{topMatches.length}</p>
              <p className="text-sm text-slate-500">Matches</p>
            </div>
            <Link
              href="/onboarding"
              className="rounded-xl border border-cyan-400/30 bg-cyan-400/10 px-5 py-2.5 text-sm font-semibold text-cyan-400 transition-all hover:bg-cyan-400/20 hover:border-cyan-400/50"
            >
              Edit Profile
            </Link>
          </div>
        </div>

        {/* Profile completeness nudge */}
        {profile && profile.profile_completeness < 80 && (
          <div className="mt-5 border-t border-navy-600 pt-5">
            <ProfileCompleteness completeness={profile.profile_completeness ?? 0} />
          </div>
        )}
      </div>

      {/* ── Feature cards grid ─────────────────────────────────────────────── */}
      <section className="mb-8">
        <div className="grid gap-4 grid-cols-2 lg:grid-cols-4">
          {FEATURE_CARDS.map((card) => (
            <Link
              key={card.title}
              href={card.href}
              className={`group flex flex-col rounded-2xl border border-navy-600 bg-navy-800 p-5 transition-all ${card.accent}`}
            >
              {/* Icon */}
              <div className={`mb-4 flex h-11 w-11 items-center justify-center rounded-xl border ${card.iconBg} ${card.iconColor}`}>
                {card.icon}
              </div>
              {/* Title */}
              <p className="font-display font-bold text-slate-100 leading-snug mb-2">{card.title}</p>
              {/* Description */}
              <p className="text-xs text-slate-500 leading-relaxed flex-1">{card.description}</p>
              {/* CTA */}
              <p className="mt-4 text-xs font-semibold text-cyan-400 transition-colors group-hover:text-cyan-300">
                {card.cta} →
              </p>
            </Link>
          ))}

          {/* Coming soon cards */}
          {COMING_SOON_CARDS.map((card) => (
            <div
              key={card.title}
              className="flex flex-col rounded-2xl border border-navy-600/50 bg-navy-800/40 p-5 opacity-50"
            >
              <div className="mb-4 flex h-11 w-11 items-center justify-center rounded-xl border border-slate-600/30 bg-slate-600/10">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" className="h-6 w-6 text-slate-600">
                  <path d="M16.5 10.5V6.75a4.5 4.5 0 1 0-9 0v3.75m-.75 11.25h10.5a2.25 2.25 0 0 0 2.25-2.25v-6.75a2.25 2.25 0 0 0-2.25-2.25H6.75a2.25 2.25 0 0 0-2.25 2.25v6.75a2.25 2.25 0 0 0 2.25 2.25Z" />
                </svg>
              </div>
              <p className="font-display font-bold text-slate-500 leading-snug mb-2">{card.title}</p>
              <p className="text-xs text-slate-600 leading-relaxed flex-1">{card.description}</p>
              <p className="mt-4 text-xs font-medium text-slate-700">Coming Soon</p>
            </div>
          ))}
        </div>
      </section>

      {/* ── Upcoming deadlines ─────────────────────────────────────────────── */}
      {upcomingDeadlines.length > 0 && (
        <section className="mb-8">
          <div className="mb-3 flex items-center gap-2">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" className="h-4 w-4 text-amber-400">
              <path strokeLinecap="round" strokeLinejoin="round" d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126ZM12 15.75h.007v.008H12v-.008Z" />
            </svg>
            <h2 className="font-display text-sm font-semibold text-amber-400">Upcoming Deadlines</h2>
          </div>
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
                  className="flex items-center gap-3 rounded-lg border border-navy-600 bg-navy-800 px-4 py-3 transition-all hover:border-amber-400/30"
                >
                  <span className="flex-1 text-sm text-slate-200">{opp.title}</span>
                  <span className="text-xs font-medium text-amber-400">
                    {daysUntil === 0 ? 'Today!' : daysUntil === 1 ? 'Tomorrow!' : `${daysUntil} days left`}
                  </span>
                </Link>
              )
            })}
          </div>
        </section>
      )}

      {/* ── AI Matches ─────────────────────────────────────────────────────── */}
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

    </div>
  )
}
