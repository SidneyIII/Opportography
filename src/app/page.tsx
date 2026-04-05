export const dynamic = 'force-dynamic'

import Link from 'next/link'
import { getAllOpportunities, getMetroAreas } from '@/lib/queries'
import { getTypeLabel, allTypes } from '@/lib/utils'
import { AIDemoShowcase } from '@/components/AIDemoShowcase'
import { MetroSelector } from '@/components/MetroSelector'
import { CinematicCarousel } from '@/components/CinematicCarousel'
import { IdentityGroups } from '@/components/IdentityGroups'
import { TheProblem } from '@/components/TheProblem'
import { InstitutionalIntegrations } from '@/components/InstitutionalIntegrations'
import { ScrollRevealInit } from '@/components/ScrollRevealInit'

export default async function HomePage() {
  const [all, metros] = await Promise.all([
    getAllOpportunities(),
    getMetroAreas(),
  ])

  return (
    <div>
      <ScrollRevealInit />

      {/* Hero — fade in on load */}
      <section
        className="scroll-reveal glow-a relative px-4 pt-6 pb-0 md:pt-10 md:pb-0"
        data-reveal="load"
      >
        <div className="mx-auto max-w-4xl text-center">
          {/* Metro selector pill — city-aware, Coming Soon for inactive metros */}
          <div className="mb-4 flex flex-col items-center gap-2 sm:flex-row sm:justify-center">
            <MetroSelector metros={metros} />
            <span className="text-sm text-slate-600">
              {all.length}+ verified opportunities mapped
            </span>
          </div>

          <h1 className="font-display mt-1 text-5xl font-bold leading-[1.1] tracking-tight text-slate-50 md:text-7xl lg:text-8xl">
            Opport<span className="text-cyan-400">ography</span>
          </h1>

          <p className="mx-auto mt-4 max-w-2xl text-lg leading-relaxed text-slate-400 md:text-xl lg:text-2xl">
            Opportunity + Cartography. Like a map for your future — every scholarship,
            internship, program, and resource in your city — all in one place.
          </p>

          <div className="mt-7 flex flex-col items-center gap-4 sm:flex-row sm:justify-center">
            <Link
              href="/opportunities"
              className="rounded-lg bg-cyan-400 px-9 py-4 text-base font-semibold text-navy-950 transition-all hover:bg-cyan-300 focus:outline-none focus:ring-2 focus:ring-cyan-400 focus:ring-offset-2 focus:ring-offset-navy-950"
            >
              Browse All Opportunities
            </Link>
            <Link
              href="/about"
              className="rounded-lg border border-navy-600 px-9 py-4 text-base font-semibold text-slate-300 transition-colors hover:border-slate-500 hover:text-slate-100"
            >
              Learn Our Story
            </Link>
          </div>
        </div>
      </section>

      {/* Featured Opportunities — Cinematic Scroll Carousel — fade in on load */}
      <div className="scroll-reveal glow-b" data-reveal="load">
        <CinematicCarousel />
      </div>

      {/* The Problem */}
      <div className="scroll-reveal glow-c">
        <TheProblem />
      </div>

      {/* AI Demo Showcase */}
      <div className="scroll-reveal glow-d">
        <AIDemoShowcase />
      </div>

      {/* Browse by Identity — grouped category boxes */}
      <div className="scroll-reveal glow-a">
        <IdentityGroups />
      </div>

      {/* Browse by Type */}
      <section className="scroll-reveal glow-b mx-4 my-2 rounded-xl border border-navy-600 bg-navy-900/50 px-6 py-12 md:mx-16 lg:mx-24">
        <h2 className="font-display mb-6 text-center text-2xl font-bold text-slate-50">Browse by Type</h2>
        <div className="flex flex-wrap gap-3 scroll-reveal-stagger">
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

      {/* Institutional Integrations — no scroll-reveal (owns its own scroll animation) */}
      <InstitutionalIntegrations />

      {/* CTA */}
      <section className="scroll-reveal glow-c px-4 py-16">
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
