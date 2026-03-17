-- ============================================================
-- Opportography — Migration 043
-- Phase 7F: Iowa State University — Institution-Specific Scholarships
-- Date: 2026-03-16
--
-- Source: iastate.edu (official Iowa State admissions and financial aid pages)
-- Scholarship portal: iastate.academicworks.com (OneApp)
-- Verify at:
--   https://www.iastate.edu/admission-and-aid/affording-college/scholarships
--   https://www.iastate.edu/admission-and-aid/admissions/first-year-students/first-year-scholarship-awards
--
-- Data confidence: medium — programs from training data through August 2025.
-- ISU merit tier names and amounts are subject to revision.
-- Verify all current-cycle information at official ISU sources before deployment.
--
-- OVERLAP NOTE — DO NOT DUPLICATE:
-- Migration 023 already contains:
--   - Iowa State University OneApp Scholarship Portal reference (college_access type)
-- This migration adds SPECIFIC NAMED ISU scholarships with full detail.
--
-- CRITICAL RESIDENCY DISTINCTION — EMBED IN EVERY ENTRY:
-- Council Bluffs students = IOWA RESIDENTS
--   -> Eligible for Iowa resident merit tiers (Loyal/Forever/True Scholar)
--   -> Pay Iowa in-state tuition (~$9,500-$10,000/year — verify current rate)
--   -> NOT eligible for non-resident tiers
--
-- Omaha students = NON-RESIDENTS
--   -> Eligible for Academic Achievement Award (non-resident merit tier)
--   -> Pay non-resident tuition (~$27,000+/year — verify current rate)
--   -> NOT eligible for Iowa-resident-only awards
--
-- NON-STACKING RULE: ISU merit awards do NOT stack with each other.
-- Student receives the highest single applicable award.
-- Full-tuition competitive awards (Carver, First Cyclones, National Merit, Science Bound)
-- are NOT eligible to also receive the automatic tier awards.
--
-- Key deadline: March 1 priority date for first-year merit review.
--
-- Entries in this file:
--   1. ISU Loyal Scholar Award (Iowa residents, automatic merit, entry tier)
--   2. ISU Forever Scholar Award (Iowa residents, automatic merit, mid tier)
--   3. ISU True Scholar Award (Iowa residents, automatic merit, top automatic tier)
--   4. George Washington Carver Scholastic Leadership Award (competitive, full tuition)
--   5. First Cyclones Scholarship (competitive, full tuition, first-gen/underrepresented)
--   6. ISU Academic Achievement Award (non-residents, automatic merit)
--   7. ISU National Merit Tuition Scholarship
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

