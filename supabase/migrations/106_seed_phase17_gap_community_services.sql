-- ============================================================
-- Opportography — Migration 106
-- Phase 17 Closure — Gap Fill: Category 4 Community Services
-- Date: 2026-04-02
--
-- 1 verified entry:
--   1. Nebraska DHHS Child Care Subsidy Program —
--      Income-Based Childcare Assistance for Working Families
--
-- NOT duplicating (already in DB):
--   - Children & Families of Iowa — Childcare & Tutoring (059)
--   - STARS custodial parent scholarship (mentions childcare
--     costs but is a scholarship, not a subsidy program) (019)
--   - ESL tutoring at OPL (mentions limited childcare during
--     class as a note, not a standalone listing) (006)
--
-- RESEARCHED BUT EXCLUDED:
--   - Mobile health vans in CB zip codes 51501/51503: No single
--     organization with a stable, findable mobile health route
--     specifically serving CB identified with sufficient
--     specificity for a 0.80+ entry. Candidate for future
--     local-research sprint.
--   - Prescription assistance navigators: No dedicated local
--     nonprofit navigator (distinct from hospital charity care
--     programs already documented) identified with its own
--     stable URL and program description. Candidate for future
--     sprint.
--   - Digital access programs: Cox Connect2Compete is already
--     noted in migration 008 (line 759). ACP ended federally
--     in 2024 — no active ACP successor found.
--
-- Sources verified 2026-04-02:
--   - dhhs.ne.gov/Pages/Child-Care-Subsidy-Information-for-Parents.aspx
--   - firstfivenebraska.org (confirms income expansion to 185% FPL)
--   - childcare.gov/state-resources/nebraska
--
-- Confidence: 0.87
--   Official DHHS program page confirmed active. Income threshold
--   confirmed at 185% FPL. Application via ACCESSNebraska
--   confirmed. This is a direct, actionable federal/state
--   program administered through DHHS.
-- ============================================================

INSERT INTO public.opportunities (
  title, organization, organization_website, description,
  type, eligibility, deadline, link,
  location, city, state,
  is_remote, is_hybrid,
  identity_tags, category_tags, grade_levels,
  data_confidence, verification_status,
  source_url, source_type, source_retrieved_date,
  schedule, audience_type,
  organization_type,
  is_active, is_featured, date_added, last_verified,
  metro_area_id,
  cb_eligibility
) VALUES
(
  'Nebraska Child Care Subsidy Program — Reduced-Cost Licensed Childcare for Working Families',
  'Nebraska Department of Health and Human Services (DHHS)',
  'https://dhhs.ne.gov',
  'The Nebraska Child Care Subsidy Program helps low- and moderate-income working families pay for licensed childcare — including daycare centers, family childcare homes, and after-school programs. Families with income up to 185% of the federal poverty level may qualify (roughly $59,000/year for a family of four as of 2026). To receive the subsidy, at least one parent or guardian must be working, attending school or job training, or attending medical appointments. The subsidy is paid directly to your childcare provider — you pay only your co-pay portion based on income and family size. Apply through ACCESSNebraska at accessnebraska.ne.gov. The application process includes completing the Economic Assistance Application online and a phone interview with a DHHS caseworker. If cost of childcare is the barrier keeping you from working or attending school full-time, this is the program to apply for first.',
  'free_resource',
  'Nebraska residents. Household income at or below 185% of the federal poverty level (approximately $59,000/year for a family of four). At least one parent/guardian must be working, in school or job training, or attending medical/therapy appointments. Apply at accessnebraska.ne.gov — select the "Economic Assistance Application." You will complete a phone interview after submitting. Douglas and Sarpy County applicants: contact DHHS Omaha office for assistance.',
  NULL,
  'https://dhhs.ne.gov/Pages/Child-Care-Subsidy-Information-for-Parents.aspx',
  'Nebraska statewide (Omaha metro DHHS offices)', 'Omaha', 'NE',
  true, false,
  '{low_income}'::text[],
  '{childcare,family_support,subsidy,working_families,low_income,DHHS,Nebraska,free_resource,financial_assistance}'::text[],
  '{}'::text[],
  'high', 'verified',
  'https://dhhs.ne.gov/Pages/Child-Care-Subsidy-Information-for-Parents.aspx', 'official_website', '2026-04-02',
  'Year-round program. Apply anytime at accessnebraska.ne.gov. Eligibility and subsidy amounts are redetermined annually. Current subsidies continue while cases remain open and parents remain eligible.',
  'community_all',
  'government_program',
  true, false, '2026-04-02', '2026-04-02',
  1,
  '{"eligible": false, "basis": "explicit", "notes": "Nebraska DHHS Child Care Subsidy is for Nebraska residents only. Council Bluffs / Iowa residents should apply for Iowa Child Care Assistance through Iowa DHS at dhs.iowa.gov. CBCSD families may also contact Children & Families of Iowa (separately listed in this database) for navigation support.", "source": "https://dhhs.ne.gov/Pages/Child-Care-Subsidy-Information-for-Parents.aspx"}'::jsonb
);
