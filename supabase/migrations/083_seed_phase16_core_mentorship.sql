-- ============================================================
-- Opportography — Migration 083
-- Phase 16B: Mentorship & College Navigation — Core Mentorship Programs
-- Date: 2026-03-23
--
-- 3 verified entries:
--   1. TeamMates Mentoring Program (Omaha + Council Bluffs)
--   2. College Possible Omaha (10 Omaha high schools)
--   3. 100 Black Men of Omaha — Leadership Mentoring Academy
--
-- NOT duplicating (already in DB):
--   - Big Brothers Big Sisters MentorU (migration 002)
--   - BBBS Mentor Info Sessions (migration 064)
--   - Partnership 4 Kids (migration 004)
--   - Avenue Scholars Omaha and Southwest Iowa (migrations 002, 004)
--   - Urban League Whitney Young Academy (migration 002)
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

-- ── 1. TeamMates Mentoring Program ───────────────────────────────────────────
(
  'TeamMates Mentoring Program — Free School-Based Mentoring (Omaha & Council Bluffs)',
  'TeamMates Mentoring Program',
  'https://teammates.org/',
  'TeamMates Mentoring Program is Nebraska''s premier school-based mentoring organization, founded by Tom and Nancy Osborne (former Nebraska Cornhuskers football coach and Athletic Director). TeamMates pairs students in grades 3–12 with a caring adult volunteer mentor who meets with them one hour per week at school during the academic year. Mentors help students identify their strengths, set goals, and develop a sense of hope, purpose, and vision for their future. The program is completely free, school-based (meetings happen on school grounds during the school day or before/after school), and requires no transportation from students or families. TeamMates operates in Omaha Public Schools, Millard Public Schools, and Council Bluffs Community Schools — among many other Nebraska and Iowa districts. The Council Bluffs Community Schools has a dedicated TeamMates District Coordinator, confirming active CB participation. Students who want a mentor can apply through their school''s TeamMates chapter — contact your school counselor or principal to find out if your school participates. If your school does not currently have a TeamMates chapter, contact teammates.org to start one. This is one of the most impactful free mentoring resources in the metro.',
  'mentorship',
  'FREE. Students in grades 3–12 enrolled at a school with an active TeamMates chapter. Open to any student — no income or first-generation requirement. Parental or guardian permission required. Contact your school counselor or principal to ask if your school has a TeamMates chapter. If yes, request to be paired with a mentor. Find local chapters at teammates.org/chapters.',
  NULL,
  'https://teammates.org/',
  'Omaha, NE / Council Bluffs, IA (school-based metro-wide)', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen}'::text[], '{mentorship,free,school_based,grades_3_12,Council_Bluffs,Omaha,youth_development,college_prep}'::text[], '{grade_3,grade_4,grade_5,grade_6,grade_7,grade_8,grade_9,grade_10,grade_11,grade_12}'::text[],
  'high', 'verified',
  'https://teammates.org/', 'official_website', '2026-03-23',
  'Academic year program. Mentors meet with students one hour per week at school. Program runs September through May. Contact teammates.org or your school counselor to apply. Council Bluffs Community Schools has an active TeamMates program — contact the district or individual schools.',
  true, true, '2026-03-23', '2026-03-23',
  '{"domain": "mentorship", "subcategory": "mentorship_one_on_one", "opportunity_type": "school_based_mentoring", "cost_details": {"amount": 0, "cost_type": "free", "conditions": "Completely free — no cost to students or families. School-based."}, "delivery": "in_person", "listing_type": "ongoing_program", "founder": "Tom and Nancy Osborne", "target_population": "all_students_grades_3_12", "schools_served": ["Omaha Public Schools", "Millard Public Schools", "Council Bluffs Community Schools", "and others across Nebraska and Iowa — check teammates.org/chapters"], "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": true, "multilingual": false}}'::jsonb
),

