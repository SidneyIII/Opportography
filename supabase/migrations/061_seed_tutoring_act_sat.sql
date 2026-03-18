-- ============================================================
-- Opportography — Migration 061
-- Phase 14C: ACT & SAT Test Prep
-- Date: 2026-03-17
--
-- Note: Khan Academy, Schoolhouse.world, UPchieve, OPL Tutor.com,
-- and Hope Center for Kids (already seeded in migration 059)
-- all cover ACT/SAT prep and are tagged accordingly.
-- This migration adds the remaining ACT/SAT-specific providers:
-- 6 entries: 3MT, Aim High, OnToCollege, Kaplan,
-- Princeton Review, Manhattan Review
-- Free options are listed first per equity mission.
-- ============================================================

-- 1. 3MT (Three Moms and a Test) — Local Omaha ACT Prep
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
  '3MT (Three Moms and a Test) — Omaha ACT Prep',
  'Three Moms and a Test (3MT)',
  'https://www.go3mt.com',
  'Omaha''s local ACT prep leader. Three-session course format designed to be affordable and accessible to every student. Strong local testimonials including 4+ point score jumps. Omaha-based, Omaha-focused — built by local educators for local students. A more affordable alternative to national ACT prep providers.',
  'tutoring',
  'Paid (affordable — contact go3mt.com for pricing). High school students. Omaha area. Call (402) 334-0912.',
  NULL,
  'https://www.go3mt.com',
  'Omaha, NE', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{}', '{}', '{}',
  'high', 'needs_confirmation',
  'https://www.go3mt.com', 'official_website', '2026-03-17',
  'Three-session course format. Check go3mt.com for current schedule and session dates.',
  true, true, '2026-03-17', '2026-03-17',
  '{"subcategory": "act_sat_prep", "subjects": ["ACT_prep"], "delivery": "in_person", "cost_tier": "moderate", "listing_type": "tutoring_center", "accessibility": {"cost_barrier": "moderate", "requires_enrollment": true, "council_bluffs_accessible": true, "transit_accessible": false, "multilingual": false}}'::jsonb
);

-- 2. Aim High Test Prep — ACT Prep (Omaha + Online)
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
  'Aim High Test Prep — ACT Prep Seminars (Omaha + Online)',
  'Aim High Test Prep',
  'https://www.aimhightestprep.com',
  'ACT prep seminars held at College of St. Mary''s (7000 Mercy Rd, Omaha) and simulcast live online via Google Meet. All sessions recorded for replay — students can review missed sessions. Students can switch between in-person and online as needed. Teaches both content and testing strategies. A practical local option with flexibility for busy high school schedules.',
  'tutoring',
  'Paid. High school students. In-person at College of St. Mary''s or live online. All sessions recorded.',
  NULL,
  'https://www.aimhightestprep.com',
  '7000 Mercy Rd, Omaha, NE (+ online)', '7000 Mercy Rd', 'Omaha', 'NE', '68106',
  false, true,
  '{}', '{}', '{}',
  'high', 'needs_confirmation',
  'https://www.aimhightestprep.com', 'official_website', '2026-03-17',
  'Seminars run seasonally. Check aimhightestprep.com for schedule. Sessions simulcast and recorded.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "act_sat_prep", "subjects": ["ACT_prep"], "delivery": "hybrid", "cost_tier": "paid", "listing_type": "tutoring_center", "accessibility": {"cost_barrier": "paid", "requires_enrollment": true, "council_bluffs_accessible": true, "transit_accessible": false, "multilingual": false}}'::jsonb
);

-- 3. OnToCollege — ACT & SAT Prep (Omaha + Online)
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
  'OnToCollege — ACT & SAT Prep Classes (Omaha, In-Person + Online)',
  'OnToCollege',
  'https://www.ontocollege.com',
  'In-person ACT and SAT prep classes in Omaha and Lincoln with certified instructors ($399). All sessions recorded and posted online for replay. 7-day free trial available. Also offers school-wide programs. Notes that UNL prefers ACT/SAT scores for scholarship consideration. Serves Nebraska, Iowa, Kansas, Missouri, and 22 other states. A strong regional option with a free trial before committing.',
  'tutoring',
  'Paid ($399). High school students. Omaha in-person or online. 7-day free trial available. Check ontocollege.com.',
  NULL,
  'https://www.ontocollege.com',
  'Omaha, NE (+ online)', NULL, 'Omaha', 'NE', NULL,
  false, true,
  '{}', '{}', '{}',
  'high', 'needs_confirmation',
  'https://www.ontocollege.com', 'official_website', '2026-03-17',
  'Classes run seasonally. All sessions recorded. 7-day free trial available. Check ontocollege.com for schedule.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "act_sat_prep", "subjects": ["ACT_prep", "SAT_prep"], "delivery": "hybrid", "cost_tier": "paid", "listing_type": "tutoring_center", "accessibility": {"cost_barrier": "paid", "requires_enrollment": true, "council_bluffs_accessible": true, "transit_accessible": false, "multilingual": false}}'::jsonb
);