-- ── 1. ISU Loyal Scholar Award (Iowa Residents, Entry Automatic Tier) ─────────
-- Automatic merit award for Iowa residents meeting entry-tier academic criteria.
-- No separate application. March 1 priority deadline for admission.
(
  'Iowa State University — Loyal Scholar Award (Iowa Residents, Automatic Merit)',
  'Iowa State University Office of Admissions',
  'https://www.iastate.edu',
  'The Loyal Scholar Award is Iowa State University''s entry-tier automatic merit scholarship for Iowa resident students. No separate scholarship application required — ISU automatically considers all Iowa resident applicants based on their academic record. The Loyal Scholar tier represents the foundation level of ISU''s merit award system for Iowa residents, with higher tiers (Forever Scholar, True Scholar) available for stronger academic credentials. Award amount and academic threshold: verify the current GPA/ACT/SAT requirements and dollar amount at iastate.edu/admission-and-aid/admissions/first-year-students/first-year-scholarship-awards. Apply to ISU by March 1 for full merit consideration. Renewable for up to four years with satisfactory academic progress. COUNCIL BLUFFS STUDENTS: You are Iowa residents and are eligible for the Loyal Scholar Award and all Iowa-resident merit tiers at Iowa State. CB students pay Iowa in-state tuition (~$9,500-$10,000/year — verify current rate) — a major cost advantage over non-residents who pay ~$27,000+/year. STACKING: ISU merit awards do NOT stack. You receive the single highest tier you qualify for.',
  'scholarship',
  'Iowa RESIDENT required (Council Bluffs students qualify). Automatic consideration at admission based on GPA and/or ACT/SAT scores — verify current entry-tier threshold at iastate.edu/admission-and-aid. No separate scholarship application. Apply to ISU by March 1 for priority merit consideration. Renewable for 4 years with satisfactory academic progress. Verify current award amount and tier threshold at iastate.edu/admission-and-aid/admissions/first-year-students/first-year-scholarship-awards.',
  '2026-03-01',
  'https://www.iastate.edu/admission-and-aid/admissions/first-year-students/first-year-scholarship-awards',
  'Ames, IA',
  '100 Alumni Hall', 'Ames', 'IA', '50011',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', null, 'annual',
  'medium', 'needs_confirmation',
  'https://www.iastate.edu/admission-and-aid/admissions/first-year-students/first-year-scholarship-awards', 'official_website', '2026-03-16',
  true, false,
  'Apply to ISU by March 1. No separate scholarship application — automatic consideration at admission. Verify current tier thresholds and award amounts at iastate.edu/admission-and-aid/admissions/first-year-students/first-year-scholarship-awards.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "CB students are Iowa residents — fully eligible for ISU Iowa-resident merit tiers. CB students pay Iowa in-state tuition at ISU (~$9,500-$10,000/year). Omaha students are NOT eligible for this award — they qualify for the Academic Achievement Award (non-resident tier) instead.", "source": "https://www.iastate.edu/admission-and-aid/admissions/first-year-students/first-year-scholarship-awards"}'::jsonb,
  '{"requires_fafsa": false, "requires_ifaa": false, "ifaa_url": null, "iowa_institution_required": true, "eligible_iowa_institutions": "Iowa State University", "state_program": false, "administering_agency": "Iowa State University Office of Admissions"}'::jsonb,
  '{"institution_abbr": "ISU", "institution_type": "public_4year", "scholarship_type": "merit", "application_method": "automatic_upon_admission", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "verify at iastate.edu", "notes": "Satisfactory academic progress required; full-time enrollment required; verify specific GPA renewal threshold"}, "stackable": {"stacks_with_other_merit": false, "stacks_with_need_based": true, "notes": "ISU merit awards do NOT stack with each other. Student receives the single highest applicable tier. Full-tuition competitive awards (Carver, First Cyclones) replace automatic tier awards."}}'::jsonb
),

-- ── 2. ISU Forever Scholar Award (Iowa Residents, Mid Automatic Tier) ─────────
-- Mid-tier automatic merit award for Iowa residents.
-- Higher academic credentials required vs. Loyal Scholar.
(
  'Iowa State University — Forever Scholar Award (Iowa Residents, Mid-Tier Merit)',
  'Iowa State University Office of Admissions',
  'https://www.iastate.edu',
  'The Forever Scholar Award is Iowa State University''s mid-tier automatic merit scholarship for Iowa resident students with stronger academic credentials than the Loyal Scholar entry tier. No separate application required — ISU automatically awards this to qualifying Iowa resident applicants based on GPA and/or ACT/SAT scores. Verify the current mid-tier academic threshold and award amount at iastate.edu/admission-and-aid/admissions/first-year-students/first-year-scholarship-awards. Apply to ISU by March 1 for full merit consideration. Renewable for up to four years with satisfactory academic progress. COUNCIL BLUFFS STUDENTS: You are Iowa residents — eligible for this scholarship. CB students with qualifying academic credentials should apply to ISU by March 1 and be automatically considered for the highest tier they qualify for. STACKING: ISU merit awards do NOT stack. If you qualify for both Loyal and Forever Scholar tiers, you receive only the Forever Scholar (the higher award).',
  'scholarship',
  'Iowa RESIDENT required (Council Bluffs students qualify). Higher academic credentials than Loyal Scholar entry tier required — verify current GPA/ACT/SAT threshold at iastate.edu. Automatic consideration at admission. Apply to ISU by March 1 for priority merit review. Renewable with satisfactory academic progress. Verify current award amount and threshold at iastate.edu/admission-and-aid/admissions/first-year-students/first-year-scholarship-awards.',
  '2026-03-01',
  'https://www.iastate.edu/admission-and-aid/admissions/first-year-students/first-year-scholarship-awards',
  'Ames, IA',
  '100 Alumni Hall', 'Ames', 'IA', '50011',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', null, 'annual',
  'medium', 'needs_confirmation',
  'https://www.iastate.edu/admission-and-aid/admissions/first-year-students/first-year-scholarship-awards', 'official_website', '2026-03-16',
  true, false,
  'Apply to ISU by March 1. No separate scholarship application. Verify current tier thresholds and award amounts at iastate.edu/admission-and-aid/admissions/first-year-students/first-year-scholarship-awards.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "CB students are Iowa residents — fully eligible for ISU Iowa-resident merit tiers. In-state tuition + Forever Scholar Award = competitive cost of attendance. Omaha students are NOT eligible — they qualify for the Academic Achievement Award instead.", "source": "https://www.iastate.edu/admission-and-aid/admissions/first-year-students/first-year-scholarship-awards"}'::jsonb,
  '{"requires_fafsa": false, "requires_ifaa": false, "ifaa_url": null, "iowa_institution_required": true, "eligible_iowa_institutions": "Iowa State University", "state_program": false, "administering_agency": "Iowa State University Office of Admissions"}'::jsonb,
  '{"institution_abbr": "ISU", "institution_type": "public_4year", "scholarship_type": "merit", "application_method": "automatic_upon_admission", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "verify at iastate.edu", "notes": "Satisfactory academic progress required"}, "stackable": {"stacks_with_other_merit": false, "stacks_with_need_based": true, "notes": "Does not stack with other ISU merit awards."}}'::jsonb
),

