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
import { GlobeCanvas } from '@/components/GlobeCanvas'
import { AuthErrorToast } from '@/components/AuthErrorToast'

export default async function HomePage() {
  const [all, metros] = await Promise.all([
    getAllOpportunities(),
    getMetroAreas(),
  ])

  return (
    <div>
      <ScrollRevealInit />
      <AuthErrorToast />

      {/* Hero — fade in on load */}
      <section
        className="scroll-reveal relative overflow-hidden pt-6 pb-0 md:pt-10 md:pb-0"
        data-reveal="load"
      >
        <div className="flex flex-col items-center gap-10 md:flex-row md:items-center md:gap-0">

          {/* Left — text + button, padded to match page content width */}
          <div className="w-full px-6 text-center md:flex-1 md:min-w-0 md:pl-8 md:pr-4 md:text-left lg:pl-14 xl:pl-20 2xl:pl-28">
            <div className="mb-4 flex items-center justify-center gap-3 md:justify-start">
              <MetroSelector metros={metros} />
              <span className="text-sm text-slate-600">
                {all.length}+ verified opportunities mapped
              </span>
            </div>

            <h1 className="font-display mt-1 text-4xl font-bold leading-[1.1] tracking-tight text-slate-50 sm:text-5xl md:text-6xl lg:text-7xl xl:text-8xl">
              Opport<span className="text-cyan-400">ography</span>
            </h1>

            <p className="mt-4 max-w-xl text-base leading-relaxed text-slate-400 sm:text-lg md:text-xl lg:text-xl xl:text-2xl">
              Opportunity + Cartography. Like a map for your future — every scholarship,
              internship, program, and resource in your city — all in one place.
            </p>

            <div className="mt-7 flex justify-center md:justify-start">
              <Link
                href="/opportunities"
                className="inline-block rounded-lg bg-cyan-400 px-10 py-5 text-lg font-semibold text-navy-950 transition-all hover:bg-cyan-300 focus:outline-none focus:ring-2 focus:ring-cyan-400 focus:ring-offset-2 focus:ring-offset-navy-950"
              >
                Browse All Opportunities
              </Link>
            </div>
          </div>

          {/* Right — globe, hugs the right edge; overflows are clipped by overflow-hidden */}
          <div className="flex w-full justify-center md:w-[420px] md:flex-none md:-mr-16 lg:w-[500px] lg:-mr-8 xl:mr-0 xl:pr-4">
            <GlobeCanvas />
          </div>

        </div>
      </section>

      {/* Featured Opportunities — Continuous marquee carousel */}
      <div className="scroll-reveal mt-16 md:mt-24" data-reveal="load">
        <CinematicCarousel />
      </div>

      {/* The Problem */}
      <div className="scroll-reveal mt-20 md:mt-28">
        <TheProblem />
      </div>

      {/* AI Demo Showcase */}
      <div className="scroll-reveal">
        <AIDemoShowcase />
      </div>

      {/* Browse by Identity — grouped category boxes */}
      <div className="scroll-reveal">
        <IdentityGroups />
      </div>

      {/* Browse by Type */}
      <section className="scroll-reveal glow-b mx-4 mt-24 mb-20 rounded-xl border border-navy-600 bg-navy-900/50 px-6 py-12 md:mx-16 lg:mx-24">
        <h2 className="font-display mb-6 text-center text-2xl font-bold text-slate-50">Browse by Type</h2>
        <div className="flex flex-wrap justify-center gap-3 scroll-reveal-stagger">
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

    </div>
  )
}