-- 4. Kaplan Test Prep — ACT, SAT, MCAT, LSAT, GRE, GMAT (Omaha)
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
  'Kaplan Test Prep — ACT, SAT, MCAT, LSAT, GRE, GMAT (Omaha)',
  'Kaplan',
  'https://www.kaptest.com',
  'National provider offering comprehensive test prep for ACT, SAT, MCAT, LSAT, GRE, and GMAT. SAT/ACT options include courses and private tutoring in multiple formats (in-person, live online, self-paced) plus an "Unlimited Prep" option through senior year. MCAT in-person course includes 125+ hours of live instruction and 14 full-length practice tests. LSAT course includes 28 hours of core prep plus hundreds of hours of LSAT Channel sessions and 70+ practice tests. Robust infrastructure for students targeting professional school.',
  'tutoring',
  'Paid. High school students (ACT/SAT) and college students/graduates (MCAT, LSAT, GRE, GMAT). Contact kaptest.com for Omaha pricing.',
  NULL,
  'https://www.kaptest.com',
  'Omaha, NE (in-person + online)', NULL, 'Omaha', 'NE', NULL,
  false, true,
  '{}', '{}', '{}',
  'high', 'verified',
  'https://www.kaptest.com', 'official_website', '2026-03-17',
  'Multiple course formats. In-person, live online, and self-paced options. Check kaptest.com for Omaha schedule.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "act_sat_prep", "subjects": ["ACT_prep", "SAT_prep", "MCAT_prep", "LSAT_prep", "GRE_prep", "GMAT_prep"], "delivery": "hybrid", "cost_tier": "paid", "listing_type": "tutoring_center", "accessibility": {"cost_barrier": "paid", "requires_enrollment": true, "council_bluffs_accessible": true, "transit_accessible": false, "multilingual": false}}'::jsonb
);

-- 5. Princeton Review — ACT, SAT, MCAT, LSAT, GRE, GMAT (Nebraska)
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
  'Princeton Review — ACT, SAT, MCAT, LSAT, GRE, GMAT (Nebraska)',
  'The Princeton Review',
  'https://www.princetonreview.com',
  'Courses and private tutoring for ACT, SAT, MCAT, LSAT, GRE, and GMAT across Nebraska — serving Omaha, Lincoln, Bellevue, Grand Island, and Kearney. Also offers 24/7 online homework tutoring. A comprehensive option for students at any stage from high school test prep through professional school admissions.',
  'tutoring',
  'Paid. High school students (ACT/SAT) and college students/graduates (MCAT, LSAT, GRE, GMAT). Omaha, Bellevue, and statewide.',
  NULL,
  'https://www.princetonreview.com',
  'Omaha, NE (+ statewide Nebraska, online)', NULL, 'Omaha', 'NE', NULL,
  false, true,
  '{}', '{}', '{}',
  'high', 'verified',
  'https://www.princetonreview.com', 'official_website', '2026-03-17',
  'Courses and private tutoring. 24/7 online homework tutoring also available. Check princetonreview.com/locations/us/nebraska.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "act_sat_prep", "subjects": ["ACT_prep", "SAT_prep", "MCAT_prep", "LSAT_prep", "GRE_prep", "GMAT_prep"], "delivery": "hybrid", "cost_tier": "paid", "listing_type": "tutoring_center", "accessibility": {"cost_barrier": "paid", "requires_enrollment": true, "council_bluffs_accessible": true, "transit_accessible": false, "multilingual": false}}'::jsonb
);

-- 6. Manhattan Review — ACT, SAT, LSAT, MCAT, GRE, GMAT (Omaha)
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
  'Manhattan Review — ACT, SAT, LSAT, MCAT, GRE, GMAT (Omaha)',
  'Manhattan Review',
  'https://www.manhattanreview.com',
  'Group courses and private tutoring for ACT, SAT, LSAT, MCAT, GRE, and GMAT. In-person at convenient Omaha locations or online. Operating since 1999. Flexible scheduling and customized lesson plans. Covers the full spectrum from high school test prep through graduate and professional school admissions.',
  'tutoring',
  'Paid. High school students (ACT/SAT) and college students/graduates (LSAT, MCAT, GRE, GMAT). In-person Omaha or online.',
  NULL,
  'https://www.manhattanreview.com',
  'Omaha, NE (in-person + online)', NULL, 'Omaha', 'NE', NULL,
  false, true,
  '{}', '{}', '{}',
  'high', 'needs_confirmation',
  'https://www.manhattanreview.com', 'official_website', '2026-03-17',
  'Flexible scheduling. Group courses and 1:1 tutoring. Check manhattanreview.com for Omaha schedule.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "act_sat_prep", "subjects": ["ACT_prep", "SAT_prep", "LSAT_prep", "MCAT_prep", "GRE_prep", "GMAT_prep"], "delivery": "hybrid", "cost_tier": "paid", "listing_type": "tutoring_center", "accessibility": {"cost_barrier": "paid", "requires_enrollment": true, "council_bluffs_accessible": true, "transit_accessible": false, "multilingual": false}}'::jsonb
);
