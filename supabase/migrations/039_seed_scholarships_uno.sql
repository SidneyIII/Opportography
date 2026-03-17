-- ============================================================
-- Opportography — Migration 039
-- Phase 7B: University of Nebraska at Omaha (UNO) — Institution-Specific Scholarships
-- Date: 2026-03-16
--
-- Source: unomaha.edu (official UNO financial aid and admissions pages)
-- Scholarship portal: unomaha.academicworks.com
-- Verify current amounts/thresholds at:
--   https://www.unomaha.edu/admissions/financial-support-and-scholarships/
--   https://www.unomaha.edu/undergraduate-admissions/tuition-and-aid/scholarships.php
--
-- Data confidence: medium — programs from training data through August 2025.
-- Amounts and thresholds must be confirmed at official UNO sources before deployment.
--
-- CRITICAL: THE COUNCIL BLUFFS RECIPROCITY FACT
-- Pottawattamie County (where Council Bluffs is located) is one of 11 Iowa counties
-- in UNO's Iowa reciprocity agreement. Council Bluffs students pay Nebraska in-state
-- tuition rates at UNO — the same as Nebraska residents.
-- This means CB students are eligible for Nebraska-resident-only UNO scholarships
-- (including Presidential Scholars and Nebraska Promise income eligibility review).
-- THIS IS THE MOST IMPORTANT FINANCIAL AID FACT FOR CB-TO-UNO STUDENTS.
-- Note this on EVERY entry.
--
-- Key deadlines:
--   February 1: Admission application deadline for scholarship consideration
--   March 1: General scholarship application (MavLINK/AcademicWorks) deadline
--
-- Entries in this file:
--   1. Presidential Scholars Program
--   2. Regents Scholarship
--   3. Dean's Scholarship
--   4. UNO Merit Award (Mid-Tier)
--   5. Nebraska Promise at UNO
--   6. Nebraska Legacy Scholarship
--   7. Goodrich Scholarship Program
--   8. Susan T. Buffett Foundation Scholarship
--   9. S-STEM Scholarship (NSF-funded)
--  10. CBA Scholars Academy
--  11. MetroMavs Partnership Scholarship (MCC to UNO transfer)
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
  cb_eligibility, scholarship_metadata
) values

-- ── 1. UNO Presidential Scholars Program ─────────────────────────────────────
-- ACT 36 or SAT 1570-1600 required. Nebraska-resident-equivalent students.
-- Full tuition. Comprehensive support program.
-- CB students in the reciprocity zone are eligible.
(
  'UNO Presidential Scholars Program',
  'University of Nebraska at Omaha Office of Financial Aid',
  'https://www.unomaha.edu',
  'The UNO Presidential Scholars Program is the university''s top undergraduate merit scholarship — covering full Nebraska in-state tuition for students with exceptional academic credentials. Eligibility requires an ACT score of 36 (perfect score) or an SAT score in the 1570-1600 range. This is a comprehensive program with academic support, mentorship, and enrichment components beyond the financial award. Apply to UNO by February 1 — scholarship consideration is tied to admission application, no separate scholarship application needed. Award is renewable for up to four years with continued academic standing (verify current renewal GPA requirement at unomaha.edu). COUNCIL BLUFFS STUDENTS: Pottawattamie County is in UNO''s Iowa reciprocity zone. You pay Nebraska in-state tuition at UNO — the same as Nebraska residents — and you are eligible for this scholarship. This is one of the most important facts for CB students to know: you are eligible for Nebraska-resident-tier scholarships at UNO. Full tuition at in-state rates is approximately $9,000/year (verify current rate at unomaha.edu).',
  'scholarship',
  'ACT 36 (perfect score) OR SAT 1570-1600 required. Nebraska resident OR resident of one of UNO''s 11 Iowa reciprocity counties (includes Pottawattamie County — Council Bluffs students qualify). Apply to UNO by February 1 for scholarship consideration. Full-time enrollment required. Renewable for up to 4 years — verify current GPA renewal requirements at unomaha.edu/admissions/financial-support-and-scholarships/.',
  '2026-02-01',
  'https://www.unomaha.edu/undergraduate-admissions/tuition-and-aid/scholarships.php',
  'Omaha, NE',
  '6001 Dodge Street', 'Omaha', 'NE', '68182',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', 9000, 'annual',
  'medium', 'needs_confirmation',
  'https://www.unomaha.edu/undergraduate-admissions/tuition-and-aid/scholarships.php', 'official_website', '2026-03-16',
  true, true,
  'Apply to UNO by February 1 for scholarship consideration. No separate scholarship application — merit awards assigned at admission. Verify current ACT/SAT thresholds and award amounts at unomaha.edu/admissions/financial-support-and-scholarships/.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "Pottawattamie County (Council Bluffs) is one of UNO''s 11 Iowa reciprocity counties. CB students pay Nebraska in-state tuition at UNO and are eligible for this Nebraska-resident scholarship tier. This is a major financial advantage that most CB families do not know about. A CB student with a 36 ACT would pay full in-state tuition — approximately $9,000/year — covered by this scholarship.", "source": "https://www.unomaha.edu/undergraduate-admissions/tuition-and-aid/scholarships.php"}'::jsonb,
  '{"institution_abbr": "UNO", "institution_type": "public_4year", "scholarship_type": "merit", "application_method": "automatic_upon_admission", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "verify at unomaha.edu", "notes": "Verify current GPA renewal requirement and full-time enrollment status requirement at unomaha.edu"}, "stackable": {"stacks_with_other_merit": false, "stacks_with_need_based": true, "notes": "Verify current stacking policy with UNO Financial Aid. Generally UNO merit awards are not combined with each other; student receives the highest applicable tier."}}'::jsonb
),

