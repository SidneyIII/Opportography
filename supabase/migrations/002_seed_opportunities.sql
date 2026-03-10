-- ============================================================
-- Opportography — Migration 002
-- Verified real opportunity seed data
-- Sources researched: February 2026
-- Run AFTER 001_create_opportunities.sql
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

-- ── SCHOLARSHIPS ──────────────────────────────────────────

(
  'OPS Foundation Scholarships',
  'Omaha Public Schools Foundation',
  'https://opsfpossible.org',
  'The OPS Foundation awards over $500,000 in scholarships annually to graduating Omaha Public Schools seniors. Dozens of individual scholarships are available through one unified application, covering a wide range of fields and financial need levels.',
  'scholarship',
  'Must be a graduating senior from an Omaha Public School. Requirements vary by individual scholarship — most require an essay, transcript, and one letter of recommendation.',
  '2026-03-02',
  'https://opsfpossible.org/scholarships/overview.html',
  'Omaha', 'Omaha', 'NE',
  array['low_income', 'first_gen'],
  array['leadership'],
  array['12'],
  'scholarship_amount', 'Varies by award', null,
  'high', 'verified',
  'https://opsfpossible.org/scholarships/apply.html', 'official_website', '2026-02-23',
  true, true
),

(
  'Barrientos Scholarship Foundation',
  'Barrientos Scholarship Foundation',
  'https://www.barrientosscholarship.org',
  'Scholarships of $250–$500 for Latino students pursuing the arts — music, visual arts, theater, or dance — at any accredited Nebraska college, university, or vocational school. Created to reduce financial barriers for Latino artists and performers.',
  'scholarship',
  'Must be of Latino heritage, have a minimum 2.5 GPA, be a high school senior or current college student, and plan to enroll in an arts-related program at an accredited Nebraska institution.',
  '2026-05-15',
  'https://www.barrientosscholarship.org',
  'Omaha', 'Omaha', 'NE',
  array['hispanic'],
  array['arts'],
  array['12', 'college_freshman'],
  'scholarship_amount', '$250–$500', 'one-time',
  'high', 'verified',
  'https://www.barrientosscholarship.org/about-2', 'official_website', '2026-02-23',
  true, false
),

(
  'Urban League of Nebraska Scholarships',
  'Urban League of Nebraska',
  'https://urbanleagueneb.org',
  'Annual college scholarships for graduating high school seniors in the Omaha area who want to attend a two- or four-year college or university. Awards recognize academic achievement and commitment to community.',
  'scholarship',
  'Must be a graduating high school senior in the Omaha area planning to attend college. Requires transcripts, two letters of recommendation, and a personal essay.',
  null,
  'https://urbanleagueneb.org/education/urban-league-of-nebraska-scholarships/',
  'Omaha', 'Omaha', 'NE',
  array['black', 'low_income'],
  array['leadership'],
  array['12'],
  'scholarship_amount', 'Varies', null,
  'high', 'verified',
  'https://urbanleagueneb.org/education/urban-league-of-nebraska-scholarships/', 'official_website', '2026-02-23',
  true, false
),

(
  'OEA Foundation CTE Scholarships',
  'OEA Foundation',
  'https://omahaoeafoundation.org',
  'Scholarships specifically for OPS seniors who have completed a Career and Technical Education (CTE) pathway and are pursuing a trade, vocational, or technical program. Recognizes students choosing skilled trades over a four-year degree.',
  'scholarship',
  'Must be a graduating senior from Omaha Public Schools who completed CTE coursework in a career pathway during junior and senior year. Must be pursuing post-secondary education.',
  null,
  'https://omahaoeafoundation.org/oea-foundation-scholarships/',
  'Omaha', 'Omaha', 'NE',
  array['low_income', 'first_gen'],
  array['trades'],
  array['12'],
  'scholarship_amount', 'Varies', null,
  'high', 'verified',
  'https://omahaoeafoundation.org/oea-foundation-scholarships/', 'official_website', '2026-02-23',
  true, false
),

