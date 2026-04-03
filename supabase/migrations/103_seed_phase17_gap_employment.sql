-- ============================================================
-- Opportography — Migration 103
-- Phase 17 Closure — Gap Fill: Category 1 Employment & Jobs
-- Date: 2026-04-02
--
-- 1 verified entry:
--   1. T.O.O.L.S. — Trades Offer Opportunities That Lead to
--      Success (Grades 7–12, Omaha Metro)
--
-- NOT duplicating (already in DB):
--   - Heartland Workforce Solutions WIOA ITA (migration 096)
--   - IowaWORKS Council Bluffs WIOA (migration 096)
--   - Job Corps Omaha (migration 096)
--   - Goodwill Omaha YouthBuild (migration 096)
--   - All union apprenticeships (migrations 089–091)
--   - MCC trades programs (migration 091)
--   - IWCC trades programs (migration 093)
--   - CHI Health CNA / Nebraska Medicine CNA (migration 028)
--
-- Sources verified 2026-04-02:
--   - nebraskaworkforce.org/tools (primary program page)
--   - Organization: Nebraska Center for Workforce Development
--     and Education; collaborative with Omaha Federation of
--     Labor AFL-CIO, William Brennan Institute (UNO),
--     United Way of the Midlands
--
-- Confidence: 0.82
--   Real, multi-organizational program with an active landing
--   page and strong institutional backing. Program specifics
--   (exact event schedule) require contacting the org directly,
--   hence 0.82 rather than 0.90+.
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
  is_active, is_featured, date_added, last_verified,
  metro_area_id,
  community_metadata
) VALUES
(
  'T.O.O.L.S. — Trades Offer Opportunities That Lead to Success (Grades 7–12, Omaha Metro)',
  'Nebraska Center for Workforce Development and Education',
  'https://www.nebraskaworkforce.org',
  'T.O.O.L.S. (Trades Offer Opportunities That Lead to Success) is a free, year-round career exploration program for Omaha-area students in grades 7 through 12. The program runs hands-on construction and trades career exploration activities — giving middle and high school students a real look at what a career in the skilled trades actually looks and feels like before committing to a training path. T.O.O.L.S. is a collaborative effort between the Omaha Federation of Labor AFL-CIO, the William Brennan Institute for Labor Studies at UNO, the United Way of the Midlands, and local business and apprenticeship partners. The trades workforce in Nebraska has a serious shortage — more than half of skilled-trade workers in the state are expected to retire in the coming years, and not enough young people are entering these fields. T.O.O.L.S. exists specifically to bridge that gap by connecting students with trades career information, employer contacts, and a clear picture of what registered apprenticeship means. If you are in middle or high school in the Omaha area and want to understand what building trades, construction, or a skilled-labor career actually looks like as a pathway — this program is a direct, free entry point.',
  'free_resource',
  'Open to Omaha-metro students in grades 7–12. Free. Year-round programming with activities and events throughout the school year. Contact the Nebraska Center for Workforce Development and Education at nebraskaworkforce.org or the Omaha Federation of Labor for current event dates and how to get involved.',
  NULL,
  'https://www.nebraskaworkforce.org/tools',
  'Omaha, NE (metro-wide)', 'Omaha', 'NE',
  false, false,
  '{low_income}'::text[],
  '{trades,career_exploration,youth_workforce,apprenticeship_pathway,construction,skilled_trades,grades_7_12,Omaha_metro,free}'::text[],
  '{"7","8","9","10","11","12"}'::text[],
  'high', 'verified',
  'https://www.nebraskaworkforce.org/tools', 'official_website', '2026-04-02',
  'Year-round events and activities. Check nebraskaworkforce.org/tools for current event schedule.',
  'k12_high_school',
  true, false, '2026-04-02', '2026-04-02',
  1,
  '{"domain": "workforce_development", "subcategory": "trades_career_exploration", "opportunity_type": "career_exploration_program", "cost_details": {"amount": 0, "cost_type": "free"}, "delivery": "in_person", "listing_type": "recurring_program", "partner_orgs": ["Omaha Federation of Labor AFL-CIO", "William Brennan Institute for Labor Studies at UNO", "United Way of the Midlands"], "target_population": "grades_7_12, Omaha metro", "accessibility": {"cost_barrier": "free", "experience_required": "none", "age_restriction": "grades_7_12", "council_bluffs_accessible": true, "multilingual": false}}'::jsonb
);
