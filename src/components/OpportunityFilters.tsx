'use client'

import { OpportunityType, IdentityTag, CategoryTag } from '@/lib/types'
import { getIdentityLabel, getCategoryLabel, allIdentityTags, allCategories } from '@/lib/utils'

// Type groups for the categorized dropdown
const TYPE_GROUPS: { label: string; types: { value: OpportunityType; label: string }[] }[] = [
  {
    label: 'Academic Support',
    types: [
      { value: 'tutoring', label: 'Tutoring & Academic Support' },
      { value: 'college_access', label: 'College Access Program' },
      { value: 'workshop', label: 'Workshop' },
      { value: 'free_resource', label: 'Free Resource' },
    ],
  },
  {
    label: 'Exploration Programs',
    types: [
      { value: 'summer_program', label: 'Summer Program' },
      { value: 'mentorship', label: 'Mentorship' },
      { value: 'scientific_exploration', label: 'Scientific Exploration' },
      { value: 'competition', label: 'Competition' },
    ],
  },
  {
    label: 'Careers & Professional Development',
    types: [
      { value: 'internship', label: 'Internship' },
      { value: 'job', label: 'Jobs' },
      { value: 'networking', label: 'Networking & Community' },
    ],
  },
  {
    label: 'Financial Support',
    types: [
      { value: 'scholarship', label: 'Scholarship' },
      { value: 'institutional_scholarship', label: 'Institutional Scholarship' },
    ],
  },
  {
    label: 'Civic & Community',
    types: [
      { value: 'community', label: 'Community Events & Clubs' },
    ],
  },
]

interface FiltersProps {
  selectedType: OpportunityType | ''
  selectedIdentity: IdentityTag | ''
  selectedCategory: CategoryTag | ''
  selectedGrade: string
  hideExpired: boolean
  onTypeChange: (type: OpportunityType | '') => void
  onIdentityChange: (identity: IdentityTag | '') => void
  onCategoryChange: (category: CategoryTag | '') => void
  onGradeChange: (grade: string) => void
  onHideExpiredChange: (hide: boolean) => void
}

export function OpportunityFilters({
  selectedType,
  selectedIdentity,
  selectedCategory,
  selectedGrade,
  hideExpired,
  onTypeChange,
  onIdentityChange,
  onCategoryChange,
  onGradeChange,
  onHideExpiredChange,
}: FiltersProps) {
  const selectClass =
    'w-full rounded-lg border border-navy-600 bg-navy-900 px-3 py-2 text-sm text-slate-200 focus:border-cyan-400 focus:outline-none focus:ring-1 focus:ring-cyan-400/30 appearance-none'

  return (
    <div className="flex flex-col gap-3">
      {/* Type — grouped */}
      <select
        value={selectedType}
        onChange={(e) => onTypeChange(e.target.value as OpportunityType | '')}
        className={selectClass}
      >
        <option value="">All Types</option>
        {TYPE_GROUPS.map((group) => (
          <optgroup key={group.label} label={group.label}>
            {group.types.map(({ value, label }) => (
              <option key={value} value={value}>{label}</option>
            ))}
          </optgroup>
        ))}
      </select>

      {/* Age Group (formerly Grade) */}
      <select
        value={selectedGrade}
        onChange={(e) => onGradeChange(e.target.value)}
        className={selectClass}
      >
        <option value="">All Age Groups</option>
        <option value="middle_school">Middle School (6–8)</option>
        <option value="high_school">High School (9–12)</option>
        <option value="college">College / Freshman</option>
        <option value="young_adult">Recent Graduate / Young Adult (18–24)</option>
        <option value="adult">Adults (25+)</option>
        <option value="all_ages">Open to All Ages</option>
      </select>

      {/* Identity */}
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

      {/* Category */}
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

      {/* Hide expired toggle */}
      <label className="flex cursor-pointer items-center gap-2.5">
        <div
          onClick={() => onHideExpiredChange(!hideExpired)}
          className={`relative h-5 w-9 rounded-full transition-colors ${hideExpired ? 'bg-cyan-400' : 'bg-navy-600'}`}
        >
          <span
            className={`absolute top-0.5 h-4 w-4 rounded-full bg-white shadow transition-transform ${hideExpired ? 'translate-x-4' : 'translate-x-0.5'}`}
          />
        </div>
        <span className="text-xs text-slate-400">Hide expired</span>
      </label>
    </div>
  )
}