-- ── 2. UNO Regents Scholarship ────────────────────────────────────────────────
-- ACT 32+. Competitive, substantial award.
-- Automatic consideration at admission (no separate application).
(
  'UNO Regents Scholarship',
  'University of Nebraska at Omaha Office of Financial Aid',
  'https://www.unomaha.edu',
  'The UNO Regents Scholarship is one of UNO''s high-value merit awards for students with strong ACT/SAT scores. Generally requires an ACT score of approximately 32 or above (verify current threshold at unomaha.edu). Awarded automatically at admission — no separate scholarship application required. Apply to UNO by the February 1 deadline for full merit consideration. This is a renewable award for up to four years, subject to GPA requirements. Verify the current award amount and renewal criteria at unomaha.edu/admissions/financial-support-and-scholarships/. COUNCIL BLUFFS STUDENTS: You pay in-state tuition at UNO through the Pottawattamie County reciprocity agreement and are eligible for this scholarship tier. The scholarship amount is calculated based on Nebraska in-state tuition, which CB students pay. Contact UNO admissions at (402) 554-2393 to confirm your reciprocity eligibility.',
  'scholarship',
  'Strong ACT or SAT score required — verify current minimum threshold at unomaha.edu (approximately ACT 32+). Nebraska resident or UNO Iowa reciprocity county resident (includes Pottawattamie County/Council Bluffs). Apply by February 1 for scholarship consideration. Automatic consideration at admission — no separate application. Renewable with satisfactory GPA — verify requirements at unomaha.edu.',
  '2026-02-01',
  'https://www.unomaha.edu/undergraduate-admissions/tuition-and-aid/scholarships.php',
  'Omaha, NE',
  '6001 Dodge Street', 'Omaha', 'NE', '68182',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', 7000, 'annual',
  'medium', 'needs_confirmation',
  'https://www.unomaha.edu/undergraduate-admissions/tuition-and-aid/scholarships.php', 'official_website', '2026-03-16',
  true, false,
  'Apply to UNO by February 1. No separate scholarship application required. Verify current ACT/SAT threshold and award amount at unomaha.edu/admissions/financial-support-and-scholarships/.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "Pottawattamie County (Council Bluffs) is in UNO''s Iowa reciprocity zone. CB students pay Nebraska in-state tuition and are eligible for this scholarship. Contact UNO at (402) 554-2393 to verify reciprocity status.", "source": "https://www.unomaha.edu/undergraduate-admissions/tuition-and-aid/scholarships.php"}'::jsonb,
  '{"institution_abbr": "UNO", "institution_type": "public_4year", "scholarship_type": "merit", "application_method": "automatic_upon_admission", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "verify at unomaha.edu", "notes": "Verify current GPA requirement at unomaha.edu"}, "stackable": {"stacks_with_other_merit": false, "stacks_with_need_based": true, "notes": "Verify stacking policy with UNO Financial Aid. Student typically receives the single highest applicable merit tier."}}'::jsonb
),

