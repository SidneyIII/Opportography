import { IdentityTag, OpportunityType, CategoryTag, Opportunity, AudienceType } from './types'

export function formatDeadline(deadline: string | null): string {
  if (!deadline) return 'Rolling / Open'
  const date = new Date(deadline + 'T00:00:00')
  const now = new Date()
  const diffDays = Math.ceil((date.getTime() - now.getTime()) / (1000 * 60 * 60 * 24))

  const formatted = date.toLocaleDateString('en-US', {
    month: 'long',
    day: 'numeric',
    year: 'numeric',
  })

  if (diffDays < 0) return `Closed (was ${formatted})`
  if (diffDays <= 7) return `${formatted} — Due soon!`
  return formatted
}

export function isDeadlineSoon(deadline: string | null): boolean {
  if (!deadline) return false
  const date = new Date(deadline + 'T00:00:00')
  const now = new Date()
  const diffDays = Math.ceil((date.getTime() - now.getTime()) / (1000 * 60 * 60 * 24))
  return diffDays >= 0 && diffDays <= 14
}

export function isExpired(deadline: string | null): boolean {
  if (!deadline) return false
  const date = new Date(deadline + 'T00:00:00')
  const today = new Date()
  today.setHours(0, 0, 0, 0)
  return date < today
}

const identityLabels: Record<IdentityTag, string> = {
  low_income: 'Low-Income Students',
  first_gen: 'First-Generation Students',
  hispanic: 'Hispanic / Latino Students',
  black: 'Black / African American Students',
  native_american: 'Native American / Indigenous Students',
  asian_pacific: 'Asian American / Pacific Islander Students',
  immigrant: 'Immigrant / Refugee Students',
  disabled: 'Students with Disabilities',
  lgbtq: 'LGBTQ+ Students',
  women_stem: 'Women in STEM',
  foster_youth: 'Foster Youth',
  homeless: 'Housing-Insecure Students',
  rural: 'Rural Students',
  esl: 'ESL / Multilingual Students',
}

export function getIdentityLabel(tag: IdentityTag): string {
  return identityLabels[tag] || tag
}

export function getIdentitySlug(tag: IdentityTag): string {
  return tag.replace(/_/g, '-')
}

export function getIdentityFromSlug(slug: string): IdentityTag | null {
  const tag = slug.replace(/-/g, '_') as IdentityTag
  return tag in identityLabels ? tag : null
}

const typeLabels: Record<OpportunityType, string> = {
  scholarship: 'Scholarship',
  institutional_scholarship: 'Institutional Scholarship',
  internship: 'Internship',
  summer_program: 'Summer Program',
  mentorship: 'Mentorship',
  competition: 'Competition',
  free_resource: 'Free Resource',
  workshop: 'Workshop',
  college_access: 'College Access Program',
  job: 'Jobs',
  networking: 'Networking & Community',
  community: 'Community Events & Clubs',
  scientific_exploration: 'Scientific Exploration',
  tutoring: 'Tutoring & Academic Support',
}

export function getTypeLabel(type: OpportunityType): string {
  return typeLabels[type] || type
}

const categoryLabels: Record<CategoryTag, string> = {
  stem: 'STEM',
  arts: 'Arts',
  business: 'Business',
  leadership: 'Leadership',
  community_service: 'Community Service',
  health: 'Health',
  trades: 'Trades',
  athletics: 'Athletics',
}

export function getCategoryLabel(tag: CategoryTag): string {
  return categoryLabels[tag] || tag
}

export interface FilterOptions {
  search?: string
  type?: OpportunityType
  identity?: IdentityTag
  category?: CategoryTag
  gradeLevel?: string // age group value or legacy grade value
  location?: string
}

// Age group values emitted by the filter UI
const HS_GRADES = ['9', '10', '11', '12']
const COLLEGE_AUDIENCE = ['college_undergraduate', 'college_graduate', 'college_all']
const YOUNG_ADULT_AUDIENCE = ['young_adult', 'college_all', 'college_undergraduate']
const ADULT_AUDIENCE = [
  'adult_general', 'adult_workforce', 'adult_50_plus', 'professional',
  'senior', 'parent_guardian', 'family', 'community_all', 'veteran',
]

