-- ============================================================
-- Opportography — Migration 004
-- Phase 2 Expansion Batch
-- Sources researched and verified: February 2026
-- Run AFTER 003_cleanup_expired.sql
--
-- Geographic breakdown:
--   Council Bluffs / Iowa-side: 7 opportunities (CRITICAL gap filled)
--   Omaha / Nebraska-side:      5 opportunities (new categories)
-- New categories covered: summer_program, college_access (trades/apprenticeship)
-- ============================================================

insert into public.opportunities (
  title, organization, organization_website, description, type,
  eligibility, deadline, link, location, city, state,
  identity_tags, category_tags, grade_levels,
  compensation_type, compensation_amount, compensation_frequency,
  data_confidence, verification_status,
  source_url, source_type, source_retrieved_date,
  is_active, is_featured
) values

-- ══════════════════════════════════════════════════════════
-- COUNCIL BLUFFS / IOWA-SIDE (7 opportunities)
-- ══════════════════════════════════════════════════════════

-- ── CB SCHOLARSHIPS ───────────────────────────────────────

(
  'SWIEF Scholarships — Southwest Iowa Educational Foundation',
  'Southwest Iowa Educational Foundation',
  'https://www.swiowaeducationalfoundation.org',
  'Over 100 college scholarships totaling more than $600,000 for high school seniors across Southwest Iowa, including Council Bluffs (Pottawattamie County). Students complete one shared application and are automatically considered for all awards they are eligible for.',
  'scholarship',
  'Must be a high school senior in Pottawattamie County or select Southwest Iowa counties (Cass, Fremont, Harrison, Mills, Montgomery, Page, Shelby). Applications open February 1 each year.',
  '2026-03-15',
  'https://www.swiowaeducationalfoundation.org',
  'Council Bluffs', 'Council Bluffs', 'IA',
  array['low_income', 'first_gen'],
  array['leadership'],
  array['12'],
  'scholarship_amount', 'Varies by award', null,
  'high', 'verified',
  'https://nonpareilonline.com/news/local/education/scholarships-southwest-iowa-education-foundation-swief-applicaiton/article_4d1b9650-da94-11ef-95d4-1724f87ddc8a.html', 'news', '2026-02-23',
  true, true
),

(
  'Iowa Western Community College Scholarship Program',
  'Iowa Western Community College',
  'https://www.iwcc.edu',
  'Iowa Western awards over $375,000 in scholarships annually through 400+ individual awards for new and continuing students. Highlights include the Presidential Scholarship (up to $2,500/semester for 3.5+ GPA students) and the Iowa Last-Dollar Scholarship covering tuition not met by federal/state grants for Iowa residents in high-demand career fields.',
  'scholarship',
  'Open to new and continuing IWCC students. Presidential Scholarship requires a 3.5+ cumulative GPA and enrollment directly from high school. Iowa Last-Dollar Scholarship requires Iowa residency and enrollment in a high-demand field certificate or degree program.',
  '2026-04-08',
  'https://www.iwcc.edu/financial-aid/scholarships/',
  'Council Bluffs', 'Council Bluffs', 'IA',
  array['low_income', 'first_gen'],
  array['leadership'],
  array['12', 'college_freshman'],
  'scholarship_amount', 'Varies — up to $10,000 total for Presidential Scholarship', null,
  'high', 'verified',
  'https://www.iwcc.edu/financial-aid/scholarships/', 'official_website', '2026-02-23',
  true, true
),

-- ── CB COLLEGE ACCESS & CAREER ────────────────────────────

(
  'Avenue Scholars Southwest Iowa — Career Pathway Program',
  'Avenue Scholars Southwest Iowa',
  'https://sharegoodiowa.org/nonprofit/avenue-scholars-southwest-iowa',
  'Council Bluffs-based career coaching and internship program for low-income and first-generation high school students in Southwest Iowa. Career coaches are embedded in partner high schools — including Thomas Jefferson and Abraham Lincoln — to guide students from school into high-demand, high-wage careers. Includes paid 8–10 week internships and certificate or associate degree planning.',
  'college_access',
  'High school students at partner schools in the Council Bluffs and Southwest Iowa area who are low-income (eligible for free/reduced lunch or Pell Grant) and interested in career pathways requiring an associate degree or less.',
  null,
  'https://sharegoodiowa.org/nonprofit/avenue-scholars-southwest-iowa',
  'Council Bluffs', 'Council Bluffs', 'IA',
  array['low_income', 'first_gen'],
  array['business', 'leadership', 'trades', 'health'],
  array['9', '10', '11', '12'],
  'paid', 'Paid internships included', null,
  'high', 'verified',
  'https://nonpareilonline.com/news/local/avenue-scholars-swi-gears-up-for-summer-career-exploration/article_25f86cca-cdd3-11ee-bdd0-e37655c75c17.html', 'news', '2026-02-23',
  true, true
),