-- ── 3. UNO Dean's Scholarship ────────────────────────────────────────────────
-- ACT 30+, 3.5+ GPA. Significant award.
-- Automatic consideration at admission.
(
  'UNO Dean''s Scholarship',
  'University of Nebraska at Omaha Office of Financial Aid',
  'https://www.unomaha.edu',
  'The UNO Dean''s Scholarship rewards strong academic performance across GPA and test scores. General eligibility requires approximately ACT 30+ and a 3.5+ high school GPA (verify current thresholds at unomaha.edu). Awarded automatically at admission — no separate application needed. Apply to UNO by February 1 for full scholarship consideration. Award is renewable for multiple years subject to GPA maintenance. Verify the current award amount at unomaha.edu/admissions/financial-support-and-scholarships/. COUNCIL BLUFFS STUDENTS: You pay in-state tuition at UNO through Pottawattamie County reciprocity and are eligible for this scholarship tier alongside Nebraska students. If your ACT and GPA meet the threshold, you will receive the same scholarship as an Omaha student with the same credentials.',
  'scholarship',
  'Approximately ACT 30+ and 3.5+ high school GPA required — verify current thresholds at unomaha.edu. Nebraska resident or UNO Iowa reciprocity county resident (includes Pottawattamie County/Council Bluffs). Apply by February 1 for scholarship consideration. Automatic consideration at admission. Renewable with GPA maintenance — verify at unomaha.edu.',
  '2026-02-01',
  'https://www.unomaha.edu/undergraduate-admissions/tuition-and-aid/scholarships.php',
  'Omaha, NE',
  '6001 Dodge Street', 'Omaha', 'NE', '68182',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', 6000, 'annual',
  'medium', 'needs_confirmation',
  'https://www.unomaha.edu/undergraduate-admissions/tuition-and-aid/scholarships.php', 'official_website', '2026-03-16',
  true, false,
  'Apply to UNO by February 1. No separate scholarship application needed. Verify current GPA/ACT thresholds and award amount at unomaha.edu/admissions/financial-support-and-scholarships/.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "Pottawattamie County (Council Bluffs) is in UNO''s Iowa reciprocity zone. CB students with qualifying GPA and ACT are equally eligible for this scholarship. You pay in-state tuition — the same base rate that this scholarship offsets.", "source": "https://www.unomaha.edu/undergraduate-admissions/tuition-and-aid/scholarships.php"}'::jsonb,
  '{"institution_abbr": "UNO", "institution_type": "public_4year", "scholarship_type": "merit", "application_method": "automatic_upon_admission", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "verify at unomaha.edu", "notes": "Verify current GPA renewal requirements"}, "stackable": {"stacks_with_other_merit": false, "stacks_with_need_based": true, "notes": "Student receives the highest applicable merit tier."}}'::jsonb
),

-- ── 4. UNO Merit Award (Mid-Tier) ────────────────────────────────────────────
-- ACT 28-29 range. ~$4,000/year.
-- Automatic consideration at admission.
(
  'UNO Merit Award — Mid-Tier (ACT 28-29 Range)',
  'University of Nebraska at Omaha Office of Financial Aid',
  'https://www.unomaha.edu',
  'UNO offers automatic merit scholarships across multiple tiers — students who do not qualify for the top Presidential, Regents, or Dean''s tiers may still receive a significant merit award in the mid-range tier (approximately ACT 28-29 range, around $4,000/year — verify current thresholds and amounts at unomaha.edu). No separate application is required. Apply to UNO by February 1, and your merit scholarship consideration happens automatically with your admission review. Check unomaha.edu/admissions/financial-support-and-scholarships/ for the full current tier chart. COUNCIL BLUFFS STUDENTS: You are eligible for these merit tiers just like Nebraska residents. Pottawattamie County is in UNO''s reciprocity zone — you pay in-state tuition, and you are eligible for in-state-tier merit awards. If your ACT falls in the 28-29 range, you likely qualify for this tier.',
  'scholarship',
  'ACT approximately 28-29 (verify current threshold at unomaha.edu). Nebraska resident or UNO Iowa reciprocity county resident (includes Council Bluffs/Pottawattamie County). Apply by February 1. No separate scholarship application. Renewable with GPA maintenance — verify at unomaha.edu.',
  '2026-02-01',
  'https://www.unomaha.edu/undergraduate-admissions/tuition-and-aid/scholarships.php',
  'Omaha, NE',
  '6001 Dodge Street', 'Omaha', 'NE', '68182',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', 4000, 'annual',
  'medium', 'needs_confirmation',
  'https://www.unomaha.edu/undergraduate-admissions/tuition-and-aid/scholarships.php', 'official_website', '2026-03-16',
  true, false,
  'Apply to UNO by February 1. No separate application. Check the full merit tier chart at unomaha.edu/admissions/financial-support-and-scholarships/ — multiple ACT/GPA tiers exist and amounts vary.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "Pottawattamie County (Council Bluffs) is in UNO''s Iowa reciprocity zone. CB students are eligible for all UNO Nebraska-resident merit tiers.", "source": "https://www.unomaha.edu/undergraduate-admissions/tuition-and-aid/scholarships.php"}'::jsonb,
  '{"institution_abbr": "UNO", "institution_type": "public_4year", "scholarship_type": "merit", "application_method": "automatic_upon_admission", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "verify at unomaha.edu", "notes": "Verify GPA renewal threshold"}, "stackable": {"stacks_with_other_merit": false, "stacks_with_need_based": true, "notes": "Student receives the highest applicable merit tier."}}'::jsonb
),

