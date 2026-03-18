-- ============================================================
-- Opportography — Migration 060
-- Phase 14B: Paid Subject Tutoring (Elementary through College)
-- Date: 2026-03-17
--
-- 10 entries: Sylvan, Huntington, Club Z!, JLGworks,
-- Adroit (Council Bluffs), Wyzant, Varsity Tutors,
-- Care.com, Superprof, SchoolTutoring Academy
-- ============================================================

-- 1. Sylvan Learning Center — Omaha
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
  'Sylvan Learning Center — Omaha (K-12 & College Test Prep)',
  'Sylvan Learning',
  'https://www.sylvanlearning.com',
  'Personalized tutoring in math, reading, writing, and study skills for K-12 and college students. Test prep for SAT, ACT, and state assessments. Supports students with learning differences. Tutors selected for knowledge of local Omaha curriculum. Two Omaha locations.',
  'tutoring',
  'Paid. K-12 students through college. Two Omaha locations. Contact sylvanlearning.com for pricing.',
  NULL,
  'https://www.sylvanlearning.com',
  'Two locations in Omaha, NE', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{}', '{}', '{}',
  'high', 'needs_confirmation',
  'https://www.sylvanlearning.com', 'official_website', '2026-03-17',
  'By appointment. Check sylvanlearning.com for Omaha locations and hours.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "paid_tutoring", "subjects": ["math", "reading", "writing", "study_skills", "SAT_prep", "ACT_prep"], "delivery": "in_person", "cost_tier": "paid", "listing_type": "tutoring_center", "accessibility": {"cost_barrier": "paid", "requires_enrollment": true, "council_bluffs_accessible": false, "transit_accessible": false, "multilingual": false}}'::jsonb
);

-- 2. Huntington Learning Center — Omaha
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
  'Huntington Learning Center — Omaha (Certified Teachers, K-12)',
  'Huntington Learning Center',
  'https://www.huntingtonhelps.com',
  'Accredited tutoring and test prep using certified teachers. Partners with local Omaha schools. Data-driven individualized learning plans with high-dosage tutoring available. Covers reading, math, writing, and test prep for K-12 students.',
  'tutoring',
  'Paid. K-12 students. Omaha location. Contact huntingtonhelps.com for pricing and enrollment.',
  NULL,
  'https://www.huntingtonhelps.com',
  'Omaha, NE', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{}', '{}', '{}',
  'high', 'needs_confirmation',
  'https://www.huntingtonhelps.com', 'official_website', '2026-03-17',
  'By appointment. Contact huntingtonhelps.com for Omaha location details.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "paid_tutoring", "subjects": ["math", "reading", "writing", "test_prep"], "delivery": "in_person", "cost_tier": "paid", "listing_type": "tutoring_center", "accessibility": {"cost_barrier": "paid", "requires_enrollment": true, "council_bluffs_accessible": false, "transit_accessible": false, "multilingual": false}}'::jsonb
);

-- 3. Club Z! Tutoring — Omaha/Council Bluffs
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
  'Club Z! Tutoring — In-Home & Online (Pre-K through College)',
  'Club Z! Tutoring',
  'https://www.clubztutoring.com',
  'In-home and online tutoring in 300+ subjects including math, science, reading, writing, foreign languages, study skills, and test prep. Tutor travels to your home. Serves Omaha, Elkhorn, Gretna, Bellevue, Papillion, La Vista, Ralston, Bennington, and Council Bluffs. 98% satisfaction rate.',
  'tutoring',
  'Paid. Pre-K through college. Serves Omaha metro and Council Bluffs. Contact clubztutoring.com for pricing.',
  NULL,
  'https://www.clubztutoring.com',
  'Omaha metro and Council Bluffs (in-home)', NULL, 'Omaha', 'NE', NULL,
  false, true,
  '{}', '{}', '{}',
  'high', 'needs_confirmation',
  'https://www.clubztutoring.com', 'official_website', '2026-03-17',
  'Flexible scheduling. Tutor comes to your home or online. Contact clubztutoring.com/omaha.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "paid_tutoring", "subjects": ["math", "science", "reading", "writing", "foreign_languages", "test_prep"], "delivery": "hybrid", "cost_tier": "paid", "listing_type": "tutoring_service", "accessibility": {"cost_barrier": "paid", "requires_enrollment": false, "council_bluffs_accessible": true, "transit_accessible": true, "multilingual": false}}'::jsonb
);

