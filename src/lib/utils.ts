import { IdentityTag, OpportunityType, CategoryTag, Opportunity } from './types'

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
  gradeLevel?: string
  location?: string
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

    if (filters.gradeLevel && !opp.grade_levels.includes(filters.gradeLevel as any)) return false

    if (filters.location && opp.location !== filters.location) return false

    return true
  })
}

export function sortByDeadline(opps: Opportunity[]): Opportunity[] {
  return [...opps].sort((a, b) => {
    if (!a.deadline && !b.deadline) return 0
    if (!a.deadline) return 1
    if (!b.deadline) return -1
    return new Date(a.deadline).getTime() - new Date(b.deadline).getTime()
  })
}

export const allIdentityTags: IdentityTag[] = Object.keys(identityLabels) as IdentityTag[]
export const allTypes: OpportunityType[] = Object.keys(typeLabels) as OpportunityType[]
export const allCategories: CategoryTag[] = Object.keys(categoryLabels) as CategoryTag[]
