-- ============================================================
-- Opportography — Migration 085
-- Phase 16D: Mentorship & College Navigation — Youth Development &
--             Financial Literacy Programs
-- Date: 2026-03-24
--
-- 3 verified entries:
--   1. Completely KIDS — After-School & Teen Leadership (Omaha)
--   2. Junior Achievement of the Midlands — JA Finance Park & Career Exploration
--   3. Jack Kent Cooke Foundation Young Scholars Program (7th graders)
--
-- NOT duplicating (already in DB):
--   - Boys & Girls Clubs Power Hour tutoring and Money Matters (migration 059, 004)
--   - Girls Inc. of Omaha tutoring (migration 059)
--   - Financial Beginnings Nebraska (migration 010)
--   - IWCC Summer Youth Camps (migration 004)
--   - AIM Institute Youth in Tech (migration 004)
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

-- ── 1. Completely KIDS ────────────────────────────────────────────────────────
(
  'Completely KIDS — Free After-School Programs & Teen Leadership (17 Omaha Sites)',
  'Completely KIDS',
  'https://completelykids.org/',
  'Completely KIDS provides free and low-cost after-school and summer programs for children ages 4–17 at its headquarters (25th and St. Mary''s Avenue) and 16 additional locations throughout Omaha — making it one of the most geographically distributed youth development organizations in the metro. For older teens, Completely KIDS offers dedicated Teen Leadership and Workforce Development programming alongside the core academic support services. Programs include homework help and academic enrichment, STEM and reading programs, healthy meals, nature and gardening programs, behavioral health services, swimming lessons, and structured leadership development. The Teen Leadership and Workforce Development track is particularly relevant for high school students thinking about college and career readiness — it builds exactly the soft skills, personal organization, and goal-setting foundations that mentors and college access programs reinforce. Completely KIDS serves 2,000 children ages 4–17 with critical services after school and throughout the summer. The program operates in OPS school areas (South, North, and Central Omaha). Fees are low-cost or free depending on family income.',
  'community',
  'Children and teens ages 4–17 in the Omaha area. Programs are free or low-cost depending on family income — financial barriers are actively minimized. Multiple Omaha locations — check completelykids.org for the site nearest you. After-school programs are school-year based; summer programs run June–August. Enrollment is through the Completely KIDS website or by contacting individual program sites.',
  NULL,
  'https://completelykids.org/',
  'Omaha, NE (17 locations)', '2520 St Marys Ave', 'Omaha', 'NE', '68105',
  false, false,
  '{low_income}'::text[], '{youth_development,free,after_school,teen_leadership,workforce_development,STEM,homework_help,ages_4_17,Omaha}'::text[], '{grade_3,grade_4,grade_5,grade_6,grade_7,grade_8,grade_9,grade_10,grade_11,grade_12}'::text[],
  'high', 'verified',
  'https://completelykids.org/', 'official_website', '2026-03-24',
  'After-school programs: September–May. Summer programs: June–August. Headquarters: 25th and St. Mary''s Ave, Omaha. 16 additional community sites across Omaha. Check completelykids.org for site locations and enrollment.',
  true, false, '2026-03-24', '2026-03-24',
  '{"domain": "youth_development", "subcategory": "after_school_teen_leadership", "opportunity_type": "after_school_program", "cost_details": {"amount": 0, "cost_type": "free_or_low_cost", "conditions": "Free or income-based sliding scale. Financial barriers minimized."}, "delivery": "in_person", "listing_type": "ongoing_program", "sites": 17, "target_population": "ages_4_17, Omaha", "teen_programs": ["Teen Leadership", "Workforce Development", "Homework Help", "STEM", "Behavioral Health"], "accessibility": {"cost_barrier": "low", "requires_enrollment": true, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
),

