'use client'

import { useState, useMemo } from 'react'
import Link from 'next/link'
import { Opportunity } from '@/lib/types'
import { TypeBadge } from './TypeBadge'
import { isExpired } from '@/lib/utils'

interface CalendarViewProps {
  opportunities: Opportunity[]
}

const DAY_LABELS = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
const MONTH_NAMES = [
  'January', 'February', 'March', 'April', 'May', 'June',
  'July', 'August', 'September', 'October', 'November', 'December',
]

function pad(n: number): string {
  return n.toString().padStart(2, '0')
}

export function CalendarView({ opportunities }: CalendarViewProps) {
  const today = new Date()
  const [year, setYear] = useState(today.getFullYear())
  const [month, setMonth] = useState(today.getMonth())
  const [selectedDate, setSelectedDate] = useState<string | null>(null)

  const todayStr = `${today.getFullYear()}-${pad(today.getMonth() + 1)}-${pad(today.getDate())}`

  // Build deadline → opportunities map for the selected month
  const oppsByDate = useMemo(() => {
    const map: Record<string, Opportunity[]> = {}
    for (const opp of opportunities) {
      if (!opp.deadline) continue
      const [y, m] = opp.deadline.split('-').map(Number)
      if (y === year && m - 1 === month) {
        if (!map[opp.deadline]) map[opp.deadline] = []
        map[opp.deadline].push(opp)
      }
    }
    return map
  }, [opportunities, year, month])

  // Count of all deadlines in this month for the header
  const monthDeadlineCount = Object.values(oppsByDate).reduce((s, a) => s + a.length, 0)

  function prevMonth() {
    if (month === 0) { setMonth(11); setYear((y) => y - 1) }
    else setMonth((m) => m - 1)
    setSelectedDate(null)
  }

  function nextMonth() {
    if (month === 11) { setMonth(0); setYear((y) => y + 1) }
    else setMonth((m) => m + 1)
    setSelectedDate(null)
  }

  const firstDayOfWeek = new Date(year, month, 1).getDay()
  const daysInMonth = new Date(year, month + 1, 0).getDate()

  // Build flat array: null for empty leading cells, number for day
  const cells: (number | null)[] = [
    ...Array<null>(firstDayOfWeek).fill(null),
    ...Array.from({ length: daysInMonth }, (_, i) => i + 1),
  ]

  const selectedOpps = selectedDate ? (oppsByDate[selectedDate] ?? []) : []

  return (
    <div className="rounded-2xl border border-navy-600 bg-navy-800 p-5">
      {/* Month navigation */}
      <div className="mb-5 flex items-center justify-between">
        <button
          onClick={prevMonth}
          className="flex h-8 w-8 items-center justify-center rounded-lg border border-navy-600 text-slate-400 transition-all hover:border-slate-500 hover:text-slate-200"
        >
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" className="h-4 w-4">
            <path strokeLinecap="round" strokeLinejoin="round" d="M15.75 19.5 8.25 12l7.5-7.5" />
          </svg>
        </button>
        <div className="text-center">
          <p className="font-display text-lg font-bold text-slate-100">
            {MONTH_NAMES[month]} {year}
          </p>
          {monthDeadlineCount > 0 && (
            <p className="text-xs text-slate-500">
              {monthDeadlineCount} deadline{monthDeadlineCount !== 1 ? 's' : ''} this month
            </p>
          )}
        </div>
        <button
          onClick={nextMonth}
          className="flex h-8 w-8 items-center justify-center rounded-lg border border-navy-600 text-slate-400 transition-all hover:border-slate-500 hover:text-slate-200"
        >
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" className="h-4 w-4">
            <path strokeLinecap="round" strokeLinejoin="round" d="m8.25 4.5 7.5 7.5-7.5 7.5" />
          </svg>
        </button>
      </div>

      {/* Day-of-week headers */}
      <div className="mb-1 grid grid-cols-7">
        {DAY_LABELS.map((d) => (
          <div key={d} className="py-1 text-center text-[11px] font-semibold uppercase tracking-wider text-slate-600">
            {d}
          </div>
        ))}
      </div>

      {/* Day cells */}
      <div className="grid grid-cols-7 gap-1">
        {cells.map((day, i) => {
          if (day === null) return <div key={`empty-${i}`} />

          const dateStr = `${year}-${pad(month + 1)}-${pad(day)}`
          const opps = oppsByDate[dateStr] ?? []
          const hasOpps = opps.length > 0
          const isToday = dateStr === todayStr
          const isSelected = selectedDate === dateStr
          const isPast = dateStr < todayStr

          return (
            <button
              key={dateStr}
              onClick={() => hasOpps && setSelectedDate(isSelected ? null : dateStr)}
              disabled={!hasOpps}
              className={`flex min-h-[52px] flex-col items-center rounded-lg px-1 py-1.5 transition-all ${
                isSelected
                  ? 'border border-cyan-400/40 bg-cyan-400/10'
                  : isToday
                  ? 'border border-cyan-400/20 bg-navy-700'
                  : hasOpps
                  ? 'border border-navy-600 hover:border-navy-500 hover:bg-navy-700/60 cursor-pointer'
                  : 'border border-transparent cursor-default'
              }`}
            >
              <span
                className={`text-xs font-medium ${
                  isToday
                    ? 'font-bold text-cyan-400'
                    : isPast
                    ? 'text-slate-700'
                    : 'text-slate-400'
                }`}
              >
                {day}
              </span>
              {hasOpps && (
                <div className="mt-1 flex flex-wrap justify-center gap-0.5">
                  {opps.slice(0, 3).map((opp, j) => (
                    <span
                      key={j}
                      className={`h-1.5 w-1.5 rounded-full ${isExpired(opp.deadline) ? 'bg-slate-600' : 'bg-cyan-400'}`}
                    />
                  ))}
                  {opps.length > 3 && (
                    <span className="text-[9px] text-slate-500">+{opps.length - 3}</span>
                  )}
                </div>
              )}
            </button>
          )
        })}
      </div>

      {/* Selected date opportunity list */}
      {selectedDate && selectedOpps.length > 0 && (
        <div className="mt-5 border-t border-navy-600 pt-5">
          <p className="mb-3 text-xs font-semibold uppercase tracking-wider text-slate-500">
            Deadlines on{' '}
            {new Date(selectedDate + 'T00:00:00').toLocaleDateString('en-US', {
              month: 'long',
              day: 'numeric',
              year: 'numeric',
            })}
          </p>
          <div className="space-y-2">
            {selectedOpps.map((opp) => (
              <Link
                key={opp.id}
                href={`/opportunities/${opp.id}`}
                className="flex items-start gap-3 rounded-lg border border-navy-600 bg-navy-900 p-3 transition-all hover:border-cyan-400/30"
              >
                <div className="min-w-0 flex-1">
                  <div className="mb-1 flex flex-wrap items-center gap-2">
                    <TypeBadge type={opp.type} />
                    {isExpired(opp.deadline) && (
                      <span className="rounded-full border border-slate-700 px-1.5 py-0.5 text-[10px] text-slate-600">
                        Expired
                      </span>
                    )}
                  </div>
                  <p className="text-sm font-medium text-slate-200">{opp.title}</p>
                  <p className="text-xs text-slate-500">{opp.organization}</p>
                </div>
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"
                  className="h-4 w-4 shrink-0 self-center text-slate-600">
                  <path strokeLinecap="round" strokeLinejoin="round" d="m8.25 4.5 7.5 7.5-7.5 7.5" />
                </svg>
              </Link>
            ))}
          </div>
        </div>
      )}

      {monthDeadlineCount === 0 && (
        <p className="mt-4 text-center text-sm text-slate-600">
          No deadlines in {MONTH_NAMES[month]} {year} — try another month.
        </p>
      )}
    </div>
  )
}