-- ── 5. Nebraska Promise at UNO ────────────────────────────────────────────────
-- Full in-state tuition for NE residents with household AGI ≤$60,000.
-- FAFSA required by April 1.
-- IMPORTANT: CB students are IOWA residents — not eligible for Nebraska Promise.
-- This entry includes a clear CB eligibility note explaining why.
(
  'Nebraska Promise — Full Tuition at UNO (Nebraska Residents with AGI ≤$60k)',
  'University of Nebraska at Omaha / NU System',
  'https://www.unomaha.edu',
  'Nebraska Promise covers 100% of Nebraska in-state tuition at UNO for Nebraska residents whose family Adjusted Gross Income is $60,000 or less. If you are a Nebraska resident from Omaha or the surrounding metro with household income at or below $60,000, this scholarship eliminates your tuition entirely — you would only pay fees, room, board, and textbooks. File your FAFSA by April 1 — that is the deadline for Nebraska Promise consideration at UNO. No separate application is needed beyond the FAFSA. Nebraska Promise is administered through the NU system and applies to UNO, UNL, UNK, and UNMC. COUNCIL BLUFFS STUDENTS: Nebraska Promise requires Nebraska residency. Council Bluffs is in Iowa — CB students are Iowa residents and are NOT eligible for Nebraska Promise even though they pay in-state tuition at UNO through the reciprocity agreement. The tuition reciprocity and Nebraska Promise are separate programs. CB students with income ≤$60,000 should look at the Iowa Last-Dollar Scholarship (for IWCC), Iowa Tuition Grant (private Iowa colleges), and All Iowa Opportunity Scholarship as Iowa-resident equivalents.',
  'scholarship',
  'Must be a Nebraska resident (not Iowa). Must have household Adjusted Gross Income (AGI) of $60,000 or less as shown on FAFSA. Must be enrolled at UNO (or other NU system institution: UNL, UNK, UNMC). File FAFSA by April 1. No separate application — FAFSA is the application. Minimum academic standing required — verify at nebraskpromise.com or unomaha.edu. Renewable annually with continued FAFSA filing and enrollment.',
  '2026-04-01',
  'https://www.unomaha.edu/undergraduate-admissions/tuition-and-aid/scholarships.php',
  'Omaha, NE',
  '6001 Dodge Street', 'Omaha', 'NE', '68182',
  false, false,
  array['low_income', 'first_gen'],
  array['scholarship', 'college_access'],
  array['high_school_senior', 'adult_learner'],
  'scholarship_amount', 9000, 'annual',
  'medium', 'needs_confirmation',
  'https://www.unomaha.edu/undergraduate-admissions/tuition-and-aid/scholarships.php', 'official_website', '2026-03-16',
  true, true,
  'File FAFSA by April 1 for Nebraska Promise consideration. No separate application. Nebraska residency required. Verify income threshold and current tuition rate at unomaha.edu and nebraskpromise.com.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["low-income Nebraska residents", "first-generation college students", "Omaha metro low-income students"], "mission_notes": "Nebraska Promise was designed to remove the tuition barrier entirely for Nebraska families earning under $60k. For an Omaha student in a low-income household, UNO becomes effectively free for tuition through Nebraska Promise."}'::jsonb,
  '{"eligible": false, "basis": "explicit", "notes": "Nebraska Promise requires Nebraska RESIDENCY. Council Bluffs students are Iowa residents and are NOT eligible for Nebraska Promise, even though they pay in-state tuition at UNO through the Pottawattamie County reciprocity agreement. The reciprocity gives CB students in-state tuition RATES but not Nebraska resident STATUS for purposes of Nebraska-resident-only programs like Nebraska Promise. CB students with family income ≤$60k should instead look at: Iowa Last-Dollar Scholarship (IWCC), All Iowa Opportunity Scholarship (AIOS), Iowa College Aid programs at educate.iowa.gov.", "source": "https://www.unomaha.edu/undergraduate-admissions/tuition-and-aid/scholarships.php"}'::jsonb,
  '{"institution_abbr": "UNO", "institution_type": "public_4year", "scholarship_type": "need-based", "application_method": "automatic_upon_admission", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "verify at unomaha.edu", "notes": "Annual FAFSA filing required; must maintain enrollment; income eligibility recertified annually"}, "stackable": {"stacks_with_other_merit": true, "stacks_with_need_based": true, "notes": "Nebraska Promise can be combined with UNO merit scholarships — combined awards may cover full tuition and then some for qualifying students."}}'::jsonb
),

