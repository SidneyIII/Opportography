-- ============================================================
-- Opportography — Migration 059
-- Phase 14A: Free & Low-Barrier Tutoring and Homework Help
-- Date: 2026-03-17
--
-- 17 entries: OPL Tutor.com, BrainFuse, Boys & Girls Clubs,
-- Hope Center, Girls Inc, Khan Academy, Schoolhouse.world,
-- UPchieve, Nebraska SMART, IWCC, UNO MSLC, UNO CBA,
-- MCC, Nebraska Methodist, Learning for ALL,
-- CB Public Library, Children & Families of Iowa
-- Free resources listed first per equity mission.
-- ============================================================

-- 1. Omaha Public Library — Tutor.com
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
) VALUES (
  'Omaha Public Library — Tutor.com (Free Live Online Tutoring)',
  'Omaha Public Library / Tutor.com',
  'https://omahalibrary.org',
  'Free live online tutoring available 9am–9pm daily with a free OPL library card. Covers K-12 subjects, writing review, math support, and ACT/SAT/AP test prep. Students can also submit papers and math questions asynchronously for written feedback anytime. LearningExpress Library included — full-length practice tests, tutorials, and college and career prep resources. One of the highest-impact free academic resources in the metro.',
  'tutoring',
  'Free with an Omaha Public Library card. Library cards are free and available to all Omaha/Douglas County residents. K-12 students and adult learners.',
  NULL,
  'https://omahalibrary.org',
  'Online (OPL library card required)', NULL, 'Omaha', 'NE', NULL,
  true, false,
  '{low_income,first_gen}', '{}', '{}',
  'high', 'verified',
  'https://omahalibrary.org', 'official_website', '2026-03-17',
  'Available daily 9am–9pm for live tutoring. Asynchronous paper and math drop-box available 24/7.',
  true, true, '2026-03-17', '2026-03-17',
  '{"subcategory": "free_tutoring", "subjects": ["math", "reading", "writing", "science", "ACT_prep", "SAT_prep", "AP_prep"], "delivery": "online", "cost_tier": "free", "listing_type": "library_service", "accessibility": {"cost_barrier": "free", "requires_enrollment": false, "council_bluffs_accessible": true, "transit_accessible": true, "multilingual": false}}'::jsonb
);

-- 2. BrainFuse HelpNow (Iowa State Library — Council Bluffs)
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
) VALUES (
  'BrainFuse HelpNow — Free Online Tutoring for Iowa Residents',
  'BrainFuse / State Library of Iowa',
  'https://www.statelibraryofiowa.gov',
  'Free live online tutoring available daily 2–11pm through the State Library of Iowa. Covers all K-12 subjects plus writing help and career resources. Available in multiple languages — especially relevant for multilingual families in Council Bluffs. No account required for many features. Every student in Council Bluffs has access through their Iowa residency. Also includes writing lab (essay review within 24 hours), skills building modules, and adult learning resources.',
  'tutoring',
  'Free for all Iowa residents, including Council Bluffs students. K-12 students and adult learners. No library card required.',
  NULL,
  'https://www.statelibraryofiowa.gov',
  'Online (Iowa residents)', NULL, 'Council Bluffs', 'IA', NULL,
  true, false,
  '{low_income,esl,immigrant}', '{}', '{}',
  'high', 'verified',
  'https://www.statelibraryofiowa.gov', 'official_website', '2026-03-17',
  'Live tutoring daily 2–11pm. Writing lab and skills modules available 24/7.',
  true, true, '2026-03-17', '2026-03-17',
  '{"subcategory": "free_tutoring", "subjects": ["math", "reading", "writing", "science", "career_resources"], "delivery": "online", "cost_tier": "free", "listing_type": "library_service", "accessibility": {"cost_barrier": "free", "requires_enrollment": false, "council_bluffs_accessible": true, "transit_accessible": true, "multilingual": true}}'::jsonb
);

