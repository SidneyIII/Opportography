-- ============================================================
-- Opportography — Migration 082
-- Phase 16A: Mentorship & College Navigation — TRIO Programs
-- Date: 2026-03-23
--
-- 6 verified entries:
--   1. Creighton University TRIO Classic Upward Bound
--   2. Creighton University TRIO Upward Bound Math & Science
--   3. Nebraska Methodist College TRIO Classic Upward Bound (Burke HS)
--   4. Nebraska Methodist College TRIO Upward Bound Math-Science (Benson HS)
--   5. Metro Community College TRIO Student Support Services
--   6. UNO TRIO Project Achieve (Student Support Services)
--
-- NOT duplicating (already in DB, migration 002):
--   - TRIO Upward Bound — UNO (Classic Upward Bound at UNO)
--
-- Note: TRIO programs are FEDERALLY FUNDED and FREE to eligible students.
-- All TRIO programs require first-generation college student status and/or
-- low-income status per federal poverty guidelines (typically 150% FPL).
-- These are among the most impactful free programs in the metro.
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

-- ── 1. Creighton University TRIO Classic Upward Bound ─────────────────────────
(
  'Creighton University TRIO Classic Upward Bound — Free College Prep for Omaha HS Students',
  'Creighton University TRIO Upward Bound Programs',
  'https://www.creighton.edu/student-success/trio',
  'Creighton University''s TRIO Classic Upward Bound Program is a federally funded, completely free college preparation program for Omaha metropolitan area high school students who are first-generation (neither parent has a 4-year college degree) and/or low-income. The program is designed to help students develop the academic skills and personal confidence needed to finish high school and be admitted to a four-year university. Upward Bound at Creighton provides: weekly tutoring in math, science, English, and foreign language; college planning advising and mentoring; SAT/ACT preparation; campus visits to colleges across Nebraska and the region; cultural activities and community service opportunities; and a six-week residential summer academy where students live on Creighton''s campus, take college-level courses, and experience what college life looks like firsthand. Rising 8th graders (entering 9th grade in the fall) may apply during the spring semester. This program has changed thousands of lives in Omaha. If you are a first-generation or low-income high school student in the Omaha metro, Creighton''s Upward Bound is one of the most important free resources available to you.',
  'college_access',
  'Must be a high school student (or rising 8th grader entering 9th grade) in the Omaha metropolitan area. Must meet at least ONE of the following: (1) first-generation college student — neither parent holds a 4-year college degree, OR (2) low-income — family income at or below 150% of federal poverty guidelines. Must demonstrate a strong desire to complete higher education. Income verification required (recent tax return or Social Security/benefits statement). Apply at creighton.edu/student-success/trio.',
  NULL,
  'https://www.creighton.edu/student-success/trio/upwardboundprograms',
  'Omaha, NE', '523 N 20th St', 'Omaha', 'NE', '68178',
  false, false,
  '{low_income,first_gen}'::text[], '{TRIO,college_access,college_prep,mentorship,SAT_ACT_prep,summer_program,first_gen,free}'::text[], '{grade_8,grade_9,grade_10,grade_11,grade_12}'::text[],
  'high', 'verified',
  'https://www.creighton.edu/student-success/trio', 'official_website', '2026-03-23',
  'Academic year program: weekly tutoring and advising during school year. Six-week residential summer academy on Creighton campus. Rising 8th graders may apply in spring semester. Office hours: M-F 8am-4:30pm; tutoring 3-6pm. Contact TRIO office at Labaj Building, 523 N 20th St.',
  true, true, '2026-03-23', '2026-03-23',
  '{"domain": "college_access", "subcategory": "TRIO", "opportunity_type": "TRIO_Upward_Bound_Classic", "cost_details": {"amount": 0, "cost_type": "free", "conditions": "Federally funded — completely free for all eligible students"}, "delivery": "in_person", "listing_type": "ongoing_program", "target_population": "first_gen, low_income, high_school", "program_components": ["weekly_tutoring", "SAT_ACT_prep", "college_visits", "advising", "six_week_summer_residential"], "federal_program": true, "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
),

