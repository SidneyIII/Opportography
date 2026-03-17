-- ============================================================
-- Opportography — Migration 026
-- Phase 11: Entry-Level Jobs Schema
--
-- Adds 'job' to the opportunity type enum, plus four new
-- columns that are specific to employment listings:
--
--   employer_careers_url  — direct link to employer's careers portal
--   sector                — which metro economic sector the job belongs to
--   education_requirement — structured education/certification requirements
--   career_pathway        — advancement potential and training programs
--   hiring_status         — confidence level on whether role is actively hiring
--
-- All existing columns continue to serve double-duty:
--   organization          → employer name
--   organization_website  → employer's main website
--   employer_careers_url  → careers portal (often different from main site)
--   link                  → direct application URL or careers search page
--   eligibility           → plain-language education/experience requirements
--   compensation_type/amount/frequency → pay information
--   city/state            → work location
--   category_tags         → includes sector tag, education level, job-specific tags
--   identity_tags         → community-specific hiring (bilingual preferred, etc.)
-- ============================================================

-- ── Step 1: Expand the type CHECK constraint to include 'job' ──
ALTER TABLE public.opportunities
  DROP CONSTRAINT IF EXISTS opportunities_type_check;

ALTER TABLE public.opportunities
  ADD CONSTRAINT opportunities_type_check CHECK (type IN (
    'scholarship',
    'internship',
    'summer_program',
    'mentorship',
    'competition',
    'free_resource',
    'workshop',
    'college_access',
    'job'
  ));

-- ── Step 2: New job-specific columns ──────────────────────────

ALTER TABLE public.opportunities
  ADD COLUMN IF NOT EXISTS employer_careers_url TEXT,
  ADD COLUMN IF NOT EXISTS sector TEXT CHECK (sector IN (
    'finance_insurance',
    'healthcare',
    'technology',
    'transportation_logistics',
    'construction_trades',
    'food_agriculture',
    'government_public_service',
    'retail_hospitality'
  )),
  ADD COLUMN IF NOT EXISTS education_requirement JSONB,
  ADD COLUMN IF NOT EXISTS career_pathway JSONB,
  ADD COLUMN IF NOT EXISTS hiring_status TEXT DEFAULT 'check_careers_page' CHECK (hiring_status IN (
    'confirmed_active',
    'likely_active',
    'check_careers_page'
  ));

-- ── Step 3: Indexes ───────────────────────────────────────────

CREATE INDEX IF NOT EXISTS idx_opportunities_type_job
  ON public.opportunities (type)
  WHERE type = 'job';

CREATE INDEX IF NOT EXISTS idx_opportunities_sector
  ON public.opportunities (sector)
  WHERE sector IS NOT NULL;

CREATE INDEX IF NOT EXISTS idx_opportunities_hiring_status
  ON public.opportunities (hiring_status)
  WHERE hiring_status IS NOT NULL;

-- ── Step 4: Column comments ───────────────────────────────────

COMMENT ON COLUMN public.opportunities.employer_careers_url IS
  'Direct URL to the employer careers portal or job search page.
   Separate from organization_website (company main site).
   Example: https://careers.mutualofomaha.com';

COMMENT ON COLUMN public.opportunities.sector IS
  'Omaha-CB metro economic sector this job belongs to.
   Values: finance_insurance | healthcare | technology |
   transportation_logistics | construction_trades |
   food_agriculture | government_public_service | retail_hospitality';

COMMENT ON COLUMN public.opportunities.education_requirement IS
  'Structured education/certification requirements.
   Structure: {
     minimum: "high_school_diploma|ged|associate|bachelor|none_specified",
     preferred: "Description of preferred education",
     certifications: ["CNA", "CDL", "RN", etc.],
     notes: "e.g., Lists bachelor preferred but hires associate holders"
   }';

COMMENT ON COLUMN public.opportunities.career_pathway IS
  'Advancement potential and employer training programs.
   Structure: {
     advancement: "Where this role leads in 2-5 years",
     employer_training: "On-the-job training, tuition reimbursement, apprenticeship details",
     typical_next_roles: ["Next role title", "Another role"],
     tuition_reimbursement: true|false,
     apprenticeship: true|false
   }';

COMMENT ON COLUMN public.opportunities.hiring_status IS
  'Confidence level on current hiring activity.
   confirmed_active  = verified open position on careers page or job board
   likely_active     = major employer known to hire continuously in this role
   check_careers_page = employer is real and active but specific opening not confirmed';

-- ============================================================
-- Done. Proceed to 027_seed_jobs_finance.sql (and subsequent)
-- ============================================================
