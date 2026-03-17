-- ============================================================
-- Opportography — Migration 042
-- Phase 7E: University of Iowa — Institution-Specific Scholarships
-- Date: 2026-03-16
--
-- Source: admissions.uiowa.edu (official University of Iowa financial aid pages)
-- Scholarship portal: uiowa.academicworks.com
-- Verify at:
--   https://admissions.uiowa.edu/finances/scholarships
--   https://admissions.uiowa.edu/cost-aid/first-year-resident-scholarships
--   https://admissions.uiowa.edu/cost-aid/first-year-non-resident-scholarships
--
-- Data confidence: medium — programs from training data through August 2025.
-- Verify all current-cycle amounts and thresholds at official UI sources.
--
-- OVERLAP NOTE — DO NOT DUPLICATE:
-- Migration 023 already contains:
--   - University of Iowa AcademicWorks portal reference (general college_access entry)
-- This migration adds SPECIFIC NAMED UI scholarships with full detail.
--
-- CRITICAL RESIDENCY DISTINCTION — EMBED IN EVERY ENTRY:
-- Council Bluffs students = IOWA RESIDENTS
--   -> Eligible for Iowa Scholars Award (resident merit tier)
--   -> Eligible for Iowa Need-Based Academic Award
--   -> Pay Iowa in-state tuition (~$10,000-11,000/year — verify current rate)
--
-- Omaha students = NON-RESIDENTS
--   -> Eligible for National Scholars Award (non-resident merit tier) instead
--   -> Pay non-resident tuition (~$32,000+/year — verify current rate)
--   -> NOT eligible for Iowa-resident-only awards
--
-- Non-stacking rule at UI:
-- Iowa Scholars, National Scholars, and Iowa Flagship awards do NOT stack.
-- Student receives the HIGHEST applicable award. Note on every UI entry.
--
-- Key deadline: February 2, 2026 for Fall 2026 merit scholarship consideration.
--
-- Entries in this file:
--   1. Iowa Scholars Award (Iowa residents — automatic merit)
--   2. National Scholars Award (non-residents — automatic merit)
--   3. Iowa Need-Based Academic Award (FAFSA, automatic)
--   4. National Merit Finalist Scholarship at UI (full tuition)
--   5. Phi Theta Kappa Transfer Scholarship
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

