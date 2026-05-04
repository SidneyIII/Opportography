'use client'

import { useEffect, useRef } from 'react'
import Link from 'next/link'

const CARDS = [
  {
    catchphrase: "Don't want a four-year degree. Don't want to be stuck either.",
    title: "Ironworkers Local 21 — Structural & Reinforcing Steel Apprenticeship",
    org: "Iron Workers International Local 21",
    description: "Earn $23.50/hr starting pay from day one. Full union benefits, structured training, no degree required.",
    badge: "Union Apprenticeship",
    href: "/opportunities/b0f275ff-6f6d-42d8-86fe-385849a85ab4",
  },
  {
    catchphrase: "Everyone said entrepreneurship was for people with connections.",
    title: "1 Million Cups Omaha",
    org: "1MC Omaha",
    description: "One of the best low-barrier entry points into the Omaha startup community for anyone with a business idea.",
    badge: "Networking",
    href: "/opportunities/284ff007-89fd-4b63-b3d7-87f25e252ecf",
  },
  {
    catchphrase: "First in your family to figure this out. No roadmap.",
    title: "Creighton TRIO Upward Bound — Free College Prep for Omaha HS Students",
    org: "Creighton University TRIO Programs",
    description: "This program has changed thousands of lives in Omaha. Free, intensive, and built for first-gen students.",
    badge: "College Access",
    href: "/opportunities/6125526b-eb66-4ec2-ab88-d05a1a684e88",
  },
  {
    catchphrase: "Scholarship applications feel like they were written for someone else.",
    title: "UNO Goodrich Scholarship Program",
    org: "University of Nebraska at Omaha",
    description: "Targets students facing significant obstacles — financial constraints don't disqualify you here.",
    badge: "Institutional Scholarship",
    href: "/opportunities/a4ad7cea-d1cc-4e20-bec6-fc9362b7f6fa",
  },
  {
    catchphrase: "You want real experience. Not just a class about it.",
    title: "Step Up Omaha! Summer Youth Employment",
    org: "Step Up Omaha / Empowerment Network",
    description: "Youth earn $10–$14/hr with two weeks of paid job training before working at 80+ real worksites.",
    badge: "Internship",
    href: "/opportunities/ac0af498-9315-47a3-b8d7-ceda8cb8190b",
  },
  {
    catchphrase: "Everyone assumes tech is for someone else. It isn't.",
    title: "AIM Institute Youth in Tech — Summer Code Camp",
    org: "AIM Institute",
    description: "Serves low-income students specifically. Connects participants to high-wage, high-demand tech careers.",
    badge: "Summer Program",
    href: "/opportunities/3e23504f-574f-478c-bcf2-6ab104f7264a",
  },
  {
    catchphrase: "You want mentors who know where you came from.",
    title: "100 Black Men of Omaha — Leadership Mentoring Academy",
    org: "100 Black Men of Omaha, Inc.",
    description: "100% graduation rate since 2008. 85% of graduates attend post-secondary institutions.",
    badge: "Mentorship",
    href: "/opportunities/b30128e0-7d9f-4c24-8962-c0065b15cf78",
  },
]

// Duplicate for seamless loop — when offset reaches TOTAL_WIDTH, reset to 0
const MARQUEE_CARDS = [...CARDS, ...CARDS]

const CARD_WIDTH  = 440   // px
const CARD_MARGIN = 28    // px gap between cards
const CARD_STRIDE = CARD_WIDTH + CARD_MARGIN   // 468px per card slot
const TOTAL_WIDTH = CARDS.length * CARD_STRIDE // 3276px — one full set

// Speed: px per millisecond (full loop in ~57 seconds)
const SPEED = TOTAL_WIDTH / (57 * 1000)

// Depth scaling: card at center = 1.0, card at DIST_REF away = SCALE_MIN
const DIST_REF   = 500
const SCALE_MIN  = 0.80
const OPACITY_MIN = 0.38

