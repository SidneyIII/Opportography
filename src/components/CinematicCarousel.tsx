'use client'

import { useEffect, useRef } from 'react'
import Link from 'next/link'

const CARDS = [
  {
    catchphrase: "Don\u2019t want a four-year degree. Don\u2019t want to be stuck either.",
    title: "Ironworkers Local 21 \u2014 Structural & Reinforcing Steel Apprenticeship (Nebraska + Iowa)",
    org: "Iron Workers International Local 21",
    description: "Ironworkers Local 21 apprentices earn $23.50/hr starting pay (65% of journeyman scale) from the first day on the job.",
    badge: "Union Apprenticeship",
    href: "/opportunities/b0f275ff-6f6d-42d8-86fe-385849a85ab4",
  },
  {
    catchphrase: "Everyone said entrepreneurship was for people with connections. You don\u2019t have those yet.",
    title: "1 Million Cups Omaha",
    org: "1MC Omaha",
    description: "This is one of the best low-barrier entry points into the Omaha entrepreneurship community for anyone with a business idea or who wants to meet founders.",
    badge: "Networking",
    href: "/opportunities/284ff007-89fd-4b63-b3d7-87f25e252ecf",
  },
  {
    catchphrase: "First in your family to figure this out. No roadmap.",
    title: "Creighton University TRIO Classic Upward Bound \u2014 Free College Prep for Omaha HS Students",
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
    description: "Youth earn $10\u2013$14/hr and complete two weeks of paid job training before starting at 80+ worksites including hospitals, banks, nonprofits, the zoo, and tech companies.",
    badge: "Internship",
    href: "/opportunities/ac0af498-9315-47a3-b8d7-ceda8cb8190b",
  },
  {
    catchphrase: "Everyone assumes tech is for someone else. It isn\u2019t.",
    title: "AIM Institute Youth in Tech \u2014 Summer Code Camp",
    org: "AIM Institute",
    description: "AIM serves low-income students specifically and connects participants to high-wage, high-demand tech career pathways.",
    badge: "Summer Program",
    href: "/opportunities/3e23504f-574f-478c-bcf2-6ab104f7264a",
  },
  {
    catchphrase: "You want mentors who know where you came from.",
    title: "100 Black Men of Omaha \u2014 Leadership Mentoring Academy (Free, Grades 9\u201312)",
    org: "100 Black Men of Omaha, Inc.",
    description: "The LMA has had a 100% graduation rate since 2008, and 85% of LMA graduates attend post-secondary educational institutions.",
    badge: "Mentorship",
    href: "/opportunities/b30128e0-7d9f-4c24-8962-c0065b15cf78",
  },
]

// Height per card in vh — controls how much scrolling each transition takes
const VH_PER_CARD = 80