-- ── 2. Creighton University TRIO Upward Bound Math & Science ─────────────────
(
  'Creighton University TRIO Upward Bound Math & Science — Free STEM College Prep',
  'Creighton University TRIO Upward Bound Programs',
  'https://www.creighton.edu/student-success/trio',
  'Creighton University''s TRIO Upward Bound Math & Science (UBMS) program is a federally funded, completely free STEM-focused college preparation program for first-generation and low-income Omaha-area high school students interested in math, science, and STEM careers. UBMS provides the same core services as Classic Upward Bound — tutoring, advising, campus visits, SAT/ACT prep, mentoring — with additional emphasis on math and science skill-building and exposure to STEM careers. The six-week summer residential academy includes STEM-specific coursework taught by Creighton faculty. If you are a first-gen or low-income student who is interested in medicine, engineering, computer science, biology, chemistry, or any STEM field — Creighton''s UBMS program is a powerful, free pathway. Creighton sponsors five TRIO programs in total, serving over 2,100 students from the Omaha metro area — one of the largest TRIO footprints in Nebraska.',
  'college_access',
  'Must be a high school student in the Omaha metropolitan area. Must meet at least ONE of: (1) first-generation college student — neither parent holds a 4-year college degree, OR (2) low-income per federal guidelines. Interest in STEM fields (math, science, engineering, medicine) preferred. Income verification required. Apply at creighton.edu/student-success/trio.',
  NULL,
  'https://www.creighton.edu/student-success/trio/upwardboundprograms',
  'Omaha, NE', '523 N 20th St', 'Omaha', 'NE', '68178',
  false, false,
  '{low_income,first_gen}'::text[], '{TRIO,college_access,STEM,college_prep,mentorship,math,science,first_gen,free}'::text[], '{grade_8,grade_9,grade_10,grade_11,grade_12}'::text[],
  'high', 'verified',
  'https://www.creighton.edu/student-success/trio', 'official_website', '2026-03-23',
  'Academic year program with six-week summer residential at Creighton. STEM-focused curriculum. Contact TRIO office at 523 N 20th St, Omaha, NE 68178.',
  true, false, '2026-03-23', '2026-03-23',
  '{"domain": "college_access", "subcategory": "TRIO", "opportunity_type": "TRIO_Upward_Bound_Math_Science", "cost_details": {"amount": 0, "cost_type": "free", "conditions": "Federally funded — completely free for all eligible students"}, "delivery": "in_person", "listing_type": "ongoing_program", "target_population": "first_gen, low_income, high_school, STEM_interested", "program_components": ["STEM_tutoring", "SAT_ACT_prep", "STEM_career_exploration", "summer_residential_STEM"], "federal_program": true, "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
),

-- ── 3. Nebraska Methodist College TRIO Classic Upward Bound (Burke HS) ────────
(
  'Nebraska Methodist College TRIO Classic Upward Bound — Burke High School Students',
  'Nebraska Methodist College TRIO Programs',
  'https://www.methodistcollege.edu/trio-classic-upward-bound',
  'Nebraska Methodist College (NMC) hosts a federally funded TRIO Classic Upward Bound program specifically serving students at Omaha Burke High School. This completely free program helps first-generation college students and low-income students at Burke develop the academic skills and personal confidence to complete high school and enter college. NMC''s Upward Bound provides tutoring, advising, mentoring, SAT/ACT preparation, college visit trips, and a summer enrichment component. This is a targeted, school-specific program — the federal grant requires that NMC serve students at Burke High School specifically. Burke students who are first-gen or low-income should apply to this program early — slots are limited by federal grant size and fill each year. NMC partners with Methodist Health System in Omaha, giving Upward Bound students unique access to healthcare career exploration alongside standard college prep services.',
  'college_access',
  'Must be a current student at Burke High School in Omaha (OPS). Must meet at least ONE of: (1) first-generation college student — neither parent holds a 4-year college degree, OR (2) low-income — family income at or below 150% of federal poverty guidelines. Strong desire to attend and complete college. Contact NMC TRIO program office at methodistcollege.edu/trio-classic-upward-bound.',
  NULL,
  'https://www.methodistcollege.edu/trio-classic-upward-bound',
  'Omaha, NE', '720 N 87th St', 'Omaha', 'NE', '68114',
  false, false,
  '{low_income,first_gen}'::text[], '{TRIO,college_access,college_prep,mentorship,Burke_HS,first_gen,free}'::text[], '{grade_9,grade_10,grade_11,grade_12}'::text[],
  'high', 'verified',
  'https://www.methodistcollege.edu/trio-classic-upward-bound', 'official_website', '2026-03-23',
  'Academic year program at Burke High School. Summer enrichment component. Federally funded — free to eligible students. Contact NMC TRIO office at methodistcollege.edu.',
  true, false, '2026-03-23', '2026-03-23',
  '{"domain": "college_access", "subcategory": "TRIO", "opportunity_type": "TRIO_Upward_Bound_Classic", "cost_details": {"amount": 0, "cost_type": "free", "conditions": "Federally funded — completely free for all eligible students"}, "delivery": "in_person", "listing_type": "ongoing_program", "target_population": "first_gen, low_income, Burke_HS_students", "schools_served": ["Burke High School (OPS)"], "federal_program": true, "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
),

