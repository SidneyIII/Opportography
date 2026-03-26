'use client'

import { useState, useMemo } from 'react'
import { useRouter } from 'next/navigation'
import { Opportunity, OpportunityType, IdentityTag, CategoryTag, MetroArea } from '@/lib/types'
import { filterOpportunities, sortByDeadline } from '@/lib/utils'
import { OpportunityCard } from '@/components/OpportunityCard'
import { OpportunityFilters } from '@/components/OpportunityFilters'
import { SearchBar } from '@/components/SearchBar'

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

  const filtered = useMemo(() => {
    const result = filterOpportunities(opportunities, {
      search: search || undefined,
      type: type || undefined,
      identity: identity || undefined,
      category: category || undefined,
      gradeLevel: grade || undefined,
    })
    return sortByDeadline(result)
  }, [opportunities, search, type, identity, category, grade])

  const hasFilters = search || type || identity || category || grade
  const activeMetros = metros.filter((m) => m.is_active)
  const inactiveMetros = metros.filter((m) => !m.is_active)

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
      <div className="mb-6 flex flex-wrap items-end justify-between gap-2">
        <div>
          <h1 className="font-display text-2xl font-bold text-slate-50">
            Browse Opportunities
          </h1>
          <p className="mt-0.5 text-sm text-slate-500">
            {filtered.length} opportunit{filtered.length !== 1 ? 'ies' : 'y'} in{' '}
            <span className="text-slate-400">{selectedMetro.name}</span>
          </p>
        </div>
        <button
          onClick={() => router.push('/opportunities')}
          className="text-xs font-medium text-slate-500 transition-colors hover:text-cyan-400"
        >
          ← Change city
        </button>
      </div>

      <div className="flex flex-col gap-6 md:flex-row">
        <aside className="w-full shrink-0 md:w-56">
          <div className="mb-4">
            <SearchBar value={search} onChange={setSearch} />
          </div>
          <OpportunityFilters
            selectedType={type}
            selectedIdentity={identity}
            selectedCategory={category}
            selectedGrade={grade}
            onTypeChange={setType}
            onIdentityChange={setIdentity}
            onCategoryChange={setCategory}
            onGradeChange={setGrade}
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
        </aside>

        <div className="flex-1">
          {filtered.length > 0 ? (
            <div className="flex flex-col gap-4">
              {filtered.map((opp) => (
                <OpportunityCard key={opp.id} opportunity={opp} />
              ))}
            </div>
          ) : (
            <div className="rounded-xl border border-navy-600 bg-navy-800 px-6 py-16 text-center">
              <p className="font-display text-lg font-medium text-slate-200">No opportunities found</p>
              <p className="mt-1 text-sm text-slate-500">
                Try adjusting your filters or search terms.
              </p>
            </div>
          )}
        </div>
      </div>
    </div>
  )
}