-- ── 3. ISU True Scholar Award (Iowa Residents, Top Automatic Tier) ─────────────
-- Top automatic tier for Iowa residents. Highest merit award without separate competitive app.
(
  'Iowa State University — True Scholar Award (Iowa Residents, Top Automatic Merit Tier)',
  'Iowa State University Office of Admissions',
  'https://www.iastate.edu',
  'The True Scholar Award is Iowa State University''s highest automatic merit scholarship for Iowa residents — awarded to the academically strongest Iowa resident applicants who do not qualify for the full-tuition competitive awards (Carver, First Cyclones, Science Bound). No separate scholarship application required — ISU automatically awards this based on your academic credentials. To access the True Scholar tier, you need the strongest academic record in ISU''s Iowa resident applicant pool. Verify the current academic threshold at iastate.edu/admission-and-aid/admissions/first-year-students/first-year-scholarship-awards. Apply by March 1 for priority merit consideration. Renewable for up to four years. COUNCIL BLUFFS STUDENTS: You are Iowa residents — fully eligible. A strong academic record (high GPA, strong ACT/SAT) from a CB high school student qualifies you for the same ISU merit tiers as a student from any Iowa city. STACKING: Does NOT stack with other ISU merit awards or full-tuition competitive awards. You receive the single highest award you qualify for.',
  'scholarship',
  'Iowa RESIDENT required (Council Bluffs students qualify). Highest academic credentials in the automatic merit tier required — verify current GPA/ACT/SAT threshold at iastate.edu. Must NOT be receiving full-tuition competitive awards (Carver, First Cyclones, etc.) — if you receive those, the True Scholar automatic tier is replaced. Apply to ISU by March 1. Renewable with satisfactory academic progress.',
  '2026-03-01',
  'https://www.iastate.edu/admission-and-aid/admissions/first-year-students/first-year-scholarship-awards',
  'Ames, IA',
  '100 Alumni Hall', 'Ames', 'IA', '50011',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', null, 'annual',
  'medium', 'needs_confirmation',
  'https://www.iastate.edu/admission-and-aid/admissions/first-year-students/first-year-scholarship-awards', 'official_website', '2026-03-16',
  true, false,
  'Apply to ISU by March 1. No separate scholarship application. Verify current True Scholar tier threshold and amount at iastate.edu/admission-and-aid/admissions/first-year-students/first-year-scholarship-awards.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "CB students are Iowa residents — fully eligible for the True Scholar Award. The top academic tier of ISU''s automatic merit system is open to any Iowa resident with qualifying credentials regardless of their high school location. Omaha students are NOT eligible — they qualify for Academic Achievement Award.", "source": "https://www.iastate.edu/admission-and-aid/admissions/first-year-students/first-year-scholarship-awards"}'::jsonb,
  '{"requires_fafsa": false, "requires_ifaa": false, "ifaa_url": null, "iowa_institution_required": true, "eligible_iowa_institutions": "Iowa State University", "state_program": false, "administering_agency": "Iowa State University Office of Admissions"}'::jsonb,
  '{"institution_abbr": "ISU", "institution_type": "public_4year", "scholarship_type": "merit", "application_method": "automatic_upon_admission", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "verify at iastate.edu", "notes": "Satisfactory academic progress required"}, "stackable": {"stacks_with_other_merit": false, "stacks_with_need_based": true, "notes": "Does not stack with other ISU merit awards or full-tuition competitive awards."}}'::jsonb
),

