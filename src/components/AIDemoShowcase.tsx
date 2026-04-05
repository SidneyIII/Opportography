'use client'

import { useState } from 'react'

const EXAMPLES = [
  {
    id: 'prompt',
    label: 'Describe Your Goals',
    tag: 'Step 1',
  },
  {
    id: 'discover',
    label: 'Discover Opportunities',
    tag: 'Step 2',
  },
  {
    id: 'save',
    label: 'Save & Prioritize',
    tag: 'Step 3',
  },
  {
    id: 'browse',
    label: 'Browse on Your Own',
    tag: 'Or',
  },
] as const

type ExampleId = (typeof EXAMPLES)[number]['id']

// ── Mock panels ──────────────────────────────────────────────────────────────

function PromptPanel() {
  return (
    <div className="flex h-full flex-col gap-5">
      {/* Header */}
      <div>
        <p className="text-[11px] uppercase tracking-widest text-cyan-400">AI Assistant</p>
        <h3 className="mt-1 text-lg font-bold text-slate-100">Tell the AI about yourself</h3>
        <p className="mt-1 text-sm text-slate-400">
          Describe your background, interests, and what you&apos;re looking for.
          The more specific, the better the match.
        </p>
      </div>

      {/* Mock chat input */}
      <div
        className="flex-1 rounded-xl border border-navy-600 bg-navy-950/60 p-4"
        style={{ minHeight: 0 }}
      >
        {/* AI greeting */}
        <div className="mb-4 flex items-start gap-3">
          <div className="flex h-7 w-7 shrink-0 items-center justify-center rounded-full bg-cyan-400/10 ring-1 ring-cyan-400/30">
            <svg viewBox="0 0 20 20" fill="none" className="h-4 w-4 text-cyan-400">
              <circle cx="10" cy="10" r="4" fill="currentColor" opacity="0.3" />
              <circle cx="10" cy="10" r="2" fill="currentColor" />
              <path d="M10 2v2M10 16v2M2 10h2M16 10h2" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" />
            </svg>
          </div>
          <div className="rounded-lg rounded-tl-none bg-navy-800/80 px-4 py-3 text-sm text-slate-300">
            Hey! Tell me about yourself — your interests, where you are in school or your career,
            and what kind of opportunities you&apos;re looking for. I&apos;ll find the best matches
            in your city.
          </div>
        </div>

        {/* User message */}
        <div className="flex items-start justify-end gap-3">
          <div className="rounded-lg rounded-tr-none bg-cyan-400/10 px-4 py-3 text-sm text-slate-200 ring-1 ring-cyan-400/20">
            I&apos;m a junior in high school, first-gen college student, interested in healthcare
            and community work. Looking for scholarships, internships, or summer programs.
            I&apos;m Latina and passionate about health equity in my neighborhood.
          </div>
          <div className="flex h-7 w-7 shrink-0 items-center justify-center rounded-full bg-navy-700 ring-1 ring-navy-600">
            <svg viewBox="0 0 20 20" fill="currentColor" className="h-4 w-4 text-slate-400">
              <path d="M10 9a3 3 0 100-6 3 3 0 000 6zM6 12a4 4 0 018 0v1H6v-1z" />
            </svg>
          </div>
        </div>

        {/* Typing indicator */}
        <div className="mt-4 flex items-center gap-3">
          <div className="flex h-7 w-7 shrink-0 items-center justify-center rounded-full bg-cyan-400/10 ring-1 ring-cyan-400/30">
            <svg viewBox="0 0 20 20" fill="none" className="h-4 w-4 text-cyan-400">
              <circle cx="10" cy="10" r="4" fill="currentColor" opacity="0.3" />
              <circle cx="10" cy="10" r="2" fill="currentColor" />
              <path d="M10 2v2M10 16v2M2 10h2M16 10h2" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" />
            </svg>
          </div>
          <div className="flex items-center gap-1 rounded-lg rounded-tl-none bg-navy-800/80 px-4 py-3">
            <span className="h-1.5 w-1.5 animate-bounce rounded-full bg-slate-500" style={{ animationDelay: '0ms' }} />
            <span className="h-1.5 w-1.5 animate-bounce rounded-full bg-slate-500" style={{ animationDelay: '150ms' }} />
            <span className="h-1.5 w-1.5 animate-bounce rounded-full bg-slate-500" style={{ animationDelay: '300ms' }} />
          </div>
        </div>
      </div>

      {/* Input bar */}
      <div className="flex items-center gap-3 rounded-xl border border-navy-600 bg-navy-900/50 px-4 py-3">
        <span className="flex-1 text-sm text-slate-600">Describe your interests, background, and goals...</span>
        <button
          type="button"
          className="flex h-8 w-8 shrink-0 items-center justify-center rounded-lg bg-cyan-400/10 text-cyan-400 ring-1 ring-cyan-400/30"
          tabIndex={-1}
        >
          <svg viewBox="0 0 20 20" fill="currentColor" className="h-4 w-4">
            <path d="M10.894 2.553a1 1 0 00-1.788 0l-7 14a1 1 0 001.169 1.409l.065-.021L9.5 15.337V17a1 1 0 001.788.618l.065-.096L17.659 3.962a1 1 0 00-1.169-1.409l-.065.021-5.531 2.22V2.553z" />
          </svg>
        </button>
      </div>
    </div>
  )
}

