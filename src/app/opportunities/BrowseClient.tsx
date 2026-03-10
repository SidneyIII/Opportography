'use client'

import { useState, useMemo } from 'react'
import { Opportunity, OpportunityType, IdentityTag, CategoryTag } from '@/lib/types'
import { filterOpportunities, sortByDeadline } from '@/lib/utils'
import { OpportunityCard } from '@/components/OpportunityCard'
import { OpportunityFilters } from '@/components/OpportunityFilters'
import { SearchBar } from '@/components/SearchBar'

export function BrowseClient({ opportunities }: { opportunities: Opportunity[] }) {
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

  return (
    <div className="mx-auto max-w-6xl px-4 py-8">
      <h1 className="font-display mb-1 text-2xl font-bold text-slate-50">Browse Opportunities</h1>
      <p className="mb-6 text-sm text-slate-500">
        {filtered.length} opportunit{filtered.length !== 1 ? 'ies' : 'y'} available
      </p>

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