-- 3. Boys & Girls Clubs of the Midlands — Power Hour
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
) VALUES (
  'Boys & Girls Clubs of the Midlands — Power Hour Homework Help',
  'Boys & Girls Clubs of the Midlands',
  'https://bgcomaha.org',
  'Structured after-school homework help program at 13 locations across the metro, including Council Bluffs (815 N 16th St), South Omaha, North Omaha, Florence, and Millard. Members receive dedicated homework space, access to technology, nutritious evening meals, and leadership/career development programs. CareerLaunch for ages 13–18 provides career exploration and job readiness. Free membership at select locations; otherwise $30/year. Serves over 7,000 youth across the metro annually.',
  'tutoring',
  'Ages 6–18. Free at select locations; annual membership $30 at others. Open enrollment — contact local club for availability.',
  NULL,
  'https://bgcomaha.org',
  '13 metro locations including 815 N 16th St, Council Bluffs, IA', '815 N 16th St', 'Council Bluffs', 'IA', '51503',
  false, false,
  '{low_income,first_gen}', '{}', '{}',
  'high', 'verified',
  'https://bgcomaha.org', 'official_website', '2026-03-17',
  'After-school, weekdays. Hours vary by location. Contact bgcomaha.org or (402) 345-2850 for specific club hours.',
  true, true, '2026-03-17', '2026-03-17',
  '{"subcategory": "free_tutoring", "subjects": ["homework_help", "all_subjects", "career_readiness"], "delivery": "in_person", "cost_tier": "free", "listing_type": "program", "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": true, "transit_accessible": true, "multilingual": false}}'::jsonb
);

-- 4. The Hope Center for Kids
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
) VALUES (
  'Hope Center for Kids — Academic Support, ACT/SAT Prep & College Prep',
  'The Hope Center for Kids',
  'https://hopecenterforkids.com',
  'After-school and summer program in North Omaha providing comprehensive academic support for K-12 youth: homework help, ACT/SAT preparation, college visit opportunities, and scholarship research assistance. Students receive a hot meal every weeknight. The Employment and Learning Academy provides $50 weekly stipends for teen participants who complete community service hours — those teens also earn eligibility for in- and out-of-state college visits. Serves over 2,700 youth annually. One of the most equity-critical resources in the Omaha metro.',
  'tutoring',
  'Free. Ages 5–19, K-12. Primarily serves North Omaha youth. Contact hopecenterforkids.com to enroll.',
  NULL,
  'https://hopecenterforkids.com',
  '2200 N 20th St, Omaha, NE', '2200 N 20th St', 'Omaha', 'NE', '68110',
  false, false,
  '{low_income,first_gen,black}', '{}', '{}',
  'high', 'verified',
  'https://hopecenterforkids.com', 'official_website', '2026-03-17',
  'After-school weekdays plus summer programming. Hot meal provided weekday evenings.',
  true, true, '2026-03-17', '2026-03-17',
  '{"subcategory": "free_tutoring", "subjects": ["homework_help", "ACT_prep", "SAT_prep", "college_prep", "scholarship_research"], "delivery": "in_person", "cost_tier": "free", "listing_type": "program", "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": false, "transit_accessible": true, "multilingual": false}}'::jsonb
);

-- 5. Girls Inc. of Omaha
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
) VALUES (
  'Girls Inc. of Omaha — Free Tutoring, STEM & College Prep',
  'Girls Inc. of Omaha',
  'https://girlsincomaha.org',
  'Two centers in North Omaha and South Omaha offering free education programs for girls: homework help, tutoring, literacy programming, STEM (coding, robotics, aquaponics), and college/career prep. Provides free transportation from 40+ local schools, counseling services, and healthy meals and snacks. Volunteer literacy tutoring sessions available weekly (5–6pm). Served 818 girls in 2023. Art rooms, computer labs, library, woodshop, and sports field at each center.',
  'tutoring',
  'Free. Girls ages 5–18. Two Omaha locations: North Omaha and South Omaha. Free transportation provided from 40+ schools.',
  NULL,
  'https://girlsincomaha.org',
  'North Omaha & South Omaha centers', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen,women_stem}', '{stem}', '{}',
  'high', 'verified',
  'https://girlsincomaha.org', 'official_website', '2026-03-17',
  'After-school weekdays. Volunteer tutoring sessions Wednesdays 5–6pm. Transportation from 40+ schools.',
  true, true, '2026-03-17', '2026-03-17',
  '{"subcategory": "free_tutoring", "subjects": ["homework_help", "literacy", "STEM", "coding", "robotics", "college_prep"], "delivery": "in_person", "cost_tier": "free", "listing_type": "program", "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": false, "transit_accessible": true, "multilingual": false}}'::jsonb
);