const MOCK_RESULTS = [
  {
    score: 97,
    title: 'MAPA Health Careers Scholarship',
    org: 'Midwest Association of Pre-Health Advisors',
    tags: ['Scholarship', 'Healthcare', 'First-Gen'],
    badge: 'Top Match',
    badgeColor: 'bg-cyan-400/15 text-cyan-300 ring-cyan-400/30',
  },
  {
    score: 93,
    title: 'CHI Health Summer Internship',
    org: 'CHI Health — Omaha',
    tags: ['Internship', 'Clinical', 'Paid'],
    badge: 'High Match',
    badgeColor: 'bg-emerald-400/10 text-emerald-300 ring-emerald-400/20',
  },
  {
    score: 88,
    title: 'Latino Center of the Midlands — Youth Health Corps',
    org: 'Latino Center of the Midlands',
    tags: ['Volunteer', 'Latina/o', 'Community Health'],
    badge: 'Strong Match',
    badgeColor: 'bg-sky-400/10 text-sky-300 ring-sky-400/20',
  },
  {
    score: 81,
    title: 'Nebraska FAFSA & Financial Aid Workshop',
    org: 'Nebraska College Preparatory Academy',
    tags: ['Financial Aid', 'First-Gen', 'Free'],
    badge: 'Good Match',
    badgeColor: 'bg-slate-400/10 text-slate-300 ring-slate-400/20',
  },
]

function DiscoverPanel() {
  return (
    <div className="flex h-full flex-col gap-4">
      {/* Header */}
      <div>
        <p className="text-[11px] uppercase tracking-widest text-cyan-400">AI Results</p>
        <h3 className="mt-1 text-lg font-bold text-slate-100">Your matched opportunities</h3>
        <p className="mt-1 text-sm text-slate-400">
          Ranked by relevance to your profile. Scores reflect how closely each opportunity
          aligns with your goals, identity, and eligibility.
        </p>
      </div>

      {/* Result cards */}
      <div className="flex flex-col gap-2.5 overflow-auto" style={{ minHeight: 0 }}>
        {MOCK_RESULTS.map((r) => (
          <div
            key={r.title}
            className="flex items-start gap-3 rounded-xl border border-navy-600 bg-navy-900/60 p-3 transition-colors hover:border-cyan-400/20"
          >
            {/* Score badge */}
            <div className="flex w-11 shrink-0 flex-col items-center gap-0.5 pt-0.5">
              <span className="text-lg font-bold leading-none text-cyan-400">{r.score}</span>
              <span className="text-[10px] leading-none text-slate-600">match</span>
            </div>

            {/* Content */}
            <div className="min-w-0 flex-1">
              <div className="flex flex-wrap items-start justify-between gap-2">
                <p className="text-sm font-semibold leading-snug text-slate-100">{r.title}</p>
                <span
                  className={`shrink-0 rounded-full px-2 py-0.5 text-[10px] font-semibold ring-1 ${r.badgeColor}`}
                >
                  {r.badge}
                </span>
              </div>
              <p className="mt-0.5 text-xs text-slate-500">{r.org}</p>
              <div className="mt-2 flex flex-wrap gap-1.5">
                {r.tags.map((tag) => (
                  <span
                    key={tag}
                    className="rounded-full border border-navy-600 px-2 py-0.5 text-[10px] text-slate-400"
                  >
                    {tag}
                  </span>
                ))}
              </div>
            </div>

            {/* Save icon */}
            <button
              type="button"
              className="shrink-0 pt-0.5 text-slate-600 transition-colors hover:text-cyan-400"
              tabIndex={-1}
            >
              <svg viewBox="0 0 20 20" fill="none" stroke="currentColor" strokeWidth="1.5" className="h-4.5 w-4.5 h-[18px] w-[18px]">
                <path d="M5 3h10a1 1 0 011 1v12.5l-6-3.5-6 3.5V4a1 1 0 011-1z" strokeLinecap="round" strokeLinejoin="round" />
              </svg>
            </button>
          </div>
        ))}
      </div>
    </div>
  )
}