-- ── 4. Nebraska Methodist College TRIO Upward Bound Math-Science (Benson HS) ──
(
  'Nebraska Methodist College TRIO Upward Bound Math-Science — Benson High School Students',
  'Nebraska Methodist College TRIO Programs',
  'https://www.methodistcollege.edu/trio-upward-bound-math-science',
  'Nebraska Methodist College (NMC) hosts a federally funded TRIO Upward Bound Math-Science program specifically serving 60 students at Benson High School in Omaha. This completely free STEM-focused college preparation program helps first-generation and low-income Benson students develop strong math and science foundations and pursue college degrees and careers in STEM fields. The program combines tutoring, advising, and mentoring with dedicated STEM enrichment — strengthening math and science skills with the specific goal of encouraging Benson students to pursue and complete four-year degrees in STEM. NMC received a grant renewal for this program, confirming its continued operation. NMC''s healthcare system connections mean Benson UBMS students get exceptional exposure to health science careers. Benson High School students who are first-gen or low-income with any interest in science, math, or healthcare should apply.',
  'college_access',
  'Must be a current student at Benson High School in Omaha (OPS). Must meet at least ONE of: (1) first-generation college student — neither parent holds a 4-year college degree, OR (2) low-income — family income at or below 150% of federal poverty guidelines. Program capacity: 60 students — apply early. Interest in math, science, or STEM-related careers preferred. Contact NMC TRIO at methodistcollege.edu/trio-upward-bound-math-science.',
  NULL,
  'https://www.methodistcollege.edu/trio-upward-bound-math-science',
  'Omaha, NE', '720 N 87th St', 'Omaha', 'NE', '68114',
  false, false,
  '{low_income,first_gen}'::text[], '{TRIO,college_access,STEM,college_prep,Benson_HS,math,science,first_gen,free}'::text[], '{grade_9,grade_10,grade_11,grade_12}'::text[],
  'high', 'verified',
  'https://www.methodistcollege.edu/trio-upward-bound-math-science', 'official_website', '2026-03-23',
  'Academic year program at Benson High School. 60 student capacity — apply early. Federally funded — free to eligible students.',
  true, false, '2026-03-23', '2026-03-23',
  '{"domain": "college_access", "subcategory": "TRIO", "opportunity_type": "TRIO_Upward_Bound_Math_Science", "cost_details": {"amount": 0, "cost_type": "free", "conditions": "Federally funded — completely free for all eligible students"}, "delivery": "in_person", "listing_type": "ongoing_program", "target_population": "first_gen, low_income, Benson_HS_students, STEM_interested", "schools_served": ["Benson High School (OPS)"], "capacity": 60, "federal_program": true, "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
),