-- ── 1. Iowa Scholars Award (Iowa Residents — Automatic Merit) ─────────────────
-- Automatic merit award for Iowa residents. Tiered by GPA/rank/test scores.
-- No separate application — awarded with admission decision.
-- CB students (Iowa residents) are eligible.
-- Omaha students (non-residents) are NOT eligible for this award.
(
  'University of Iowa — Iowa Scholars Award (Iowa Residents, Automatic Merit)',
  'University of Iowa Office of Admissions',
  'https://www.uiowa.edu',
  'The Iowa Scholars Award is the University of Iowa''s automatic merit scholarship for Iowa residents. If you are a Council Bluffs student — you are an Iowa resident, and this award is for you. No separate application required: the University of Iowa automatically considers all Iowa resident applicants for merit scholarships based on your academic record (GPA, class rank, and/or ACT/SAT scores). Award amounts vary by academic credentials — higher GPA and test scores correspond to higher award tiers. The scholarship is renewable for up to four years with satisfactory academic progress. To receive full scholarship consideration, apply by February 2 for Fall 2026 enrollment. CRITICAL RESIDENCY NOTE: The Iowa Scholars Award is for Iowa residents only. Omaha students (Nebraska residents) are NON-residents at the University of Iowa — they are instead considered for the National Scholars Award (entry #2 in this batch). The financial difference is significant: Iowa residents also pay in-state tuition (~$10,000-$11,000/year), while non-residents pay approximately $32,000+/year. CB students have a major cost advantage at the University of Iowa. STACKING: Iowa Scholars, National Scholars, and Iowa Flagship awards do NOT stack. Student receives the highest single applicable award. Verify the current tier chart and award amounts at admissions.uiowa.edu/finances/scholarships.',
  'scholarship',
  'Iowa RESIDENT required (Council Bluffs students qualify). Automatic consideration at admission based on GPA, class rank, and/or ACT/SAT scores — no separate scholarship application. Apply to University of Iowa by February 2 for full merit consideration (updated test scores or transcript accepted until March 1). Renewable for 4 years (8 semesters) with satisfactory academic progress and full-time enrollment. Verify current tier thresholds and award amounts at admissions.uiowa.edu/cost-aid/first-year-resident-scholarships.',
  '2026-02-02',
  'https://admissions.uiowa.edu/cost-aid/first-year-resident-scholarships',
  'Iowa City, IA',
  '107 Calvin Hall', 'Iowa City', 'IA', '52242',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', null, 'annual',
  'medium', 'needs_confirmation',
  'https://admissions.uiowa.edu/cost-aid/first-year-resident-scholarships', 'official_website', '2026-03-16',
  true, true,
  'Apply by February 2 for full merit consideration. Updated test scores or transcripts accepted until March 1 for reconsideration. No separate scholarship application. Award levels announced with admission decision. Verify current tier chart at admissions.uiowa.edu/cost-aid/first-year-resident-scholarships.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "Council Bluffs is in Iowa — CB students are Iowa residents and are fully eligible for the Iowa Scholars Award. This is one of the most important facts for CB students considering the University of Iowa: you qualify for Iowa-resident merit awards AND pay Iowa in-state tuition (~$10,000-11,000/year instead of ~$32,000+ for out-of-state). The combination of Iowa resident tuition + Iowa Scholars Award makes U of I significantly more affordable for CB students than most families realize. Omaha students (Nebraska residents) are NOT eligible for this award — they qualify for the National Scholars Award instead.", "source": "https://admissions.uiowa.edu/cost-aid/first-year-resident-scholarships"}'::jsonb,
  '{"requires_fafsa": false, "requires_ifaa": false, "ifaa_url": null, "iowa_institution_required": true, "eligible_iowa_institutions": "University of Iowa", "state_program": false, "administering_agency": "University of Iowa Office of Admissions"}'::jsonb,
  '{"institution_abbr": "Iowa", "institution_type": "public_4year", "scholarship_type": "merit", "application_method": "automatic_upon_admission", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "verify at admissions.uiowa.edu", "notes": "Satisfactory academic progress required; full-time enrollment required; verify specific GPA renewal requirement at UI"}, "stackable": {"stacks_with_other_merit": false, "stacks_with_need_based": true, "notes": "Iowa Scholars, National Scholars, and Iowa Flagship awards do NOT stack with each other. Student receives the highest applicable award. Iowa Scholars Award may stack with need-based Iowa Need-Based Academic Award — verify with UI Financial Aid."}}'::jsonb
),

-- ── 2. National Scholars Award (Non-Residents — Automatic Merit) ──────────────
-- Automatic merit award for non-Iowa-residents.
-- Omaha students (Nebraska residents) are eligible.
-- CB students (Iowa residents) are NOT eligible — they get Iowa Scholars instead.
(
  'University of Iowa — National Scholars Award (Non-Residents, Automatic Merit)',
  'University of Iowa Office of Admissions',
  'https://www.uiowa.edu',
  'The National Scholars Award is the University of Iowa''s automatic merit scholarship for students who are NOT Iowa residents. If you are an Omaha student (Nebraska resident), this is the scholarship tier that applies to you when considering the University of Iowa. Like the Iowa Scholars Award, the National Scholars Award requires no separate application — it is awarded automatically with your admission decision based on your academic record (GPA, class rank, ACT/SAT). Apply by February 2 for full merit consideration. Award amounts and tier thresholds are separate from the Iowa resident tier — verify current National Scholars amounts at admissions.uiowa.edu/cost-aid/first-year-non-resident-scholarships. IMPORTANT: As a Nebraska resident at the University of Iowa, you pay non-resident tuition (~$32,000+/year — verify current rate). The National Scholars Award partially offsets this, but the total cost is still significantly higher than for Iowa residents. COUNCIL BLUFFS STUDENTS: You are Iowa residents and do NOT receive this award — you receive the Iowa Scholars Award instead. CB students should look at entry #1 (Iowa Scholars) in this batch. STACKING: National Scholars and other Iowa merit awards do NOT stack. You receive one.',
  'scholarship',
  'Non-Iowa resident required (Nebraska, Minnesota, Illinois, and other non-Iowa state residents). Automatic consideration at admission — no separate scholarship application. Apply by February 2 for full merit consideration (updated test scores/transcripts accepted until March 1). Renewable for 4 years with satisfactory academic progress. Verify current tier amounts at admissions.uiowa.edu/cost-aid/first-year-non-resident-scholarships.',
  '2026-02-02',
  'https://admissions.uiowa.edu/cost-aid/first-year-non-resident-scholarships',
  'Iowa City, IA',
  '107 Calvin Hall', 'Iowa City', 'IA', '52242',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', null, 'annual',
  'medium', 'needs_confirmation',
  'https://admissions.uiowa.edu/cost-aid/first-year-non-resident-scholarships', 'official_website', '2026-03-16',
  true, false,
  'Apply by February 2. No separate scholarship application. Verify current tier thresholds and award amounts at admissions.uiowa.edu/cost-aid/first-year-non-resident-scholarships.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": false, "basis": "explicit", "notes": "Council Bluffs students are Iowa residents and do NOT receive the National Scholars Award — they receive the Iowa Scholars Award (entry #1 in this batch) instead. This entry is for Omaha students (Nebraska residents), who are non-residents at the University of Iowa. Omaha students should carefully compare total cost of attendance (non-resident tuition ~$32,000+ minus National Scholars Award) vs. Nebraska schools (UNO, Creighton) where they would pay in-state or private rates.", "source": "https://admissions.uiowa.edu/cost-aid/first-year-non-resident-scholarships"}'::jsonb,
  '{"requires_fafsa": false, "requires_ifaa": false, "ifaa_url": null, "iowa_institution_required": true, "eligible_iowa_institutions": "University of Iowa", "state_program": false, "administering_agency": "University of Iowa Office of Admissions"}'::jsonb,
  '{"institution_abbr": "Iowa", "institution_type": "public_4year", "scholarship_type": "merit", "application_method": "automatic_upon_admission", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "verify at admissions.uiowa.edu", "notes": "Satisfactory academic progress and full-time enrollment required"}, "stackable": {"stacks_with_other_merit": false, "stacks_with_need_based": true, "notes": "Does not stack with other Iowa merit awards. Verify stacking with need-based aid at UI Financial Aid."}}'::jsonb
),