export function CinematicCarousel() {
  const wrapperRef = useRef<HTMLDivElement>(null)
  const stickyRef  = useRef<HTMLDivElement>(null)
  const cardEls    = useRef<(HTMLDivElement | null)[]>([])
  const dotEls     = useRef<(HTMLSpanElement | null)[]>([])

  useEffect(() => {
    const N = CARDS.length
    let raf = 0

    function update() {
      const wrapper = wrapperRef.current
      if (!wrapper) return

      // Distance from page top to wrapper top (accounts for any sticky nav)
      const wrapperTop = wrapper.getBoundingClientRect().top + window.scrollY
      const budget = wrapper.offsetHeight - window.innerHeight
      if (budget <= 0) return

      const into = window.scrollY - wrapperTop
      const p = Math.max(0, Math.min(1, into / budget))

      // Floating active-card index (e.g. 1.4 = between card 1 and 2)
      const active = p * (N - 1)

      // How wide a card actually renders (capped by viewport)
      const cardW = Math.min(700, window.innerWidth * 0.84)
      // How many px of adjacent cards peek in from each side
      const peekPx = Math.max(52, window.innerWidth * 0.11)
      // Scale applied to adjacent cards
      const adjScale = 0.82
      // Distance between card centers that produces exactly `peekPx` of the
      // adjacent card visible at the viewport edge
      const STEP = window.innerWidth / 2 + adjScale * (cardW / 2) - peekPx

      cardEls.current.forEach((el, i) => {
        if (!el) return
        // Wrap to shortest distance so cards always appear on both sides
        let off = i - active
        if (off >  N / 2) off -= N
        if (off < -N / 2) off += N
        const absOff = Math.abs(off)
        const tx     = off * STEP
        const sc     = Math.max(0.62, 1 - absOff * 0.19)
        const op     = Math.max(0,    1 - absOff * 0.48)
        const bl     = Math.min(9,    absOff * 3.5)
        const z      = Math.max(0,    10 - Math.round(absOff * 2))

        el.style.transform = `translateX(${tx}px) scale(${sc})`
        el.style.opacity   = String(Number(op.toFixed(3)))
        el.style.filter    = bl > 0.1 ? `blur(${bl.toFixed(1)}px)` : 'none'
        el.style.zIndex    = String(z)
      })

      const activeIdx = Math.round(active)
      dotEls.current.forEach((el, i) => {
        if (!el) return
        el.style.background = i === activeIdx ? '#22d3ee' : 'rgba(148,163,184,0.25)'
        el.style.transform  = i === activeIdx ? 'scale(1.7)' : 'scale(1)'
      })
    }

    function onScroll() {
      cancelAnimationFrame(raf)
      raf = requestAnimationFrame(update)
    }

    // Run once on mount so cards are positioned before user scrolls
    update()

    window.addEventListener('scroll', onScroll, { passive: true })
    window.addEventListener('resize', update)
    return () => {
      window.removeEventListener('scroll', onScroll)
      window.removeEventListener('resize', update)
      cancelAnimationFrame(raf)
    }
  }, [])

  const totalHeight = `${CARDS.length * VH_PER_CARD}vh`

  return (
    <div ref={wrapperRef} style={{ height: totalHeight, overflowX: 'clip' }}>
      <div
        ref={stickyRef}
        className="sticky top-0 overflow-hidden flex flex-col items-center justify-center"
        style={{ height: '100vh' }}
      >

        {/*
          Card container — fixed height calibrated to the card content
          (p-8/p-12 + catchphrase + rule + title + org + description + footer).
          Cards are position:absolute within this container and shifted
          horizontally by JS. The container gives this layout a real height
          so the scroll hint can follow naturally below it.
        */}
        {/*
          flex justify-center is required: it sets the CSS static position of
          the absolute cards to the horizontal center of the container, so
          translateX(0) from JS places the active card centered in the viewport.
        */}
        <div
          className="relative shrink-0 w-full overflow-visible flex justify-center"
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
              }}
              className="rounded-lg border border-navy-600 bg-navy-800 p-8 md:p-12"
            >
              {/* Catchphrase */}
              <p className="font-display mb-5 text-xl font-bold italic leading-snug text-slate-50 md:text-2xl lg:text-3xl">
                {card.catchphrase}
              </p>

              {/* Accent rule */}
              <div className="mb-5 h-px w-10 bg-cyan-400" />

              {/* Opportunity title */}
              <h3 className="mb-1 text-base font-bold leading-snug text-slate-100 md:text-lg">
                {card.title}
              </h3>

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

        {/* Gap between card bottom and scroll hint — ~32px */}
        <div className="shrink-0 h-8" />

        {/* Scroll hint */}
        <p className="shrink-0 text-[11px] uppercase tracking-widest text-slate-600">
          scroll to explore
        </p>

        {/* Progress dots */}
        <div className="shrink-0 mt-2 flex gap-2">
          {CARDS.map((_, i) => (
            <span
              key={i}
              ref={el => { dotEls.current[i] = el }}
              style={{
                display: 'inline-block',
                width: 5,
                height: 5,
                borderRadius: '50%',
                background: i === 0 ? '#22d3ee' : 'rgba(148,163,184,0.25)',
                transform: i === 0 ? 'scale(1.7)' : 'scale(1)',
                transition: 'background 0.35s ease, transform 0.35s ease',
              }}
            />
          ))}
        </div>
      </div>
    </div>
  )
}