-- 4. JLGworks — STEM Tutoring (Omaha metro)
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
  'JLGworks — Affordable 1:1 STEM Tutoring (Omaha Metro)',
  'JLGworks',
  'https://www.jlgworks.co',
  'STEM-focused tutoring company serving the Omaha metro. Affordable rates, no contracts, no group tutoring — all 1:1 individualized sessions. Tutor travels to you. Good option for families looking for a local, flexible, and affordable STEM tutor without long-term commitments.',
  'tutoring',
  'Paid (affordable rates). K-12. Omaha metro. No contracts required. Contact jlgworks.co for pricing.',
  NULL,
  'https://www.jlgworks.co',
  'Omaha metro (in-home)', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{}', '{stem}', '{}',
  'medium', 'needs_confirmation',
  'https://www.jlgworks.co', 'official_website', '2026-03-17',
  'Flexible scheduling. Tutor comes to your home. Contact jlgworks.co to schedule.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "paid_tutoring", "subjects": ["STEM", "math", "science"], "delivery": "in_person", "cost_tier": "moderate", "listing_type": "tutoring_service", "accessibility": {"cost_barrier": "moderate", "requires_enrollment": false, "council_bluffs_accessible": false, "transit_accessible": true, "multilingual": false}}'::jsonb
);

-- 5. Adroit Tutoring & Consulting — Council Bluffs
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
  'Adroit Tutoring & Consulting — Council Bluffs (K-12 & Adults)',
  'Adroit Tutoring & Consulting, LLC',
  'https://www.nextdoor.com',
  'One of the few tutoring businesses physically located in Council Bluffs. Offers 1:1 tutoring in reading, writing, math, science, and more for K-12 students and adults. Also provides test preparation, academic camps, resume and cover letter editing, and education and career support — making it unusually versatile for students who need academic and professional help together.',
  'tutoring',
  'Paid. K-12 students and adults. Council Bluffs location. Contact via Nextdoor (search "Adroit Tutoring Council Bluffs") for pricing.',
  NULL,
  'https://www.nextdoor.com',
  'Council Bluffs, IA', NULL, 'Council Bluffs', 'IA', NULL,
  false, false,
  '{}', '{}', '{}',
  'medium', 'needs_confirmation',
  'https://www.nextdoor.com', 'community_org', '2026-03-17',
  'By appointment. Contact via Nextdoor or local Council Bluffs listings.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "paid_tutoring", "subjects": ["reading", "writing", "math", "science", "test_prep", "resume_writing", "career_support"], "delivery": "in_person", "cost_tier": "paid", "listing_type": "tutoring_service", "accessibility": {"cost_barrier": "paid", "requires_enrollment": false, "council_bluffs_accessible": true, "transit_accessible": false, "multilingual": false}}'::jsonb
);

-- 6. Wyzant — Omaha/Council Bluffs
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
  'Wyzant — Local & Online Tutors (Omaha & Council Bluffs)',
  'Wyzant',
  'https://www.wyzant.com',
  'Online marketplace with 97+ tutors in Omaha and 60+ in Council Bluffs covering every subject and grade level — elementary through college — plus ACT, SAT, MCAT, GRE, LSAT, GMAT, and ASVAB prep. Tutors set their own rates, so pricing varies widely. First hour is protected by a satisfaction guarantee. Good option for finding affordable tutors at flexible price points, including graduate and professional exam prep.',
  'tutoring',
  'Paid (varies by tutor). All ages, all subjects. Omaha and Council Bluffs tutors available. First hour satisfaction guaranteed.',
  NULL,
  'https://www.wyzant.com',
  'Omaha metro and Council Bluffs (in-person + online)', NULL, 'Omaha', 'NE', NULL,
  false, true,
  '{}', '{}', '{}',
  'high', 'verified',
  'https://www.wyzant.com', 'official_website', '2026-03-17',
  'Flexible — tutor and student arrange schedule. Both in-person and online options.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "paid_tutoring", "subjects": ["all_subjects", "ACT_prep", "SAT_prep", "MCAT_prep", "GRE_prep", "LSAT_prep", "GMAT_prep", "ASVAB"], "delivery": "hybrid", "cost_tier": "paid", "listing_type": "platform", "accessibility": {"cost_barrier": "paid", "requires_enrollment": false, "council_bluffs_accessible": true, "transit_accessible": true, "multilingual": false}}'::jsonb
);

-- 7. Varsity Tutors — Omaha (K-College + Graduate Exams)
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
  'Varsity Tutors — Omaha (K-College, ACT/SAT, Graduate Exam Prep)',
  'Varsity Tutors',
  'https://www.varsitytutors.com',
  '1:1 private tutoring and group classes across all subjects K through college. Comprehensive test prep for ACT, SAT, GRE, GMAT, LSAT, and MCAT. Both in-person and online. Director-matched to student needs. New group classes start weekly. Instructors include professionals with credentials from Columbia Law, Boston University, Yale, and Rice.',
  'tutoring',
  'Paid. All ages, K through college. Graduate exam prep for LSAT, MCAT, GRE, GMAT. Contact varsitytutors.com for pricing.',
  NULL,
  'https://www.varsitytutors.com',
  'Omaha, NE (in-person + online)', NULL, 'Omaha', 'NE', NULL,
  false, true,
  '{}', '{}', '{}',
  'high', 'verified',
  'https://www.varsitytutors.com', 'official_website', '2026-03-17',
  'Flexible scheduling. New group classes start weekly. Both in-person and online options.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "paid_tutoring", "subjects": ["all_subjects", "ACT_prep", "SAT_prep", "LSAT_prep", "MCAT_prep", "GRE_prep", "GMAT_prep"], "delivery": "hybrid", "cost_tier": "paid", "listing_type": "platform", "accessibility": {"cost_barrier": "paid", "requires_enrollment": false, "council_bluffs_accessible": true, "transit_accessible": true, "multilingual": false}}'::jsonb
);