(
  'IowaWORKS Council Bluffs — Career & Job Training Services',
  'Iowa Workforce Development',
  'https://workforce.iowa.gov/jobs/iowaworks/iowaworks-council-bluffs',
  'The IowaWORKS office in Council Bluffs is a free American Job Center offering one-on-one career counseling, virtual resume-building workshops, labor market information, connections to paid training programs, and youth workforce services. Walk-ins welcome Monday–Friday.',
  'free_resource',
  'Open to all job seekers in the Council Bluffs area — both employed and unemployed Iowans. Youth and young adults are specifically served through WIOA youth program connections.',
  null,
  'https://workforce.iowa.gov/jobs/iowaworks/iowaworks-council-bluffs',
  'Council Bluffs', 'Council Bluffs', 'IA',
  array['low_income', 'first_gen', 'homeless', 'immigrant'],
  array['business', 'leadership', 'trades'],
  array['11', '12', 'college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://workforce.iowa.gov/jobs/iowaworks/iowaworks-council-bluffs', 'official_website', '2026-02-23',
  true, false
),

-- ── CB FREE RESOURCES ─────────────────────────────────────

(
  'Boys & Girls Clubs of the Midlands — Council Bluffs & Carter Lake',
  'Boys & Girls Clubs of the Midlands',
  'https://www.bgcomaha.org',
  'Free teen membership at two Iowa-side clubs — Council Bluffs (815 N 16th St) and Carter Lake (4101 N 17th St). Programs include CareerLaunch career exploration (ages 13–18), Keystone Club leadership (ages 14–18), Diplomas 2 Degrees college readiness, Money Matters financial literacy, SMART Girls health program, and post-secondary scholarships for members.',
  'free_resource',
  'Youth ages 6–18 in Council Bluffs and Carter Lake, Iowa. Membership is FREE for teens. No income requirement.',
  null,
  'https://www.bgcomaha.org/programs/teen-programs.html',
  'Council Bluffs', 'Council Bluffs', 'IA',
  array['low_income', 'first_gen'],
  array['leadership', 'community_service', 'athletics', 'business'],
  array['9', '10', '11', '12'],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.bgcomaha.org/programs/teen-programs.html', 'official_website', '2026-02-23',
  true, false
),

(
  'Council Bluffs Public Library — Teen Volunteer Program',
  'Council Bluffs Public Library',
  'https://www.councilbluffslibrary.org',
  'Free teen volunteer program at the Council Bluffs Public Library (400 Willow Ave). Volunteers help run the Friends Bookstore, shelve books, deliver books to homebound patrons, and assist with programs and events. The library also provides free access to LinkedIn Learning, resume review via Brainfuse, and practice tests through Learning Express.',
  'free_resource',
  'Teens in the Council Bluffs area. No income requirement. Complete an online volunteer application — library staff will contact you if your interests match a current opening.',
  null,
  'https://www.councilbluffslibrary.org/volunteer',
  'Council Bluffs', 'Council Bluffs', 'IA',
  array['low_income', 'first_gen'],
  array['community_service', 'leadership'],
  array['9', '10', '11', '12'],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.councilbluffslibrary.org/volunteer', 'official_website', '2026-02-23',
  true, false
),

-- ── CB SUMMER PROGRAMS ────────────────────────────────────

(
  'Iowa Western Community College — Summer Youth Camps',
  'Iowa Western Community College',
  'https://www.iwcc.edu',
  'Hands-on summer camps for middle and high school students (grades 6–12) at Iowa Western''s Council Bluffs campus. Camps run June–July and cover welding, CAD design, construction, diesel mechanics, robotics/electronics, aerospace/flight, and agriculture. Students gain real skills in college-level facilities with IWCC instructors.',
  'summer_program',
  'Open to students in grades 6–12. No special eligibility requirements. Register online at iwcc.augusoft.net. Camp costs vary by program — contact IWCC for pricing and scholarships.',
  null,
  'https://iwcc.augusoft.net',
  'Council Bluffs', 'Council Bluffs', 'IA',
  array[]::text[],
  array['stem', 'trades', 'arts'],
  array['9', '10', '11', '12'],
  'paid', 'Varies by camp', null,
  'high', 'verified',
  'https://www.unleashcb.com/blog/iwcc_hosting_summer_camps_for_youth_learners', 'community_org', '2026-02-23',
  true, false
),

-- ══════════════════════════════════════════════════════════
-- OMAHA / NEBRASKA-SIDE — NEW CATEGORIES (5 opportunities)
-- ══════════════════════════════════════════════════════════

-- ── TRADES & APPRENTICESHIP ───────────────────────────────

(
  'OJEATC Electrical Apprenticeship Program',
  'Omaha Joint Electrical Apprenticeship Training Committee',
  'https://www.ojeatc.com',
  'Earn-while-you-learn electrical apprenticeship in partnership with IBEW Local 22. Three tracks available: Inside Wireman (commercial/industrial), Telecommunications, and Residential. The Construction Wireman entry-level track is a four-year program starting at $14/hr and progressing to $22/hr. No prior experience required — training provided.',
  'college_access',
  'Open to applicants 17 or older. Must apply through the OJEATC online portal. No prior electrical experience needed. Background check required.',
  null,
  'https://www.ojeatc.com/applications/',
  'Omaha', 'Omaha', 'NE',
  array['low_income', 'first_gen'],
  array['trades', 'stem'],
  array['12', 'college_freshman'],
  'paid', 'Starting $14/hr, rising to $22/hr+', 'hourly',
  'high', 'verified',
  'https://www.ojeatc.com', 'official_website', '2026-02-23',
  true, true
),

(
  'MCC Career Academy — Free Trades & Tech Training',
  'Metropolitan Community College',
  'https://www.mccneb.edu/getting-started/secondary-partnerships/career-academy',
  'Free college-level career training for Nebraska high school juniors and seniors. 20+ programs offered including Welding, HVAC, Electrical Technology, Construction, Diesel Technology, Advanced Manufacturing, Culinary Arts, Nursing Assistant, and Digital Technology. Students earn college credit before graduation — up to 54 credit hours in a two-year track. Tuition is waived for Nebraska high schoolers; students pay only for tools and materials.',
  'college_access',
  'Must be a high school junior or senior (at least 16 years old) at a Nebraska high school. Minimum 2.0 GPA preferred. Must have transportation to an MCC campus. Applications reviewed with acceptance letters sent in April.',
  null,
  'https://www.mccneb.edu/getting-started/secondary-partnerships/career-academy',
  'Omaha', 'Omaha', 'NE',
  array['low_income', 'first_gen'],
  array['trades', 'stem', 'health', 'arts', 'business'],
  array['11', '12'],
  'unpaid', 'Tuition waived; tools/materials fees apply', null,
  'high', 'verified',
  'https://www.mccneb.edu/getting-started/secondary-partnerships/career-academy', 'official_website', '2026-02-23',
  true, true
),

-- ── SUMMER PROGRAMS ───────────────────────────────────────

(
  'AIM Institute Youth in Tech — Summer Code Camp',
  'AIM Institute',
  'https://aiminstitute.org',
  'Free technology learning experiences for students ages 7–17 at the Brain Exchange (Omaha) and through partner schools — including Thomas Jefferson and Abraham Lincoln in Council Bluffs. Summer Code Camp offers hands-on coding, robotics, and career exploration. AIM serves low-income students specifically and connects participants to high-wage, high-demand tech career pathways.',
  'summer_program',
  'Open to students ages 7–17. Free of charge. Specifically designed to reach under-resourced youth. Apply through the AIM Institute website. Serves Omaha and Council Bluffs school communities.',
  null,
  'https://aiminstitute.org/programs/access-programs/youth-in-tech/',
  'Omaha', 'Omaha', 'NE',
  array['low_income', 'women_stem', 'first_gen'],
  array['stem'],
  array['9', '10', '11', '12'],
  'unpaid', null, null,
  'high', 'verified',
  'https://aiminstitute.org/programs/access-programs/youth-in-tech/', 'official_website', '2026-02-23',
  true, false
),

-- ── MENTORSHIP ────────────────────────────────────────────

(
  'Partnership 4 Kids — College & Career Mentoring',
  'Partnership 4 Kids',
  'https://p4k.org',
  'Year-round mentoring and postsecondary support for students in 16 Omaha Public Schools from elementary through high school. High school students explore career interests, build financial literacy, and access college readiness support. The organization provides last-dollar-in scholarships to help members complete post-secondary education debt-free. 90% of participants come from low-income households.',
  'mentorship',
  'Students enrolled at one of Partnership 4 Kids'' 16 partner Omaha Public Schools. Participation starts at the elementary level and continues through high school. Contact P4K directly at 402-930-3000 or mentor@p4k.org to learn about your school''s program.',
  null,
  'https://p4k.org',
  'Omaha', 'Omaha', 'NE',
  array['low_income', 'first_gen', 'black', 'hispanic'],
  array['leadership', 'business', 'community_service'],
  array['9', '10', '11', '12'],
  'unpaid', null, null,
  'high', 'verified',
  'https://p4k.org', 'official_website', '2026-02-23',
  true, false
),

-- ── FREE RESOURCES ────────────────────────────────────────

(
  'CIRA — Center for Immigrant & Refugee Advancement',
  'CIRA (Center for Immigrant and Refugee Advancement)',
  'https://ciraconnect.org',
  'Formerly the Refugee Empowerment Center (renamed 2024), CIRA provides free ESL classes at four proficiency levels, employment skills training, job placement support, cultural orientation, and youth peer mentorship for refugees and immigrants in Omaha. Interpreters are available for medical and government appointments. Services available in multiple languages.',
  'free_resource',
  'Refugees, immigrants, and their families living in the Omaha metro area. Youth and young adults specifically served. No income requirement — services are free.',
  null,
  'https://ciraconnect.org',
  'Omaha', 'Omaha', 'NE',
  array['immigrant', 'esl', 'low_income'],
  array['community_service', 'leadership'],
  array['9', '10', '11', '12', 'college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://ciraconnect.org/refugee-services/', 'official_website', '2026-02-23',
  true, false
);

-- ── Phase 2 Completion Report ──────────────────────────────
-- Total new listings inserted: 12
--
-- By geography:
--   Council Bluffs / Iowa-side: 7
--     - SWIEF Scholarships
--     - Iowa Western CC Scholarships
--     - Avenue Scholars Southwest Iowa
--     - IowaWORKS Council Bluffs
--     - Boys & Girls Clubs (CB & Carter Lake)
--     - Council Bluffs Public Library Teen Volunteers
--     - IWCC Summer Youth Camps
--   Omaha / Nebraska-side: 5
--     - OJEATC Electrical Apprenticeship
--     - MCC Career Academy
--     - AIM Institute Youth in Tech
--     - Partnership 4 Kids
--     - CIRA (Immigrant & Refugee Advancement)
--
-- By type:
--   scholarship:     2 (SWIEF, IWCC Scholarships)
--   college_access:  3 (Avenue Scholars SWI, OJEATC, MCC Career Academy)
--   free_resource:   4 (IowaWORKS CB, BGC CB/Carter Lake, CB Library, CIRA)
--   summer_program:  2 (IWCC Summer Camps, AIM Youth in Tech)
--   mentorship:      1 (Partnership 4 Kids)
--
-- Confidence: 12 high / 0 medium / 0 low
-- Needs confirmation: 0
--
-- Phase 1 cleanup (003): 2 expired entries deactivated
--   - Susan Thompson Buffett (deadline 2026-02-01)
--   - Hispanic Scholarship Fund (deadline 2026-02-15)
--
-- New featured entries: SWIEF, IWCC Scholarships, Avenue Scholars SWI,
--                       OJEATC Apprenticeship, MCC Career Academy
-- ============================================================
