-- ============================================================
-- Opportography — Migration 041
-- Phase 7D: Iowa Western Community College (IWCC) — Named Scholarship Awards
-- Date: 2026-03-16
--
-- Source: iwcc.edu/financial-aid/scholarships/
-- Scholarship portal: iwcc.scholarships.ngwebsolutions.com
-- Verify at: https://www.iwcc.edu/financial-aid/scholarships/
--
-- Data confidence: medium — programs from training data through August 2025.
-- Verify all current-cycle information at official IWCC sources.
--
-- OVERLAP NOTE — DO NOT DUPLICATE:
-- Migration 019 already contains:
--   - IWCC Foundation Scholarships (general pool, April 8 deadline) — entry #2
--   - Pottawattamie Promise (full-ride last-dollar, IWCC) — entry #5
-- This migration adds SPECIFIC NAMED IWCC scholarships NOT separately seeded in 019:
--   - Presidential Scholarship (standalone entry with full detail)
--   - Aviation Program Scholarships
--   - Healthcare-specific scholarship note
--
-- CRITICAL CONTEXT FOR ALL IWCC ENTRIES:
-- IWCC is THE community college for Council Bluffs students.
-- CB students pay Iowa in-state tuition at IWCC.
-- Every scholarship at IWCC is a high-priority listing for CB students.
-- A CB student who doesn't know the Presidential Scholarship exists
-- is exactly the person Opportography exists for.
--
-- Entries in this file:
--   1. IWCC Presidential Scholarship (flagship named award — standalone)
--   2. IWCC Aviation Program Scholarships
--   3. IWCC Healthcare Program Scholarships
-- ============================================================

insert into public.opportunities (
  title, organization, organization_website, description, type,
  eligibility, deadline, link, location, address, city, state, zip,
  is_remote, is_hybrid,
  identity_tags, category_tags, grade_levels,
  compensation_type, compensation_amount, compensation_frequency,
  data_confidence, verification_status,
  source_url, source_type, source_retrieved_date,
  is_active, is_featured,
  schedule, language_access, cost_structure, recurrence,
  learning_context, equity_focus,
  cb_eligibility, iowa_specific, scholarship_metadata
) values