function matchesAgeGroup(opp: Opportunity, gl: string): boolean {
  const at = opp.audience_type ?? ''
  switch (gl) {
    case 'middle_school':
      return opp.grade_levels.includes('8') || at === 'k12_middle' || at === 'k12_all'
    case 'high_school':
      return HS_GRADES.some((g) => opp.grade_levels.includes(g as '9' | '10' | '11' | '12')) ||
        at === 'k12_high_school' || at === 'k12_all'
    case 'college':
      return opp.grade_levels.includes('college_freshman') || COLLEGE_AUDIENCE.includes(at)
    case 'young_adult':
      return YOUNG_ADULT_AUDIENCE.includes(at) || opp.grade_levels.includes('college_freshman')
    case 'adult':
      return ADULT_AUDIENCE.includes(at)
    case 'all_ages':
      return at === 'community_all' || at === 'family' || opp.identity_tags.length === 0
    default:
      // Legacy single-grade value (e.g. '9', '10', 'college_freshman')
      return opp.grade_levels.includes(gl as import('./types').GradeLevel)
  }
}

export function filterOpportunities(
  opps: Opportunity[],
  filters: FilterOptions
): Opportunity[] {
  return opps.filter((opp) => {
    if (!opp.is_active) return false

    if (filters.search) {
      const q = filters.search.toLowerCase()
      const match =
        opp.title.toLowerCase().includes(q) ||
        opp.organization.toLowerCase().includes(q) ||
        opp.description.toLowerCase().includes(q)
      if (!match) return false
    }

    if (filters.type && opp.type !== filters.type) return false

    if (filters.identity && !opp.identity_tags.includes(filters.identity)) return false

    if (filters.category && !opp.category_tags.includes(filters.category)) return false

    if (filters.gradeLevel && !matchesAgeGroup(opp, filters.gradeLevel)) return false

    if (filters.location && opp.location !== filters.location) return false

    return true
  })
}

// Expired items always appear at the bottom regardless of sort order
function expiredLast(a: Opportunity, b: Opportunity): number {
  const aExp = isExpired(a.deadline)
  const bExp = isExpired(b.deadline)
  if (aExp && !bExp) return 1
  if (!aExp && bExp) return -1
  return 0
}

export function sortByDeadline(opps: Opportunity[]): Opportunity[] {
  return [...opps].sort((a, b) => {
    const exp = expiredLast(a, b)
    if (exp !== 0) return exp
    if (!a.deadline && !b.deadline) return 0
    if (!a.deadline) return 1
    if (!b.deadline) return -1
    return new Date(a.deadline).getTime() - new Date(b.deadline).getTime()
  })
}

export function sortByRecent(opps: Opportunity[]): Opportunity[] {
  return [...opps].sort((a, b) => {
    const exp = expiredLast(a, b)
    if (exp !== 0) return exp
    return new Date(b.date_added).getTime() - new Date(a.date_added).getTime()
  })
}

export function sortByAlpha(opps: Opportunity[]): Opportunity[] {
  return [...opps].sort((a, b) => {
    const exp = expiredLast(a, b)
    if (exp !== 0) return exp
    return a.title.localeCompare(b.title)
  })
}

const gradeLevelLabels: Record<string, string> = {
  '8': '8th Grade',
  '9': '9th Grade',
  '10': '10th Grade',
  '11': '11th Grade',
  '12': '12th Grade',
  college_freshman: 'College Freshman',
}

/** Returns a display label for a grade level value, or null for non-K-12 strings. */
export function formatGradeLevel(g: string): string | null {
  return gradeLevelLabels[g] ?? null
}

const audienceTypeLabels: Record<AudienceType, string> = {
  k12_elementary: 'Elementary School',
  k12_middle: 'Middle School',
  k12_high_school: 'High School',
  k12_all: 'K–12 Students',
  college_undergraduate: 'College / Undergraduate',
  college_graduate: 'Graduate Students',
  college_all: 'College Students',
  young_adult: 'Young Adults',
  adult_general: 'Adults',
  adult_workforce: 'Adult Workforce',
  adult_50_plus: 'Adults 50+',
  veteran: 'Veterans',
  parent_guardian: 'Parents & Guardians',
  family: 'Families',
  senior: 'Seniors',
  community_all: 'Open to All',
  professional: 'Professionals',
  immigrant_refugee: 'Immigrants & Refugees',
  indigenous: 'Indigenous Communities',
  lgbtq_plus: 'LGBTQ+ Community',
  low_income: 'Low-Income Individuals',
}

export function getAudienceLabel(type: AudienceType): string {
  return audienceTypeLabels[type] ?? type
}

export const allIdentityTags: IdentityTag[] = Object.keys(identityLabels) as IdentityTag[]
export const allTypes: OpportunityType[] = Object.keys(typeLabels) as OpportunityType[]
export const allCategories: CategoryTag[] = Object.keys(categoryLabels) as CategoryTag[]
