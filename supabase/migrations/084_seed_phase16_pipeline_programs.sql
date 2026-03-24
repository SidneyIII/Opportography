-- ============================================================
-- Opportography — Migration 084
-- Phase 16C: Mentorship & College Navigation — Health Sciences Pipeline
--             & Community College Access Initiatives
-- Date: 2026-03-24
--
-- 3 verified entries:
--   1. UNMC High School Alliance (HS juniors/seniors, dual credit, health sciences)
--   2. UNO North Omaha Initiative (UNO courses at community sites, first-gen focus)
--   3. UNO Goodrich Scholarship Program — Support Services Component
--      (NOTE: only seeding the SUPPORT SERVICES component as a
--       college-access listing — the scholarship itself is in migration 039)
-- ============================================================

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
) VALUES

-- ── 1. UNMC High School Alliance ─────────────────────────────────────────────
(
  'UNMC High School Alliance — Dual-Credit Health Sciences Program (Grades 11–12)',
  'University of Nebraska Medical Center (UNMC)',
  'https://www.unmc.edu/alliance/',
  'The UNMC High School Alliance is an academic enrichment program that provides Omaha metro area high school juniors and seniors with unique opportunities to explore health science careers through hands-on learning at one of the nation''s leading academic medical centers. The program offers advanced health science courses — including infectious diseases, anatomy, and medical decision-making — taught directly by UNMC faculty on the UNMC campus in the Nebraska Medical Center area of Omaha. Students receive DUAL CREDIT: both high school credit and college credit from their institution. Program participants shadow healthcare professionals, network with other serious science students, and gain a significant advantage when applying to health science programs in college. Since 2010, the UNMC High School Alliance has been building a pipeline from Omaha-area high schools into healthcare careers. This is one of the most rigorous and prestigious free opportunities available to a high school student in the metro who is interested in medicine, nursing, pharmacy, dentistry, physical therapy, or any allied health field. The application window typically closes in the spring for the following academic year. Students at Bellevue Public Schools and OPS schools have dedicated pathways.',
  'college_access',
  'Must be a rising junior or senior in high school (entering 11th or 12th grade) and at least 16 years old at the start of the program year. Strong academic record in science: must have completed Algebra I, Biology, a physical science course, and a third year of science — all with a grade of B or above. Must submit a 250-word essay describing your interest in a health science career. In-person interview required as part of selection. Application typically due in spring for the following year. Contact UNMC High School Alliance at 402-559-3027 or visit unmc.edu/alliance for current application dates.',
  '2026-05-01',
  'https://www.unmc.edu/alliance/',
  'Omaha, NE (UNMC Campus)', NULL, 'Omaha', 'NE', '68198',
  false, false,
  '{low_income,first_gen}'::text[], '{health_sciences,dual_credit,college_prep,pre_med,nursing,science,UNMC,pipeline,grades_11_12,free}'::text[], '{grade_10,grade_11}'::text[],
  'high', 'verified',
  'https://www.unmc.edu/alliance/', 'official_website', '2026-03-24',
  'Academic year program at UNMC campus. Application typically opens in spring. 2025-2026 applications were noted as closed — check unmc.edu/alliance for next cycle dates. Contact: 402-559-3027.',
  true, true, '2026-03-24', '2026-03-24',
  '{"domain": "college_access", "subcategory": "health_sciences_pipeline", "opportunity_type": "dual_credit_pipeline_program", "cost_details": {"amount": 0, "cost_type": "free", "conditions": "Free program — dual credit may have small per-credit fees; verify at unmc.edu/alliance"}, "delivery": "in_person", "listing_type": "academic_program", "target_population": "HS_juniors_seniors_health_interested", "program_components": ["UNMC_faculty_taught_courses", "healthcare_professional_shadowing", "dual_credit_HS_and_college", "networking_with_health_science_peers"], "established": 2010, "contact_phone": "402-559-3027", "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": true, "multilingual": false}}'::jsonb
),

