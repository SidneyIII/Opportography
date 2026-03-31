export const dynamic = 'force-dynamic'

import Link from 'next/link'
import { getAllOpportunities, getMetroAreas } from '@/lib/queries'
import { getTypeLabel, allTypes } from '@/lib/utils'
import { DemoMatchBox } from '@/components/DemoMatchBox'
import { MetroSelector } from '@/components/MetroSelector'
import { CinematicCarousel } from '@/components/CinematicCarousel'
import { IdentityGroups } from '@/components/IdentityGroups'

export default async function HomePage() {
  const [all, metros] = await Promise.all([
    getAllOpportunities(),
    getMetroAreas(),
  ])

  return (
    <div>
      {/* Hero */}
      <section className="relative px-4 pt-20 pb-0 md:pt-28 md:pb-0">
        <div className="mx-auto max-w-4xl text-center">
          {/* Metro selector pill — city-aware, Coming Soon for inactive metros */}
          <div className="mb-6 flex flex-col items-center gap-2 sm:flex-row sm:justify-center">
            <MetroSelector metros={metros} />
            <span className="text-xs text-slate-600">
              {all.length}+ verified opportunities mapped
            </span>
          </div>

          <h1 className="font-display mt-2 text-5xl font-bold leading-[1.1] tracking-tight text-slate-50 md:text-7xl">
            Opport<span className="text-cyan-400">ography</span>
          </h1>

          <p className="mx-auto mt-6 max-w-2xl text-lg leading-relaxed text-slate-400 md:text-xl">
            Opportunity + Cartography. Like a map for your future — every scholarship,
            internship, program, and resource in your city — all in one place.
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

      {/* Featured Opportunities — Cinematic Scroll Carousel */}
      <CinematicCarousel />

      {/* AI Demo Match Box */}
      <section className="mx-auto max-w-6xl px-4 py-16">
        <DemoMatchBox totalOpportunities={all.length} />
      </section>

      {/* Browse by Identity — grouped category boxes */}
      <IdentityGroups />

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
