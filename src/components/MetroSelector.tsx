'use client'

import { useState, useEffect, useRef } from 'react'
import type { MetroArea } from '@/lib/types'

interface MetroSelectorProps {
  metros: MetroArea[]
}

const STORAGE_KEY = 'opportography-selected-metro'

export function MetroSelector({ metros }: MetroSelectorProps) {
  const flagship = metros.find((m) => m.is_flagship) ?? metros[0]
  const [selected, setSelected] = useState<MetroArea>(flagship)
  const [open, setOpen] = useState(false)
  const ref = useRef<HTMLDivElement>(null)

  // Restore from localStorage on mount
  useEffect(() => {
    const stored = localStorage.getItem(STORAGE_KEY)
    if (stored) {
      const found = metros.find((m) => m.slug === stored)
      if (found?.is_active) setSelected(found)
    }
  }, [metros])

  // Close on outside click
  useEffect(() => {
    function handleClick(e: MouseEvent) {
      if (ref.current && !ref.current.contains(e.target as Node)) {
        setOpen(false)
      }
    }
    document.addEventListener('mousedown', handleClick)
    return () => document.removeEventListener('mousedown', handleClick)
  }, [])

  function choose(metro: MetroArea) {
    if (!metro.is_active) return
    setSelected(metro)
    localStorage.setItem(STORAGE_KEY, metro.slug)
    setOpen(false)
  }

  const inactive = metros.filter((m) => !m.is_active)
  const active = metros.filter((m) => m.is_active)

  return (
    <div ref={ref} className="relative inline-block">
      <button
        onClick={() => setOpen((o) => !o)}
        className="inline-flex items-center gap-2 rounded-full border border-cyan-400/30 bg-cyan-400/10 px-4 py-1.5 text-xs font-medium text-cyan-400 transition-colors hover:border-cyan-400/50 hover:bg-cyan-400/15"
        aria-label={`Currently showing: ${selected.name}. Click to change city.`}
        aria-expanded={open}
        aria-haspopup="listbox"
      >
        <span className="h-1.5 w-1.5 animate-pulse rounded-full bg-cyan-400" />
        {selected.short_name}
        <svg
          width="10"
          height="10"
          viewBox="0 0 10 10"
          fill="currentColor"
          className={`transition-transform duration-150 ${open ? 'rotate-180' : ''}`}
          aria-hidden="true"
        >
          <path d="M5 7L1 3h8L5 7z" />
        </svg>
      </button>

      {open && (
        <div
          role="listbox"
          aria-label="Select your city"
          className="absolute left-1/2 top-full z-50 mt-2 w-64 -translate-x-1/2 rounded-xl border border-navy-600 bg-navy-800 py-1 shadow-2xl shadow-navy-950/80"
        >
          <p className="px-4 pb-1.5 pt-2.5 text-xs font-semibold uppercase tracking-wider text-slate-500">
            Select Your City
          </p>

          {active.map((metro) => (
            <button
              key={metro.id}
              role="option"
              aria-selected={selected.id === metro.id}
              onClick={() => choose(metro)}
              className={`flex w-full items-center justify-between px-4 py-2.5 text-left text-sm transition-colors hover:bg-navy-700 ${
                selected.id === metro.id
                  ? 'text-cyan-400'
                  : 'text-slate-300'
              }`}
            >
              <span>{metro.name}</span>
              {selected.id === metro.id && (
                <svg width="14" height="14" viewBox="0 0 14 14" fill="currentColor" aria-hidden="true">
                  <path d="M2 7l4 4 6-6" stroke="currentColor" strokeWidth="2" fill="none" strokeLinecap="round" />
                </svg>
              )}
            </button>
          ))}

          {inactive.length > 0 && (
            <>
              <div className="my-1 border-t border-navy-700" />
              <p className="px-4 pb-1 pt-1.5 text-xs font-semibold uppercase tracking-wider text-slate-600">
                Coming Soon
              </p>
              {inactive.map((metro) => (
                <div
                  key={metro.id}
                  className="flex items-center justify-between px-4 py-2.5 text-sm text-slate-600"
                  aria-disabled="true"
                >
                  <span>{metro.name}</span>
                  <span className="rounded-full border border-slate-700 px-2 py-0.5 text-[10px] font-medium text-slate-600">
                    Waitlist
                  </span>
                </div>
              ))}
              <div className="border-t border-navy-700 px-4 py-3">
                <p className="text-xs text-slate-600">
                  Bringing Opportography to your city?{' '}
                  <a
                    href="/support"
                    className="text-slate-500 underline-offset-2 hover:text-cyan-400 hover:underline"
                  >
                    Get in touch
                  </a>
                </p>
              </div>
            </>
          )}
        </div>
      )}
    </div>
  )
}