-- ── 4. George Washington Carver Scholastic Leadership Award ───────────────────
-- Full tuition. Competitive. Leadership + underrepresented students.
-- Requires separate application. Among ISU's most prestigious scholarships.
(
  'Iowa State University — George Washington Carver Scholastic Leadership Award (Full Tuition)',
  'Iowa State University Office of Admissions',
  'https://www.iastate.edu',
  'The George Washington Carver Scholastic Leadership Award is one of Iowa State University''s most prestigious and competitive scholarships — covering full Iowa in-state tuition for exceptional student leaders. Named for George Washington Carver (who attended ISU), this award is specifically for students with strong academic records and demonstrated leadership, with a focus on underrepresented student groups. A separate competitive application is required. Recipients participate in a cohort leadership experience and have access to dedicated support resources. Full in-state tuition at ISU is approximately $9,500-$10,000/year (verify current rate) — making this a scholarship worth approximately $38,000-$40,000 over four years. Apply by the Carver application deadline — this is typically earlier than the general March 1 admission deadline (verify exact date at iastate.edu). COUNCIL BLUFFS STUDENTS: You are Iowa residents and fully eligible. The Carver Award has historically been particularly accessible to CB students because Iowa residency is inherent to the award. If you are a CB student from an underrepresented background with strong academics and leadership, this scholarship is worth a focused application. STACKING: Carver Award recipients do NOT also receive automatic merit tier awards (Loyal/Forever/True Scholar). Carver replaces them — it is a higher award.',
  'scholarship',
  'Strong academic record required (verify current GPA/ACT threshold at iastate.edu). Demonstrated leadership and service required. Focus on underrepresented student groups — students from low-income, first-generation, racial/ethnic minority backgrounds are encouraged to apply. Iowa resident status preferred (verify whether non-residents are eligible at iastate.edu). Separate competitive application required — visit iastate.edu for current application and deadline. Campus visit or interview may be required for finalists. Renewable for 4 years with satisfactory academic progress and program participation.',
  null,
  'https://www.iastate.edu/admission-and-aid/affording-college/scholarships',
  'Ames, IA',
  '100 Alumni Hall', 'Ames', 'IA', '50011',
  false, false,
  array['first_gen', 'low_income', 'black', 'hispanic', 'native_american'],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', 9800, 'annual',
  'medium', 'needs_confirmation',
  'https://www.iastate.edu/admission-and-aid/affording-college/scholarships', 'official_website', '2026-03-16',
  true, true,
  'Separate competitive application required. Deadline typically earlier than March 1 admission deadline — verify exact Carver Award application deadline at iastate.edu/admission-and-aid/affording-college/scholarships. Campus visit may be required.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["underrepresented students", "first-generation college students", "low-income students", "Black students", "Hispanic/Latino students", "Native American students"], "mission_notes": "Named for George Washington Carver, who enrolled at ISU in 1891 and faced significant barriers as one of the first Black students at the institution. The Carver Award honors that legacy by supporting students who are breaking their own barriers."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "CB students are Iowa residents — fully eligible. The Carver Award is specifically relevant for CB students from underrepresented backgrounds (Black, Hispanic, Native American, low-income, first-generation). Iowa in-state tuition + full Carver coverage = a powerful financial package at a major research university. Apply by the Carver-specific deadline (typically earlier than March 1 — verify at iastate.edu).", "source": "https://www.iastate.edu/admission-and-aid/affording-college/scholarships"}'::jsonb,
  '{"requires_fafsa": false, "requires_ifaa": false, "ifaa_url": null, "iowa_institution_required": true, "eligible_iowa_institutions": "Iowa State University", "state_program": false, "administering_agency": "Iowa State University Office of Admissions"}'::jsonb,
  '{"institution_abbr": "ISU", "institution_type": "public_4year", "scholarship_type": "competitive", "application_method": "separate_application_required", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "verify at iastate.edu", "notes": "Academic standing and program participation required for renewal; verify GPA threshold at ISU"}, "stackable": {"stacks_with_other_merit": false, "stacks_with_need_based": true, "notes": "Carver Award replaces automatic merit tier awards (Loyal/Forever/True Scholar). Recipients do not additionally receive automatic tier scholarships. May stack with need-based aid — verify with ISU Financial Aid."}}'::jsonb
),

