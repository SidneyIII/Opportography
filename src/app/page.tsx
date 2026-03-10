import Link from 'next/link'
import { getFeaturedOpportunities, getAllOpportunities } from '@/lib/queries'
import { allIdentityTags, getIdentityLabel, getIdentitySlug, getTypeLabel, allTypes } from '@/lib/utils'
import { OpportunityCard } from '@/components/OpportunityCard'
import { DemoMatchBox } from '@/components/DemoMatchBox'

export default async function HomePage() {
  const [featured, all] = await Promise.all([
    getFeaturedOpportunities(),
    getAllOpportunities(),
  ])

  return (
    <div>
      {/* Hero */}
      <section className="relative px-4 py-24 md:py-40">
        <div className="mx-auto max-w-4xl text-center">
          {/* Live count pill */}
          <div className="mb-6 inline-flex items-center gap-2 rounded-full border border-cyan-400/30 bg-cyan-400/10 px-4 py-1.5 text-xs font-medium text-cyan-400">
            <span className="h-1.5 w-1.5 animate-pulse rounded-full bg-cyan-400" />
            {all.length}+ opportunities mapped in Omaha / Council Bluffs
          </div>

          <h1 className="font-display mt-2 text-5xl font-bold leading-[1.1] tracking-tight text-slate-50 md:text-7xl">
            Opport<span className="text-cyan-400">ography</span>
          </h1>

          <p className="mx-auto mt-6 max-w-2xl text-lg leading-relaxed text-slate-400 md:text-xl">
            Opportunity + Cartography. Like a map for your future — every scholarship,
            internship, program, and resource in the Omaha area, all in one place.
          </p>

          <blockquote className="mx-auto mt-8 max-w-xl text-sm italic text-slate-500">
            &ldquo;Outliers are those who have been given opportunities — and who have had
            the strength and presence of mind to seize them.&rdquo;
            <span className="mt-1 block not-italic text-slate-600">— Malcolm Gladwell, <em>Outliers</em></span>
          </blockquote>

          <div className="mt-10 flex flex-col items-center gap-3 sm:flex-row sm:justify-center">
            <Link
              href="/opportunities"
              className="rounded-lg bg-cyan-400 px-7 py-3 text-sm font-semibold text-navy-950 transition-all hover:bg-cyan-300 focus:outline-none focus:ring-2 focus:ring-cyan-400 focus:ring-offset-2 focus:ring-offset-navy-950"
            >
              Browse All Opportunities
            </Link>
            <Link
              href="/about"
              className="rounded-lg border border-navy-600 px-7 py-3 text-sm font-semibold text-slate-300 transition-colors hover:border-slate-500 hover:text-slate-100"
            >
              Learn Our Story
            </Link>
          </div>
        </div>
      </section>

      {/* AI Demo Match Box */}
      <section className="mx-auto max-w-6xl px-4 py-16">
        <DemoMatchBox totalOpportunities={all.length} />
      </section>

      {/* Featured Opportunities */}
      <section className="mx-auto max-w-6xl px-4 py-12">
        <div className="mb-6 flex items-end justify-between">
          <h2 className="font-display text-2xl font-bold text-slate-50">Featured Opportunities</h2>
          <Link
            href="/opportunities"
            className="text-sm font-medium text-slate-500 transition-colors hover:text-cyan-400"
          >
            View all &rarr;
          </Link>
        </div>
        <div className="grid gap-4 sm:grid-cols-2">
          {featured.map((opp) => (
            <OpportunityCard key={opp.id} opportunity={opp} />
          ))}
        </div>
      </section>

      {/* Browse by Identity */}
      <section className="border-y border-navy-600 bg-navy-900/50 px-4 py-12">
        <div className="mx-auto max-w-6xl">
          <h2 className="font-display mb-2 text-2xl font-bold text-slate-50">Find Opportunities For You</h2>
          <p className="mb-6 text-sm text-slate-500">
            We surface opportunities specifically for your background and identity.
          </p>
          <div className="grid grid-cols-2 gap-3 sm:grid-cols-3 md:grid-cols-4">
            {allIdentityTags.map((tag) => (
              <Link
                key={tag}
                href={`/for/${getIdentitySlug(tag)}`}
                className="rounded-lg border border-navy-600 bg-navy-800 px-4 py-3 text-center text-sm font-medium text-slate-300 transition-all hover:border-cyan-400/50 hover:bg-navy-700 hover:text-cyan-400"
              >
                {getIdentityLabel(tag)}
              </Link>
            ))}
          </div>
        </div>
      </section>

      {/* Browse by Type */}
      <section className="mx-auto max-w-6xl px-4 py-12">
        <h2 className="font-display mb-6 text-2xl font-bold text-slate-50">Browse by Type</h2>
        <div className="flex flex-wrap gap-3">
          {allTypes.map((type) => (
            <Link
              key={type}
              href={`/opportunities?type=${type}`}
              className="rounded-full border border-navy-600 px-4 py-2 text-sm font-medium text-slate-400 transition-all hover:border-cyan-400/50 hover:bg-navy-800 hover:text-cyan-400"
            >
              {getTypeLabel(type)}
            </Link>
          ))}
        </div>
      </section>

      {/* CTA */}
      <section className="border-t border-navy-600 px-4 py-16">
        <div className="mx-auto max-w-2xl text-center">
          <h2 className="font-display text-3xl font-bold text-slate-50">You belong here.</h2>
          <p className="mt-3 text-slate-400">
            Whether you&apos;re first-gen, low-income, an immigrant, or just looking for your next
            step — these opportunities are for you.
          </p>
          <Link
            href="/opportunities"
            className="mt-8 inline-block rounded-lg bg-cyan-400 px-7 py-3 text-sm font-semibold text-navy-950 transition-all hover:bg-cyan-300"
          >
            Start Exploring
          </Link>
        </div>
      </section>
    </div>
  )
}