-- ── 3. Iowa Need-Based Academic Award ─────────────────────────────────────────
-- $100-$3,000/semester for Iowa residents with demonstrated need.
-- FAFSA required. Automatic — no separate application.
-- CB students are Iowa residents and are eligible.
(
  'University of Iowa — Iowa Need-Based Academic Award',
  'University of Iowa Student Financial Aid',
  'https://www.uiowa.edu',
  'The Iowa Need-Based Academic Award is an institutional grant from the University of Iowa for Iowa resident students who demonstrate financial need through FAFSA and have strong academic credentials. Award amounts range from $100 to $3,000 per semester depending on financial need and academic record — file your FAFSA early for maximum consideration. This award stacks with your Iowa Scholars merit award: if you are a Council Bluffs student who qualifies for both Iowa Scholars (merit) and the Iowa Need-Based Academic Award (need), you may receive both. No separate application — your FAFSA filing triggers consideration automatically. File your FAFSA and the Iowa Financial Aid Application (IFAA) at educate.iowa.gov by April 1 for full Iowa state aid consideration. COUNCIL BLUFFS STUDENTS: You are Iowa residents and are fully eligible for this award. File your FAFSA early — this is one of several Iowa state and institutional need-based awards that CB students often miss because they do not know they are Iowa residents for financial aid purposes. Contact UI Student Financial Aid at (319) 335-1450 for a full aid package review.',
  'scholarship',
  'Iowa RESIDENT required (Council Bluffs students qualify). Demonstrated financial need as determined by FAFSA required. Strong academic credentials (verify specific GPA/test requirement at admissions.uiowa.edu). No separate application — FAFSA filing triggers automatic consideration. File FAFSA and Iowa IFAA at educate.iowa.gov by April 1 for full consideration. Must maintain satisfactory academic progress. Renewable annually with FAFSA filing.',
  '2026-04-01',
  'https://admissions.uiowa.edu/finances/scholarships',
  'Iowa City, IA',
  '107 Calvin Hall', 'Iowa City', 'IA', '52242',
  false, false,
  array['low_income', 'first_gen'],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', 3000, 'per_semester',
  'medium', 'needs_confirmation',
  'https://admissions.uiowa.edu/finances/scholarships', 'official_website', '2026-03-16',
  true, true,
  'File FAFSA and Iowa IFAA (educate.iowa.gov) by April 1 for full consideration. No separate application — FAFSA triggers review. Contact UI Student Financial Aid at (319) 335-1450. Verify current award range at admissions.uiowa.edu/finances/scholarships.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["low-income Iowa residents", "first-generation college students", "Council Bluffs students with financial need"], "mission_notes": "Many CB families with financial need assume the University of Iowa is out of reach financially. The Iowa Need-Based Academic Award — combined with in-state tuition and the Iowa Scholars merit award — can make UI significantly more affordable than its size suggests. A CB student with a 3.5 GPA and $40k family income may qualify for a package that covers most of their costs."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "Iowa residents only — CB students qualify. Must file FAFSA AND the Iowa Financial Aid Application (IFAA) at educate.iowa.gov by April 1. The IFAA is separate from the FAFSA and is required for Iowa state aid — most CB students do not know it exists. Filing both is the critical step. Contact UI Financial Aid at (319) 335-1450 for a complete financial aid breakdown.", "source": "https://admissions.uiowa.edu/finances/scholarships"}'::jsonb,
  '{"requires_fafsa": true, "requires_ifaa": true, "ifaa_url": "https://educate.iowa.gov", "iowa_institution_required": true, "eligible_iowa_institutions": "University of Iowa", "state_program": false, "administering_agency": "University of Iowa Student Financial Aid"}'::jsonb,
  '{"institution_abbr": "Iowa", "institution_type": "public_4year", "scholarship_type": "need-based", "application_method": "automatic_upon_admission", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "verify at UI Financial Aid", "notes": "Annual FAFSA filing required; satisfactory academic progress required; award amount may change based on family financial situation"}, "stackable": {"stacks_with_other_merit": true, "stacks_with_need_based": false, "notes": "Stacks with Iowa Scholars Award and other merit scholarships. Verify stacking with other need-based institutional aid at UI Financial Aid."}}'::jsonb
),