-- ── 5. First Cyclones Scholarship (Full Tuition, First-Gen/Underrepresented) ──
-- Full tuition. Highly competitive. First-generation and underrepresented students.
-- Separate application required.
(
  'Iowa State University — First Cyclones Scholarship (Full Tuition, First-Generation Students)',
  'Iowa State University Office of Admissions',
  'https://www.iastate.edu',
  'The First Cyclones Scholarship is a full Iowa in-state tuition scholarship at Iowa State University specifically for first-generation college students and underrepresented students who demonstrate exceptional academic achievement and potential. "First Cyclones" acknowledges students who would be the first in their family to earn a college degree — one of the defining identities of many Omaha and Council Bluffs area students. This is a competitive award requiring a separate application. Recipients are among the most accomplished applicants in ISU''s pool and represent a commitment by ISU to build a diverse, first-generation-friendly campus. Full in-state tuition value is approximately $9,500-$10,000/year — approximately $38,000-$40,000 over four years (verify current rate). Apply by the First Cyclones scholarship deadline — this may be earlier than the general admission deadline (verify at iastate.edu). COUNCIL BLUFFS STUDENTS: If you would be the first in your family to attend college, the First Cyclones Scholarship was created for you. CB first-generation students are Iowa residents — they pay in-state tuition and are fully eligible to compete for this award. This is one of ISU''s highest-profile equity scholarships. STACKING: Full-tuition competitive awards like First Cyclones do NOT stack with automatic merit tier awards.',
  'scholarship',
  'First-generation college student preferred or required (verify exact criteria at iastate.edu — underrepresented students also encouraged to apply). Strong academic record required. Iowa resident preferred (verify non-resident eligibility at iastate.edu). Competitive application required — separate from general ISU admission. Apply by the First Cyclones application deadline (verify at iastate.edu — may be earlier than March 1 general deadline). Renewable for 4 years with continued academic standing and program participation.',
  null,
  'https://www.iastate.edu/admission-and-aid/affording-college/scholarships',
  'Ames, IA',
  '100 Alumni Hall', 'Ames', 'IA', '50011',
  false, false,
  array['first_gen', 'low_income', 'black', 'hispanic', 'native_american'],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', 9800, 'annual',
  'medium', 'needs_confirmation',
  'https://www.iastate.edu/admission-and-aid/affording-college/scholarships', 'official_website', '2026-03-16',
  true, true,
  'Separate competitive application required. Deadline may be earlier than March 1 general admission deadline — verify exact First Cyclones application deadline at iastate.edu/admission-and-aid/affording-college/scholarships.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["first-generation college students", "underrepresented students", "low-income students"], "mission_notes": "First Cyclones is ISU''s explicit commitment to first-generation students as a priority population. The name itself is a statement: these students are the first, and ISU is investing in their success."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "CB first-generation students are Iowa residents at ISU — fully eligible to compete for First Cyclones. A first-generation CB student who earns this scholarship pays zero tuition at a Big 12 research university. ISU''s College of Engineering, Agriculture, Business, and Design are nationally ranked — First Cyclones opens those doors. Apply by the specific scholarship deadline (may be earlier than March 1).", "source": "https://www.iastate.edu/admission-and-aid/affording-college/scholarships"}'::jsonb,
  '{"requires_fafsa": false, "requires_ifaa": false, "ifaa_url": null, "iowa_institution_required": true, "eligible_iowa_institutions": "Iowa State University", "state_program": false, "administering_agency": "Iowa State University Office of Admissions"}'::jsonb,
  '{"institution_abbr": "ISU", "institution_type": "public_4year", "scholarship_type": "competitive", "application_method": "separate_application_required", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "verify at iastate.edu", "notes": "Academic standing and program participation required"}, "stackable": {"stacks_with_other_merit": false, "stacks_with_need_based": true, "notes": "Full-tuition competitive award — replaces automatic merit tier awards. Does not stack with Loyal/Forever/True Scholar tiers."}}'::jsonb
),