-- 6. Khan Academy
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
) VALUES (
  'Khan Academy — Free Self-Paced Learning & Official SAT Prep',
  'Khan Academy',
  'https://khanacademy.org',
  'Completely free self-paced learning platform covering every subject from elementary math through AP courses and college-level material. The official Digital SAT prep partner of College Board — the gold standard for free SAT prep, including full-length adaptive practice tests, personalized learning dashboards, and skill-specific review. No account required to start browsing. Covers math, science, reading, writing, history, economics, and AP courses for every subject. Used by millions of students globally.',
  'tutoring',
  'Free for all ages. No account required for most content. Create a free account for personalized tracking and SAT practice.',
  NULL,
  'https://khanacademy.org',
  'Online', NULL, NULL, NULL, NULL,
  true, false,
  '{low_income,first_gen}', '{stem}', '{}',
  'high', 'verified',
  'https://khanacademy.org', 'official_website', '2026-03-17',
  'Self-paced, available 24/7. Digital SAT prep at khanacademy.org/digital-sat.',
  true, true, '2026-03-17', '2026-03-17',
  '{"subcategory": "free_tutoring", "subjects": ["math", "science", "reading", "writing", "AP_prep", "SAT_prep", "history", "economics"], "delivery": "online", "cost_tier": "free", "listing_type": "platform", "accessibility": {"cost_barrier": "free", "requires_enrollment": false, "council_bluffs_accessible": true, "transit_accessible": true, "multilingual": true}}'::jsonb
);

-- 7. Schoolhouse.world
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
) VALUES (
  'Schoolhouse.world — Free SAT Bootcamps & Peer Tutoring',
  'Schoolhouse.world',
  'https://schoolhouse.world',
  'Free peer-to-peer tutoring platform founded by Sal Khan (Khan Academy). Offers live small-group SAT Bootcamps on rolling 4-week cycles — tutors have scored in the top 5% on the SAT. Students report score jumps of 100–240+ points. Also covers SAT Skill Builders, AP preparation, college admissions mentorship, essay workshops, and financial aid workshops. Has served over 170,000 students globally. Partnered with College Board for official SAT prep materials.',
  'tutoring',
  'Free. Ages 13+, high school students. SAT Bootcamps available on rolling 4-week cycles — register at schoolhouse.world.',
  NULL,
  'https://schoolhouse.world',
  'Online', NULL, NULL, NULL, NULL,
  true, false,
  '{low_income,first_gen}', '{}', '{}',
  'high', 'verified',
  'https://schoolhouse.world', 'official_website', '2026-03-17',
  'SAT Bootcamps run on rolling 4-week cycles. Sessions over Zoom. Small group format.',
  true, true, '2026-03-17', '2026-03-17',
  '{"subcategory": "free_tutoring", "subjects": ["SAT_prep", "AP_prep", "college_admissions", "financial_aid"], "delivery": "online", "cost_tier": "free", "listing_type": "platform", "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": true, "transit_accessible": true, "multilingual": false}}'::jsonb
);

-- 8. UPchieve
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
) VALUES (
  'UPchieve — Free On-Demand 1:1 Online Tutoring & College Counseling',
  'UPchieve',
  'https://upchieve.org',
  'Free on-demand 1:1 online tutoring in math, science, reading, writing, SAT prep, and college counseling. No appointments needed — connect with a trained volunteer tutor immediately. Specifically designed to reach low-income high school students. Also offers college essay review, college application help, and financial aid guidance. Mission-driven: aims to serve 8 million low-income high school students in the U.S. by 2030.',
  'tutoring',
  'Free. High school students, focused on low-income students. No appointment needed — connect immediately at upchieve.org.',
  NULL,
  'https://upchieve.org',
  'Online', NULL, NULL, NULL, NULL,
  true, false,
  '{low_income,first_gen}', '{}', '{}',
  'high', 'verified',
  'https://upchieve.org', 'official_website', '2026-03-17',
  'On-demand, available 24/7. Connect with a tutor immediately — no scheduling required.',
  true, true, '2026-03-17', '2026-03-17',
  '{"subcategory": "free_tutoring", "subjects": ["math", "science", "reading", "writing", "SAT_prep", "college_counseling", "financial_aid"], "delivery": "online", "cost_tier": "free", "listing_type": "platform", "accessibility": {"cost_barrier": "free", "requires_enrollment": false, "council_bluffs_accessible": true, "transit_accessible": true, "multilingual": false}}'::jsonb
);

