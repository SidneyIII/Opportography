'use client'

import { useEffect, useRef } from 'react'
import Link from 'next/link'

const CARDS = [
  {
    catchphrase: "Don't want a four-year degree. Don't want to be stuck either.",
    title: "Ironworkers Local 21 — Structural & Reinforcing Steel Apprenticeship (Nebraska + Iowa)",
    org: "Iron Workers International Local 21",
    description: "Ironworkers Local 21 apprentices earn $23.50/hr starting pay (65% of journeyman scale) from the first day on the job.",
    badge: "Union Apprenticeship",
    href: "/opportunities/b0f275ff-6f6d-42d8-86fe-385849a85ab4",
  },
  {
    catchphrase: "Everyone said entrepreneurship was for people with connections. You don't have those yet.",
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
    catchphrase: "Everyone assumes tech is for someone else. It isn't.",
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
const INTERVAL_MS = 4800

export function CinematicCarousel() {
  const cardEls   = useRef<(HTMLDivElement  | null)[]>([])
  const dotEls    = useRef<(HTMLSpanElement | null)[]>([])
  const activeRef = useRef(0)
  const pausedRef = useRef(false)
  const resumeTimer = useRef<ReturnType<typeof setTimeout> | null>(null)

  // ── Compute step: how far apart card centres are (px) ───────────────────
  function getStep() {
    const cardW   = Math.min(700, window.innerWidth * 0.84)
    const peekPx  = Math.max(52, window.innerWidth * 0.11)
    const adj     = 0.82
    return window.innerWidth / 2 + adj * (cardW / 2) - peekPx
  }

  // ── Apply card + dot positions directly to the DOM ───────────────────────
  function apply(idx: number, animate: boolean) {
    const step = getStep()

    cardEls.current.forEach((el, i) => {
      if (!el) return
      let off = i - idx
      if (off >  N / 2) off -= N
      if (off < -N / 2) off += N
      const absOff = Math.abs(off)
      const tx = off * step
      const sc = Math.max(0.62, 1 - absOff * 0.19)
      const op = Math.max(0,    1 - absOff * 0.48)
      const bl = Math.min(9,    absOff * 3.5)
      const z  = Math.max(0,    10 - Math.round(absOff * 2))

      el.style.transition = animate
        ? 'transform 0.75s cubic-bezier(0.4,0,0.2,1), opacity 0.75s ease, filter 0.75s ease'
        : 'none'
      el.style.transform = `translateX(${tx}px) scale(${sc})`
      el.style.opacity   = op.toFixed(3)
      el.style.filter    = bl > 0.1 ? `blur(${bl.toFixed(1)}px)` : 'none'
      el.style.zIndex    = String(z)
    })

    dotEls.current.forEach((el, i) => {
      if (!el) return
      el.style.background = i === idx ? '#22d3ee' : 'rgba(148,163,184,0.25)'
      el.style.transform  = i === idx ? 'scale(1.6)' : 'scale(1)'
    })
  }

  // ── Advance to a specific card ────────────────────────────────────────────
  function goTo(idx: number) {
    activeRef.current = idx
    apply(idx, true)
  }

  // ── Manual dot/swipe: go to card + pause briefly before resuming ──────────
  function manualGoTo(idx: number) {
    goTo(idx)
    pausedRef.current = true
    if (resumeTimer.current) clearTimeout(resumeTimer.current)
    resumeTimer.current = setTimeout(() => { pausedRef.current = false }, 7000)
  }

  useEffect(() => {
    // Position cards immediately (no animation) so layout is correct on mount
    apply(0, false)

    const interval = setInterval(() => {
      if (!pausedRef.current) {
        goTo((activeRef.current + 1) % N)
      }
    }, INTERVAL_MS)

    function onResize() { apply(activeRef.current, false) }
    window.addEventListener('resize', onResize)

    return () => {
      clearInterval(interval)
      window.removeEventListener('resize', onResize)
      if (resumeTimer.current) clearTimeout(resumeTimer.current)
    }
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  // ── Touch swipe ──────────────────────────────────────────────────────────
  const touchStartX = useRef<number | null>(null)
  function handleTouchStart(e: React.TouchEvent) {
    touchStartX.current = e.touches[0].clientX
  }
  function handleTouchEnd(e: React.TouchEvent) {
    if (touchStartX.current === null) return
    const delta = touchStartX.current - e.changedTouches[0].clientX
    if (Math.abs(delta) > 48) {
      manualGoTo(delta > 0 ? (activeRef.current + 1) % N : (activeRef.current - 1 + N) % N)
    }
    touchStartX.current = null
  }

  return (
    <div
      className="overflow-hidden py-12 md:py-16"
      onMouseEnter={() => { pausedRef.current = true }}
      onMouseLeave={() => { pausedRef.current = false }}
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
            ref={el => { cardEls.current[i] = el }}
            style={{
              position: 'absolute',
              top: 0,
              width: 'min(700px, 84vw)',
              willChange: 'transform, opacity, filter',
              background: i % 2 === 0 ? 'rgba(14,28,54,0.95)' : 'rgba(8,40,60,0.95)',
              borderColor: i % 2 === 0 ? 'rgba(45,64,112,0.7)' : 'rgba(34,211,238,0.25)',
            }}
            className="rounded-lg border p-8 md:p-12"
          >
            <p className="font-display mb-5 text-xl font-bold italic leading-snug text-slate-50 md:text-2xl lg:text-3xl">
              {card.catchphrase}
            </p>
            <div className="mb-5 h-px w-10 bg-cyan-400" />
            <p className="mb-1 text-base font-bold leading-snug text-slate-100 md:text-lg">
              {card.title}
            </p>
            <p className="mb-4 text-[11px] uppercase tracking-wider text-slate-500">
              {card.org}
            </p>
            <p className="mb-8 text-sm leading-relaxed text-slate-400 md:text-base">
              {card.description}
            </p>
            <div className="flex items-center justify-between">
              <span className="border border-cyan-400/30 px-3 py-1 text-[10px] uppercase tracking-widest text-cyan-400">
                {card.badge}
              </span>
              <Link href={card.href} className="text-sm text-cyan-400 transition-colors hover:text-cyan-300">
                View Opportunity &rarr;
              </Link>
            </div>
          </div>
        ))}
      </div>

      {/* Dot navigation */}
      <div className="mt-8 flex items-center justify-center gap-3">
        {CARDS.map((_, i) => (
          <button
            key={i}
            onClick={() => manualGoTo(i)}
            aria-label={`Go to card ${i + 1}`}
            className="flex items-center justify-center p-1"
          >
            <span
              ref={el => { dotEls.current[i] = el }}
              style={{
                display: 'block',
                width: 6,
                height: 6,
                borderRadius: '50%',
                background: i === 0 ? '#22d3ee' : 'rgba(148,163,184,0.25)',
                transform: i === 0 ? 'scale(1.6)' : 'scale(1)',
                transition: 'background 0.35s ease, transform 0.35s ease',
              }}
            />
          </button>
        ))}
      </div>
    </div>
  )
}