const SAVED_ITEMS = [
  {
    title: 'MAPA Health Careers Scholarship',
    org: 'Midwest Association of Pre-Health Advisors',
    deadline: 'Apr 15, 2026',
    deadlineUrgent: true,
    score: 97,
    starred: true,
    note: 'Need 2 rec letters + 500-word essay',
  },
  {
    title: 'CHI Health Summer Internship',
    org: 'CHI Health — Omaha',
    deadline: 'May 1, 2026',
    deadlineUrgent: false,
    score: 93,
    starred: true,
    note: 'Application opens March 1',
  },
  {
    title: 'Latino Center Youth Health Corps',
    org: 'Latino Center of the Midlands',
    deadline: 'Rolling',
    deadlineUrgent: false,
    score: 88,
    starred: false,
    note: '',
  },
]

function SavePanel() {
  return (
    <div className="flex h-full flex-col gap-4">
      {/* Header */}
      <div>
        <p className="text-[11px] uppercase tracking-widest text-cyan-400">Saved List</p>
        <h3 className="mt-1 text-lg font-bold text-slate-100">Your priority opportunities</h3>
        <p className="mt-1 text-sm text-slate-400">
          Star and organize what matters most. Flag upcoming deadlines so nothing slips.
        </p>
      </div>

      {/* Urgency banner */}
      <div className="flex items-center gap-2.5 rounded-xl border border-amber-400/25 bg-amber-400/5 px-4 py-2.5">
        <svg viewBox="0 0 20 20" fill="none" stroke="currentColor" strokeWidth="1.5" className="h-4 w-4 shrink-0 text-amber-400">
          <path d="M10 3L2 17h16L10 3z" strokeLinecap="round" strokeLinejoin="round" />
          <path d="M10 10v3M10 15.5v.5" strokeLinecap="round" />
        </svg>
        <p className="text-xs text-amber-300">
          <span className="font-semibold">1 deadline approaching</span> — MAPA Scholarship closes in 15 days
        </p>
      </div>

      {/* Saved cards */}
      <div className="flex flex-col gap-2.5 overflow-auto" style={{ minHeight: 0 }}>
        {SAVED_ITEMS.map((item) => (
          <div
            key={item.title}
            className="rounded-xl border border-navy-600 bg-navy-900/60 p-3"
          >
            <div className="flex items-start gap-2.5">
              {/* Star */}
              <button type="button" className="shrink-0 pt-0.5" tabIndex={-1}>
                <svg
                  viewBox="0 0 20 20"
                  fill={item.starred ? 'currentColor' : 'none'}
                  stroke="currentColor"
                  strokeWidth="1.5"
                  className={`h-4 w-4 ${item.starred ? 'text-amber-400' : 'text-slate-600'}`}
                >
                  <path d="M10 2l2.09 4.26L17 7.27l-3.5 3.41.83 4.82L10 13.27l-4.33 2.23.83-4.82L3 7.27l4.91-.71L10 2z" strokeLinecap="round" strokeLinejoin="round" />
                </svg>
              </button>

              {/* Info */}
              <div className="min-w-0 flex-1">
                <p className="text-sm font-semibold leading-snug text-slate-100">{item.title}</p>
                <p className="mt-0.5 text-xs text-slate-500">{item.org}</p>

                {item.note && (
                  <p className="mt-1.5 rounded-md bg-navy-800/60 px-2 py-1 text-xs text-slate-400">
                    {item.note}
                  </p>
                )}
              </div>

              {/* Score + deadline */}
              <div className="flex shrink-0 flex-col items-end gap-1.5">
                <span className="text-xs font-bold text-cyan-400">{item.score}%</span>
                <span
                  className={`flex items-center gap-1 rounded-full px-2 py-0.5 text-[10px] font-medium ring-1 ${
                    item.deadlineUrgent
                      ? 'bg-amber-400/10 text-amber-300 ring-amber-400/25'
                      : 'bg-navy-800 text-slate-500 ring-navy-600'
                  }`}
                >
                  {item.deadlineUrgent && (
                    <svg viewBox="0 0 16 16" fill="currentColor" className="h-2.5 w-2.5">
                      <path d="M8 1a7 7 0 100 14A7 7 0 008 1zm0 3v4l2.5 2.5-.75.75L7 8.5V4H8z" />
                    </svg>
                  )}
                  {item.deadline}
                </span>
              </div>
            </div>
          </div>
        ))}
      </div>

      {/* Footer action */}
      <button
        type="button"
        tabIndex={-1}
        className="flex w-full items-center justify-center gap-2 rounded-xl border border-cyan-400/20 bg-cyan-400/5 py-2.5 text-sm font-semibold text-cyan-400 transition-colors hover:bg-cyan-400/10"
      >
        <svg viewBox="0 0 20 20" fill="none" stroke="currentColor" strokeWidth="1.5" className="h-4 w-4">
          <path d="M10 4v12M4 10h12" strokeLinecap="round" />
        </svg>
        Set deadline reminders
      </button>
    </div>
  )
}