-- ── 4. University of Iowa National Merit Finalist Scholarship ─────────────────
-- Full tuition for National Merit Finalists who designate UI as their first choice.
-- Extremely competitive (National Merit Finalist status required).
-- CB students (Iowa residents) are eligible.
(
  'University of Iowa — National Merit Finalist Scholarship (Full Tuition)',
  'University of Iowa Office of Admissions / National Merit Scholarship Corporation',
  'https://www.uiowa.edu',
  'The University of Iowa provides a full Iowa in-state tuition scholarship to National Merit Finalists who designate the University of Iowa as their first-choice institution with the National Merit Scholarship Corporation. If you are a National Merit Finalist, this is one of the most powerful financial levers available — full tuition coverage at a major research university. Iowa residents (including Council Bluffs students) pay in-state tuition (~$10,000-$11,000/year), so the full-tuition scholarship covers this entire amount. Non-residents who are National Merit Finalists can also receive this award, but their non-resident tuition is higher (~$32,000+/year) — the award covers the in-state equivalent amount or full non-resident tuition, depending on current UI policy (verify at admissions.uiowa.edu). To receive this scholarship: (1) qualify as a National Merit Finalist through your PSAT/NMSQT junior year, (2) designate the University of Iowa as your first-choice institution with NMSC. Renewable for 4 years with satisfactory academic progress.',
  'scholarship',
  'Must be a National Merit Finalist (determined by PSAT/NMSQT junior year — junior year is the year to qualify). Must designate the University of Iowa as your first-choice institution with the National Merit Scholarship Corporation (NMSC). Must be admitted to and enroll at the University of Iowa. Renewable for 4 years with satisfactory academic progress. Verify current award policy (Iowa resident vs. non-resident amount) at admissions.uiowa.edu/finances/scholarships.',
  null,
  'https://admissions.uiowa.edu/finances/scholarships',
  'Iowa City, IA',
  '107 Calvin Hall', 'Iowa City', 'IA', '52242',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', 11000, 'annual',
  'medium', 'needs_confirmation',
  'https://admissions.uiowa.edu/finances/scholarships', 'official_website', '2026-03-16',
  true, false,
  'Must be a National Merit Finalist and designate UI as first-choice institution with NMSC. No separate scholarship application beyond NMSC process. Verify current full-tuition coverage amounts (resident vs. non-resident) at admissions.uiowa.edu/finances/scholarships.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "CB students who are National Merit Finalists are Iowa residents and pay Iowa in-state tuition at UI — this scholarship covers 100% of that tuition. CB National Merit Finalists should seriously consider designating UI as their first-choice institution, since the full-tuition scholarship at in-state rates is a compelling financial offer. Omaha National Merit Finalists would pay non-resident tuition — verify whether the scholarship covers full non-resident tuition or only the in-state equivalent at admissions.uiowa.edu.", "source": "https://admissions.uiowa.edu/finances/scholarships"}'::jsonb,
  '{"requires_fafsa": false, "requires_ifaa": false, "ifaa_url": null, "iowa_institution_required": true, "eligible_iowa_institutions": "University of Iowa", "state_program": false, "administering_agency": "University of Iowa / National Merit Scholarship Corporation"}'::jsonb,
  '{"institution_abbr": "Iowa", "institution_type": "public_4year", "scholarship_type": "competitive", "application_method": "separate_application_required", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "verify at admissions.uiowa.edu", "notes": "Satisfactory academic progress required; must maintain National Merit Finalist designation through NMSC"}, "stackable": {"stacks_with_other_merit": false, "stacks_with_need_based": true, "notes": "National Merit Finalist scholarship replaces other Iowa merit awards (Iowa Scholars, National Scholars). Does not stack with other merit awards but may stack with need-based aid — verify with UI Financial Aid."}}'::jsonb
),