-- ── 5. Metro Community College TRIO Student Support Services ──────────────────
(
  'Metro Community College TRIO Student Support Services — Free Academic Support for MCC Students',
  'Metropolitan Community College TRIO Programs',
  'https://www.mccneb.edu/life-at-mcc/trio',
  'Metropolitan Community College''s (MCC) TRIO Student Support Services (SSS) program is a federally funded, completely free academic support program for MCC students who are first-generation, low-income, and/or have a documented disability. TRIO SSS at MCC provides academic advising and counseling, tutoring assistance, financial aid information and counseling, college transfer advising, workshop programming, and community service opportunities. The goal of the program is to help eligible students succeed at MCC, improve their GPA, earn their certificate or degree, and successfully transfer to four-year institutions. High school seniors who know they will be attending MCC should be aware of this program before enrollment — applying early after admission maximizes access to services. MCC serves the Omaha metro area at multiple campuses (Fort Omaha, Elkhorn, Papillion, Sarpy). This is a federally funded program and costs nothing to participate in.',
  'college_access',
  'Must be enrolled in credit classes at Metropolitan Community College (MCC). Must meet at least ONE of: (1) first-generation college student — neither parent holds a 4-year college degree, OR (2) low-income — family income meeting U.S. Department of Education guidelines, OR (3) documented physical or learning disability. Must be a U.S. citizen or permanent resident seeking a degree, certificate, or planning to transfer. Apply at mccneb.edu/life-at-mcc/trio.',
  NULL,
  'https://www.mccneb.edu/life-at-mcc/trio',
  'Omaha, NE (multiple MCC campuses)', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen,disability}'::text[], '{TRIO,college_access,community_college,first_gen,advising,tutoring,transfer,free}'::text[], '{college_freshman,college_sophomore}'::text[],
  'high', 'verified',
  'https://www.mccneb.edu/life-at-mcc/trio', 'official_website', '2026-03-23',
  'Ongoing support during MCC enrollment. Apply early after admission to MCC for best access to services. Multiple MCC campuses served.',
  true, false, '2026-03-23', '2026-03-23',
  '{"domain": "college_access", "subcategory": "TRIO", "opportunity_type": "TRIO_Student_Support_Services", "cost_details": {"amount": 0, "cost_type": "free", "conditions": "Federally funded — completely free for all eligible enrolled MCC students"}, "delivery": "in_person", "listing_type": "ongoing_program", "target_population": "first_gen, low_income, disabled, MCC_enrolled_students", "note_for_hs_students": "High school seniors planning to attend MCC should apply for TRIO SSS immediately after MCC enrollment", "federal_program": true, "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": true, "multilingual": false}}'::jsonb
),

-- ── 6. UNO TRIO Project Achieve (Student Support Services) ────────────────────
(
  'UNO TRIO Project Achieve — Free Academic & Advising Support for UNO First-Gen Students',
  'University of Nebraska Omaha — TRIO Project Achieve',
  'https://www.unomaha.edu/project-achieve/',
  'UNO''s TRIO Student Support Services program — called Project Achieve — is a federally funded, completely free academic support program for University of Nebraska Omaha undergraduates who are first-generation, low-income, and/or have a documented disability. Project Achieve provides: academic advising and personal counseling, one-on-one tutoring assistance, financial aid information and counseling, transfer advising (for students considering further study after UNO), community service connections, and workshops on time management, financial literacy, graduate school preparation, and career planning. This is distinct from UNO''s Upward Bound program (which serves high school students) — Project Achieve specifically serves enrolled UNO undergraduates. Every UNO student who qualifies should know this program exists and apply. High school seniors who are first-gen or low-income and plan to attend UNO should apply for Project Achieve immediately after UNO enrollment.',
  'college_access',
  'Must be enrolled as an undergraduate student at the University of Nebraska Omaha (UNO). Must meet at least ONE of: (1) first-generation college student — neither parent holds a 4-year college degree, OR (2) low-income per federal income guidelines, OR (3) documented physical or learning disability. Must be a U.S. citizen or permanent resident. Apply at unomaha.edu/project-achieve or call 402-554-3492.',
  NULL,
  'https://www.unomaha.edu/project-achieve/',
  'Omaha, NE', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen,disability}'::text[], '{TRIO,college_access,first_gen,advising,tutoring,financial_aid,career_planning,free}'::text[], '{college_freshman,college_sophomore,college_junior,college_senior}'::text[],
  'high', 'verified',
  'https://www.unomaha.edu/project-achieve/', 'official_website', '2026-03-23',
  'Ongoing support throughout UNO enrollment. Apply early in first semester. Contact: 402-554-3492 or unoprojectachieve@unomaha.edu.',
  true, false, '2026-03-23', '2026-03-23',
  '{"domain": "college_access", "subcategory": "TRIO", "opportunity_type": "TRIO_Student_Support_Services", "cost_details": {"amount": 0, "cost_type": "free", "conditions": "Federally funded — completely free for all eligible enrolled UNO undergraduates"}, "delivery": "in_person", "listing_type": "ongoing_program", "target_population": "first_gen, low_income, disabled, UNO_enrolled_undergrads", "contact": {"phone": "402-554-3492", "email": "unoprojectachieve@unomaha.edu"}, "note_for_hs_students": "High school seniors planning to attend UNO should apply for Project Achieve immediately after UNO enrollment", "federal_program": true, "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
);