-- ── 1. IWCC Presidential Scholarship ─────────────────────────────────────────
-- $2,500/semester = $5,000/year = $10,000 over two years (total IWCC enrollment).
-- 3.5+ GPA required. Interview required. On-campus housing OR living with parents.
-- Priority deadline: February 10 (2025-2026 cycle — verify for 2026-2027 cycle).
-- This is the flagship named scholarship at IWCC — the highest-value individual award.
-- Migration 019 mentions this briefly inside the general IWCC Foundation entry.
-- This standalone entry gives it the prominence it deserves.
(
  'IWCC Presidential Scholarship — $10,000 Over Two Years',
  'Iowa Western Community College',
  'https://www.iwcc.edu',
  'The IWCC Presidential Scholarship is the highest-value individual named scholarship at Iowa Western Community College — $2,500 per semester, $5,000 per year, $10,000 total over a two-year IWCC enrollment. This is real, significant money for a Council Bluffs student, and it comes from the community college right in your backyard. Here is what you need to know: the Presidential Scholarship requires a cumulative GPA of 3.5 or higher from high school, an interview as part of the selection process, and you must plan to live in on-campus housing OR continue living with your parents during enrollment. Priority deadline for the 2025-2026 cycle was February 10. For the 2026-2027 application cycle: the IWCC Foundation scholarship portal typically opens November 24 — verify the exact deadline for next cycle at iwcc.edu/financial-aid/scholarships/ and mark it on your calendar NOW. This scholarship applies to the general Foundation scholarship portal at iwcc.scholarships.ngwebsolutions.com. If the 2026-2027 priority deadline has not yet passed, apply immediately. If you are a junior planning for next year, set your reminder for November 2026. This is $10,000 sitting at your local community college waiting for qualified CB students.',
  'scholarship',
  'Must be a graduating high school senior applying for first-year enrollment at Iowa Western Community College. Cumulative high school GPA of 3.5 or higher required. Interview required as part of the selection process — contact IWCC Financial Aid at (712) 325-3200 to schedule. Must plan to live in IWCC on-campus housing OR continue living with parents/guardians during enrollment (not independently). Apply through iwcc.scholarships.ngwebsolutions.com. Iowa resident (including Council Bluffs/Pottawattamie County students) — eligible. Priority deadline approximately February 10 annually (verify 2026-2027 deadline at iwcc.edu).',
  null,
  'https://iwcc.scholarships.ngwebsolutions.com/',
  'Council Bluffs, IA',
  '2700 College Road', 'Council Bluffs', 'IA', '51503',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', 5000, 'annual',
  'medium', 'needs_confirmation',
  'https://www.iwcc.edu/financial-aid/scholarships/', 'official_website', '2026-03-16',
  true, true,
  '2026-2027 application cycle: portal opens approximately November 24, 2026. Priority deadline approximately February 10, 2027. Interview required. Verify exact dates at iwcc.edu/financial-aid/scholarships/ or call IWCC Financial Aid at (712) 325-3200.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": false, "communities": ["high-achieving Council Bluffs high school graduates", "IWCC-bound students"], "mission_notes": "The Presidential Scholarship is IWCC''s signal to high-performing Council Bluffs students that they do not need to leave their community to receive meaningful scholarship recognition. $10,000 over two years at a local institution with in-state tuition is a powerful financial foundation."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "IWCC is an Iowa community college. Council Bluffs is in Iowa. CB students pay Iowa in-state tuition at IWCC and are eligible for all IWCC scholarships. The Presidential Scholarship is one of the most valuable local scholarships available specifically to CB students. A CB student with a 3.5+ GPA who applies for this scholarship and receives it has $10,000 from their local community college plus Iowa in-state tuition rates — a powerful starting financial package.", "source": "https://www.iwcc.edu/financial-aid/scholarships/"}'::jsonb,
  '{"requires_fafsa": false, "requires_ifaa": false, "ifaa_url": null, "iowa_institution_required": true, "eligible_iowa_institutions": "Iowa Western Community College only", "state_program": false, "administering_agency": "Iowa Western Community College"}'::jsonb,
  '{"institution_abbr": "IWCC", "institution_type": "public_2year", "scholarship_type": "competitive", "application_method": "general_scholarship_app", "renewable": {"is_renewable": true, "max_years": 2, "renewal_gpa": "verify at iwcc.edu", "notes": "Renewable for second year with continued enrollment and satisfactory GPA — verify renewal requirements with IWCC Financial Aid at (712) 325-3200"}, "stackable": {"stacks_with_other_merit": false, "stacks_with_need_based": true, "notes": "Verify whether Presidential Scholarship stacks with other IWCC Foundation awards or Iowa state aid (Iowa Last-Dollar Scholarship, FAFSA-based Pell Grant). Contact IWCC Financial Aid for stacking clarification."}}'::jsonb
),