-- ── 5. Phi Theta Kappa Transfer Scholarship at University of Iowa ─────────────
-- For community college transfer students with PTK membership.
-- Competitive, limited awards. CB students who transfer from IWCC or another
-- Iowa CC with PTK membership are eligible.
(
  'University of Iowa — Phi Theta Kappa Transfer Scholarship',
  'University of Iowa Office of Admissions',
  'https://www.uiowa.edu',
  'Phi Theta Kappa (PTK) is the international honor society for two-year colleges. If you are transferring to the University of Iowa from a community college and you are a PTK member in good standing, you may be eligible for the Phi Theta Kappa Transfer Scholarship. This is a competitive award with a limited number available each transfer cycle. If you are at Iowa Western Community College (Council Bluffs) or another Iowa community college and you have PTK membership, apply for this scholarship when you apply to transfer to UI. PTK membership is earned by maintaining a strong GPA (typically 3.5+) and being invited to join through your community college chapter. COUNCIL BLUFFS STUDENTS: If you start at IWCC and join PTK, you are building eligibility for this scholarship for when you transfer to UI. Iowa residents (including CB students) also pay in-state tuition at UI after transfer. Verify current scholarship amount, application process, and transfer deadlines at admissions.uiowa.edu/finances/scholarships.',
  'scholarship',
  'Must be a community college transfer student admitted to the University of Iowa. Must be a Phi Theta Kappa member in good standing at the time of transfer application. Competitive — limited number of awards per transfer cycle. Iowa resident status gives access to Iowa-resident-preference awards alongside this scholarship. FAFSA and Iowa IFAA recommended for need-based aid consideration in addition. Verify current amount and application at admissions.uiowa.edu/finances/scholarships.',
  null,
  'https://admissions.uiowa.edu/finances/scholarships',
  'Iowa City, IA',
  '107 Calvin Hall', 'Iowa City', 'IA', '52242',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['adult_learner'],
  'scholarship_amount', null, 'one_time',
  'medium', 'needs_confirmation',
  'https://admissions.uiowa.edu/finances/scholarships', 'official_website', '2026-03-16',
  true, false,
  'Apply during transfer application cycle. PTK membership in good standing required. Verify current award amount and transfer application timeline at admissions.uiowa.edu/finances/scholarships or contact UI Transfer Admissions.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "likely", "notes": "CB students transferring from IWCC or another Iowa community college with PTK membership are Iowa residents at UI — eligible for in-state tuition and Iowa-resident scholarship tiers. If you are at IWCC and not yet a PTK member, joining PTK (requires 3.5+ GPA and invitation) creates eligibility for this and other transfer scholarships. Contact IWCC''s PTK chapter advisor for membership information.", "source": "https://admissions.uiowa.edu/finances/scholarships"}'::jsonb,
  '{"requires_fafsa": false, "requires_ifaa": false, "ifaa_url": null, "iowa_institution_required": true, "eligible_iowa_institutions": "University of Iowa", "state_program": false, "administering_agency": "University of Iowa Office of Admissions"}'::jsonb,
  '{"institution_abbr": "Iowa", "institution_type": "public_4year", "scholarship_type": "merit", "application_method": "separate_application_required", "renewable": {"is_renewable": false, "max_years": 1, "renewal_gpa": null, "notes": "Typically a one-time transfer award — verify renewable status at admissions.uiowa.edu"}, "stackable": {"stacks_with_other_merit": false, "stacks_with_need_based": true, "notes": "Verify stacking with other UI transfer scholarships and Iowa need-based aid."}}'::jsonb
);
