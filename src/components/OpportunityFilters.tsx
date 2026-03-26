'use client'

import { OpportunityType, IdentityTag, CategoryTag } from '@/lib/types'
import { getTypeLabel, getIdentityLabel, getCategoryLabel, allTypes, allIdentityTags, allCategories } from '@/lib/utils'

interface FiltersProps {
  selectedType: OpportunityType | ''
  selectedIdentity: IdentityTag | ''
  selectedCategory: CategoryTag | ''
  selectedGrade: string
  onTypeChange: (type: OpportunityType | '') => void
  onIdentityChange: (identity: IdentityTag | '') => void
  onCategoryChange: (category: CategoryTag | '') => void
  onGradeChange: (grade: string) => void
}

export function OpportunityFilters({
  selectedType,
  selectedIdentity,
  selectedCategory,
  selectedGrade,
  onTypeChange,
  onIdentityChange,
  onCategoryChange,
  onGradeChange,
}: FiltersProps) {
  const selectClass =
    'w-full rounded-lg border border-navy-600 bg-navy-900 px-3 py-2 text-sm text-slate-200 focus:border-cyan-400 focus:outline-none focus:ring-1 focus:ring-cyan-400/30 appearance-none'

  return (
    <div className="flex flex-col gap-3">
      <select
        value={selectedType}
        onChange={(e) => onTypeChange(e.target.value as OpportunityType | '')}
        className={selectClass}
      >
        <option value="">All Types</option>
        {allTypes.map((t) => (
          <option key={t} value={t}>
            {getTypeLabel(t)}
          </option>
        ))}
      </select>

      <select
        value={selectedIdentity}
        onChange={(e) => onIdentityChange(e.target.value as IdentityTag | '')}
        className={selectClass}
      >
        <option value="">All Identities</option>
        {allIdentityTags.map((t) => (
          <option key={t} value={t}>
            {getIdentityLabel(t)}
          </option>
        ))}
      </select>

      <select
        value={selectedCategory}
        onChange={(e) => onCategoryChange(e.target.value as CategoryTag | '')}
        className={selectClass}
      >
        <option value="">All Categories</option>
        {allCategories.map((t) => (
          <option key={t} value={t}>
            {getCategoryLabel(t)}
          </option>
        ))}
      </select>

      <select
        value={selectedGrade}
        onChange={(e) => onGradeChange(e.target.value)}
        className={selectClass}
      >
        <option value="">All Grades</option>
        <option value="8">8th Grade</option>
        <option value="9">9th Grade</option>
        <option value="10">10th Grade</option>
        <option value="11">11th Grade</option>
        <option value="12">12th Grade</option>
        <option value="college_freshman">College Freshman</option>
      </select>
    </div>
  )
}