-- ── 2. College Possible Omaha ─────────────────────────────────────────────────
(
  'College Possible Omaha — Free Multi-Year College Coaching (10 Omaha High Schools)',
  'College Possible Omaha',
  'https://collegepossible.org/locations/omaha/',
  'College Possible is a national college access organization with a strong Omaha presence — one of the most important free college coaching programs in the metro. Since 2011, College Possible Omaha has provided free, personalized college coaching to over 3,570 students. The program is embedded directly in 10 Omaha-area high schools, beginning with students in their junior year of high school. College Possible coaches help students find the right college, navigate the admissions process, secure financial aid with as little debt as possible, and stay enrolled and on track through degree completion — providing 6+ years of support from junior year of high school through college graduation. The program serves students from low-income backgrounds at no cost whatsoever — no fees, no applications costs, no strings attached. Students who are eligible for Dell Scholars or other college access scholarships may gain additional resources through College Possible''s national partnerships. The 10 Omaha-area high schools served are: Bellevue East, Benson, Central, Millard South, North, Northwest Magnet, Papillion-La Vista, Ralston, South Magnet, and Westview. Students at these schools should ask their school counselor how to connect with their College Possible coach. College Possible students are 30% more likely to enroll in college after high school and 3x more likely to earn a bachelor''s degree than peers from similar backgrounds.',
  'college_access',
  'FREE. High school junior (11th grade) or sophomore at one of College Possible''s 10 Omaha partner high schools: Bellevue East, Benson, Central, Millard South, Omaha North, Northwest Magnet, Papillion-La Vista, Ralston, South Magnet, or Westview. From a low-income household. No formal application process — students are recruited and enrolled through their school. Ask your school counselor or check collegepossible.org/locations/omaha for your school''s connection.',
  NULL,
  'https://collegepossible.org/locations/omaha/',
  'Omaha, NE (embedded in 10 partner high schools)', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen}'::text[], '{college_access,mentorship,free,FAFSA,financial_aid,college_prep,multi_year,10_schools}'::text[], '{grade_10,grade_11,grade_12}'::text[],
  'high', 'verified',
  'https://collegepossible.org/locations/omaha/', 'official_website', '2026-03-23',
  'Multi-year program: begins junior year of high school and continues through college graduation (6+ years total). School-year based. Students at partner high schools are recruited and connected through their school counselor.',
  true, true, '2026-03-23', '2026-03-23',
  '{"domain": "college_access", "subcategory": "college_access_coaching", "opportunity_type": "multi_year_college_coaching", "cost_details": {"amount": 0, "cost_type": "free", "conditions": "Completely free — no cost to students or families."}, "delivery": "in_person", "listing_type": "ongoing_program", "established": 2011, "students_served_total": "3,570+", "schools_served": ["Bellevue East", "Benson", "Central", "Millard South", "Omaha North", "Northwest Magnet", "Papillion-La Vista", "Ralston", "South Magnet", "Westview"], "program_duration": "6+ years (junior year HS through college graduation)", "outcomes": {"college_enrollment_rate": "30% more likely than peers", "degree_completion": "3x more likely than peers"}, "dell_scholars_connection": "College Possible is an approved Dell Scholars partner — eligible students may qualify for additional $20,000 Dell Scholarship", "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
),

-- ── 3. 100 Black Men of Omaha — Leadership Mentoring Academy ─────────────────
(
  '100 Black Men of Omaha — Leadership Mentoring Academy (Free, Grades 9–12)',
  '100 Black Men of Omaha, Inc.',
  'https://100blackmenomaha.org/',
  '100 Black Men of Omaha, Inc. is the only organization in Omaha that ensures young Black men are specifically mentored by Black men — providing crucial representation alongside the mentoring relationship. Founded in 1995, the organization operates several youth programs with the Leadership Mentoring Academy (LMA) as its flagship. The LMA serves young men in grades 9–12 and focuses on goal setting, positive decision-making, career exploration, high school graduation planning, and post-secondary education readiness. The results speak: the LMA has had a 100% graduation rate since 2008, and 85% of LMA graduates attend post-secondary educational institutions. During the 2024-25 year, 100 Black Men of Omaha impacted 1,040 youth across the Omaha community. Additional programs include the Saturday Academy for younger students, financial literacy programming, and the African American History Challenge. The LMA is free and serves young Black men in the Omaha metro. If you are a young Black man in Omaha looking for mentors who look like you and who will walk with you from high school through college — this is the program. Apply at 100blackmenomaha.org or visit their SHARE Omaha page.',
  'mentorship',
  'FREE. Young Black men in grades 9–12 in the Omaha metropolitan area. Program focuses on academic achievement, career exploration, and post-secondary readiness. Apply at 100blackmenomaha.org or via the mentor orientation events listed on SHARE Omaha. Contact the organization directly for current enrollment status and application process.',
  NULL,
  'https://100blackmenomaha.org/leadership-mentoring-academy/',
  'Omaha, NE', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen,bipoc}'::text[], '{mentorship,free,Black_male,leadership,college_prep,career_exploration,financial_literacy,high_school}'::text[], '{grade_9,grade_10,grade_11,grade_12}'::text[],
  'high', 'verified',
  'https://100blackmenomaha.org/', 'official_website', '2026-03-23',
  'Year-round program with academic year and summer components. Annual enrollment — contact 100blackmenomaha.org for current application cycle and openings.',
  true, true, '2026-03-23', '2026-03-23',
  '{"domain": "mentorship", "subcategory": "mentorship_cohort", "opportunity_type": "youth_mentorship_program", "cost_details": {"amount": 0, "cost_type": "free", "conditions": "Completely free for eligible young men."}, "delivery": "in_person", "listing_type": "ongoing_program", "established": 1995, "target_population": "Black_male_students_grades_9_12", "outcomes": {"graduation_rate": "100% since 2008", "postsecondary_rate": "85% of LMA graduates"}, "programs": ["Leadership Mentoring Academy (LMA)", "100 Saturday Academy", "Financial Literacy", "African American History Challenge", "Real Men Read", "Real Men Greet", "Striving for Success: Black Male Summit"], "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
);