-- ── 2. Junior Achievement of the Midlands ────────────────────────────────────
(
  'Junior Achievement of the Midlands — JA Finance Park, JA BizTown & Career Programs',
  'Junior Achievement of the Midlands',
  'https://midlands.ja.org/',
  'Junior Achievement of the Midlands (JA Midlands) delivers in-school financial literacy, career exploration, and entrepreneurship programs to students across the Omaha metro area — including Council Bluffs schools — through a network of volunteer business educators. JA programs are school-based and free to participating students. Key programs include: JA BizTown (grades 4–6) — a hands-on simulated town where students run banks, restaurants, and stores; JA Finance Park (grades 7–9) — a realistic personal finance simulation where students create personal budgets and make real-world financial decisions; and JA Inspire (high school) — career exploration connecting students with local employers, industry professionals, and career pathway information. JA Finance Park is arguably the most impactful financial literacy program available to middle school students in the Omaha metro — it teaches budgeting, net income vs. gross income, housing costs, transportation costs, insurance, and savings in a hands-on way that students remember. Spanish language support is available for JA BizTown. Schools request JA programs through JA Midlands — students participate through their school. JA also hosts the JA Inspire career exploration event open to high school students from the metro.',
  'community',
  'FREE for participating students. JA programs are delivered in schools — students participate through their school if the school has requested a JA program. Parents, students, and teachers can advocate for JA programs at their school by contacting midlands.ja.org. Some JA events (like JA Inspire) may be open to students beyond participating schools — check midlands.ja.org for current events open to the public.',
  NULL,
  'https://midlands.ja.org/',
  'Omaha, NE / Council Bluffs, IA (metro-wide school delivery)', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income}'::text[], '{financial_literacy,career_exploration,entrepreneurship,school_based,free,Council_Bluffs,Omaha,grades_4_12,workforce_readiness}'::text[], '{grade_4,grade_5,grade_6,grade_7,grade_8,grade_9,grade_10,grade_11,grade_12}'::text[],
  'high', 'verified',
  'https://midlands.ja.org/', 'official_website', '2026-03-24',
  'School-year programs delivered through participating schools. JA BizTown and Finance Park visits are scheduled throughout the academic year. JA Inspire career event: annual, typically spring. Check midlands.ja.org for current public event dates.',
  true, true, '2026-03-24', '2026-03-24',
  '{"domain": "financial_literacy", "subcategory": "school_based_financial_literacy", "opportunity_type": "in_school_program", "cost_details": {"amount": 0, "cost_type": "free", "conditions": "Free for participating students through school partnerships."}, "delivery": "in_person", "listing_type": "ongoing_program", "programs": {"JA_BizTown": "grades 4-6, simulated business town, Spanish language support available", "JA_Finance_Park": "grades 7-9, personal finance simulation (budgeting, income, housing, savings)", "JA_Inspire": "HS, career exploration event with local employers", "classroom_programs": "various grades, financial literacy and entrepreneurship curriculum"}, "volunteer_educators": "business professionals from Omaha metro area", "accessibility": {"cost_barrier": "free", "requires_enrollment": false, "council_bluffs_accessible": true, "multilingual": true}}'::jsonb
),

-- ── 3. Jack Kent Cooke Foundation Young Scholars Program (7th Grade) ──────────
-- For high-achieving 7th graders with financial need.
-- Multi-year support through high school and into the JKC College Scholarship.
-- Separate from the JKC College Scholarship (migration 076, already in DB).
(
  'Jack Kent Cooke Young Scholars Program — 7th Grade High-Achievers with Financial Need',
  'Jack Kent Cooke Foundation',
  'https://www.jkcf.org/our-scholarships/young-scholars-program/',
  'The Jack Kent Cooke Foundation Young Scholars Program is a multi-year support program — distinct from the JKC College Scholarship (which is for high school seniors and is separately listed in this database) — designed for high-achieving 7th graders from families with significant financial need. Selected Young Scholars receive up to $2,500 per year in educational funding during middle and high school, plus access to JKC''s comprehensive college preparation support services: college counseling, test preparation resources, summer enrichment funding, extracurricular support, and mentoring. The program runs from 8th grade through 12th grade. Young Scholars also receive priority consideration for the JKC College Scholarship (up to $55,000/year for college). Approximately 60–80 Young Scholars are selected nationally per year. This is extremely competitive — but for a 7th grader in Omaha or Council Bluffs who has strong grades and significant financial need, applying is one of the most valuable things a parent or student can do. The application is free and opens in the fall. This is for students who are currently in 7th grade — not high school seniors.',
  'scholarship',
  'Must be a current 7th grader (or in the fall semester of 7th grade at time of application). Demonstrated high academic achievement (typically top of class, strong grades). Significant financial need (family income typically under $95,000, adjusted for family size). U.S. citizen or permanent resident. Application is FREE. Opens in fall of 7th grade year, deadline typically in February. Apply at jkcf.org/our-scholarships/young-scholars-program. NOTE: This is the MIDDLE SCHOOL program (grades 7-12). The JKC College Scholarship (for HS seniors) is separately listed in this database.',
  '2027-02-28',
  'https://www.jkcf.org/our-scholarships/young-scholars-program/',
  'Remote (National)', NULL, NULL, NULL, NULL,
  true, false,
  '{low_income,first_gen}'::text[], '{scholarship,college_access,7th_grade,high_achiever,multi_year,national,need_based,free}'::text[], '{grade_7}'::text[],
  'high', 'verified',
  'https://www.jkcf.org/our-scholarships/young-scholars-program/', 'official_website', '2026-03-24',
  'Application opens in fall of 7th grade year. Deadline: ~February. Scholars selected in spring. Program runs through 12th grade graduation. Verify exact current-cycle dates at jkcf.org.',
  true, true, '2026-03-24', '2026-03-24',
  '{"domain": "college_access", "subcategory": "multi_year_support_program", "opportunity_type": "national_scholarship_support_program", "cost_details": {"amount": 0, "cost_type": "free", "conditions": "Free to apply. Up to $2,500/year in educational funding plus college prep services."}, "delivery": "remote_and_in_person", "listing_type": "scholarship_program", "award_count_national": "~60-80 per year", "program_duration": "grades 8-12 (5 years)", "annual_funding": "$2,500 for educational expenses", "additional_benefits": ["college_counseling", "test_prep_resources", "summer_enrichment_funding", "priority_consideration_for_JKC_College_Scholarship"], "note": "Distinct from JKC College Scholarship (HS seniors, up to $55,000/yr) which is separately listed in this database (migration 076).", "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": true, "multilingual": false}}'::jsonb
);