-- 8. Care.com Tutors — Omaha/Council Bluffs (Budget Option)
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
  'Care.com Tutors — Omaha & Council Bluffs (Budget-Friendly)',
  'Care.com',
  'https://www.care.com',
  '97 tutors in Omaha and 60 in Council Bluffs, averaging $15–20/hr — one of the more affordable tutor marketplaces in the metro. Many are college students from Creighton and UNO, making them a good fit for elementary and middle school subjects. All tutors are background-checked.',
  'tutoring',
  'Paid (avg $15–20/hr). All ages. Both Omaha and Council Bluffs tutors available. Background-checked tutors.',
  NULL,
  'https://www.care.com',
  'Omaha metro and Council Bluffs (in-person)', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{}', '{}', '{}',
  'high', 'verified',
  'https://www.care.com', 'official_website', '2026-03-17',
  'Flexible — tutor and student arrange schedule. Search care.com/tutors for Omaha/Council Bluffs.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "paid_tutoring", "subjects": ["homework_help", "math", "reading", "writing", "science"], "delivery": "in_person", "cost_tier": "moderate", "listing_type": "platform", "accessibility": {"cost_barrier": "moderate", "requires_enrollment": false, "council_bluffs_accessible": true, "transit_accessible": true, "multilingual": false}}'::jsonb
);

-- 9. Superprof — Omaha Area
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
  'Superprof — Omaha Area Tutors (First Lesson Often Free)',
  'Superprof',
  'https://www.superprof.com',
  '458 tutors across academic subjects, languages, music, and more in the greater Omaha area. Average rate approximately $24/hr. First lesson typically free. Covers Omaha, Council Bluffs, Bellevue, Papillion, Gretna, and surrounding areas. Broad subject coverage including academic subjects, music, and foreign languages.',
  'tutoring',
  'Paid (avg ~$24/hr, first lesson often free). All ages. Omaha, Council Bluffs, and surrounding areas.',
  NULL,
  'https://www.superprof.com',
  'Omaha metro and Council Bluffs (in-person + online)', NULL, 'Omaha', 'NE', NULL,
  false, true,
  '{}', '{}', '{}',
  'high', 'verified',
  'https://www.superprof.com', 'official_website', '2026-03-17',
  'Flexible scheduling. First lesson typically free. Search superprof.com/lessons/all-tutors/omaha.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "paid_tutoring", "subjects": ["all_subjects", "music", "foreign_languages", "math", "science"], "delivery": "hybrid", "cost_tier": "moderate", "listing_type": "platform", "accessibility": {"cost_barrier": "moderate", "requires_enrollment": false, "council_bluffs_accessible": true, "transit_accessible": true, "multilingual": true}}'::jsonb
);

-- 10. SchoolTutoring Academy — Council Bluffs & Omaha
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
  'SchoolTutoring Academy — Council Bluffs & Omaha (Free Assessment)',
  'SchoolTutoring Academy',
  'https://www.schooltutoring.com',
  'Starts with a free academic assessment. Covers Council Bluffs Community School District and Lewis Central Community Schools, as well as Omaha Public Schools. Offers Pre-K, elementary, and high school online tutoring. One of the few national tutoring providers that explicitly supports the Council Bluffs school districts.',
  'tutoring',
  'Paid. Pre-K through high school. Free academic assessment. Serves Council Bluffs (CBCSD and Lewis Central) and OPS.',
  NULL,
  'https://www.schooltutoring.com',
  'Online (serves Omaha and Council Bluffs school districts)', NULL, 'Council Bluffs', 'IA', NULL,
  true, false,
  '{}', '{}', '{}',
  'high', 'needs_confirmation',
  'https://www.schooltutoring.com', 'official_website', '2026-03-17',
  'Online tutoring with flexible scheduling. Starts with free assessment. Check schooltutoring.com for pricing.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "paid_tutoring", "subjects": ["math", "reading", "writing", "science", "all_subjects"], "delivery": "online", "cost_tier": "paid", "listing_type": "tutoring_center", "accessibility": {"cost_barrier": "paid", "requires_enrollment": true, "council_bluffs_accessible": true, "transit_accessible": true, "multilingual": false}}'::jsonb
);