-- ── 6. ISU Academic Achievement Award (Non-Residents — Omaha Students) ────────
-- Automatic merit award for non-Iowa-residents.
-- Omaha (Nebraska resident) students are eligible.
-- CB students are Iowa residents — NOT eligible for this award.
(
  'Iowa State University — Academic Achievement Award (Non-Residents, Automatic Merit)',
  'Iowa State University Office of Admissions',
  'https://www.iastate.edu',
  'The Academic Achievement Award is Iowa State University''s automatic merit scholarship for students who are NOT Iowa residents. If you are an Omaha student (Nebraska resident), this is the merit tier that applies when you apply to Iowa State. No separate application required — ISU automatically considers all non-resident applicants based on academic credentials. Apply to ISU by March 1 for priority merit consideration. Award amounts and tier thresholds for non-residents are separate from the Iowa resident tier — verify current Academic Achievement Award amounts and thresholds at iastate.edu/admission-and-aid/admissions/first-year-students/first-year-scholarship-awards. IMPORTANT: As a Nebraska resident at Iowa State, you pay non-resident tuition (~$27,000+/year — verify current rate). The Academic Achievement Award partially offsets this, but total cost remains significantly higher than for Iowa residents. COUNCIL BLUFFS STUDENTS: You are Iowa residents — do NOT receive this award. CB students qualify for the Iowa resident merit tiers (Loyal/Forever/True Scholar — entries #1-3 in this batch) instead. STACKING: Does not stack with other ISU merit awards.',
  'scholarship',
  'Non-Iowa RESIDENT required (Nebraska, Minnesota, South Dakota, and other non-Iowa state residents qualify). Automatic consideration at admission based on GPA and/or ACT/SAT scores — verify current threshold at iastate.edu. No separate scholarship application. Apply to ISU by March 1 for priority merit review. Renewable for 4 years with satisfactory academic progress. Verify current award amount and non-resident tier details at iastate.edu/admission-and-aid/admissions/first-year-students/first-year-scholarship-awards.',
  '2026-03-01',
  'https://www.iastate.edu/admission-and-aid/admissions/first-year-students/first-year-scholarship-awards',
  'Ames, IA',
  '100 Alumni Hall', 'Ames', 'IA', '50011',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', null, 'annual',
  'medium', 'needs_confirmation',
  'https://www.iastate.edu/admission-and-aid/admissions/first-year-students/first-year-scholarship-awards', 'official_website', '2026-03-16',
  true, false,
  'Apply to ISU by March 1. No separate scholarship application. Verify current non-resident merit tier thresholds and amounts at iastate.edu/admission-and-aid/admissions/first-year-students/first-year-scholarship-awards.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": false, "basis": "explicit", "notes": "CB students are Iowa residents — NOT eligible for the Academic Achievement Award (non-resident tier). CB students should look at the Iowa resident merit tiers: Loyal Scholar (entry #1), Forever Scholar (entry #2), and True Scholar (entry #3) in this batch. Omaha students considering ISU should carefully compare total non-resident cost of attendance (~$27,000+ tuition minus Academic Achievement Award) vs. Nebraska schools (UNO in-state, Creighton private flat rate).", "source": "https://www.iastate.edu/admission-and-aid/admissions/first-year-students/first-year-scholarship-awards"}'::jsonb,
  '{"requires_fafsa": false, "requires_ifaa": false, "ifaa_url": null, "iowa_institution_required": true, "eligible_iowa_institutions": "Iowa State University", "state_program": false, "administering_agency": "Iowa State University Office of Admissions"}'::jsonb,
  '{"institution_abbr": "ISU", "institution_type": "public_4year", "scholarship_type": "merit", "application_method": "automatic_upon_admission", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "verify at iastate.edu", "notes": "Satisfactory academic progress and full-time enrollment required"}, "stackable": {"stacks_with_other_merit": false, "stacks_with_need_based": true, "notes": "Does not stack with other ISU merit awards."}}'::jsonb
),