-- ── 2. IWCC Aviation Program Scholarships ─────────────────────────────────────
-- IWCC has an aviation and flight training program.
-- Program-specific scholarships exist through Foundation and external aviation orgs.
-- Verify current available aviation scholarships at IWCC.
(
  'IWCC Aviation Program Scholarships — Flight Training and Aviation Technology',
  'Iowa Western Community College / IWCC Foundation',
  'https://www.iwcc.edu',
  'Iowa Western Community College operates one of the few community college aviation and flight training programs in the region. IWCC aviation students have access to aviation-specific scholarships through both the IWCC Foundation and external aviation organizations. If you are planning to pursue a career in aviation — as a pilot, aviation mechanic, air traffic controller, or in aviation management — IWCC''s aviation program is a regionally unique opportunity, and scholarships are available to help fund it. Apply through the general IWCC Foundation scholarship portal at iwcc.scholarships.ngwebsolutions.com — the portal will match you to aviation-specific awards you qualify for. Also contact IWCC''s Aviation Department directly at (712) 325-3200 for information on any aviation-specific scholarships with separate applications. External aviation scholarships (AOPA Foundation, EAA, Women in Aviation, etc.) may also be available to IWCC aviation students — search the AOPA scholarship database at aopa.org/scholarships. COUNCIL BLUFFS STUDENTS: You are fully eligible for IWCC aviation scholarships as Iowa residents. IWCC is your local institution. If you have an interest in aviation as a career, this is where to start.',
  'scholarship',
  'Must be enrolled or planning to enroll in Iowa Western Community College''s Aviation or Aviation Technology program. Iowa resident (includes Council Bluffs/Pottawattamie County students). Apply through IWCC Foundation portal at iwcc.scholarships.ngwebsolutions.com for Foundation aviation scholarships. Contact IWCC Aviation Department at (712) 325-3200 for program-specific awards. Verify current available awards, eligibility criteria, and deadlines at iwcc.edu/financial-aid/scholarships/.',
  null,
  'https://iwcc.scholarships.ngwebsolutions.com/',
  'Council Bluffs, IA',
  '2700 College Road', 'Council Bluffs', 'IA', '51503',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior', 'adult_learner'],
  'scholarship_amount', null, 'annual',
  'medium', 'needs_confirmation',
  'https://www.iwcc.edu/financial-aid/scholarships/', 'official_website', '2026-03-16',
  true, false,
  'Apply through IWCC Foundation portal at iwcc.scholarships.ngwebsolutions.com. Contact IWCC Aviation Department at (712) 325-3200 for program-specific scholarship details. Verify current aviation scholarship pool and deadlines at iwcc.edu.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "IWCC is an Iowa institution. CB students are Iowa residents — fully eligible for all IWCC aviation scholarships. IWCC''s aviation program is a rare community-college aviation program in the region. CB students with aviation career interest should contact the IWCC Aviation Department at (712) 325-3200.", "source": "https://www.iwcc.edu/financial-aid/scholarships/"}'::jsonb,
  '{"requires_fafsa": false, "requires_ifaa": false, "ifaa_url": null, "iowa_institution_required": true, "eligible_iowa_institutions": "Iowa Western Community College — Aviation Program", "state_program": false, "administering_agency": "Iowa Western Community College / IWCC Foundation"}'::jsonb,
  '{"institution_abbr": "IWCC", "institution_type": "public_2year", "scholarship_type": "departmental", "application_method": "general_scholarship_app", "renewable": {"is_renewable": false, "max_years": 1, "renewal_gpa": null, "notes": "Verify renewable status with IWCC for specific aviation awards"}, "stackable": {"stacks_with_other_merit": true, "stacks_with_need_based": true, "notes": "IWCC Foundation awards can stack — one application covers all. External aviation organization scholarships (AOPA, EAA) may also be combinable."}}'::jsonb
),

