export type OpportunityType =
  | 'scholarship'
  | 'institutional_scholarship'
  | 'internship'
  | 'summer_program'
  | 'mentorship'
  | 'competition'
  | 'free_resource'
  | 'workshop'
  | 'college_access'
  | 'job'
  | 'networking'
  | 'community'
  | 'scientific_exploration'
  | 'tutoring'

export type IdentityTag =
  | 'low_income'
  | 'first_gen'
  | 'hispanic'
  | 'black'
  | 'native_american'
  | 'asian_pacific'
  | 'immigrant'
  | 'disabled'
  | 'lgbtq'
  | 'women_stem'
  | 'foster_youth'
  | 'homeless'
  | 'rural'
  | 'esl'

export type CategoryTag =
  | 'stem'
  | 'arts'
  | 'business'
  | 'leadership'
  | 'community_service'
  | 'health'
  | 'trades'
  | 'athletics'

export type GradeLevel = '9' | '10' | '11' | '12' | 'college_freshman'

export type DataConfidence = 'high' | 'medium' | 'low'
export type VerificationStatus = 'verified' | 'needs_confirmation'
export type CompensationType = 'paid' | 'unpaid' | 'stipend' | 'varies' | 'scholarship_amount'
export type SourceType = 'official_website' | 'job_board' | 'government_db' | 'community_org' | 'news'
export type CostStructureType = 'free' | 'free_with_eligibility' | 'sliding_scale' | 'reduced_cost' | 'varies'

export interface LanguageAccess {
  primary_language: string
  additional_languages?: string[]
  interpretation_available?: boolean
  bilingual_staff?: boolean
  translated_materials?: string[]
  language_line_available?: boolean
  notes?: string
}

export interface CostStructure {
  type: CostStructureType
  details?: string
  accepts_insurance?: boolean
  accepts_medicaid?: boolean
  accepts_medicare?: boolean
  notes?: string
}

export type RecurrenceFrequency = 'weekly' | 'biweekly' | 'monthly' | 'quarterly' | 'annual' | 'varies'
export type DayOfWeek = 'Monday' | 'Tuesday' | 'Wednesday' | 'Thursday' | 'Friday' | 'Saturday' | 'Sunday'
export type WeekOfMonth = 'first' | 'second' | 'third' | 'fourth' | 'last'

export interface Recurrence {
  frequency: RecurrenceFrequency
  day_of_week?: DayOfWeek
  week_of_month?: WeekOfMonth
  time?: string
  timezone?: string
  next_date?: string
  notes?: string
}

export type IdentityFocusCommunity = 'native_american' | 'lgbtq' | 'two_spirit' | 'intersectional'

export interface IdentityFocus {
  primary_community: IdentityFocusCommunity
  specific_identities?: string[]
  open_to_allies?: boolean
  notes?: string
}

export interface Opportunity {
  id: string
  title: string
  organization: string
  organization_website: string | null
  description: string
  type: OpportunityType
  eligibility: string | null
  deadline: string | null
  link: string

  // Location
  location: string
  address: string | null
  city: string | null
  state: string | null
  zip: string | null
  is_remote: boolean
  is_hybrid: boolean

  // Tags
  identity_tags: IdentityTag[]
  category_tags: CategoryTag[]
  grade_levels: GradeLevel[]

  // Compensation
  compensation_type: CompensationType | null
  compensation_amount: string | null
  compensation_frequency: string | null

  // Data quality
  data_confidence: DataConfidence
  verification_status: VerificationStatus
  source_url: string | null
  source_type: SourceType | null
  source_retrieved_date: string | null

  // Schedule (for recurring events/programs)
  schedule: string | null

  // Language access (Phase 4 — bilingual/multilingual resources)
  language_access: LanguageAccess | null

  // Cost structure (Phase 4 — resource/service cost to end user)
  cost_structure: CostStructure | null

  // Recurrence (Phase 5 — structured event recurrence metadata)
  recurrence: Recurrence | null

  // Identity focus (Phase 6 — community-specific filtering for NA and LGBTQ+ resources)
  identity_focus: IdentityFocus | null

  // Lifecycle
  is_active: boolean
  is_featured: boolean
  date_added: string
  last_verified: string
  created_at: string
  updated_at: string
}