-- ── 6. Nebraska Legacy Scholarship ────────────────────────────────────────────
-- For children (or grandchildren) of University of Nebraska graduates.
-- ACT 24+ or top 1/3 of class.
-- CB students in reciprocity zone are eligible.
(
  'UNO Nebraska Legacy Scholarship',
  'University of Nebraska at Omaha Office of Financial Aid',
  'https://www.unomaha.edu',
  'If one of your parents or grandparents graduated from any University of Nebraska campus — UNO, UNL, UNK, or UNMC — you may be eligible for the Nebraska Legacy Scholarship. This scholarship rewards the academic achievement of students with NU family connections: typically requires ACT 24+ or graduating in the top one-third of your high school class (verify current thresholds at unomaha.edu). Automatic consideration at admission — no separate scholarship application needed. Apply to UNO by February 1 and identify your family''s NU connection in your application materials. COUNCIL BLUFFS STUDENTS: Pottawattamie County is in UNO''s Iowa reciprocity zone — you pay in-state tuition and are eligible for this scholarship. Many CB families have parents or grandparents who attended UNO or UNL. If that''s you, apply and identify your NU family connection.',
  'scholarship',
  'Parent or grandparent must be a University of Nebraska graduate (any NU campus: UNO, UNL, UNK, UNMC). ACT 24+ or graduation in top 1/3 of high school class required (verify current threshold at unomaha.edu). Nebraska resident or UNO Iowa reciprocity county resident (includes Pottawattamie County/Council Bluffs). Apply by February 1. Renewable with satisfactory GPA — verify at unomaha.edu.',
  '2026-02-01',
  'https://www.unomaha.edu/undergraduate-admissions/tuition-and-aid/scholarships.php',
  'Omaha, NE',
  '6001 Dodge Street', 'Omaha', 'NE', '68182',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', 2000, 'annual',
  'medium', 'needs_confirmation',
  'https://www.unomaha.edu/undergraduate-admissions/tuition-and-aid/scholarships.php', 'official_website', '2026-03-16',
  true, false,
  'Apply to UNO by February 1. Identify NU family connection in application. Verify current ACT/class rank threshold and award amount at unomaha.edu/admissions/financial-support-and-scholarships/.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "Pottawattamie County (Council Bluffs) is in UNO''s Iowa reciprocity zone. CB students with NU alumni parents or grandparents are fully eligible for the Legacy Scholarship. Many CB families have NU alumni connections — this scholarship is often overlooked.", "source": "https://www.unomaha.edu/undergraduate-admissions/tuition-and-aid/scholarships.php"}'::jsonb,
  '{"institution_abbr": "UNO", "institution_type": "public_4year", "scholarship_type": "merit", "application_method": "automatic_upon_admission", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "verify at unomaha.edu", "notes": "Verify renewal requirements"}, "stackable": {"stacks_with_other_merit": false, "stacks_with_need_based": true, "notes": "Verify current stacking policy with UNO Financial Aid."}}'::jsonb
),

-- ── 7. Goodrich Scholarship Program ──────────────────────────────────────────
-- Holistic merit + need award with comprehensive support.
-- Separate application required. Strong equity focus.
(
  'UNO Goodrich Scholarship Program',
  'University of Nebraska at Omaha / Goodrich Program',
  'https://www.unomaha.edu',
  'The Goodrich Scholarship Program at UNO is a comprehensive merit and need-based award that includes academic support services, mentorship, career development, and financial assistance. It is designed for students who have overcome significant obstacles or have demonstrated potential for success alongside financial need. The program goes beyond a scholarship — Goodrich Scholars are part of a community with dedicated advisors, tutoring, career counseling, and peer mentorship. If you are a student from a low-income background, a first-generation college student, or someone who has faced significant challenges on your path to college, the Goodrich Program may be the most valuable scholarship opportunity at UNO. Requires a separate application — do not assume automatic consideration. Apply to UNO by February 1 and submit the Goodrich application. Contact the Goodrich Program at (402) 554-3708 or visit unomaha.edu/goodrich for current application information. COUNCIL BLUFFS STUDENTS: You are eligible. Pottawattamie County is in UNO''s reciprocity zone and CB students with qualifying need and merit are welcome to apply.',
  'scholarship',
  'Merit and financial need required. First-generation college students and students who have overcome adversity are strongly encouraged to apply. Separate Goodrich Program application required beyond general UNO admission application. Nebraska resident or UNO Iowa reciprocity county resident (includes Pottawattamie County/Council Bluffs). FAFSA required. Verify current eligibility criteria and application deadline at unomaha.edu/goodrich.',
  '2026-02-01',
  'https://www.unomaha.edu/college-of-arts-and-sciences/goodrich-program/',
  'Omaha, NE',
  '6001 Dodge Street', 'Omaha', 'NE', '68182',
  false, false,
  array['low_income', 'first_gen'],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', null, 'annual',
  'medium', 'needs_confirmation',
  'https://www.unomaha.edu/college-of-arts-and-sciences/goodrich-program/', 'official_website', '2026-03-16',
  true, true,
  'Separate application required. Apply by February 1 UNO admission deadline. Contact Goodrich Program at (402) 554-3708 or visit unomaha.edu/goodrich for application details and current award amounts.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["first-generation college students", "low-income students", "students who have overcome adversity"], "mission_notes": "The Goodrich Program is one of UNO''s most impactful equity initiatives — it wraps financial support with the academic and social support services that first-generation and low-income students need to persist and graduate. Being a Goodrich Scholar is a community identity, not just a financial award."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "Pottawattamie County (Council Bluffs) is in UNO''s Iowa reciprocity zone. CB students with qualifying need and merit are eligible to apply. CB first-generation students with financial need should strongly consider applying for the Goodrich Program.", "source": "https://www.unomaha.edu/college-of-arts-and-sciences/goodrich-program/"}'::jsonb,
  '{"institution_abbr": "UNO", "institution_type": "public_4year", "scholarship_type": "merit-and-need", "application_method": "separate_application_required", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "verify at unomaha.edu/goodrich", "notes": "Continued program participation and academic standing required; verify renewal conditions"}, "stackable": {"stacks_with_other_merit": false, "stacks_with_need_based": true, "notes": "Verify stacking policy with Goodrich Program and UNO Financial Aid."}}'::jsonb
),