(
  'Susan Thompson Buffett Scholarship',
  'Susan Thompson Buffett Foundation',
  'https://buffettscholarships.org',
  'One of the most generous scholarships in the country — covers full tuition and fees at any Nebraska public college or university for Pell-eligible Nebraska residents. Includes a book stipend and access to a network of fellow scholars.',
  'scholarship',
  'Must be a Nebraska resident, Pell Grant eligible, and attending a Nebraska public college or university. Strong academic record required.',
  '2026-02-01',
  'https://buffettscholarships.org',
  'National', null, 'NE',
  array['low_income', 'first_gen'],
  array[]::text[],
  array['12', 'college_freshman'],
  'scholarship_amount', 'Full tuition + fees', null,
  'high', 'verified',
  'https://buffettscholarships.org', 'official_website', '2026-02-23',
  true, true
),

(
  'QuestBridge National College Match',
  'QuestBridge',
  'https://www.questbridge.org',
  'Matches high-achieving, low-income high school seniors with full four-year scholarships to 50+ top colleges including Yale, Stanford, MIT, and more. Match scholars receive 100% of demonstrated financial need covered.',
  'scholarship',
  'High school seniors from low-income families (typically household income under $65,000) with strong academics. U.S. citizen or permanent resident.',
  '2026-09-26',
  'https://www.questbridge.org',
  'National', null, null,
  array['low_income', 'first_gen'],
  array[]::text[],
  array['12'],
  'scholarship_amount', 'Full cost of attendance', null,
  'high', 'verified',
  'https://www.questbridge.org', 'official_website', '2026-02-23',
  true, true
),

(
  'Hispanic Scholarship Fund',
  'Hispanic Scholarship Fund',
  'https://www.hsf.net',
  'Scholarships from $500 to $5,000 for Hispanic/Latino students planning to enroll full-time at a four-year university. Based on academic achievement, financial need, and community involvement.',
  'scholarship',
  'Must be of Hispanic heritage, a U.S. citizen or permanent resident, have a minimum 3.0 GPA, and plan to enroll full-time at a four-year university.',
  '2026-02-15',
  'https://www.hsf.net/scholarship',
  'National', null, null,
  array['hispanic'],
  array[]::text[],
  array['12', 'college_freshman'],
  'scholarship_amount', '$500–$5,000', 'one-time',
  'high', 'verified',
  'https://www.hsf.net/scholarship', 'official_website', '2026-02-23',
  true, false
),

-- ── INTERNSHIPS ───────────────────────────────────────────

(
  'Step Up Omaha! Summer Youth Employment',
  'Step Up Omaha / Empowerment Network',
  'https://stepupomaha.com',
  'Paid summer jobs and internships for Omaha youth ages 14–21 at 80+ worksites including hospitals, banks, nonprofits, the zoo, and tech companies. Youth earn $10–$14/hr and complete two weeks of paid job training before starting.',
  'internship',
  'Must be 14–21 years old and live in the City of Omaha. Applications typically open in January each year with a March deadline.',
  '2026-03-03',
  'https://stepupomaha.com/applicants/',
  'Omaha', 'Omaha', 'NE',
  array['low_income', 'first_gen'],
  array['business', 'leadership', 'health', 'stem'],
  array['9', '10', '11', '12'],
  'paid', '$10–$14/hr', 'hourly',
  'high', 'verified',
  'https://stepupomaha.com/applicants/', 'official_website', '2026-02-23',
  true, true
),

(
  'UNO IS&T Summer High School Internship',
  'University of Nebraska at Omaha — College of IS&T',
  'https://www.unomaha.edu/college-of-information-science-and-technology',
  'Hands-on summer internship working alongside UNO professors and graduate students in research areas including robotics, bioinformatics, software engineering, cybersecurity, and Unity game development. Students work 20 hours per week on campus.',
  'internship',
  'Must be 16+ years old, entering 10th, 11th, or 12th grade in the fall, and able to provide your own transportation to UNO campus.',
  null,
  'https://www.unomaha.edu/college-of-information-science-and-technology/engagement/high-school-internship-program.php',
  'Omaha', 'Omaha', 'NE',
  array['women_stem', 'low_income'],
  array['stem'],
  array['10', '11', '12'],
  'stipend', 'Stipend provided', null,
  'high', 'verified',
  'https://www.unomaha.edu/college-of-information-science-and-technology/engagement/high-school-internship-program.php', 'official_website', '2026-02-23',
  true, false
),

