'use client'

import { useEffect, useRef, useState } from 'react'

const STATS = [
  {
    value: '400%',
    bar: 1.0,
    label: 'more likely to attend college',
    quote: 'Children consistently involved in extracurriculars are 400% more likely to go to college than kids who cannot access these programs.',
    source: 'EdSurge / Afterschool Alliance',
  },
  {
    value: '76%',
    bar: 0.76,
    label: 'of Gen Z had college pushed on them',
    quote: '76% of Gen Z say university was actively promoted by their high school, while only 31% remember trade school being encouraged.',
    source: 'Jobber Study, via Green Industry Pros',
  },
  {
    value: '60%',
    bar: 0.60,
    label: 'of teens want to start their own business',
    quote: '60% of teens want to launch their own businesses instead of working regular jobs — and 37% said they\'d be interested in after-school programs teaching entrepreneurship.',
    source: 'Junior Achievement USA / CNBC, 2022',
  },
  {
    value: '400:1',
    bar: 0.88,
    label: 'students per counselor in rural schools',
    quote: 'More students attend rural schools than attend the 100 largest U.S. school districts combined. Seven states averaged worse than 400-to-1 students per school counselor.',
    source: 'Why Rural Matters 2023, NREA',
  },
  {
    value: '"They\ndidn\'t."',
    bar: 0.12,
    label: 'students actually used the platform',
    quote: 'Only a handful of students were logging on for post-secondary planning. Students found the interface dated and uninviting. Students simply did not want to use it — so they didn\'t.',
    source: 'SchooLinks case study, Spokane Public Schools',
  },
]

// Bar heights for the chart — one per stat
const BAR_HEIGHTS = STATS.map(s => s.bar)

export function StatPanel() {
  const [active, setActive] = useState(0)
  const [animatedBars, setAnimatedBars] = useState(BAR_HEIGHTS.map(() => 0))
  const intervalRef = useRef<ReturnType<typeof setInterval> | null>(null)
  const hasAnimated = useRef(false)
  const containerRef = useRef<HTMLDivElement>(null)

  // Animate bars in on first visibility
  useEffect(() => {
    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry.isIntersecting && !hasAnimated.current) {
          hasAnimated.current = true
          setTimeout(() => setAnimatedBars(BAR_HEIGHTS), 100)
        }
      },
      { threshold: 0.3 }
    )
    if (containerRef.current) observer.observe(containerRef.current)
    return () => observer.disconnect()
  }, [])

  // Auto-cycle active stat
  useEffect(() => {
    intervalRef.current = setInterval(() => {
      setActive(a => (a + 1) % STATS.length)
    }, 3800)
    return () => { if (intervalRef.current) clearInterval(intervalRef.current) }
  }, [])

  const stat = STATS[active]

  return (
    <div ref={containerRef} className="flex flex-col gap-5">

      {/* Bar chart */}
      <div className="rounded-xl border border-navy-600 p-5" style={{ background: 'rgba(14,22,50,0.80)' }}>
        <p className="mb-4 text-[10px] uppercase tracking-widest text-cyan-400">Key Statistics</p>
        <div className="flex items-end gap-2 h-28">
          {STATS.map((s, i) => (
            <button
              key={i}
              onClick={() => { setActive(i); if (intervalRef.current) clearInterval(intervalRef.current) }}
              className="flex-1 flex flex-col items-center gap-1 group"
              aria-label={s.source}
            >
              <div className="w-full rounded-t-sm relative overflow-hidden" style={{ height: '96px' }}>
                {/* Background track */}
                <div className="absolute inset-0 rounded-t-sm" style={{ background: 'rgba(34,211,238,0.07)' }} />
                {/* Filled bar */}
                <div
                  className="absolute bottom-0 left-0 right-0 rounded-t-sm transition-all duration-1000"
                  style={{
                    height: `${animatedBars[i] * 100}%`,
                    background: i === active
                      ? 'linear-gradient(to top, rgba(34,211,238,0.9), rgba(56,189,248,0.5))'
                      : 'linear-gradient(to top, rgba(34,211,238,0.25), rgba(56,189,248,0.12))',
                    transition: 'height 1s cubic-bezier(0.16,1,0.3,1), background 0.4s ease',
                  }}
                />
              </div>
              {/* Dot indicator */}
              <span
                className="block w-1.5 h-1.5 rounded-full transition-all duration-300"
                style={{ background: i === active ? '#22d3ee' : 'rgba(148,163,184,0.25)' }}
              />
            </button>
          ))}
        </div>

        {/* Connector line suggestion */}
        <div className="mt-3 flex items-center gap-1.5">
          <div className="h-px flex-1" style={{ background: 'linear-gradient(to right, rgba(34,211,238,0.4), rgba(34,211,238,0.05))' }} />
          <span className="text-[9px] uppercase tracking-widest text-slate-600">click a bar to explore</span>
        </div>
      </div>

      {/* Active stat card */}
      <div
        key={active}
        className="rounded-xl border p-5 transition-all duration-500"
        style={{
          background: 'rgba(14,22,50,0.85)',
          borderColor: 'rgba(34,211,238,0.22)',
          animation: 'statFadeIn 0.5s ease',
        }}
      >
        {/* Big value */}
        <div className="mb-3 font-display text-4xl font-bold leading-tight text-cyan-400 whitespace-pre-line">
          {stat.value}
        </div>
        <p className="mb-3 text-xs font-semibold uppercase tracking-wider text-slate-300">{stat.label}</p>
        <p className="text-sm leading-relaxed text-white mb-3">&ldquo;{stat.quote}&rdquo;</p>
        <p className="text-[10px] uppercase tracking-widest text-slate-500">{stat.source}</p>
      </div>

      {/* Progress dots */}
      <div className="flex justify-center gap-2">
        {STATS.map((_, i) => (
          <button
            key={i}
            onClick={() => { setActive(i); if (intervalRef.current) clearInterval(intervalRef.current) }}
            className="w-1.5 h-1.5 rounded-full transition-all duration-300"
            style={{
              background: i === active ? '#22d3ee' : 'rgba(148,163,184,0.2)',
              transform: i === active ? 'scale(1.6)' : 'scale(1)',
            }}
          />
        ))}
      </div>
    </div>
  )
}