const CATEGORY_FILTERS = [
  { label: 'Scholarships', active: true },
  { label: 'Internships', active: false },
  { label: 'Employment', active: false },
  { label: 'Educational', active: false },
  { label: 'Community', active: false },
  { label: 'Civic', active: false },
  { label: 'Networking', active: false },
]

const IDENTITY_FILTERS = [
  { label: 'First-Gen', active: true },
  { label: 'Latina/o', active: true },
  { label: 'Low-Income', active: false },
  { label: 'Veterans', active: false },
  { label: 'LGBTQ+', active: false },
]

const BROWSE_RESULTS = [
  {
    title: 'Hispanic Scholarship Fund — General Scholarship',
    org: 'Hispanic Scholarship Fund',
    type: 'Scholarship',
    tags: ['Latina/o', 'First-Gen', 'Undergraduate'],
    amount: 'Up to $5,000',
  },
  {
    title: 'MAPA Health Careers Scholarship',
    org: 'Midwest Association of Pre-Health Advisors',
    type: 'Scholarship',
    tags: ['First-Gen', 'Healthcare', 'Omaha'],
    amount: 'Up to $3,000',
  },
  {
    title: 'UFCW Charity Foundation Scholarship',
    org: 'United Food & Commercial Workers',
    type: 'Scholarship',
    tags: ['First-Gen', 'Union Family', 'National'],
    amount: '$12,000',
  },
]

