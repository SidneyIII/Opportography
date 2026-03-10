-- ============================================================
-- Opportography — Migration 022
-- Add iowa_specific JSONB column to opportunities
--
-- Purpose: Machine-readable metadata for Iowa state-level
-- scholarship requirements. Many Iowa programs require BOTH
-- the federal FAFSA and the Iowa Financial Aid Application (IFAA)
-- — a detail that is easy to miss and causes students to lose
-- state aid they are entitled to.
--
-- Structure:
--   {
--     "requires_fafsa": true | false,
--     "requires_ifaa": true | false,
--     "ifaa_url": "URL for Iowa Financial Aid Application",
--     "iowa_institution_required": true | false,
--     "eligible_iowa_institutions": "Any accredited Iowa institution" | ["list"],
--     "state_program": true | false,
--     "administering_agency": "Iowa Department of Education | Iowa College Aid | etc."
--   }
-- ============================================================

ALTER TABLE public.opportunities
  ADD COLUMN IF NOT EXISTS iowa_specific JSONB;

COMMENT ON COLUMN public.opportunities.iowa_specific IS
  'Iowa-specific financial aid metadata.
   Structure: {requires_fafsa: bool, requires_ifaa: bool, ifaa_url: text,
   iowa_institution_required: bool, eligible_iowa_institutions: text|array,
   state_program: bool, administering_agency: text}';

CREATE INDEX IF NOT EXISTS idx_opp_iowa_specific
  ON public.opportunities
  USING GIN (iowa_specific)
  WHERE iowa_specific IS NOT NULL;
