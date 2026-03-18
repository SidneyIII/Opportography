-- ============================================================
-- Opportography — Migration 062
-- Phase 14D: Graduate & Professional School Test Prep
-- (LSAT, MCAT, GRE, GMAT)
-- Date: 2026-03-17
--
-- Note: Kaplan, Princeton Review, Manhattan Review, and Varsity
-- Tutors / Wyzant (seeded in migrations 060-061) also cover
-- graduate exam prep and are tagged accordingly.
-- This migration adds grad-test-prep-specific entries:
-- 3 entries: 7Sage (LSAT), Prep For Success Tutors
-- (all exams), and a standalone Wyzant grad entry is not
-- needed (already in 060). Only net-new providers added here.
-- ============================================================

-- Context note for platform: The LSAT is required for law school
-- admission. The MCAT is required for medical school admission.
-- The GRE is required for most graduate school programs (master's,
-- PhD). The GMAT is required for most MBA and business school
-- programs. First-generation college students from communities
-- like Council Bluffs often don't know these exams exist until
-- it's too late to prepare. The mere presence of this category
-- in Opportography is an equity intervention.

-- 1. 7Sage — LSAT Prep (Online)
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
  '7Sage — LSAT Prep (Law School Admissions Test)',
  '7Sage',
  'https://7sage.com',
  'The LSAT is the required admissions exam for U.S. law schools. 7Sage is widely regarded as the top online LSAT prep platform. Includes a complete video curriculum, explanations for every official LSAT question ever released, performance analytics, adaptive drills, and full study plan tools. Live tier includes 60+ live classes per week plus an "Ask a Tutor" feature. Coach tier adds bi-monthly 1:1 sessions with 99th-percentile instructors. Testimonials of 25+ point score jumps. Multiple tiers for different budgets.',
  'tutoring',
  'Paid (multiple price tiers). College students and graduates preparing for law school. Self-paced + live class options. Visit 7sage.com for pricing.',
  NULL,
  'https://7sage.com',
  'Online', NULL, NULL, NULL, NULL,
  true, false,
  '{low_income,first_gen}', '{}', '{}',
  'high', 'verified',
  'https://7sage.com', 'official_website', '2026-03-17',
  'Self-paced (start anytime). Live classes 60+/week. Coach 1:1 bi-monthly sessions.',
  true, true, '2026-03-17', '2026-03-17',
  '{"subcategory": "grad_test_prep", "subjects": ["LSAT_prep"], "exam_description": "LSAT = Law School Admissions Test, required for U.S. law school admission", "delivery": "online", "cost_tier": "paid", "listing_type": "platform", "accessibility": {"cost_barrier": "paid", "requires_enrollment": true, "council_bluffs_accessible": true, "transit_accessible": true, "multilingual": false}}'::jsonb
);

-- 2. Prep For Success Tutors — LSAT, MCAT, SAT, GRE, GMAT, ACT (Online)
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
  'Prep For Success Tutors — 1:1 Virtual Tutoring (LSAT, MCAT, GRE, GMAT, SAT, ACT)',
  'Prep For Success Tutors',
  'https://www.prepforsuccesstutors.com',
  '1:1 virtual Zoom tutoring for LSAT, MCAT, SAT, GRE, GMAT, and ACT. All tutors scored in the 99th percentile or achieved a perfect score on their respective exams. Custom study plans tailored to the student''s timeline and target schools. Partnered with 30+ high schools. Strong track record: testimonials include 170-point GMAT jumps and LSAT score improvements leading to Cornell admission.',
  'tutoring',
  'Paid. All levels — high school through graduate school. Contact prepforsuccesstutors.com or call (973) 566-5236.',
  NULL,
  'https://www.prepforsuccesstutors.com',
  'Online (virtual Zoom sessions)', NULL, NULL, NULL, NULL,
  true, false,
  '{first_gen}', '{}', '{}',
  'high', 'needs_confirmation',
  'https://www.prepforsuccesstutors.com', 'official_website', '2026-03-17',
  'By appointment. Flexible scheduling via Zoom. Contact prepforsuccesstutors.com for pricing.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "grad_test_prep", "subjects": ["LSAT_prep", "MCAT_prep", "GRE_prep", "GMAT_prep", "SAT_prep", "ACT_prep"], "exam_description": "LSAT = law school | MCAT = medical school | GRE = grad school | GMAT = business school", "delivery": "online", "cost_tier": "paid", "listing_type": "tutoring_service", "accessibility": {"cost_barrier": "paid", "requires_enrollment": false, "council_bluffs_accessible": true, "transit_accessible": true, "multilingual": false}}'::jsonb
);
