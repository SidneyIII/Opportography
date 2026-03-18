-- ============================================================
-- Opportography — Migration 072
-- Phase 15J: Career Pathways — Business, Finance & Accounting
--             (NEW entries only — not duplicating Phases 5 & 9)
-- Date: 2026-03-18
--
-- 1 verified entry:
--   1. IRS VITA Volunteer Tax Preparation Training (Creighton/Omaha)
--
-- Dead ends researched and excluded:
--   - Nebraska Society of CPAs (NESCPA): confirmed active, hosts
--     events (Business, Industry & Innovation Conference at Werner
--     Enterprises April 28, 2025) but cost could not be confirmed
--     as under $20; UNO CBA Career Fair is for UNO students/alumni
--     only, not open to general public
--   - Iowa Society of CPAs: chapter confirmed but no free public
--     events for non-members/non-CPAs verified
--   - CFA Society Nebraska: could not confirm active local chapter
--     with free public events for career explorers
--   - Independent Insurance Agents of Nebraska: organization
--     confirmed active but no free public career events verified
--   - CPCU Society Nebraska chapter: could not confirm free events
--
-- Note: Business/finance field is thin. Omaha's insurance industry
-- is a major asset that is underrepresented. Flag for Phase 16
-- to research Mutual of Omaha, Pacific Life, and GEICO career
-- events more thoroughly.
-- ============================================================

-- 1. IRS VITA Program — Free Tax Preparation Volunteer Training (Creighton / Omaha)
INSERT INTO public.opportunities (
  title, organization, organization_website, description,
  type, eligibility, deadline, link,
  location, address, city, state, zip,
  is_remote, is_hybrid,
  identity_tags, category_tags, grade_levels,
  data_confidence, verification_status,
  source_url, source_type, source_retrieved_date,
  schedule, is_active, is_featured, date_added, last_verified,
  community_metadata
) VALUES (
  'IRS VITA Program — Free Volunteer Tax Preparation Training (Creighton / Omaha EITC Coalition)',
  'Creighton University / Omaha EITC Coalition / IRS',
  'https://www.creighton.edu/business/vita',
  'The IRS Volunteer Income Tax Assistance (VITA) program trains volunteers to prepare free federal and state tax returns for low-to-moderate income individuals and families (generally earning $65,000/year or less). Creighton University''s Heider College of Business runs an active VITA site in Omaha, and the Omaha EITC Coalition coordinates additional VITA preparation locations across the metro. All IRS training is provided free of charge — volunteers must complete IRS certification tests in basic tax law. VITA volunteering provides hands-on tax preparation experience that is directly equivalent to entry-level accounting and tax work — it is one of the best free career development opportunities available for aspiring accountants, financial planners, and tax professionals. Training typically begins in November/December for the January–April filing season.',
  'workshop',
  'Free. Open to anyone willing to complete IRS volunteer certification training. All training materials provided by the IRS at no cost. Training begins November/December for the tax season (January–April). Contact Creighton''s VITA program at creighton.edu/business/vita or the IRS at irs.gov/individuals/irs-tax-volunteers.',
  NULL,
  'https://www.creighton.edu/business/vita',
  'Omaha, NE (Creighton + multiple metro VITA sites)', '2500 California Plaza', 'Omaha', 'NE', '68178',
  false, false,
  '{low_income,first_gen}', '{accounting,finance,tax_preparation,career_exploration,VITA,volunteer,business,financial_planning}', '{}',
  'high', 'verified',
  'https://www.creighton.edu/business/vita', 'official_website', '2026-03-18',
  'Annual program. Training November–December. Tax preparation season January–April. Apply in fall semester.',
  true, true, '2026-03-18', '2026-03-18',
  '{"career_field": "business", "subcategory": "accounting_finance", "opportunity_type": "volunteer", "cost_details": {"amount": 0, "cost_type": "free", "conditions": null, "waiver_available": false, "waiver_details": null}, "delivery": "in_person", "listing_type": "volunteer_program", "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
);