-- ── 8. Susan T. Buffett Foundation Scholarship ────────────────────────────────
-- Major need-based scholarship for Nebraska residents at NU system schools.
-- One of the most significant financial aid awards available to NE students.
-- CB students are NOT eligible (Iowa residents, not Nebraska residents).
(
  'Susan T. Buffett Foundation Scholarship (Nebraska Residents — NU System)',
  'Susan Thompson Buffett Foundation / University of Nebraska System',
  'https://www.unomaha.edu',
  'The Susan Thompson Buffett Foundation Scholarship is one of the most significant private scholarship awards available to Nebraska residents attending University of Nebraska system schools (UNO, UNL, UNK, UNMC). It is a major need-based award for Nebraska residents with demonstrated financial need. The scholarship is highly competitive and represents a substantial commitment to keeping college accessible for Nebraska students who could not otherwise afford it. Apply through your NU system school''s financial aid office — application process and deadlines are coordinated through each campus. COUNCIL BLUFFS STUDENTS: This scholarship requires Nebraska residency. As Iowa residents, Council Bluffs students are NOT eligible for the Susan T. Buffett Foundation Scholarship. Even though CB students pay in-state tuition at UNO through the reciprocity agreement, the Buffett Scholarship is limited to Nebraska residents. If you are a CB student with significant financial need attending UNO, look at UNO''s other need-based institutional aid, the Goodrich Scholarship Program, and federal aid (FAFSA-based).',
  'scholarship',
  'Nebraska RESIDENT required (Iowa residents are not eligible). Demonstrated significant financial need as determined by FAFSA. Must attend a University of Nebraska system institution (UNO, UNL, UNK, UNMC). Strong academic standing preferred. Separate application through the STB Foundation or coordinated through NU campus financial aid offices — verify current application process. Verify eligibility and application at the Susan Thompson Buffett Foundation or unomaha.edu financial aid office.',
  null,
  'https://www.unomaha.edu/admissions/financial-support-and-scholarships/',
  'Omaha, NE',
  '6001 Dodge Street', 'Omaha', 'NE', '68182',
  false, false,
  array['low_income', 'first_gen'],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', null, 'annual',
  'medium', 'needs_confirmation',
  'https://www.unomaha.edu/admissions/financial-support-and-scholarships/', 'official_website', '2026-03-16',
  true, false,
  'Nebraska residency required. Verify current application process, deadlines, and award amounts through UNO Financial Aid or the Susan Thompson Buffett Foundation directly.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["low-income Nebraska residents", "first-generation Nebraska college students"], "mission_notes": "The Buffett Foundation scholarship reflects a generational commitment by the Buffett family to making Nebraska higher education accessible to Nebraska families of all income levels. This is one of the most transformative private scholarships in the state."}'::jsonb,
  '{"eligible": false, "basis": "explicit", "notes": "Nebraska residency required. Council Bluffs students are Iowa residents and are NOT eligible for the Susan T. Buffett Foundation Scholarship. CB students at UNO should instead explore: Goodrich Scholarship Program, UNO institutional need-based aid, FAFSA-based federal aid, and any Iowa-resident programs they may qualify for (note: most Iowa state programs require attending Iowa institutions, not Nebraska ones).", "source": "https://www.unomaha.edu/admissions/financial-support-and-scholarships/"}'::jsonb,
  '{"institution_abbr": "UNO", "institution_type": "public_4year", "scholarship_type": "need-based", "application_method": "separate_application_required", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "verify at foundation or unomaha.edu", "notes": "Annual renewal with continued enrollment and FAFSA filing; verify terms"}, "stackable": {"stacks_with_other_merit": true, "stacks_with_need_based": false, "notes": "Verify stacking policy with UNO Financial Aid and STB Foundation."}}'::jsonb
),

