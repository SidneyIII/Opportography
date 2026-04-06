import Link from 'next/link'

const GROUPS = [
  {
    title: 'Ethnic Identity',
    description: 'Opportunities tailored to your cultural background and heritage.',
    topBorder: 'border-t-2 border-t-cyan-400',
    bg: 'rgba(14, 28, 54, 0.75)',
    border: 'rgba(34, 211, 238, 0.28)',
    links: [
      { label: 'Hispanic / Latino Students',                    href: '/for/hispanic' },
      { label: 'Black / African American Students',             href: '/for/black' },
      { label: 'Native American / Indigenous Students',         href: '/for/native-american' },
      { label: 'Asian American / Pacific Islander Students',    href: '/for/asian-pacific' },
      { label: 'Immigrant / Refugee Students',                  href: '/for/immigrant' },
    ],
  },
  {
    title: 'Life Circumstances',
    description: 'Opportunities for students navigating financial, systemic, or personal challenges.',
    topBorder: 'border-t-2 border-t-white',
    bg: 'rgba(20, 28, 53, 0.75)',
    border: 'rgba(255, 255, 255, 0.16)',
    links: [
      { label: 'Low-Income Students',          href: '/for/low-income' },
      { label: 'First-Generation Students',    href: '/for/first-gen' },
      { label: 'Students with Disabilities',   href: '/for/disabled' },
      { label: 'Foster Youth',                 href: '/for/foster-youth' },
      { label: 'Housing-Insecure Students',    href: '/for/homeless' },
      { label: 'ESL / Multilingual Students',  href: '/for/esl' },
    ],
  },
  {
    title: 'LGBTQ+ & Gender',
    description: 'Opportunities supporting LGBTQ+ students and women in STEM fields.',
    topBorder: 'border-t-2 border-t-blue-400',
    bg: 'rgba(12, 26, 58, 0.75)',
    border: 'rgba(96, 165, 250, 0.28)',
    links: [
      { label: 'LGBTQ+ Students', href: '/for/lgbtq' },
      { label: 'Women in STEM',   href: '/for/women-stem' },
    ],
  },
  {
    title: "Where You're From",
    description: 'Opportunities shaped by where you grew up and where you live now.',
    topBorder: 'border-t-2 border-t-indigo-400',
    bg: 'rgba(16, 22, 58, 0.75)',
    border: 'rgba(129, 140, 248, 0.28)',
    links: [
      { label: 'Rural Students', href: '/for/rural' },
    ],
    note: 'More geographic categories coming soon.',
  },
]

export function IdentityGroups() {
  return (
    <section className="mx-4 px-6 py-14 md:mx-16 lg:mx-24">
      <div className="mx-auto max-w-6xl">
        <h2 className="font-display mb-2 text-center text-2xl font-bold text-slate-50">
          Find Opportunities For You
        </h2>
        <p className="mb-10 text-center text-sm text-slate-500">
          We surface opportunities specifically for your background and identity.
        </p>

        <div className="grid gap-5 sm:grid-cols-2">
          {GROUPS.map((group, i) => (
            <div
              key={group.title}
              className={`rounded-lg ${group.topBorder} p-6 backdrop-blur-sm ${['glow-a','glow-b','glow-c','glow-d'][i % 4]}`}
              style={{ background: group.bg, border: `1px solid ${group.border}`, borderTopWidth: '2px' }}
            >
              {/* Header */}
              <h3 className="mb-1 text-xs font-semibold uppercase tracking-widest text-slate-200">
                {group.title}
              </h3>
              <p className="mb-5 text-xs leading-relaxed text-slate-500">
                {group.description}
              </p>

              {/* Links */}
              <ul className="space-y-1">
                {group.links.map((link) => (
                  <li key={link.href}>
                    <Link
                      href={link.href}
                      className="flex items-center gap-2 rounded px-2 py-1.5 text-sm text-slate-300 transition-all hover:bg-navy-700 hover:text-cyan-400"
                    >
                      <span className="text-slate-600" aria-hidden>&#8594;</span>
                      {link.label}
                    </Link>
                  </li>
                ))}
              </ul>

              {/* Optional note */}
              {'note' in group && group.note && (
                <p className="mt-4 text-[11px] italic text-slate-600">{group.note}</p>
              )}
            </div>
          ))}
        </div>
      </div>
    </section>
  )
}