export function CinematicCarousel() {
  const outerRef   = useRef<HTMLDivElement>(null)
  const trackRef   = useRef<HTMLDivElement>(null)
  const cardRefs   = useRef<(HTMLDivElement | null)[]>([])
  const offsetRef  = useRef(0)       // current scroll offset in px
  const lastTimeRef = useRef<number | null>(null)
  const isPausedRef = useRef(false)
  const rafRef     = useRef<number>(0)

  useEffect(() => {
    const outer = outerRef.current
    const track = trackRef.current
    if (!outer || !track) return

    function tick(now: number) {
      if (lastTimeRef.current === null) lastTimeRef.current = now
      const dt = Math.min(now - lastTimeRef.current, 80) // cap to avoid jumps on tab resume
      lastTimeRef.current = now

      if (!isPausedRef.current) {
        offsetRef.current += SPEED * dt
        // Seamless reset — second set of cards has identical content to first
        if (offsetRef.current >= TOTAL_WIDTH) offsetRef.current -= TOTAL_WIDTH
      }

      const tx = -offsetRef.current
      track!.style.transform = `translateX(${tx}px)`

      // Scale each card based on its computed distance from the container center
      const outerRect = outer!.getBoundingClientRect()
      const viewCenter = outerRect.left + outerRect.width / 2

      cardRefs.current.forEach((el, i) => {
        if (!el) return
        // Card's center in viewport coords (computed from JS offset, not DOM query)
        const cardCenter = outerRect.left + tx + i * CARD_STRIDE + CARD_WIDTH / 2
        const dist = Math.abs(cardCenter - viewCenter)
        const t = Math.min(dist / DIST_REF, 1)
        const scale   = SCALE_MIN + (1 - SCALE_MIN) * (1 - t)
        const opacity = OPACITY_MIN + (1 - OPACITY_MIN) * (1 - t)
        el.style.transform = `scale(${scale.toFixed(4)})`
        el.style.opacity   = opacity.toFixed(3)
      })

      rafRef.current = requestAnimationFrame(tick)
    }

    rafRef.current = requestAnimationFrame(tick)
    return () => cancelAnimationFrame(rafRef.current)
  }, [])

  function handleMouseEnter() {
    if (window.matchMedia('(hover: hover)').matches) isPausedRef.current = true
  }

  function handleMouseLeave() {
    isPausedRef.current = false
  }

  return (
    <div
      ref={outerRef}
      className="overflow-hidden"
      onMouseEnter={handleMouseEnter}
      onMouseLeave={handleMouseLeave}
    >
      {/* Track — translateX driven by rAF loop */}
      <div
        ref={trackRef}
        style={{
          display: 'flex',
          width: 'max-content',
          willChange: 'transform',
        }}
      >
        {MARQUEE_CARDS.map((card, i) => (
          <div
            key={i}
            ref={(el) => { cardRefs.current[i] = el }}
            style={{
              width: CARD_WIDTH,
              marginRight: CARD_MARGIN,
              flexShrink: 0,
              background: i % 2 === 0 ? 'rgba(14,28,54,0.95)' : 'rgba(8,40,60,0.95)',
              borderColor: i % 2 === 0 ? 'rgba(45,64,112,0.7)' : 'rgba(34,211,238,0.25)',
              transformOrigin: 'center center',
              willChange: 'transform, opacity',
            }}
            className="rounded-xl border p-7 flex flex-col"
          >
            {/* Catchphrase */}
            <p className="font-display mb-4 text-lg font-bold italic leading-snug text-slate-50">
              {card.catchphrase}
            </p>

            {/* Accent rule */}
            <div className="mb-4 h-px w-8 bg-cyan-400" />

            {/* Title */}
            <p className="mb-1 text-sm font-bold leading-snug text-slate-100 line-clamp-2">
              {card.title}
            </p>

            {/* Org */}
            <p className="mb-3 text-[10px] uppercase tracking-wider text-slate-500">
              {card.org}
            </p>

            {/* Description */}
            <p className="mb-6 text-sm leading-relaxed text-slate-400 line-clamp-3 flex-1">
              {card.description}
            </p>

            {/* Footer */}
            <div className="flex items-center justify-between">
              <span className="border border-cyan-400/30 px-2.5 py-0.5 text-[10px] uppercase tracking-widest text-cyan-400">
                {card.badge}
              </span>
              <Link
                href={card.href}
                className="text-xs text-cyan-400 transition-colors hover:text-cyan-300"
                onClick={(e) => e.stopPropagation()}
              >
                View &rarr;
              </Link>
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}