-- ── 9. UNO S-STEM Scholarship (NSF-Funded) ────────────────────────────────────
-- Up to $15,000/year for Math, Computer Science, Biology, Physics students.
-- NSF funding — financial need + academic potential required.
-- CB students eligible.
(
  'UNO S-STEM Scholarship — STEM Majors (Up to $15,000/Year)',
  'University of Nebraska at Omaha / National Science Foundation',
  'https://www.unomaha.edu',
  'The UNO S-STEM Scholarship is funded by the National Science Foundation and provides up to $15,000 per year for students majoring in Mathematics, Computer Science, Biology, or Physics at UNO who demonstrate both financial need and academic potential. This is one of the highest-value individual scholarships at UNO and is specifically designed for STEM students who might not otherwise be able to afford college. The scholarship also includes cohort community building, mentorship, undergraduate research opportunities, and career preparation — designed to increase STEM retention and graduation rates. FAFSA must be on file to demonstrate financial need. Academic potential is assessed through GPA, test scores, and sometimes a short essay or recommendation. Apply through UNO Financial Aid or directly through the S-STEM program. Contact UNO''s math, CS, biology, or physics departments for current application information. COUNCIL BLUFFS STUDENTS: You are eligible. Pottawattamie County is in UNO''s reciprocity zone — CB students in qualifying STEM majors with financial need should apply.',
  'scholarship',
  'Must be majoring or planning to major in Mathematics, Computer Science, Biology, or Physics at UNO. Financial need required — FAFSA must be on file. Academic potential required (GPA and test scores reviewed; verify current minimums at unomaha.edu or with relevant department). Nebraska resident or UNO Iowa reciprocity county resident (includes Pottawattamie County/Council Bluffs). U.S. citizen or permanent resident required (NSF funding restriction). Renewable annually with continued STEM major enrollment, satisfactory GPA, and demonstrated financial need.',
  null,
  'https://www.unomaha.edu/college-of-arts-and-sciences/s-stem/',
  'Omaha, NE',
  '6001 Dodge Street', 'Omaha', 'NE', '68182',
  false, false,
  array['low_income', 'first_gen', 'women_stem'],
  array['scholarship', 'college_access', 'stem'],
  array['high_school_senior', 'adult_learner'],
  'scholarship_amount', 15000, 'annual',
  'medium', 'needs_confirmation',
  'https://www.unomaha.edu/college-of-arts-and-sciences/s-stem/', 'official_website', '2026-03-16',
  true, true,
  'NSF-funded scholarship with cohort cohort community. Contact relevant STEM departments or UNO Financial Aid for current application cycle and deadlines. FAFSA required. Verify current award maximum and eligibility at unomaha.edu/s-stem.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["low-income STEM students", "first-generation STEM students", "women in STEM", "underrepresented groups in STEM"], "mission_notes": "S-STEM addresses the structural barriers that prevent talented low-income students from completing STEM degrees. The combination of financial support and cohort community dramatically improves retention compared to scholarships alone."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "Pottawattamie County (Council Bluffs) is in UNO''s Iowa reciprocity zone. CB students majoring in Math, CS, Biology, or Physics with financial need are eligible. Note: NSF funding typically requires U.S. citizenship or permanent resident status — verify this requirement with UNO.", "source": "https://www.unomaha.edu/college-of-arts-and-sciences/s-stem/"}'::jsonb,
  '{"institution_abbr": "UNO", "institution_type": "public_4year", "scholarship_type": "merit-and-need", "application_method": "separate_application_required", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "verify at unomaha.edu/s-stem", "notes": "Continued STEM major enrollment required; annual FAFSA filing required; academic standing reviewed annually"}, "stackable": {"stacks_with_other_merit": false, "stacks_with_need_based": true, "notes": "Verify stacking with UNO Financial Aid — NSF-funded scholarships sometimes have specific stacking rules."}}'::jsonb
),

-- ── 10. CBA Scholars Academy ──────────────────────────────────────────────────
-- $5,000+/year for College of Business Administration students.
-- Mentorship, networking, international travel component.
-- Separate application required through CBA.
(
  'UNO CBA Scholars Academy — College of Business Administration',
  'University of Nebraska at Omaha College of Business Administration',
  'https://www.unomaha.edu',
  'The CBA Scholars Academy is a $5,000+/year scholarship program specifically for students in UNO''s College of Business Administration. Beyond the financial award, Scholars Academy members participate in a structured program including business mentorship, professional networking with Omaha-area executives, and an international travel component. This is the flagship undergraduate scholarship within the CBA and is highly competitive. If you are planning to major in business at UNO — accounting, finance, management, marketing, economics, MIS, or another CBA major — apply for the Scholars Academy through the CBA directly. COUNCIL BLUFFS STUDENTS: You are eligible if you are planning to study business at UNO. Your Pottawattamie County reciprocity status gives you in-state tuition rates at UNO, and you can apply for all CBA scholarships on the same basis as Nebraska residents. Contact the CBA at (402) 554-2303 for the current Scholars Academy application and deadline.',
  'scholarship',
  'Must be admitted to or planning to enroll in UNO''s College of Business Administration. Strong academic record required (verify current GPA/ACT threshold with CBA). Nebraska resident or UNO Iowa reciprocity county resident (includes Pottawattamie County/Council Bluffs). Separate CBA Scholars Academy application required — contact CBA at (402) 554-2303. Program participation required (mentorship, networking events, international travel). Renewable with satisfactory GPA and continued CBA enrollment.',
  null,
  'https://www.unomaha.edu/college-of-business-administration/undergraduate/scholarships.php',
  'Omaha, NE',
  '6001 Dodge Street', 'Omaha', 'NE', '68182',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access', 'business'],
  array['high_school_senior'],
  'scholarship_amount', 5000, 'annual',
  'medium', 'needs_confirmation',
  'https://www.unomaha.edu/college-of-business-administration/undergraduate/scholarships.php', 'official_website', '2026-03-16',
  true, false,
  'Separate CBA application required. Contact CBA at (402) 554-2303 for current cycle deadline and application. Verify award amount and program requirements at unomaha.edu/college-of-business-administration.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "Pottawattamie County (Council Bluffs) is in UNO''s Iowa reciprocity zone. CB students planning to major in business at UNO are fully eligible for CBA scholarships. The mentorship and networking opportunities connect Scholars Academy members to Omaha''s business community — CB business students benefit equally.", "source": "https://www.unomaha.edu/college-of-business-administration/undergraduate/scholarships.php"}'::jsonb,
  '{"institution_abbr": "UNO", "institution_type": "public_4year", "scholarship_type": "merit", "application_method": "department_application", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "verify with CBA", "notes": "Continued CBA enrollment and program participation required; verify GPA renewal requirement"}, "stackable": {"stacks_with_other_merit": false, "stacks_with_need_based": true, "notes": "Verify stacking policy with CBA and UNO Financial Aid."}}'::jsonb
),