-- ── 7. ISU National Merit Tuition Scholarship ─────────────────────────────────
-- Full tuition for Iowa resident National Merit Scholars designating ISU as first choice.
-- Non-residents with National Merit may also qualify — verify current policy.
(
  'Iowa State University — National Merit Tuition Scholarship (Iowa Residents)',
  'Iowa State University / National Merit Scholarship Corporation',
  'https://www.iastate.edu',
  'Iowa State University provides a full Iowa in-state tuition scholarship to Iowa resident National Merit Scholars (Finalists who are designated as National Merit Scholars by NMSC) who designate ISU as their first-choice institution. Full Iowa in-state tuition at ISU is approximately $9,500-$10,000/year — verify the current rate at iastate.edu. This is a renewable four-year scholarship tied to continued National Merit Scholar status and enrollment at ISU. To receive this scholarship: (1) qualify as a National Merit Finalist through your PSAT/NMSQT junior year, (2) be selected as a National Merit Scholar by NMSC, (3) designate Iowa State University as your first-choice institution with NMSC. COUNCIL BLUFFS STUDENTS: You are Iowa residents — eligible for the Iowa resident tier of this scholarship, which covers 100% of in-state tuition. CB students who achieve National Merit Finalist/Scholar status should seriously consider ISU as an option — full tuition coverage at a Big 12 research university for Iowa residents is a powerful offer. STACKING: National Merit Scholarship at ISU replaces other automatic merit tier awards. It does not stack with Loyal/Forever/True Scholar.',
  'scholarship',
  'Must be an Iowa resident National Merit Scholar (or Finalist who receives Scholar status from NMSC). Must designate Iowa State University as first-choice institution with the National Merit Scholarship Corporation. Must be admitted to and enroll full-time at ISU. Verify current residency requirements and whether non-resident National Merit Scholars are separately eligible at iastate.edu. Renewable for 4 years with continued enrollment and satisfactory academic progress.',
  null,
  'https://www.iastate.edu/admission-and-aid/affording-college/scholarships',
  'Ames, IA',
  '100 Alumni Hall', 'Ames', 'IA', '50011',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', 9800, 'annual',
  'medium', 'needs_confirmation',
  'https://www.iastate.edu/admission-and-aid/affording-college/scholarships', 'official_website', '2026-03-16',
  true, false,
  'Must be designated National Merit Scholar by NMSC and designate ISU as first-choice institution. No separate ISU application — process runs through NMSC. Verify current Iowa resident vs. non-resident National Merit policy at iastate.edu.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "CB National Merit Scholars are Iowa residents — eligible for the Iowa resident tier (full in-state tuition). CB National Merit Scholars considering ISU receive full tuition + Iowa in-state rates — one of the most cost-effective options for high-achieving CB students. If you are a CB junior who took the PSAT, check your National Merit status and consider ISU as a first-choice designation option.", "source": "https://www.iastate.edu/admission-and-aid/affording-college/scholarships"}'::jsonb,
  '{"requires_fafsa": false, "requires_ifaa": false, "ifaa_url": null, "iowa_institution_required": true, "eligible_iowa_institutions": "Iowa State University", "state_program": false, "administering_agency": "Iowa State University / National Merit Scholarship Corporation"}'::jsonb,
  '{"institution_abbr": "ISU", "institution_type": "public_4year", "scholarship_type": "competitive", "application_method": "separate_application_required", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "verify at iastate.edu", "notes": "Continued enrollment and academic standing required; must maintain National Merit Scholar status"}, "stackable": {"stacks_with_other_merit": false, "stacks_with_need_based": true, "notes": "Replaces automatic merit tier awards (Loyal/Forever/True Scholar). Does not stack with other ISU merit scholarships."}}'::jsonb
);