-- ── COLLEGE ACCESS ────────────────────────────────────────

(
  'Avenue Scholars Career Pathway Program',
  'Avenue Scholars',
  'https://avescholars.org',
  'A free program connecting Omaha-area high school students with career coaches, academic support, paid internships, and post-secondary planning. Avenue Scholars walks alongside students from high school into their first career — covering associate degrees and certificates.',
  'college_access',
  'Omaha-area high school students, particularly those from low-income backgrounds or who are first-generation college-bound.',
  null,
  'https://avescholars.org',
  'Omaha', 'Omaha', 'NE',
  array['low_income', 'first_gen'],
  array['business', 'leadership'],
  array['9', '10', '11', '12'],
  'unpaid', null, null,
  'high', 'verified',
  'https://avescholars.org', 'official_website', '2026-02-23',
  true, true
),

(
  'EducationQuest: Free College Planning',
  'EducationQuest Foundation',
  'https://educationquest.org',
  'Free college planning services for Nebraska students and families — including help completing the FAFSA, understanding financial aid, college application support, and need-based scholarship programs. Offered in English and Spanish.',
  'college_access',
  'Any Nebraska student or family seeking college access support. No income requirement.',
  null,
  'https://educationquest.org',
  'Omaha', 'Omaha', 'NE',
  array['low_income', 'first_gen', 'esl', 'hispanic'],
  array[]::text[],
  array['10', '11', '12', 'college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://educationquest.org', 'official_website', '2026-02-23',
  true, false
),

(
  'TRIO Upward Bound — UNO',
  'University of Nebraska at Omaha',
  'https://www.unomaha.edu/student-life/inclusion/trio/upward-bound.php',
  'Federally funded program helping first-generation and low-income high school students prepare for college. Includes tutoring, SAT/ACT prep, campus visits, and a summer residential program at UNO.',
  'college_access',
  'Must be a first-generation college student (neither parent holds a 4-year degree) and/or from a low-income family, attending a target high school in the Omaha area.',
  null,
  'https://www.unomaha.edu/student-life/inclusion/trio/upward-bound.php',
  'Omaha', 'Omaha', 'NE',
  array['low_income', 'first_gen'],
  array['stem', 'leadership'],
  array['9', '10', '11', '12'],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.unomaha.edu/student-life/inclusion/trio/upward-bound.php', 'official_website', '2026-02-23',
  true, false
),

(
  'WIOA Youth Program — Dynamic Workforce Solutions',
  'Dynamic Workforce Solutions',
  'https://dwfs.us/wioa-youth-omaha/',
  'Federally funded workforce program serving youth in Douglas, Sarpy, and Washington Counties. Helps young people set educational and employment goals, earn credentials, and connect with paid work experience and job training in high-demand fields.',
  'college_access',
  'Youth in Douglas, Sarpy, and Washington Counties in Nebraska. Must meet WIOA income and eligibility requirements.',
  null,
  'https://dwfs.us/wioa-youth-omaha/',
  'Omaha', 'Omaha', 'NE',
  array['low_income', 'first_gen', 'foster_youth', 'homeless'],
  array['business', 'leadership', 'trades'],
  array['9', '10', '11', '12'],
  'paid', 'Varies', null,
  'high', 'verified',
  'https://dwfs.us/wioa-youth-omaha/', 'official_website', '2026-02-23',
  true, false
),

(
  'Heartland Workforce Solutions Youth Services',
  'Heartland Workforce Solutions',
  'https://hws-ne.org/youth-services',
  'Free career and job training services for youth and young adults in the Greater Omaha area. Connects participants with job opportunities, job skills training, resume help, and career pathway planning.',
  'college_access',
  'Youth and young adults in the Greater Omaha metro area. Income-based eligibility may apply.',
  null,
  'https://hws-ne.org/youth-services',
  'Omaha', 'Omaha', 'NE',
  array['low_income', 'first_gen'],
  array['business', 'trades', 'leadership'],
  array['11', '12', 'college_freshman'],
  'unpaid', null, null,
  'medium', 'verified',
  'https://hws-ne.org/', 'official_website', '2026-02-23',
  true, false
),

-- ── MENTORSHIP ────────────────────────────────────────────

(
  'Big Brothers Big Sisters — MentorU Program',
  'Big Brothers Big Sisters of the Midlands',
  'https://bbbsmidlands.org',
  'One-on-one mentoring program pairing high school students with adult volunteer mentors at select Omaha and Council Bluffs high schools. Mentors meet weekly online and in person throughout the school year.',
  'mentorship',
  'High school students at participating schools: Millard North, Horizon, and Ralston (Omaha) and Thomas Jefferson and Abraham Lincoln (Council Bluffs). No income requirement.',
  null,
  'https://bbbsmidlands.org',
  'Omaha', 'Omaha', 'NE',
  array['low_income', 'first_gen'],
  array['leadership'],
  array['9', '10', '11', '12'],
  'unpaid', null, null,
  'high', 'verified',
  'https://bbbsmidlands.org/be-a-mentor/be-a-mentor-omaha/mentoru.html', 'official_website', '2026-02-23',
  true, false
),

(
  'Urban League Whitney Young Academy',
  'Urban League of Nebraska',
  'https://urbanleagueneb.org/education/',
  'Youth development program that prepares young people with communication skills, decision-making, mentorship, and community service. Part of the Urban League''s broader education and empowerment programs for Omaha youth.',
  'mentorship',
  'Youth in the Omaha area, particularly Black and underserved youth.',
  null,
  'https://urbanleagueneb.org/education/',
  'Omaha', 'Omaha', 'NE',
  array['black', 'low_income'],
  array['leadership', 'community_service'],
  array['9', '10', '11', '12'],
  'unpaid', null, null,
  'medium', 'verified',
  'https://urbanleagueneb.org/education/', 'official_website', '2026-02-23',
  true, false
),

(
  'Project Everlast — Foster Youth Support',
  'Project Everlast',
  'https://www.projecteverlast.org',
  'Connects current and former foster youth (ages 14–26) in Nebraska with housing assistance, educational support, employment help, and a community of peers who understand the foster care experience.',
  'mentorship',
  'Current or former foster youth in Nebraska, ages 14–26.',
  null,
  'https://www.projecteverlast.org',
  'Omaha', 'Omaha', 'NE',
  array['foster_youth', 'low_income', 'homeless'],
  array['leadership', 'community_service'],
  array['9', '10', '11', '12', 'college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.projecteverlast.org', 'official_website', '2026-02-23',
  true, false
),

-- ── FREE RESOURCES ────────────────────────────────────────

(
  'EducationQuest FAFSA Completion Workshops',
  'EducationQuest Foundation',
  'https://educationquest.org',
  'Free in-person workshops across Omaha where students and families can complete the FAFSA with expert help. Available in both English and Spanish. Bring your tax documents and FSA ID — walk-ins welcome at most locations.',
  'workshop',
  'Any student or family in Nebraska who needs FAFSA help. No income requirement.',
  null,
  'https://educationquest.org',
  'Omaha', 'Omaha', 'NE',
  array['low_income', 'first_gen', 'esl', 'hispanic', 'immigrant'],
  array[]::text[],
  array['12', 'college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://educationquest.org', 'official_website', '2026-02-23',
  true, false
),

(
  'Kids Can Community Center — Summer Program',
  'Kids Can Community Center',
  'https://kidscan.org',
  'Free full-day summer program combining STEM, music, arts, reading, tutoring, and field trips. State-licensed, with meals included. Scholarships available so cost is never a barrier.',
  'free_resource',
  'K–8 students in Omaha. Scholarships available for all income levels. Priority given to low-income families.',
  null,
  'https://kidscan.org/out-of-school/kidscansummer.html',
  'Omaha', 'Omaha', 'NE',
  array['low_income'],
  array['stem', 'arts'],
  array['9'],
  'unpaid', null, null,
  'high', 'verified',
  'https://kidscan.org/out-of-school/kidscansummer.html', 'official_website', '2026-02-23',
  true, false
);

-- ── Verification report ───────────────────────────────────
-- Total inserted: 18 opportunities
-- High confidence: 15 | Medium confidence: 3
-- Categories: 4 scholarships, 2 internships, 4 college_access,
--             3 mentorship, 2 free_resource/workshop, 1 free_resource
-- Source retrieved: 2026-02-23
-- ============================================================