function BrowsePanel() {
  return (
    <div className="flex h-full flex-col gap-4">
      {/* Header */}
      <div>
        <p className="text-[11px] uppercase tracking-widest text-cyan-400">Manual Browse</p>
        <h3 className="mt-1 text-lg font-bold text-slate-100">Explore at your own pace</h3>
        <p className="mt-1 text-sm text-slate-400">
          Prefer to browse without AI? Filter by category, identity, or background — then sort
          through every verified opportunity in your metro.
        </p>
      </div>

      {/* Filter rows */}
      <div className="space-y-2.5">
        {/* Category filters */}
        <div>
          <p className="mb-1.5 text-[10px] uppercase tracking-widest text-slate-600">Category</p>
          <div className="flex flex-wrap gap-1.5">
            {CATEGORY_FILTERS.map((f) => (
              <span
                key={f.label}
                className={`rounded-full px-3 py-1 text-xs font-medium ring-1 ${
                  f.active
                    ? 'bg-cyan-400/10 text-cyan-300 ring-cyan-400/30'
                    : 'bg-navy-900/50 text-slate-500 ring-navy-600'
                }`}
              >
                {f.label}
              </span>
            ))}
          </div>
        </div>

        {/* Identity filters */}
        <div>
          <p className="mb-1.5 text-[10px] uppercase tracking-widest text-slate-600">Identity / Background</p>
          <div className="flex flex-wrap gap-1.5">
            {IDENTITY_FILTERS.map((f) => (
              <span
                key={f.label}
                className={`rounded-full px-3 py-1 text-xs font-medium ring-1 ${
                  f.active
                    ? 'bg-sky-400/10 text-sky-300 ring-sky-400/25'
                    : 'bg-navy-900/50 text-slate-500 ring-navy-600'
                }`}
              >
                {f.label}
              </span>
            ))}
          </div>
        </div>
      </div>

      {/* Divider + result count */}
      <div className="flex items-center gap-3">
        <div className="h-px flex-1 bg-navy-700" />
        <span className="text-xs text-slate-500">14 matching opportunities in Omaha/CB</span>
        <div className="h-px flex-1 bg-navy-700" />
      </div>

      {/* Results */}
      <div className="flex flex-col gap-2 overflow-auto" style={{ minHeight: 0 }}>
        {BROWSE_RESULTS.map((r) => (
          <div
            key={r.title}
            className="flex items-start justify-between gap-3 rounded-xl border border-navy-600 bg-navy-900/60 p-3 transition-colors hover:border-cyan-400/20"
          >
            <div className="min-w-0 flex-1">
              <p className="text-sm font-semibold leading-snug text-slate-100">{r.title}</p>
              <p className="mt-0.5 text-xs text-slate-500">{r.org}</p>
              <div className="mt-2 flex flex-wrap gap-1.5">
                <span className="rounded-full bg-cyan-400/10 px-2 py-0.5 text-[10px] font-medium text-cyan-400 ring-1 ring-cyan-400/20">
                  {r.type}
                </span>
                {r.tags.map((tag) => (
                  <span key={tag} className="rounded-full border border-navy-600 px-2 py-0.5 text-[10px] text-slate-400">
                    {tag}
                  </span>
                ))}
              </div>
            </div>
            <div className="shrink-0 text-right">
              <span className="text-xs font-semibold text-emerald-400">{r.amount}</span>
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}

const PANELS: Record<ExampleId, React.ReactNode> = {
  prompt: <PromptPanel />,
  discover: <DiscoverPanel />,
  save: <SavePanel />,
  browse: <BrowsePanel />,
}

// ── Main component ────────────────────────────────────────────────────────────

export function AIDemoShowcase() {
  const [active, setActive] = useState<ExampleId>('prompt')

  return (
    <section className="mx-auto max-w-6xl px-4 py-16">
      {/* Section header */}
      <div className="mb-10 text-center">
        <p className="mb-2 text-[11px] uppercase tracking-widest text-cyan-400">How It Works</p>
        <h2 className="font-display text-3xl font-bold text-slate-50 md:text-4xl">
          See Opportography in action
        </h2>
        <p className="mx-auto mt-3 max-w-xl text-slate-400">
          Our AI learns what you care about, then surfaces the opportunities you&apos;d never find on your own.
        </p>
      </div>

      {/* Demo shell */}
      <div
        className="overflow-hidden rounded-2xl border border-navy-600 glow-c"
        style={{ background: 'rgba(10, 16, 40, 0.85)' }}
      >
        <div className="flex min-h-[520px] flex-col md:flex-row">

          {/* ── Left sidebar ─────────────────────────────────────── */}
          <div
            className="flex flex-row gap-2 border-b border-navy-600 px-4 py-4 md:w-64 md:flex-col md:border-b-0 md:border-r md:px-5 md:py-6 md:gap-3 lg:w-72"
            style={{ background: 'rgba(6, 10, 28, 0.70)' }}
          >
            <p className="hidden text-[10px] uppercase tracking-widest text-slate-600 md:block">
              Examples
            </p>

            {EXAMPLES.map((ex) => {
              const isActive = active === ex.id
              return (
                <button
                  key={ex.id}
                  type="button"
                  onClick={() => setActive(ex.id)}
                  className={`flex flex-1 flex-col items-start rounded-xl px-3 py-2.5 text-left transition-all md:flex-none md:w-full ${
                    isActive
                      ? 'bg-navy-800/80 ring-1 ring-cyan-400/25'
                      : 'hover:bg-navy-900/60'
                  }`}
                >
                  <span
                    className={`text-[10px] font-semibold uppercase tracking-widest ${
                      isActive ? 'text-cyan-400' : 'text-slate-600'
                    }`}
                  >
                    {ex.tag}
                  </span>
                  <span
                    className={`mt-0.5 text-xs font-medium leading-snug md:text-sm ${
                      isActive ? 'text-slate-100' : 'text-slate-500'
                    }`}
                  >
                    {ex.label}
                  </span>
                </button>
              )
            })}
          </div>

          {/* ── Right panel ──────────────────────────────────────── */}
          <div className="flex-1 p-5 md:p-7 lg:p-8" style={{ minHeight: 0 }}>
            <div className="h-full" key={active}>
              {PANELS[active]}
            </div>
          </div>

        </div>
      </div>
    </section>
  )
}
