-- ============================================================
-- Opportography — Migration 104
-- Phase 17 Closure — Gap Fill: Category 2 Scholarships
-- Date: 2026-04-02
--
-- 1 verified entry:
--   1. UFCW Charity Foundation Scholarship — $12,000 over
--      4 years for children/dependents of UFCW union members
--
-- NOT duplicating (already in DB):
--   - Susan Thompson Buffett Foundation (migration 002)
--   - Peter Kiewit Foundation scholarship (migration 021)
--   - Nebraska National Guard Tuition Assistance (migration 087)
--   - Iowa National Guard Tuition Benefit (migration 087)
--   - American Legion Auxiliary National Scholarship (migration 025)
--   - Union Plus Scholarship (national program, separate from
--     UFCW Charity Foundation — not in DB but excluded here
--     because it is a benefit requiring Union Plus card
--     activation, not directly relevant to Omaha/CB gap fill)
--
-- RESEARCHED BUT EXCLUDED:
--   - Union Pacific Foundation: Does not offer direct student
--     scholarships — funds org grants only. Excluded per
--     "no aggregator/indirect" policy.
--   - Diocese of Omaha (Children's Scholarship Fund): K–8
--     private school tuition only; does not fit existing
--     scholarship category model for this platform.
--   - Mutual of Omaha Foundation: Corporate foundation with
--     nonprofit grants only, no documented direct student
--     scholarship program confirmed at time of research.
--
-- Sources verified 2026-04-02:
--   - ufcwcharityfoundation.org/scholarship
--   - forlocals.ufcw.org/2026/02/09/... (confirms 2026 cycle open)
--   - ufcw400.org/2026/02/13/... (confirms 2026 cycle active)
--
-- Confidence: 0.88
--   Active 2026 application confirmed from multiple UFCW local
--   announcement sources. Award amount and eligibility confirmed
--   from primary foundation page.
-- ============================================================

INSERT INTO public.opportunities (
  title, organization, organization_website, description,
  type, eligibility, deadline, link,
  location, city, state,
  is_remote, is_hybrid,
  identity_tags, category_tags, grade_levels,
  compensation_type, compensation_amount, compensation_frequency,
  data_confidence, verification_status,
  source_url, source_type, source_retrieved_date,
  schedule, audience_type,
  organization_type,
  is_active, is_featured, date_added, last_verified,
  metro_area_id,
  cb_eligibility
) VALUES
(
  'UFCW Charity Foundation Scholarship — Up to $12,000 for Children of Grocery & Food Union Members',
  'UFCW Charity Foundation',
  'https://ufcwcharityfoundation.org',
  'The UFCW Charity Foundation Scholarship awards up to $12,000 — $3,000 per year for up to four years — to the children and dependents of active UFCW union members. UFCW (United Food and Commercial Workers) represents workers at grocery stores, meatpacking plants, food processing facilities, and retail establishments across the country, including members in the Omaha and Council Bluffs metro area under UFCW Local 293. If one of your parents or guardians works at a grocery store or food industry employer that is unionized through UFCW, you are likely eligible for this scholarship. Selection is based on academic achievement, community involvement, and an essay demonstrating understanding of the labor movement. This scholarship recurs annually — applications open each February and close in May. Scholarships are paid directly to the student''s accredited college or university.',
  'scholarship',
  'Unmarried child or dependent of an active UFCW member, under age 20 on May 24, 2026. Parent/guardian must be an active UFCW union member (not an officer or staff member). Apply online at ufcwcharityfoundation.org — application open February 9 through May 10, 2026. Official grade transcript and Part B Form must be postmarked by May 24, 2026. Questions: cfscholarship@ufcw.org.',
  '2026-05-10',
  'https://ufcwcharityfoundation.org/scholarship/',
  'National (open to UFCW members and dependents in Omaha/CB metro)', 'Omaha', 'NE',
  true, false,
  '{}'::text[],
  '{scholarship,union_affiliated,grocery_workers,food_industry,annual_scholarship,labor_movement}'::text[],
  '{"11","12"}'::text[],
  'scholarship_amount', '$3,000/year (up to $12,000 over 4 years)', 'annual',
  'high', 'verified',
  'https://ufcwcharityfoundation.org/scholarship/', 'official_website', '2026-04-02',
  'Annual recurring scholarship. Application window: February through May each year. 2026 deadline: May 10 (online), May 24 (postmark for transcript + Part B).',
  'k12_high_school',
  'industry_group',
  true, false, '2026-04-02', '2026-04-02',
  1,
  '{"eligible": true, "basis": "explicit", "notes": "National UFCW scholarship open to dependent children of all active UFCW members, including Local 293 members in the Omaha/Council Bluffs metro area. CB residents with a UFCW-member parent are explicitly eligible.", "source": "https://ufcwcharityfoundation.org/scholarship/"}'::jsonb
);