-- 9. Nebraska SMART Program
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
) VALUES (
  'Nebraska SMART Program — Free Virtual Tutoring (All Nebraska K-12 Students)',
  'Nebraska State College System',
  'https://www.nscs.edu',
  'Free virtual tutoring program through the Nebraska State College System, connecting K-12 students with pre-service teachers studying education at Peru State College, Chadron State, and Wayne State. Available to all Nebraska K-12 students — public, private, and homeschooled — regardless of location. Students get support from education majors who are learning to teach while providing real tutoring.',
  'tutoring',
  'Free. All K-12 students in Nebraska — public school, private school, and homeschool. Contact the Nebraska State College System for access.',
  NULL,
  'https://www.nscs.edu',
  'Online (statewide Nebraska)', NULL, NULL, 'NE', NULL,
  true, false,
  '{low_income,first_gen,rural}', '{}', '{}',
  'medium', 'needs_confirmation',
  'https://www.nscs.edu', 'official_website', '2026-03-17',
  'Virtual tutoring. Contact Nebraska State College System for scheduling and access.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "free_tutoring", "subjects": ["homework_help", "all_subjects"], "delivery": "online", "cost_tier": "free", "listing_type": "program", "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": false, "transit_accessible": true, "multilingual": false}}'::jsonb
);

-- 10. Iowa Western Community College Tutoring Center
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
) VALUES (
  'Iowa Western Community College — Free Tutoring Center',
  'Iowa Western Community College',
  'https://www.iwcc.edu/students',
  'Free academic support for enrolled IWCC students at the Council Bluffs campus: tutoring in core academic subjects, writing center services, and academic accommodation support. The tutoring center is a built-in resource for any student enrolled at IWCC — one of the most accessible college pathways in the Council Bluffs area.',
  'tutoring',
  'Free for enrolled IWCC students. College-level courses. Located at the Council Bluffs campus.',
  NULL,
  'https://www.iwcc.edu/students',
  'Iowa Western Community College, 2700 College Rd, Council Bluffs, IA', '2700 College Rd', 'Council Bluffs', 'IA', '51503',
  false, false,
  '{low_income,first_gen}', '{}', '{}',
  'high', 'needs_confirmation',
  'https://www.iwcc.edu/students', 'official_website', '2026-03-17',
  'Weekday hours during academic year. Check iwcc.edu/students for current tutoring center schedule.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "free_tutoring", "subjects": ["math", "writing", "science", "all_subjects"], "delivery": "in_person", "cost_tier": "free", "listing_type": "tutoring_center", "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": true, "transit_accessible": false, "multilingual": false}}'::jsonb
);

-- 11. UNO Math-Science Learning Center
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
) VALUES (
  'UNO Math-Science Learning Center — Free STEM Tutoring',
  'University of Nebraska Omaha',
  'https://www.unomaha.edu/college-of-arts-and-sciences/math-science-learning-center',
  'Free peer tutoring in math, science, statistics, chemistry, physics, biology, astronomy, geology, and engineering for UNO students. Peer tutors are recommended by professors and trained in mentorship. Includes study spaces, computers, and reserve study materials. Drop-in and scheduled sessions available.',
  'tutoring',
  'Free for enrolled UNO students. College-level STEM courses. Located on UNO campus.',
  NULL,
  'https://www.unomaha.edu/college-of-arts-and-sciences/math-science-learning-center',
  'UNO Campus, Omaha, NE', NULL, 'Omaha', 'NE', '68182',
  false, false,
  '{low_income,first_gen}', '{stem}', '{}',
  'high', 'needs_confirmation',
  'https://www.unomaha.edu/college-of-arts-and-sciences/math-science-learning-center', 'official_website', '2026-03-17',
  'Weekday hours during academic year. Drop-in and scheduled appointments. Check UNO website for current hours.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "free_tutoring", "subjects": ["math", "science", "statistics", "chemistry", "physics", "biology", "astronomy", "geology", "engineering"], "delivery": "in_person", "cost_tier": "free", "listing_type": "tutoring_center", "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": false, "transit_accessible": true, "multilingual": false}}'::jsonb
);

