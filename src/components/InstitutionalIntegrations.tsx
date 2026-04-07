const CARDS = [
  {
    title: 'Schools & Educational Counselors',
    copy: 'Integrate directly into school counseling platforms and advisory workflows to surface nontraditional pathways — trades, entrepreneurship, certifications, gap year programs — alongside traditional college routes. Students get personalized opportunity discovery; counselors get tools that expand what they can offer every student, regardless of where they\'re headed.',
    accent: 'rgba(34, 211, 238, 0.07)',
    border: 'rgba(34, 211, 238, 0.18)',
    icon: (
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true" className="h-6 w-6 text-cyan-400">
        <path d="M12 3L2 8l10 5 10-5-10-5z" />
        <path d="M2 13l10 5 10-5" />
        <path d="M2 18l10 5 10-5" />
      </svg>
    ),
  },
  {
    title: 'Civic Institutions',
    copy: 'Help local civic bodies — city councils, voter registration offices, political organizations, small business development centers — connect residents to participation opportunities. From local elections and town halls to startup incubators and small business grants, Opportography surfaces the civic pathways most people never knew existed.',
    accent: 'rgba(56, 189, 248, 0.06)',
    border: 'rgba(56, 189, 248, 0.14)',
    icon: (
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true" className="h-6 w-6 text-cyan-400">
        <path d="M3 21h18" />
        <path d="M5 21V7l7-4 7 4v14" />
        <path d="M9 21v-6h6v6" />
        <path d="M9 9h1m5 0h1M9 13h1m5 0h1" />
      </svg>
    ),
  },
  {
    title: 'Nonprofits',
    copy: 'Enable nonprofits to reach the right people at the right moment. Whether organizations are recruiting volunteers, offering services, or seeking community partners, Opportography integrates with their outreach so they show up where locally-focused youth and community members are already looking.',
    accent: 'rgba(30, 45, 82, 0.60)',
    border: 'rgba(56, 189, 248, 0.12)',
    icon: (
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true" className="h-6 w-6 text-cyan-400">
        <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2" />
        <circle cx="9" cy="7" r="4" />
        <path d="M23 21v-2a4 4 0 0 0-3-3.87" />
        <path d="M16 3.13a4 4 0 0 1 0 7.75" />
      </svg>
    ),
  },
  {
    title: 'Government Agencies & Local Government',
    copy: 'Give local and state government agencies a direct channel into community growth. Workforce development programs, apprenticeship pipelines, public service opportunities, and civic engagement initiatives can be surfaced intelligently to the residents who need them most — making government a visible, accessible partner in people\'s lives.',
    accent: 'rgba(20, 28, 53, 0.80)',
    border: 'rgba(45, 64, 112, 0.60)',
    icon: (
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true" className="h-6 w-6 text-cyan-400">
        <path d="M3 21h18M3 10h18M5 6l7-3 7 3" />
        <rect x="5" y="10" width="3" height="11" />
        <rect x="10.5" y="10" width="3" height="11" />
        <rect x="16" y="10" width="3" height="11" />
      </svg>
    ),
  },
]

const GLOW_CLASSES = ['glow-a', 'glow-b', 'glow-c', 'glow-d'] as const

export function InstitutionalIntegrations() {
  return (
    <div className="px-4 py-14 md:px-16 lg:px-24">
      <div className="mb-10 text-center">
        <p className="mb-3 text-[11px] uppercase tracking-widest text-cyan-400">Platform</p>
        <h2 className="font-display text-3xl font-bold text-slate-50 md:text-4xl">
          Opportography integrates into...
        </h2>
      </div>
      <div className="grid grid-cols-1 gap-4 md:grid-cols-2">
        {CARDS.map((card, i) => (
          <div
            key={card.title}
            className={`rounded-lg p-6 backdrop-blur-sm ${GLOW_CLASSES[i % 4]}`}
            style={{ background: card.accent, border: `1px solid ${card.border}` }}
          >
            <div className="mb-3 flex h-9 w-9 items-center justify-center rounded-md border border-navy-600 bg-navy-800/70">
              {card.icon}
            </div>
            <h3 className="font-display mb-2 text-base font-bold leading-snug text-slate-100">
              {card.title}
            </h3>
            <p className="text-sm leading-relaxed text-slate-400">
              {card.copy}
            </p>
          </div>
        ))}
      </div>
    </div>
  )
}
