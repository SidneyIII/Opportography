'use client'

import { useEffect, useRef } from 'react'

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
    copy: 'Help local civic bodies — city councils, voter registration offices, political organizations, small business development centers — connect residents to participation opportunities. From local elections and town halls to startup incubators and small business grants, Opportography surfaces the civic pathways most people never knew existed and makes collaboration between institutions easy.',
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

// Scroll budget per phase (title + 4 cards = 5 phases)
const VH_PER_PHASE = 65

// Phase progress boundaries (as fraction of total scroll budget)
// Card 0 enters almost immediately — title and first card overlap heavily
const TITLE_HOLD_END  = 0.02  // title static for just a beat
const TITLE_FADE_END  = 0.20  // title fully gone by here
const CARD_PHASES = [
  { start: 0.04, end: 0.26 },  // starts on first scroll — coincides with title midpoint
  { start: 0.26, end: 0.48 },
  { start: 0.48, end: 0.68 },
  { start: 0.68, end: 0.88 },
] as const

function clamp(v: number, lo: number, hi: number) {
  return Math.max(lo, Math.min(hi, v))
}

// easeOutCubic — fast in, settles cleanly
function ease(t: number) {
  return 1 - Math.pow(1 - t, 3)
}

export function InstitutionalIntegrations() {
  const wrapperRef = useRef<HTMLDivElement>(null)
  const titleRef   = useRef<HTMLDivElement>(null)
  const hintRef    = useRef<HTMLParagraphElement>(null)
  const cardRefs   = useRef<(HTMLDivElement | null)[]>([])

  useEffect(() => {
    let raf = 0

    function update() {
      const wrapper = wrapperRef.current
      if (!wrapper) return

      const wrapperTop = wrapper.getBoundingClientRect().top + window.scrollY
      const budget = wrapper.offsetHeight - window.innerHeight
      if (budget <= 0) return

      const into = window.scrollY - wrapperTop
      const p = clamp(into / budget, 0, 1)

      // ── Title ─────────────────────────────────────────────────
      const titleEl = titleRef.current
      if (titleEl) {
        const tp = clamp(
          (p - TITLE_HOLD_END) / (TITLE_FADE_END - TITLE_HOLD_END),
          0, 1,
        )
        titleEl.style.opacity   = String((1 - tp).toFixed(3))
        titleEl.style.transform = `translateY(${(-tp * 36).toFixed(1)}px)`
        titleEl.style.pointerEvents = tp > 0.5 ? 'none' : 'auto'
      }

      // ── Scroll hint ───────────────────────────────────────────
      const hintEl = hintRef.current
      if (hintEl) {
        const hp = clamp(p / TITLE_FADE_END, 0, 1)
        hintEl.style.opacity = String((1 - hp).toFixed(3))
      }

      // ── Cards ─────────────────────────────────────────────────
      const slideX = Math.min(window.innerWidth * 0.7, 520)

      cardRefs.current.forEach((el, i) => {
        if (!el) return
        const phase = CARD_PHASES[i]
        if (!phase) return
        const cp = clamp(
          (p - phase.start) / (phase.end - phase.start),
          0, 1,
        )
        const easedP = ease(cp)
        // even cards (0, 2) → enter from left; odd (1, 3) → from right
        const dir = i % 2 === 0 ? -1 : 1
        const tx  = dir * slideX * (1 - easedP)
        el.style.transform = `translateX(${tx.toFixed(1)}px)`
        el.style.opacity   = String(easedP.toFixed(3))
      })
    }

    function onScroll() {
      cancelAnimationFrame(raf)
      raf = requestAnimationFrame(update)
    }

    // Position everything correctly before first scroll
    update()

    window.addEventListener('scroll', onScroll, { passive: true })
    window.addEventListener('resize', update)
    return () => {
      window.removeEventListener('scroll', onScroll)
      window.removeEventListener('resize', update)
      cancelAnimationFrame(raf)
    }
  }, [])

  const totalHeight = `${CARDS.length * VH_PER_PHASE + VH_PER_PHASE}vh`

  return (
    <div ref={wrapperRef} style={{ height: totalHeight, overflowX: 'clip' }}>
      <div className="sticky top-0 overflow-hidden" style={{ height: '100vh' }}>

        {/* ── Title phase ─────────────────────────────────────── */}
        <div
          ref={titleRef}
          className="absolute inset-0 flex flex-col items-center justify-start pt-24 px-6 md:pt-28"
          style={{ willChange: 'transform, opacity', zIndex: 10 }}
        >
          <p className="mb-4 text-[11px] uppercase tracking-widest text-cyan-400">
            Platform
          </p>
          <h2 className="font-display max-w-2xl text-center text-3xl font-bold text-slate-50 md:text-4xl lg:text-5xl">
            Opportography integrates into...
          </h2>
        </div>

        {/* ── Cards grid ──────────────────────────────────────── */}
        <div className="absolute inset-0 flex items-center justify-center px-4 py-16 md:px-16 lg:px-24">
          <div className="grid w-full max-w-5xl gap-5 sm:grid-cols-2">
            {CARDS.map((card, i) => (
              <div
                key={card.title}
                ref={(el) => { cardRefs.current[i] = el }}
                style={{
                  background: card.accent,
                  border: `1px solid ${card.border}`,
                  opacity: 0,
                  willChange: 'transform, opacity',
                }}
                className="rounded-lg p-6 backdrop-blur-sm"
              >
                {/* Icon */}
                <div className="mb-4 flex h-10 w-10 items-center justify-center rounded-md border border-navy-600 bg-navy-800/70">
                  {card.icon}
                </div>

                {/* Heading */}
                <h3 className="font-display mb-3 text-base font-bold leading-snug text-slate-100">
                  {card.title}
                </h3>

                {/* Copy */}
                <p className="text-sm leading-relaxed text-slate-400">
                  {card.copy}
                </p>
              </div>
            ))}
          </div>
        </div>

        {/* ── Scroll hint ─────────────────────────────────────── */}
        <div className="absolute bottom-6 left-0 right-0 z-20 flex justify-center">
          <p
            ref={hintRef}
            className="text-[11px] uppercase tracking-widest text-slate-600"
          >
            scroll to explore
          </p>
        </div>

      </div>
    </div>
  )
}