-- 12. UNO College of Business Administration Tutoring Labs
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
) VALUES (
  'UNO College of Business — Free Tutoring Labs (Accounting, Finance, Stats)',
  'University of Nebraska Omaha, College of Business Administration',
  'https://www.unomaha.edu/college-of-business-administration/academics/tutoring',
  'Free tutoring in accounting, economics, finance, math (including MATH 1370), and statistics for UNO students. Available in-person at Mammel Hall and over Zoom. Drop-in hours and scheduled appointments Monday–Friday.',
  'tutoring',
  'Free for enrolled UNO students. College-level business, math, and economics courses.',
  NULL,
  'https://www.unomaha.edu/college-of-business-administration/academics/tutoring',
  'Mammel Hall, UNO Campus, Omaha, NE', NULL, 'Omaha', 'NE', '68182',
  false, true,
  '{low_income,first_gen}', '{business}', '{}',
  'high', 'needs_confirmation',
  'https://www.unomaha.edu/college-of-business-administration/academics/tutoring', 'official_website', '2026-03-17',
  'Monday–Friday, drop-in and scheduled appointments. In-person at Mammel Hall and Zoom.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "free_tutoring", "subjects": ["accounting", "economics", "finance", "math", "statistics"], "delivery": "hybrid", "cost_tier": "free", "listing_type": "tutoring_center", "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": false, "transit_accessible": true, "multilingual": false}}'::jsonb
);

-- 13. Metropolitan Community College Learning & Tutoring Center
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
) VALUES (
  'Metropolitan Community College — Free Learning & Tutoring Center',
  'Metropolitan Community College',
  'https://www.mccneb.edu/student-resources/academic-support-and-tutoring',
  'Free academic assistance across all subjects for enrolled MCC students. Staff includes specialists in reading, writing, math, ESL, and subject-specific support. Bilingual staff available in Spanish. Multiple campus locations across the Omaha metro. Particularly valuable for first-generation and ESL students navigating college-level coursework.',
  'tutoring',
  'Free for enrolled MCC students. All subjects. Bilingual Spanish support available.',
  NULL,
  'https://www.mccneb.edu/student-resources/academic-support-and-tutoring',
  'Multiple MCC campus locations, Omaha metro', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen,esl,immigrant,hispanic}', '{}', '{}',
  'high', 'needs_confirmation',
  'https://www.mccneb.edu/student-resources/academic-support-and-tutoring', 'official_website', '2026-03-17',
  'Weekday hours at multiple campus locations. Check mccneb.edu for current schedule and locations.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "free_tutoring", "subjects": ["math", "reading", "writing", "ESL", "science", "all_subjects"], "delivery": "in_person", "cost_tier": "free", "listing_type": "tutoring_center", "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": false, "transit_accessible": true, "multilingual": true}}'::jsonb
);

-- 14. Nebraska Methodist College Tutoring
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
) VALUES (
  'Nebraska Methodist College — Free Online & Peer Tutoring',
  'Nebraska Methodist College',
  'https://www.methodistcollege.edu',
  'Free online tutoring through NetTutor and free peer tutoring for all enrolled Nebraska Methodist College students. Particularly relevant for students pursuing nursing, healthcare, and allied health careers. Peer tutors recommended by faculty.',
  'tutoring',
  'Free for enrolled NMC students. All subjects, with strength in nursing and healthcare coursework.',
  NULL,
  'https://www.methodistcollege.edu',
  'Nebraska Methodist College, Omaha, NE', NULL, 'Omaha', 'NE', '68114',
  false, true,
  '{low_income,first_gen}', '{health}', '{}',
  'medium', 'needs_confirmation',
  'https://www.methodistcollege.edu', 'official_website', '2026-03-17',
  'Online tutoring via NetTutor available 24/7. Peer tutoring by appointment during academic year.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "free_tutoring", "subjects": ["nursing", "healthcare", "science", "math", "writing"], "delivery": "hybrid", "cost_tier": "free", "listing_type": "tutoring_center", "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": false, "transit_accessible": false, "multilingual": false}}'::jsonb
);

