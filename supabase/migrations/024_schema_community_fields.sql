-- ============================================================
-- Opportography — Migration 024
-- Add community scholarship metadata fields
--
-- swief_overlap: Documents whether a Pottawattamie County civic
-- organization scholarship is administered through the SWIEF
-- portal (one application = 100+ scholarships) or has its own
-- separate application. Prevents students from applying twice
-- for the same scholarship, and ensures they don't miss the
-- SWIEF pathway.
--
-- organization_type: Machine-readable tag for the kind of
-- organization behind a non-institutional scholarship. Useful
-- for future filtering: "show me trades scholarships" or
-- "show me civic org scholarships".
--
-- swief_overlap structure:
--   {
--     "administered_through_swief": true | false,
--     "separate_application_available": true | false,
--     "notes": "Explanation of SWIEF/non-SWIEF pathway"
--   }
--
-- organization_type values:
--   civic_service_club | professional_association | industry_group |
--   private_foundation | faith_based | cultural_org |
--   military_connected | advocacy_org | media_org |
--   government_program | education_access_org | other
-- ============================================================

ALTER TABLE public.opportunities
  ADD COLUMN IF NOT EXISTS swief_overlap JSONB,
  ADD COLUMN IF NOT EXISTS organization_type TEXT CHECK (
    organization_type IN (
      'civic_service_club',
      'professional_association',
      'industry_group',
      'private_foundation',
      'faith_based',
      'cultural_org',
      'military_connected',
      'advocacy_org',
      'media_org',
      'government_program',
      'education_access_org',
      'other'
    )
  );

COMMENT ON COLUMN public.opportunities.swief_overlap IS
  'SWIEF administration status for Pottawattamie County civic org scholarships.
   Structure: {administered_through_swief: bool, separate_application_available: bool, notes: text}';

COMMENT ON COLUMN public.opportunities.organization_type IS
  'Type of organization offering the scholarship/opportunity.
   Values: civic_service_club | professional_association | industry_group |
   private_foundation | faith_based | cultural_org | military_connected |
   advocacy_org | media_org | government_program | education_access_org | other';

CREATE INDEX IF NOT EXISTS idx_opp_organization_type
  ON public.opportunities (organization_type)
  WHERE organization_type IS NOT NULL;