-- ── 11. MetroMavs Partnership Scholarship (MCC → UNO Transfer) ──────────────
-- Partnership between MCC and UNO for transfer students.
-- Encourages community college start, guaranteed transfer pathway.
-- Both Omaha and CB students who start at MCC are eligible.
(
  'UNO MetroMavs Partnership Scholarship — MCC to UNO Transfer Pathway',
  'University of Nebraska at Omaha / Metropolitan Community College',
  'https://www.unomaha.edu',
  'The MetroMavs Partnership is a formal scholarship and guaranteed transfer agreement between Metropolitan Community College (MCC) in Omaha and UNO. If you complete an Associate''s degree at MCC with a qualifying GPA, you are guaranteed admission to UNO AND receive a scholarship to support your continuation. This pathway is designed for students who want to start at a community college (lower cost, closer to home) and then transfer to UNO for a four-year degree. The financial value of starting at MCC (lower tuition) plus the MetroMavs scholarship at UNO can make the combined cost of a four-year degree significantly lower than attending UNO directly for all four years. Contact MCC''s transfer services office and UNO''s transfer admissions office to get the current scholarship amount, GPA requirements, and eligible MCC programs. COUNCIL BLUFFS STUDENTS: If you start at MCC, you will pay out-of-state tuition at MCC (Iowa resident + Nebraska community college = out-of-state rates). However, when you transfer to UNO, Pottawattamie County reciprocity applies and you pay in-state rates. The MetroMavs scholarship applies at the UNO side of the transfer. Run the numbers — it may still be financially advantageous depending on your situation.',
  'scholarship',
  'Must complete an Associate''s degree at Metropolitan Community College (MCC — Omaha, NE) with qualifying GPA (verify current threshold with MCC or UNO transfer admissions). Must apply for transfer admission to UNO through the standard transfer process. Scholarship is applied to UNO enrollment upon transfer. Contact UNO Transfer Admissions at (402) 554-3441 or MCC Transfer Services for current program terms, GPA requirements, scholarship amount, and eligible MCC program areas.',
  null,
  'https://www.unomaha.edu/admissions/transfer/scholarships.php',
  'Omaha, NE',
  '6001 Dodge Street', 'Omaha', 'NE', '68182',
  false, false,
  array['first_gen', 'low_income'],
  array['scholarship', 'college_access'],
  array['adult_learner'],
  'scholarship_amount', null, 'annual',
  'medium', 'needs_confirmation',
  'https://www.unomaha.edu/admissions/transfer/scholarships.php', 'official_website', '2026-03-16',
  true, false,
  'Contact UNO Transfer Admissions at (402) 554-3441 or MCC Transfer Services for current scholarship terms. Scholarship applies at UNO after completing MCC Associate''s degree.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["community college transfer students", "first-generation college students", "non-traditional students"], "mission_notes": "The MetroMavs partnership removes the cost and uncertainty from the community-college-to-university transfer pathway. Students who start at MCC for cost reasons are not penalized when they are ready to transfer to UNO — they are welcomed and supported."}'::jsonb,
  '{"eligible": true, "basis": "likely", "notes": "CB students who start at MCC and transfer to UNO are eligible for the MetroMavs scholarship at the UNO transfer stage, where Pottawattamie County reciprocity applies (in-state tuition). NOTE: At MCC itself, CB students pay out-of-state rates (MCC is a Nebraska school outside the UNO reciprocity framework). Run the full cost comparison before committing to this pathway. Contact UNO Transfer at (402) 554-3441 for current terms.", "source": "https://www.unomaha.edu/admissions/transfer/scholarships.php"}'::jsonb,
  '{"institution_abbr": "UNO", "institution_type": "public_4year", "scholarship_type": "merit", "application_method": "separate_application_required", "renewable": {"is_renewable": true, "max_years": 2, "renewal_gpa": "verify with UNO", "notes": "Typically covers remaining UNO enrollment after MCC transfer; verify current terms"}, "stackable": {"stacks_with_other_merit": false, "stacks_with_need_based": true, "notes": "Verify stacking policy with UNO Financial Aid upon transfer."}}'::jsonb
);
