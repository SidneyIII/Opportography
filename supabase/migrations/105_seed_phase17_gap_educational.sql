-- ============================================================
-- Opportography — Migration 105
-- Phase 17 Closure — Gap Fill: Category 3 Educational Pathways
-- Date: 2026-04-02
--
-- 1 verified entry:
--   1. Omaha Public Schools College & Career Academies —
--      Free CTE Pathways (Welding, Culinary, Healthcare,
--      Energy Systems, Urban Agriculture, IT, and more)
--
-- NOT duplicating (already in DB):
--   - MCC Dual Enrollment (migration 004)
--   - College Possible Omaha (migration 083)
--   - Do Space / OPL Digital Lab (migration 008, 013, 036)
--   - OPL LinkedIn Learning / LearningExpress (migration 006)
--   - Junior Achievement of the Midlands (migration 085)
--   - Step Up Omaha! (migration 004)
--   - AIM Institute Youth in Tech (migration 004)
--   - TRIO Upward Bound programs (migration 082)
--
-- RESEARCHED BUT EXCLUDED:
--   - Free SAT/ACT prep: College Possible Omaha (already in DB,
--     migration 083) provides multi-year coaching that includes
--     test prep for all its participants. No standalone free
--     SAT/ACT program with its own actionable URL was found
--     outside College Possible that isn't duplicative.
--   - OPL Kanopy: OPL's digital resource page includes Kanopy
--     but an OPL free resource entry (migration 006) already
--     covers the library's digital learning portfolio. Adding
--     a Kanopy-specific entry would represent the same org
--     under a new title — excluded per duplication policy.
--     The existing OPL entry should be updated in a future
--     maintenance pass to include Kanopy and Mango Languages.
--
-- Sources verified 2026-04-02:
--   - ops.org/domain/767 (OPS Student Outcomes & Opportunities)
--   - ops.org/Page/1816 (College & Career Academies research)
--   - go.ops.org/CTEAwards (OPS CTE recognition, 2025)
--   - omaha.com: Nebraska schools boost CTE (Oct 2024)
--
-- Confidence: 0.83
--   OPS CTE programs are formally documented on the OPS website,
--   confirmed operating in 2025–2026 by news coverage and CTE
--   award announcements. Program offerings vary by school;
--   students must contact their school counselor for specific
--   enrollment availability — hence 0.83 not 0.90.
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
  cb_eligibility
) VALUES
(
  'Omaha Public Schools Career & Technical Education (CTE) Pathways — Free Dual-Credit Trades, Healthcare, and Technology Programs',
  'Omaha Public Schools',
  'https://www.ops.org',
  'Omaha Public Schools (OPS) offers more than 20 Career and Technical Education (CTE) pathways across its high schools — and many of them are free, in-school programs that come with dual college credit through Metropolitan Community College. CTE pathways include energy systems and manufacturing (Omaha Northwest), urban agriculture (Bryan High Urban Agriculture Academy), medical assisting and healthcare support, culinary arts, digital technology and IT, and construction trades. Students in OPS who complete three or more courses in a CTE sequence graduate at a rate 11% higher than those who don''t participate. If you are already enrolled in OPS and nobody has told you these programs exist — this is that conversation. You can start in any of these pathways and earn real college credit while still in high school, at no cost to you. Talk to your school counselor or check ops.org to find the CTE offerings at your specific high school. CTE awards from the Nebraska Department of Education were received by OPS staff and schools as recently as 2025, confirming these programs are among the strongest in the state.',
  'college_access',
  'Enrolled OPS students in grades 9–12. CTE programs are available through individual OPS high schools — not all programs are offered at every school. Talk to your school counselor or check ops.org/domain/767 to find which CTE pathways are available at your high school. Enrollment is typically handled through your school''s standard course registration process.',
  NULL,
  'https://www.ops.org/domain/767',
  'Omaha, NE (multiple OPS high schools)', 'Omaha', 'NE',
  false, false,
  '{low_income,first_gen}'::text[],
  '{CTE,career_technical_education,dual_enrollment,MCC,trades,healthcare,technology,culinary,agriculture,free,OPS,high_school,college_credit}'::text[],
  '{"9","10","11","12"}'::text[],
  'high', 'verified',
  'https://www.ops.org/domain/767', 'official_website', '2026-04-02',
  'School-year programs at individual OPS high schools. Enrollment through standard course registration. New academic year begins September. Contact your school counselor by spring registration (typically March–April) to enroll for the following year.',
  'k12_high_school',
  true, false, '2026-04-02', '2026-04-02',
  1,
  '{"eligible": false, "basis": "explicit", "notes": "OPS CTE programs are for enrolled OPS students only. Council Bluffs students are enrolled in the Council Bluffs Community School District (CBCSD). CB students should inquire with CBCSD about their own CTE pathways at Abraham Lincoln and Thomas Jefferson High Schools.", "source": "https://www.ops.org"}'::jsonb
);
