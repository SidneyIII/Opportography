'use client'

import { useState, useEffect, useRef, useCallback } from 'react'
import Link from 'next/link'

const CARDS = [
  {
    catchphrase: "Don’t want a four-year degree. Don’t want to be stuck either.",
    title: "Ironworkers Local 21 — Structural & Reinforcing Steel Apprenticeship (Nebraska + Iowa)",
    org: "Iron Workers International Local 21",
    description: "Ironworkers Local 21 apprentices earn $23.50/hr starting pay (65% of journeyman scale) from the first day on the job.",
    badge: "Union Apprenticeship",
    href: "/opportunities/b0f275ff-6f6d-42d8-86fe-385849a85ab4",
  },
  {
    catchphrase: "Everyone said entrepreneurship was for people with connections. You don’t have those yet.",
    title: "1 Million Cups Omaha",
    org: "1MC Omaha",
    description: "This is one of the best low-barrier entry points into the Omaha entrepreneurship community for anyone with a business idea or who wants to meet founders.",
    badge: "Networking",
    href: "/opportunities/284ff007-89fd-4b63-b3d7-87f25e252ecf",
  },
  {
    catchphrase: "First in your family to figure this out. No roadmap.",
    title: "Creighton University TRIO Classic Upward Bound — Free College Prep for Omaha HS Students",
    org: "Creighton University TRIO Upward Bound Programs",
    description: "This program has changed thousands of lives in Omaha.",
    badge: "College Access",
    href: "/opportunities/6125526b-eb66-4ec2-ab88-d05a1a684e88",
  },
  {
    catchphrase: "Scholarship applications feel like they were written for someone else.",
    title: "UNO Goodrich Scholarship Program",
    org: "University of Nebraska at Omaha / Goodrich Program",
    description: "The program targets students facing significant obstacles or demonstrating potential despite financial constraints.",
    badge: "Institutional Scholarship",
    href: "/opportunities/a4ad7cea-d1cc-4e20-bec6-fc9362b7f6fa",
  },
  {
    catchphrase: "You want real experience. Not just a class about it.",
    title: "Step Up Omaha! Summer Youth Employment",
    org: "Step Up Omaha / Empowerment Network",
    description: "Youth earn $10–$14/hr and complete two weeks of paid job training before starting at 80+ worksites including hospitals, banks, nonprofits, the zoo, and tech companies.",
    badge: "Internship",
    href: "/opportunities/ac0af498-9315-47a3-b8d7-ceda8cb8190b",
  },
  {
    catchphrase: "Everyone assumes tech is for someone else. It isn’t.",
    title: "AIM Institute Youth in Tech — Summer Code Camp",
    org: "AIM Institute",
    description: "AIM serves low-income students specifically and connects participants to high-wage, high-demand tech career pathways.",
    badge: "Summer Program",
    href: "/opportunities/3e23504f-574f-478c-bcf2-6ab104f7264a",
  },
  {
    catchphrase: "You want mentors who know where you came from.",
    title: "100 Black Men of Omaha — Leadership Mentoring Academy (Free, Grades 9–12)",
    org: "100 Black Men of Omaha, Inc.",
    description: "The LMA has had a 100% graduation rate since 2008, and 85% of LMA graduates attend post-secondary educational institutions.",
    badge: "Mentorship",
    href: "/opportunities/b30128e0-7d9f-4c24-8962-c0065b15cf78",
  },
]

const N = CARDS.length
const INTERVAL_MS = 4800 // readable pace — ~5 seconds per card

