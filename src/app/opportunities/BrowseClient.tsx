'use client'

import { useState, useMemo, useEffect } from 'react'
import { useRouter } from 'next/navigation'
import { Opportunity, OpportunityType, IdentityTag, CategoryTag, MetroArea } from '@/lib/types'
import { filterOpportunities, sortByDeadline, sortByRecent, sortByAlpha, isExpired } from '@/lib/utils'
import { OpportunityCard } from '@/components/OpportunityCard'
import { OpportunityFilters } from '@/components/OpportunityFilters'
import { SearchBar } from '@/components/SearchBar'
import { CalendarView } from '@/components/CalendarView'

type SortKey = 'deadline' | 'recent' | 'alpha'
type ViewMode = 'list' | 'calendar'

const SORT_LABELS: Record<SortKey, string> = {
  deadline: 'Deadline',
  recent: 'Most Recent',
  alpha: 'A–Z',
}

const LOCAL_VIEW_KEY = 'opportography_view_mode'

interface BrowseClientProps {
  opportunities: Opportunity[]
  metros: MetroArea[]
  selectedMetro: MetroArea | null
}

export function BrowseClient({ opportunities, metros, selectedMetro }: BrowseClientProps) {
  const router = useRouter()
  const [search, setSearch] = useState('')
  const [type, setType] = useState<OpportunityType | ''>('')
  const [identity, setIdentity] = useState<IdentityTag | ''>('')
  const [category, setCategory] = useState<CategoryTag | ''>('')
  const [grade, setGrade] = useState('')
  const [hideExpired, setHideExpired] = useState(true)
  const [sortKey, setSortKey] = useState<SortKey>('deadline')
  const [viewMode, setViewMode] = useState<ViewMode>('list')

  // Persist view preference
  useEffect(() => {
    const saved = localStorage.getItem(LOCAL_VIEW_KEY)
    if (saved === 'calendar' || saved === 'list') setViewMode(saved)
  }, [])

  function handleViewMode(mode: ViewMode) {
    setViewMode(mode)
    localStorage.setItem(LOCAL_VIEW_KEY, mode)
  }

  const filtered = useMemo(() => {
    let result = filterOpportunities(opportunities, {
      search: search || undefined,
      type: type || undefined,
      identity: identity || undefined,
      category: category || undefined,
      gradeLevel: grade || undefined,
    })

    if (hideExpired) {
      result = result.filter((opp) => !isExpired(opp.deadline))
    }

    if (sortKey === 'recent') return sortByRecent(result)
    if (sortKey === 'alpha') return sortByAlpha(result)
    return sortByDeadline(result)
  }, [opportunities, search, type, identity, category, grade, hideExpired, sortKey])

  // For calendar: include expired opportunities so users can see them on the calendar
  const calendarOpps = useMemo(() => {
    return filterOpportunities(opportunities, {
      search: search || undefined,
      type: type || undefined,
      identity: identity || undefined,
      category: category || undefined,
      gradeLevel: grade || undefined,
    })
  }, [opportunities, search, type, identity, category, grade])

  const hasFilters = search || type || identity || category || grade
  const activeMetros = metros.filter((m) => m.is_active)
  const inactiveMetros = metros.filter((m) => !m.is_active)

  const expiredCount = calendarOpps.filter((o) => isExpired(o.deadline)).length

  // ── No metro selected: show city picker ──
  if (!selectedMetro) {
    return (
      <div className="mx-auto max-w-3xl px-4 py-16 text-center">
        <h1 className="font-display mb-3 text-3xl font-bold text-slate-50">Browse Opportunities</h1>
        <p className="mb-10 text-slate-400">Select your city to see opportunities near you.</p>

        <div className="grid gap-3 sm:grid-cols-2">
          {activeMetros.map((metro) => (
            <button
              key={metro.id}
              onClick={() => router.push(`/opportunities?metro=${metro.slug}`)}
              className="rounded-xl border border-navy-600 bg-navy-800 px-6 py-5 text-left transition-all hover:border-cyan-400/50 hover:bg-navy-700"
            >
              <div className="flex items-center gap-2">
                <span className="h-2 w-2 rounded-full bg-cyan-400" />
                <span className="font-display font-semibold text-slate-100">{metro.name}</span>
              </div>
              <p className="mt-1 text-xs text-slate-500">
                {metro.population_estimate
                  ? `Metro population ~${(metro.population_estimate / 1000).toFixed(0)}K`
                  : 'Active'}
              </p>
            </button>
          ))}

          {inactiveMetros.map((metro) => (
            <div
              key={metro.id}
              className="rounded-xl border border-navy-700 bg-navy-900/50 px-6 py-5 text-left opacity-60"
            >
              <div className="flex items-center gap-2">
                <span className="h-2 w-2 rounded-full bg-slate-600" />
                <span className="font-display font-semibold text-slate-400">{metro.name}</span>
                <span className="ml-auto rounded-full border border-slate-700 px-2 py-0.5 text-[10px] font-medium text-slate-600">
                  Coming Soon
                </span>
              </div>
              <p className="mt-1 text-xs text-slate-600">On the roadmap</p>
            </div>
          ))}
        </div>
      </div>
    )
  }

  // ── Metro selected: show browse UI ──
  return (
    <div className="mx-auto max-w-6xl px-4 py-8">
      {/* Header row */}
      <div className="mb-6 flex flex-wrap items-end justify-between gap-3">
        <div>
          <h1 className="font-display text-2xl font-bold text-slate-50">Browse Opportunities</h1>
          <p className="mt-0.5 text-sm text-slate-500">
            {filtered.length} opportunit{filtered.length !== 1 ? 'ies' : 'y'} in{' '}
            <span className="text-slate-400">{selectedMetro.name}</span>
            {hideExpired && expiredCount > 0 && (
              <button
                onClick={() => setHideExpired(false)}
                className="ml-2 text-slate-600 underline underline-offset-2 hover:text-slate-400 transition-colors"
              >
                +{expiredCount} expired hidden
              </button>
            )}
          </p>
        </div>

        <div className="flex items-center gap-3">
          {/* Sort dropdown */}
          <div className="flex items-center gap-2">
            <span className="text-xs text-slate-600">Sort:</span>
            <select
              value={sortKey}
              onChange={(e) => setSortKey(e.target.value as SortKey)}
              className="rounded-lg border border-navy-600 bg-navy-900 px-2.5 py-1.5 text-xs text-slate-300 focus:border-cyan-400 focus:outline-none appearance-none"
            >
              {(Object.keys(SORT_LABELS) as SortKey[]).map((k) => (
                <option key={k} value={k}>{SORT_LABELS[k]}</option>
              ))}
            </select>
          </div>

          {/* View toggle */}
          <div className="flex gap-1 rounded-lg border border-navy-600 bg-navy-900 p-0.5">
            <button
              onClick={() => handleViewMode('list')}
              title="List view"
              className={`rounded-md p-1.5 transition-all ${viewMode === 'list' ? 'bg-navy-700 text-slate-200' : 'text-slate-600 hover:text-slate-400'}`}
            >
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" className="h-4 w-4">
                <path strokeLinecap="round" strokeLinejoin="round" d="M8.25 6.75h12M8.25 12h12m-12 5.25h12M3.75 6.75h.007v.008H3.75V6.75Zm.375 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0ZM3.75 12h.007v.008H3.75V12Zm.375 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Zm-.375 5.25h.007v.008H3.75v-.008Zm.375 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Z" />
              </svg>
            </button>
            <button
              onClick={() => handleViewMode('calendar')}
              title="Calendar view"
              className={`rounded-md p-1.5 transition-all ${viewMode === 'calendar' ? 'bg-navy-700 text-slate-200' : 'text-slate-600 hover:text-slate-400'}`}
            >
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" className="h-4 w-4">
                <path strokeLinecap="round" strokeLinejoin="round" d="M6.75 3v2.25M17.25 3v2.25M3 18.75V7.5a2.25 2.25 0 0 1 2.25-2.25h13.5A2.25 2.25 0 0 1 21 7.5v11.25m-18 0A2.25 2.25 0 0 0 5.25 21h13.5A2.25 2.25 0 0 0 21 18.75m-18 0v-7.5A2.25 2.25 0 0 1 5.25 9h13.5A2.25 2.25 0 0 1 21 11.25v7.5" />
              </svg>
            </button>
          </div>

          <button
            onClick={() => router.push('/opportunities')}
            className="text-xs font-medium text-slate-500 transition-colors hover:text-cyan-400"
          >
            ← Change city
          </button>
        </div>
      </div>

      <div className="flex flex-col gap-6 md:flex-row">
        {/* Sidebar filters */}
        <aside className="w-full shrink-0 md:w-56">
          <div className="mb-4">
            <SearchBar value={search} onChange={setSearch} />
          </div>
          <OpportunityFilters
            selectedType={type}
            selectedIdentity={identity}
            selectedCategory={category}
            selectedGrade={grade}
            hideExpired={hideExpired}
            onTypeChange={setType}
            onIdentityChange={setIdentity}
            onCategoryChange={setCategory}
            onGradeChange={setGrade}
            onHideExpiredChange={setHideExpired}
          />
          {hasFilters && (
            <button
              onClick={() => {
                setSearch('')
                setType('')
                setIdentity('')
                setCategory('')
                setGrade('')
              }}
              className="mt-3 w-full text-xs font-medium text-slate-500 transition-colors hover:text-cyan-400"
            >
              Clear all filters
            </button>
          )}

          {/* Sort indicator (visible on desktop) */}
          <p className="mt-4 hidden text-xs text-slate-700 md:block">
            Sorted by: <span className="text-slate-500">{SORT_LABELS[sortKey]}</span>
            {!hideExpired ? '' : ' · Active only'}
          </p>
        </aside>

        {/* Main content */}
        <div className="flex-1">
          {viewMode === 'calendar' ? (
            <CalendarView opportunities={calendarOpps} />
          ) : filtered.length > 0 ? (
            <div className="flex flex-col gap-4">
              {filtered.map((opp) => (
                <OpportunityCard key={opp.id} opportunity={opp} />
              ))}
            </div>
          ) : (
            <div className="rounded-xl border border-navy-600 bg-navy-800 px-6 py-16 text-center">
              <p className="font-display text-lg font-medium text-slate-200">No opportunities found</p>
              <p className="mt-1 text-sm text-slate-500">
                {hideExpired && expiredCount > 0
                  ? `${expiredCount} expired opportunit${expiredCount !== 1 ? 'ies' : 'y'} hidden — `
                  : 'Try adjusting your filters or search terms.'}
                {hideExpired && expiredCount > 0 && (
                  <button
                    onClick={() => setHideExpired(false)}
                    className="text-cyan-400 hover:text-cyan-300 transition-colors"
                  >
                    show them
                  </button>
                )}
              </p>
            </div>
          )}
        </div>
      </div>
    </div>
  )
}