-- 15. Learning for ALL — Omaha (Adult ESL/GED)
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
) VALUES (
  'Learning for ALL — Free Adult ESL, GED & Literacy Classes',
  'Learning for ALL Omaha',
  'https://www.lfa-omaha.org',
  'Free classes and tutoring in English as a Second Language (ESL), Adult Basic Education, and GED preparation for adults in the Omaha community. Serves adults who need literacy and language skills to advance their education, careers, and daily lives. Critical resource for immigrant and refugee families in the metro.',
  'tutoring',
  'Free. Adults (18+). No prior education level required. ESL, GED, and basic literacy.',
  NULL,
  'https://www.lfa-omaha.org',
  'Omaha, NE (check lfa-omaha.org for current locations)', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,esl,immigrant}', '{}', '{}',
  'medium', 'needs_confirmation',
  'https://www.lfa-omaha.org', 'official_website', '2026-03-17',
  'Classes offered throughout the year. Contact lfa-omaha.org for schedule and enrollment.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "free_tutoring", "subjects": ["ESL", "GED", "literacy", "adult_basic_education"], "delivery": "in_person", "cost_tier": "free", "listing_type": "program", "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": false, "transit_accessible": true, "multilingual": true}}'::jsonb
);

-- 16. Council Bluffs Public Library Homework Help Center
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
) VALUES (
  'Council Bluffs Public Library — Free Homework Help Center',
  'Council Bluffs Public Library',
  'https://www.councilbluffslibrary.org',
  'Free tutoring and homework help services for K-12 students through the Council Bluffs Public Library. One of the most accessible free academic support resources for students on the Iowa side of the metro who may not have transportation to Omaha-based programs.',
  'tutoring',
  'Free. K-12 students. Council Bluffs library card may be required for some services.',
  NULL,
  'https://www.councilbluffslibrary.org',
  '400 Willow Ave, Council Bluffs, IA', '400 Willow Ave', 'Council Bluffs', 'IA', '51503',
  false, false,
  '{low_income,first_gen}', '{}', '{}',
  'medium', 'needs_confirmation',
  'https://www.councilbluffslibrary.org', 'official_website', '2026-03-17',
  'Check councilbluffslibrary.org for current homework help hours and schedule.',
  true, true, '2026-03-17', '2026-03-17',
  '{"subcategory": "free_tutoring", "subjects": ["homework_help", "all_subjects"], "delivery": "in_person", "cost_tier": "free", "listing_type": "library_service", "accessibility": {"cost_barrier": "free", "requires_enrollment": false, "council_bluffs_accessible": true, "transit_accessible": true, "multilingual": false}}'::jsonb
);

-- 17. Children & Families of Iowa — Childcare & Tutoring Services
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
) VALUES (
  'Children & Families of Iowa — Low-Cost Tutoring for Working Families',
  'Children & Families of Iowa',
  'https://www.cfiowa.org',
  'Affordable childcare and tutoring services for low-income working families in the Iowa area, including Council Bluffs. Designed specifically for families who need academic support options that fit limited budgets and working parent schedules.',
  'tutoring',
  'Low-cost. Low-income working families in Iowa including Council Bluffs. Contact cfiowa.org for eligibility and enrollment.',
  NULL,
  'https://www.cfiowa.org',
  'Council Bluffs, IA (and broader Iowa area)', NULL, 'Council Bluffs', 'IA', NULL,
  false, false,
  '{low_income}', '{}', '{}',
  'medium', 'needs_confirmation',
  'https://www.cfiowa.org', 'official_website', '2026-03-17',
  'Contact cfiowa.org for current program availability and scheduling.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "free_tutoring", "subjects": ["homework_help", "all_subjects"], "delivery": "in_person", "cost_tier": "low_cost", "listing_type": "program", "accessibility": {"cost_barrier": "low_cost", "requires_enrollment": true, "council_bluffs_accessible": true, "transit_accessible": false, "multilingual": false}}'::jsonb
);