export function CinematicCarousel() {
  const [activeIndex, setActiveIndex] = useState(0)
  const [step, setStep] = useState(580)   // px between card centres; set on mount
  const [paused, setPaused] = useState(false)
  const intervalRef = useRef<ReturnType<typeof setInterval> | null>(null)
  const touchStartX = useRef<number | null>(null)
  // Track the timeout used to resume after a manual dot/swipe interaction
  const resumeTimeout = useRef<ReturnType<typeof setTimeout> | null>(null)

  // ── Compute card step from viewport width ────────────────────────────────
  function computeStep() {
    const cardW = Math.min(700, window.innerWidth * 0.84)
    const peekPx = Math.max(52, window.innerWidth * 0.11)
    const adjScale = 0.82
    return window.innerWidth / 2 + adjScale * (cardW / 2) - peekPx
  }

  useEffect(() => {
    setStep(computeStep())
    function onResize() { setStep(computeStep()) }
    window.addEventListener('resize', onResize)
    return () => window.removeEventListener('resize', onResize)
  }, [])

  // ── Auto-advance ─────────────────────────────────────────────────────────
  const advance = useCallback(() => {
    setActiveIndex((i) => (i + 1) % N)
  }, [])

  useEffect(() => {
    if (paused) {
      if (intervalRef.current) clearInterval(intervalRef.current)
      return
    }
    intervalRef.current = setInterval(advance, INTERVAL_MS)
    return () => { if (intervalRef.current) clearInterval(intervalRef.current) }
  }, [paused, advance])

  // ── Manual navigation (dots / swipe) ─────────────────────────────────────
  function goTo(i: number) {
    setActiveIndex(i)
    // Pause briefly after a manual interaction, then resume
    setPaused(true)
    if (resumeTimeout.current) clearTimeout(resumeTimeout.current)
    resumeTimeout.current = setTimeout(() => setPaused(false), 7000)
  }

  // ── Touch swipe ──────────────────────────────────────────────────────────
  function handleTouchStart(e: React.TouchEvent) {
    touchStartX.current = e.touches[0].clientX
  }

  function handleTouchEnd(e: React.TouchEvent) {
    if (touchStartX.current === null) return
    const delta = touchStartX.current - e.changedTouches[0].clientX
    if (Math.abs(delta) > 48) {
      goTo(delta > 0 ? (activeIndex + 1) % N : (activeIndex - 1 + N) % N)
    }
    touchStartX.current = null
  }

  // ── Per-card style (same math as the original scroll version) ────────────
  function cardStyle(i: number): React.CSSProperties {
    let off = i - activeIndex
    // Wrap to shortest arc so cards loop cleanly
    if (off >  N / 2) off -= N
    if (off < -N / 2) off += N
    const absOff = Math.abs(off)
    const tx  = off * step
    const sc  = Math.max(0.62, 1 - absOff * 0.19)
    const op  = Math.max(0,    1 - absOff * 0.48)
    const bl  = Math.min(9,    absOff * 3.5)
    const z   = Math.max(0,    10 - Math.round(absOff * 2))
    return {
      transform: `translateX(${tx}px) scale(${sc})`,
      opacity: op,
      filter: bl > 0.1 ? `blur(${bl.toFixed(1)}px)` : 'none',
      zIndex: z,
      transition: 'transform 0.75s cubic-bezier(0.4,0,0.2,1), opacity 0.75s ease, filter 0.75s ease',
    }
  }

  return (
    // overflow-hidden prevents horizontal scrollbars from off-screen cards.
    // No tall wrapper, no sticky — this section flows naturally in the page.
    <div
      className="overflow-hidden py-12 md:py-16"
      onMouseEnter={() => setPaused(true)}
      onMouseLeave={() => setPaused(false)}
      onTouchStart={handleTouchStart}
      onTouchEnd={handleTouchEnd}
    >
      {/* Card track */}
      <div
        className="relative w-full flex justify-center overflow-visible"
        style={{ height: 'clamp(360px, 52vh, 460px)' }}
      >
        {CARDS.map((card, i) => (
          <div
            key={i}
            style={{
              position: 'absolute',
              top: 0,
              width: 'min(700px, 84vw)',
              willChange: 'transform, opacity, filter',
              background: i % 2 === 0 ? 'rgba(14,28,54,0.95)' : 'rgba(8,40,60,0.95)',
              borderColor: i % 2 === 0 ? 'rgba(45,64,112,0.7)' : 'rgba(34,211,238,0.25)',
              ...cardStyle(i),
            }}
            className="rounded-lg border p-8 md:p-12"
          >
            {/* Catchphrase */}
            <p className="font-display mb-5 text-xl font-bold italic leading-snug text-slate-50 md:text-2xl lg:text-3xl">
              {card.catchphrase}
            </p>

            {/* Accent rule */}
            <div className="mb-5 h-px w-10 bg-cyan-400" />

            {/* Opportunity title */}
            <p className="mb-1 text-base font-bold leading-snug text-slate-100 md:text-lg">
              {card.title}
            </p>

            {/* Organization */}
            <p className="mb-4 text-[11px] uppercase tracking-wider text-slate-500">
              {card.org}
            </p>

            {/* Description */}
            <p className="mb-8 text-sm leading-relaxed text-slate-400 md:text-base">
              {card.description}
            </p>

            {/* Footer row */}
            <div className="flex items-center justify-between">
              <span className="border border-cyan-400/30 px-3 py-1 text-[10px] uppercase tracking-widest text-cyan-400">
                {card.badge}
              </span>
              <Link
                href={card.href}
                className="text-sm text-cyan-400 transition-colors hover:text-cyan-300"
              >
                View Opportunity &rarr;
              </Link>
            </div>
          </div>
        ))}
      </div>

      {/* Dot navigation */}
      <div className="mt-8 flex items-center justify-center gap-2.5">
        {CARDS.map((_, i) => (
          <button
            key={i}
            onClick={() => goTo(i)}
            aria-label={`Go to card ${i + 1}`}
            style={{
              width: 6,
              height: 6,
              borderRadius: '50%',
              background: i === activeIndex ? '#22d3ee' : 'rgba(148,163,184,0.25)',
              transform: i === activeIndex ? 'scale(1.6)' : 'scale(1)',
              transition: 'background 0.35s ease, transform 0.35s ease',
            }}
          />
        ))}
      </div>

      {/* Pause indicator — only shown while hovered */}
      <p
        className="mt-3 text-center text-[11px] uppercase tracking-widest transition-opacity duration-300"
        style={{ color: 'rgba(148,163,184,0.35)', opacity: paused ? 1 : 0 }}
      >
        paused
      </p>
    </div>
  )
}