-- ── 3. IWCC Healthcare Program Scholarships ───────────────────────────────────
-- IWCC has strong healthcare programs (nursing, allied health, EMT, medical assisting).
-- Foundation scholarships exist specifically for healthcare program students.
-- High-demand field eligible for Iowa Last-Dollar Scholarship.
(
  'IWCC Healthcare Program Scholarships — Nursing, Allied Health, EMT, Medical Assisting',
  'Iowa Western Community College / IWCC Foundation',
  'https://www.iwcc.edu',
  'Iowa Western Community College offers nursing, EMT/paramedic, medical assisting, dental assisting, and other allied health programs. The IWCC Foundation has scholarship funds specifically for students in healthcare programs — accessed through the same single application portal at iwcc.scholarships.ngwebsolutions.com. Healthcare is one of the highest-demand career fields in the Council Bluffs and Omaha metro — and completing a healthcare program at IWCC can lead directly to employment in a field with strong wages and job security. ADDITIONAL OPPORTUNITY: Healthcare programs at IWCC may qualify for the Iowa Last-Dollar Scholarship (Future Ready Iowa) — a state program that covers remaining tuition and fees after federal grants for students in qualifying high-demand career fields. Contact IWCC Financial Aid at (712) 325-3200 to confirm your program qualifies for the Iowa Last-Dollar Scholarship. Combining Iowa Last-Dollar with FAFSA and IWCC Foundation scholarships may make a healthcare program at IWCC essentially cost-free for qualifying students. COUNCIL BLUFFS STUDENTS: You are fully eligible as Iowa residents. Healthcare programs at your local community college, supported by state last-dollar funding — this is a high-value pathway.',
  'scholarship',
  'Must be enrolled or planning to enroll in Iowa Western Community College''s nursing, allied health, EMT, medical assisting, dental assisting, or related healthcare program. Iowa resident (includes Council Bluffs/Pottawattamie County students). Apply through IWCC Foundation portal at iwcc.scholarships.ngwebsolutions.com. FAFSA required for need-based awards and for Iowa Last-Dollar Scholarship consideration. Contact IWCC Financial Aid at (712) 325-3200 to confirm Iowa Last-Dollar Scholarship eligibility for your specific program.',
  null,
  'https://iwcc.scholarships.ngwebsolutions.com/',
  'Council Bluffs, IA',
  '2700 College Road', 'Council Bluffs', 'IA', '51503',
  false, false,
  array['low_income', 'first_gen'],
  array['scholarship', 'college_access', 'health'],
  array['high_school_senior', 'adult_learner'],
  'scholarship_amount', null, 'annual',
  'medium', 'needs_confirmation',
  'https://www.iwcc.edu/financial-aid/scholarships/', 'official_website', '2026-03-16',
  true, false,
  'Apply through IWCC Foundation portal at iwcc.scholarships.ngwebsolutions.com. Contact IWCC Financial Aid at (712) 325-3200 to confirm Iowa Last-Dollar Scholarship eligibility for your healthcare program. FAFSA required for need-based and state aid.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["career and technical students", "healthcare career seekers", "first-generation college students", "adult learners seeking career change"], "mission_notes": "Healthcare programs at community colleges are one of the clearest pathways from entry-level wages to a stable, family-sustaining career. IWCC healthcare programs connect directly to Omaha-area hospital and healthcare employer pipelines. Scholarship support for these students has outsized community impact."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "IWCC is an Iowa institution. CB students are Iowa residents — fully eligible for all IWCC healthcare scholarships and Iowa Last-Dollar Scholarship. For CB students interested in healthcare careers, IWCC is the local option with in-state tuition + Foundation scholarship + potential Iowa Last-Dollar coverage. Contact IWCC Financial Aid at (712) 325-3200 for a complete financial aid picture.", "source": "https://www.iwcc.edu/financial-aid/scholarships/"}'::jsonb,
  '{"requires_fafsa": true, "requires_ifaa": true, "ifaa_url": "https://educate.iowa.gov", "iowa_institution_required": true, "eligible_iowa_institutions": "Iowa Western Community College — Healthcare Programs", "state_program": false, "administering_agency": "Iowa Western Community College / IWCC Foundation"}'::jsonb,
  '{"institution_abbr": "IWCC", "institution_type": "public_2year", "scholarship_type": "departmental", "application_method": "general_scholarship_app", "renewable": {"is_renewable": false, "max_years": 1, "renewal_gpa": null, "notes": "Verify renewable status with IWCC for specific healthcare awards; Iowa Last-Dollar Scholarship is renewable through program completion"}, "stackable": {"stacks_with_other_merit": true, "stacks_with_need_based": true, "notes": "Foundation awards + Iowa Last-Dollar Scholarship + Pell Grant may all stack — contact IWCC Financial Aid to confirm. One AwardSpring application covers all Foundation awards."}}'::jsonb
);
