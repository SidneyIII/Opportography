'use client'

import { useState } from 'react'
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

// Duplicate for seamless infinite loop — translateX(-50%) lands exactly on the repeat
const MARQUEE_CARDS = [...CARDS, ...CARDS]

// Each card slot = card width + margin-right; -50% translateX = exactly 7 cards
const CARD_WIDTH  = 440  // px
const CARD_MARGIN = 28   // px  — margin-right between cards
const DURATION    = 52   // seconds for one full loop  (~8.5 px/s — slow, readable)

export function CinematicCarousel() {
  const [paused, setPaused] = useState(false)

  return (
    <div
      className="overflow-hidden"
      onMouseEnter={() => setPaused(true)}
      onMouseLeave={() => setPaused(false)}
    >
      {/* Marquee track — width: max-content so translateX(-50%) = exactly half */}
      <div
        style={{
          display: 'flex',
          width: 'max-content',
          animationName: 'carousel-marquee',
          animationDuration: `${DURATION}s`,
          animationTimingFunction: 'linear',
          animationIterationCount: 'infinite',
          animationPlayState: paused ? 'paused' : 'running',
        }}
      >
        {MARQUEE_CARDS.map((card, i) => (
          <div
            key={i}
            style={{
              width: CARD_WIDTH,
              marginRight: CARD_MARGIN,
              flexShrink: 0,
              background: i % 2 === 0 ? 'rgba(14,28,54,0.95)' : 'rgba(8,40,60,0.95)',
              borderColor: i % 2 === 0 ? 'rgba(45,64,112,0.7)' : 'rgba(34,211,238,0.25)',
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
                // Prevent the link click from resuming the marquee
                onClick={(e) => e.stopPropagation()}
              >
                View &rarr;
              </Link>
            </div>
          </div>
        ))}
      </div>

      {/* Pause hint — fades in on hover */}
      <p
        className="mt-3 text-center text-[10px] uppercase tracking-widest transition-opacity duration-300"
        style={{ color: 'rgba(148,163,184,0.3)', opacity: paused ? 1 : 0 }}
      >
        paused — hover to read, scroll to continue
      </p>
    </div>
  )
}