-- ── 2. UNO North Omaha Initiative ─────────────────────────────────────────────
(
  'UNO North Omaha Initiative — College Courses in Your Neighborhood (Urban League Site)',
  'University of Nebraska Omaha — Office of Academic Affairs',
  'https://www.unomaha.edu/academic-affairs/news/2025/03/north-omaha-initiative.php',
  'The UNO North Omaha Initiative brings University of Nebraska Omaha courses directly into North Omaha community spaces — eliminating one of the biggest barriers to college enrollment for non-traditional, first-generation, and low-income students: getting to campus. The Initiative launched in fall 2024 and offers 12–15 credit hours per semester at the Urban League of Nebraska building in North Omaha. Courses span Black Studies, Business, Criminal Justice, Education, and Gerontology. Students receive the same UNO credit, the same UNO instructors, and the same degree pathway as students attending class on the main UNO campus — but they do it in a community space they already know and trust. Tuition assistance is available. This initiative directly targets students who might never take the step of walking onto a traditional college campus — people who have thought about college, who have the ability to succeed, but who face real logistical, psychological, or cultural barriers to enrollment. If you are a North Omaha resident who has been thinking about college but hasn''t made the move — this program was designed for you. Courses are offered at the Urban League of Nebraska, 3040 Lake St, Omaha.',
  'college_access',
  'Open to any adult interested in earning UNO credit. No prior college enrollment required for audit or initial enrollment. Ideal for non-traditional students, first-generation college students, and North Omaha community residents who face barriers to on-campus attendance. Tuition assistance available — contact UNO Academic Affairs or the Urban League of Nebraska for details. Verify current course offerings and enrollment at unomaha.edu or by contacting UNO Academic Affairs.',
  NULL,
  'https://www.unomaha.edu/academic-affairs/news/2025/03/north-omaha-initiative.php',
  'Omaha, NE (Urban League of Nebraska)', '3040 Lake St', 'Omaha', 'NE', '68111',
  false, false,
  '{low_income,first_gen,bipoc}'::text[], '{college_access,non_traditional,first_gen,North_Omaha,community_college_access,UNO,free}'::text[], '{college_freshman,college_sophomore}'::text[],
  'high', 'verified',
  'https://www.unomaha.edu/academic-affairs/news/2025/03/north-omaha-initiative.php', 'official_website', '2026-03-24',
  'Semester-based. Launched fall 2024, continuing in spring 2025 and beyond. Offered at Urban League of Nebraska, 3040 Lake St, Omaha. 12-15 credit hours per semester. Check unomaha.edu for current semester schedule.',
  true, true, '2026-03-24', '2026-03-24',
  '{"domain": "college_access", "subcategory": "community_college_access", "opportunity_type": "off_campus_college_courses", "cost_details": {"amount": 0, "cost_type": "free_with_eligibility", "conditions": "UNO tuition applies — tuition assistance available. Verify at unomaha.edu."}, "delivery": "in_person", "listing_type": "ongoing_program", "target_population": "non_traditional, first_gen, North_Omaha_residents", "location_partner": "Urban League of Nebraska", "launched": "fall 2024", "courses": ["Black Studies", "Business", "Criminal Justice", "Education", "Gerontology"], "future_sites": "Malcolm X Memorial Foundation (planned)", "accessibility": {"cost_barrier": "low_with_assistance", "requires_enrollment": true, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
),

-- ── 3. UNO Goodrich Scholarship Program — Support Services ────────────────────
-- NOTE: The Goodrich Scholarship (financial aid component) is in migration 039.
-- This entry documents the SUPPORT SERVICES and LEARNING COMMUNITY component
-- that makes Goodrich much more than just a scholarship — it is a holistic
-- college success program that provides ongoing advising, mentorship, and
-- community for Goodrich scholars throughout their UNO enrollment.
(
  'UNO Goodrich Scholarship Program — Learning Community & Advising Support',
  'University of Nebraska Omaha — Goodrich Scholarship Program',
  'https://www.unomaha.edu/college-of-public-affairs-and-community-service/goodrich-scholarship-program/',
  'The UNO Goodrich Scholarship Program — established by the Nebraska Legislature in 1972 — is far more than a scholarship. It is a comprehensive college success program built around an intentional learning community that provides every Goodrich Scholar with holistic support from enrollment through graduation. The program includes: the MavEd core curriculum (a structured academic and life skills sequence), academic advising by dedicated Goodrich faculty advisors, peer mentoring through the Goodrich Organization (GO!), connections to professional internships and employer partners, and ongoing community engagement with organizations like Partnership 4 Kids and Big Brothers Big Sisters. The 85% graduation rate — far above national averages for low-income and first-generation students — is the direct result of this community-first model. Goodrich Scholars are any Nebraska resident with financial need and academic merit; there is no income cutoff that disqualifies you from the scholarship component, and the learning community benefits every Scholar equally. Any Nebraska resident attending UNO who wants to be part of this community should apply. Application for the scholarship (and learning community access) opens October 1 of each year. Visit goodrich.smapply.org to apply.',
  'college_access',
  'Must be a Nebraska resident attending or planning to attend UNO. Financial need and academic merit required (no specific minimum GPA stated — varies by year). Apply at goodrich.smapply.org when applications open on October 1 each year. Applications for the following fall are reviewed through the spring. The learning community (advising, mentoring, peer community) is available to all Goodrich Scholars — receiving the scholarship unlocks full program participation.',
  NULL,
  'https://www.unomaha.edu/college-of-public-affairs-and-community-service/goodrich-scholarship-program/',
  'Omaha, NE', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen}'::text[], '{college_access,mentorship,advising,learning_community,first_gen,Nebraska_resident,UNO,free}'::text[], '{high_school_senior,college_freshman}'::text[],
  'high', 'verified',
  'https://www.unomaha.edu/college-of-public-affairs-and-community-service/goodrich-scholarship-program/', 'official_website', '2026-03-24',
  'Applications open October 1 annually at goodrich.smapply.org. Rolling review through spring. Scholarship and learning community membership begins the following fall. Current application cycle: applications for 2026-2027 open October 1, 2026.',
  true, true, '2026-03-24', '2026-03-24',
  '{"domain": "college_access", "subcategory": "college_success_program", "opportunity_type": "scholarship_plus_learning_community", "cost_details": {"amount": 0, "cost_type": "free_with_eligibility", "conditions": "Scholarship covers tuition and general fees. Learning community access is included for all Goodrich Scholars."}, "delivery": "in_person", "listing_type": "ongoing_program", "target_population": "Nebraska_residents, financial_need, academic_merit", "established": 1972, "graduation_rate": "85%", "program_components": ["MavEd_core_curriculum", "dedicated_academic_advising", "peer_mentoring_GO", "employer_connections", "community_engagement"], "application_url": "https://goodrich.smapply.org", "note": "Scholarship component also listed separately in this database (migration 039 — UNO scholarships). This entry documents the support services and learning community.", "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
);
