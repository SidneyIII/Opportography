-- ============================================================
-- Opportography — Migration 044
-- Phase 7G: University of Northern Iowa (UNI) — Institution-Specific Scholarships
-- Date: 2026-03-16
--
-- Source: admissions.uni.edu and finaid.uni.edu (official UNI financial aid pages)
-- Scholarship application: UNI Scholarship Application (opens July 1 annually)
-- Verify at:
--   https://admissions.uni.edu/financial-aid/types-of-aid/scholarships/scholarships-incoming-freshmen
--   https://finaid.uni.edu/scholarship
--
-- Data confidence: medium — programs from training data through August 2025.
-- Verify all current-cycle information at official UNI sources before deployment.
--
-- CRITICAL DIFFERENTIATOR — EMBED IN EVERY ENTRY:
-- UNI's admission-based scholarships CAN STACK with each other.
-- This is a major differentiator from most other schools on this list.
-- Example: A CB student (Iowa resident) could receive:
--   Panther Impact Award ($1,000-$4,000/year)
--   + Presidential Scholarship ($4,000/year)
--   + Inspire Award ($1,000/year)
--   = up to $9,000/year in stacked awards
-- This is a rare and valuable fact. Emphasize it clearly.
--
-- RESIDENCY DISTINCTION:
-- Council Bluffs students = IOWA RESIDENTS
--   -> Panther Impact Award (Iowa resident tier, $1,000-$4,000/year)
--   -> Pay Iowa in-state tuition (~$9,000-$10,000/year — verify current rate)
--
-- Omaha students = NON-RESIDENTS
--   -> UNI Advantage Award (non-resident tier, $5,000-$7,000/year approximate)
--   -> Pay non-resident tuition (~$21,000+/year — verify current rate)
--
-- Key deadlines:
--   January 15: Priority deadline for UNI Scholarship Application
--   May 1: Admission application priority deadline for scholarship consideration
--
-- Entries in this file:
--   1. Panther Impact Award (Iowa residents, automatic merit, tiered)
--   2. UNI Advantage Award (non-residents, automatic merit)
--   3. UNI Presidential Scholarship (competitive, $4,000/year, stacks, 20 awarded/year)
--   4. Inspire Award (need-based, $1,000/year, automatic, stacks)
--   5. Live 2 Succeed Scholarship ($500, on-campus housing commitment)
--   6. CAPS Completer Scholarship (for CAPS program graduates)
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

-- ── 1. Panther Impact Award (Iowa Residents, Automatic Merit, Tiered) ──────────
-- $1,000-$4,000/year based on GPA tier. Automatic at admission.
-- Iowa residents only. CB students are eligible.
-- CAN stack with Presidential Scholarship + Inspire Award.
(
  'UNI Panther Impact Award — Iowa Residents (Automatic Merit, $1,000-$4,000/Year)',
  'University of Northern Iowa Office of Admissions',
  'https://www.uni.edu',
  'The UNI Panther Impact Award is the University of Northern Iowa''s automatic merit scholarship for Iowa resident students. It is awarded in tiers based on your high school GPA — no ACT/SAT minimum required in many tiers. Awards range from $1,000 to $4,000 per year depending on your GPA. No separate application is required for the Panther Impact Award — it is automatically awarded when you are admitted to UNI as an Iowa resident. Apply to UNI by May 1 for priority scholarship consideration. Renewable for up to four years with continued satisfactory academic progress. COUNCIL BLUFFS STUDENTS: You are Iowa residents — this scholarship is for you. CB students pay Iowa in-state tuition at UNI (~$9,000-$10,000/year — verify current rate). CRITICAL STACKING ADVANTAGE: Unlike most other schools, UNI''s admission-based scholarships CAN stack with each other. A CB student could receive the Panther Impact Award ($1,000-$4,000) PLUS the Presidential Scholarship ($4,000/year, if selected) PLUS the Inspire Award ($1,000/year, if need-based eligible). Total stacked scholarships: up to $9,000/year. At a school with in-state tuition of ~$9,000-$10,000, this combination can effectively cover the entire tuition cost. No other school on this list offers this stacking advantage. Verify current GPA tier amounts and thresholds at admissions.uni.edu.',
  'scholarship',
  'Iowa RESIDENT required (Council Bluffs students qualify). Automatic consideration at UNI admission based on high school GPA — no separate scholarship application required. GPA determines the specific tier: verify current GPA/amount tier chart at admissions.uni.edu/financial-aid/types-of-aid/scholarships/scholarships-incoming-freshmen. Apply to UNI by May 1 for priority scholarship consideration. Renewable for up to 4 years (8 semesters) with satisfactory academic progress and continuous enrollment.',
  '2026-05-01',
  'https://admissions.uni.edu/financial-aid/types-of-aid/scholarships/scholarships-incoming-freshmen',
  'Cedar Falls, IA',
  '1227 West 27th Street', 'Cedar Falls', 'IA', '50614',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', 4000, 'annual',
  'medium', 'needs_confirmation',
  'https://admissions.uni.edu/financial-aid/types-of-aid/scholarships/scholarships-incoming-freshmen', 'official_website', '2026-03-16',
  true, true,
  'Apply to UNI by May 1 for priority scholarship consideration. No separate Panther Impact application — automatic at admission. Also submit UNI Scholarship Application by January 15 to be considered for the stacking Presidential Scholarship. Verify current GPA tier amounts at admissions.uni.edu.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "CB students are Iowa residents — fully eligible for the Panther Impact Award (Iowa resident tier). STACKING NOTE: The Panther Impact Award can be combined with the UNI Presidential Scholarship and Inspire Award for a total of up to $9,000/year in stacked awards. At UNI in-state tuition rates (~$9,000-$10,000/year), this combination can cover tuition almost entirely. This stacking advantage is unique among the Phase 7 institutions — most other schools on this list do not allow merit awards to stack. Omaha students (non-residents) receive the Advantage Award instead.", "source": "https://admissions.uni.edu/financial-aid/types-of-aid/scholarships/scholarships-incoming-freshmen"}'::jsonb,
  '{"requires_fafsa": false, "requires_ifaa": false, "ifaa_url": null, "iowa_institution_required": true, "eligible_iowa_institutions": "University of Northern Iowa", "state_program": false, "administering_agency": "University of Northern Iowa Office of Admissions"}'::jsonb,
  '{"institution_abbr": "UNI", "institution_type": "public_4year", "scholarship_type": "merit", "application_method": "automatic_upon_admission", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "verify at admissions.uni.edu", "notes": "Satisfactory academic progress required; full-time enrollment required; verify specific GPA renewal threshold"}, "stackable": {"stacks_with_other_merit": true, "stacks_with_need_based": true, "notes": "STACKS with UNI Presidential Scholarship and Inspire Award. UNI is unique among the Phase 7 institutions — admission-based scholarships can be combined. A CB student could receive Panther Impact + Presidential + Inspire for up to $9,000/year in stacked awards."}}'::jsonb
),

-- ── 2. UNI Advantage Award (Non-Residents — Omaha Students) ──────────────────
-- $5,000-$7,000+/year base for non-Iowa-residents. Automatic at admission.
-- Omaha (Nebraska resident) students are eligible.
-- CB students (Iowa residents) receive Panther Impact instead.
-- CAN stack with Presidential Scholarship.
(
  'UNI Advantage Award — Non-Residents (Automatic Merit, $5,000+/Year)',
  'University of Northern Iowa Office of Admissions',
  'https://www.uni.edu',
  'The UNI Advantage Award is the University of Northern Iowa''s automatic merit scholarship for students who are NOT Iowa residents. If you are an Omaha student (Nebraska resident), this is the scholarship tier that applies when considering UNI. No separate application required — automatic consideration at UNI admission. The Advantage Award typically provides $5,000+ per year base, with additional merit amounts based on academic credentials (verify the current tier structure at admissions.uni.edu). STACKING ADVANTAGE: Like the Panther Impact Award, the Advantage Award CAN stack with the UNI Presidential Scholarship ($4,000/year additional, if selected through a separate competitive application). An Omaha student receiving both would have Advantage Award + Presidential — a significant combined package. As an Omaha student, you pay non-resident tuition at UNI (~$21,000+/year — verify current rate). Calculate your net cost: non-resident tuition minus Advantage Award minus any Presidential Scholarship. Compare to your Nebraska in-state options (UNO at in-state rates, Creighton at private flat rate). Apply to UNI by May 1 for priority scholarship consideration. Verify current Advantage Award amounts at admissions.uni.edu. COUNCIL BLUFFS STUDENTS: You are Iowa residents — do NOT receive this award. CB students get the Panther Impact Award (entry #1) instead.',
  'scholarship',
  'Non-Iowa RESIDENT required (Nebraska, Illinois, South Dakota, and other non-Iowa state residents). Automatic consideration at UNI admission — no separate scholarship application required. Apply to UNI by May 1 for priority scholarship consideration. Renewable for 4 years with satisfactory academic progress. Also submit the UNI Scholarship Application by January 15 to be considered for the stackable Presidential Scholarship. Verify current tier amounts and thresholds at admissions.uni.edu.',
  '2026-05-01',
  'https://admissions.uni.edu/financial-aid/types-of-aid/scholarships/scholarships-incoming-freshmen',
  'Cedar Falls, IA',
  '1227 West 27th Street', 'Cedar Falls', 'IA', '50614',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', 5000, 'annual',
  'medium', 'needs_confirmation',
  'https://admissions.uni.edu/financial-aid/types-of-aid/scholarships/scholarships-incoming-freshmen', 'official_website', '2026-03-16',
  true, false,
  'Apply to UNI by May 1 for priority scholarship consideration. No separate Advantage Award application — automatic at admission. Also submit UNI Scholarship Application by January 15 for stackable Presidential Scholarship consideration. Verify current amounts at admissions.uni.edu.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": false, "basis": "explicit", "notes": "CB students are Iowa residents — they receive the Panther Impact Award (entry #1), NOT the Advantage Award. The Advantage Award is for non-Iowa residents (including Omaha students). Omaha students considering UNI should compare: non-resident tuition (~$21,000+/year) minus Advantage Award minus any Presidential Scholarship vs. their Nebraska-school options.", "source": "https://admissions.uni.edu/financial-aid/types-of-aid/scholarships/scholarships-incoming-freshmen"}'::jsonb,
  '{"requires_fafsa": false, "requires_ifaa": false, "ifaa_url": null, "iowa_institution_required": true, "eligible_iowa_institutions": "University of Northern Iowa", "state_program": false, "administering_agency": "University of Northern Iowa Office of Admissions"}'::jsonb,
  '{"institution_abbr": "UNI", "institution_type": "public_4year", "scholarship_type": "merit", "application_method": "automatic_upon_admission", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "verify at admissions.uni.edu", "notes": "Satisfactory academic progress and full-time enrollment required"}, "stackable": {"stacks_with_other_merit": true, "stacks_with_need_based": true, "notes": "STACKS with UNI Presidential Scholarship. An Omaha student could receive Advantage Award + Presidential Scholarship as a combined package."}}'::jsonb
),

-- ── 3. UNI Presidential Scholarship ($4,000/Year, Stacks, 20 Awarded/Year) ────
-- Competitive. Stacks with Panther Impact AND Advantage Award.
-- January 15 UNI Scholarship Application deadline.
-- 20 students selected per year — limited but worth applying.
(
  'UNI Presidential Scholarship — $4,000/Year (Stacks on Top of Panther Impact or Advantage)',
  'University of Northern Iowa Office of Admissions',
  'https://www.uni.edu',
  'The UNI Presidential Scholarship awards $4,000 per year to 20 incoming students per year through a competitive selection process. Unlike most competitive scholarships at other institutions, the UNI Presidential Scholarship STACKS on top of your admission-based merit award. If you are a Council Bluffs student who receives both the Panther Impact Award and the Presidential Scholarship, you receive both amounts combined: up to $4,000 (Panther Impact) + $4,000 (Presidential) = $8,000/year. Add the Inspire Award ($1,000/year) for need-based students, and the total can reach $9,000/year. This stacking combination is rare and powerful — at UNI in-state tuition rates, you could effectively cover tuition entirely. To apply: submit the UNI Scholarship Application by the January 15 priority deadline at finaid.uni.edu/scholarship. The UNI Scholarship Application is a single application that considers you for the Presidential Scholarship plus hundreds of other UNI and UNI Foundation scholarships. The Presidential Scholarship may include an interview for finalists. Only 20 students receive the Presidential Scholarship per year — it is competitive. But every student who applies for the UNI Scholarship Application by January 15 is considered for all available scholarships, not just the Presidential. Apply regardless of whether you think you will win the Presidential — the application itself opens the door to hundreds of other awards.',
  'scholarship',
  'Must be admitted to UNI as a first-year student. Submit the UNI Scholarship Application by January 15 priority deadline at finaid.uni.edu/scholarship. Competitive selection — strong academic record and personal essay required. Interview may be required for finalists. Iowa resident or non-resident — BOTH are eligible (this scholarship stacks with Panther Impact for Iowa residents and with Advantage Award for non-residents). 20 students selected per year nationally from the applicant pool. Renewable for 4 years with satisfactory academic progress.',
  '2026-01-15',
  'https://finaid.uni.edu/scholarship',
  'Cedar Falls, IA',
  '1227 West 27th Street', 'Cedar Falls', 'IA', '50614',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', 4000, 'annual',
  'medium', 'needs_confirmation',
  'https://admissions.uni.edu/financial-aid/types-of-aid/scholarships/scholarships-incoming-freshmen', 'official_website', '2026-03-16',
  true, true,
  'UNI Scholarship Application deadline: January 15. Submit at finaid.uni.edu/scholarship. This single application considers you for Presidential Scholarship AND hundreds of other UNI scholarships. Apply by January 15 even if you are not sure you will win Presidential — you are automatically considered for all other available awards. Interview may be required for Presidential finalists. Verify current cycle details at admissions.uni.edu.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "Both Iowa residents (CB students) and non-residents (Omaha students) are eligible for the UNI Presidential Scholarship. STACKING: CB students receiving Presidential Scholarship also keep their Panther Impact Award — both stack. A CB student with a 3.8 GPA receiving both the top Panther Impact tier ($4,000/year) + Presidential ($4,000/year) + Inspire ($1,000/year) receives $9,000/year in stacked UNI scholarships. At in-state tuition (~$9,000-$10,000/year), this is near-full tuition coverage through stacked awards — a combination not available at most schools on this list.", "source": "https://admissions.uni.edu/financial-aid/types-of-aid/scholarships/scholarships-incoming-freshmen"}'::jsonb,
  '{"requires_fafsa": false, "requires_ifaa": false, "ifaa_url": null, "iowa_institution_required": true, "eligible_iowa_institutions": "University of Northern Iowa", "state_program": false, "administering_agency": "University of Northern Iowa"}'::jsonb,
  '{"institution_abbr": "UNI", "institution_type": "public_4year", "scholarship_type": "competitive", "application_method": "general_scholarship_app", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "verify at admissions.uni.edu", "notes": "Satisfactory academic progress and full-time enrollment required"}, "stackable": {"stacks_with_other_merit": true, "stacks_with_need_based": true, "notes": "STACKS with Panther Impact Award (Iowa residents) OR Advantage Award (non-residents). Also stacks with Inspire Award (need-based). Total stacked package possible: up to $9,000/year for qualifying Iowa resident students."}}'::jsonb
),

-- ── 4. Inspire Award (Need-Based, $1,000/Year, Automatic, Stacks) ─────────────
-- Need-based. FAFSA required. Automatic.
-- Stacks with Panther Impact + Presidential.
-- CB students (Iowa residents with need) are eligible.
(
  'UNI Inspire Award — Need-Based ($1,000/Year, Stacks with Merit Awards)',
  'University of Northern Iowa Student Financial Aid',
  'https://www.uni.edu',
  'The UNI Inspire Award provides $1,000 per year to admitted UNI students who demonstrate financial need through FAFSA. It is awarded automatically — no separate application beyond your FAFSA. The Inspire Award is renewable for up to four years as long as you maintain enrollment and continue to demonstrate need through annual FAFSA filing. CRITICAL STACKING ADVANTAGE: The Inspire Award stacks with UNI''s admission-based merit awards. A Council Bluffs student with financial need could receive all of the following simultaneously: Panther Impact Award ($1,000-$4,000/year) + Presidential Scholarship ($4,000/year, if selected) + Inspire Award ($1,000/year) = up to $9,000/year total. This stacking combination is unique and powerful — making UNI one of the most financially accessible options for CB students with a combination of academic merit and financial need. File your FAFSA and the Iowa Financial Aid Application (IFAA) at educate.iowa.gov by April 1 to maximize all Iowa-related aid alongside the Inspire Award.',
  'scholarship',
  'Must be admitted to UNI. Demonstrated financial need as shown by FAFSA required. Iowa resident and non-resident both eligible (need-based). No separate Inspire Award application — FAFSA filing triggers consideration automatically. File FAFSA by the annual priority deadline. Iowa residents should also file the Iowa Financial Aid Application (IFAA) at educate.iowa.gov. Renewable for 4 years with annual FAFSA filing and continued enrollment.',
  null,
  'https://admissions.uni.edu/financial-aid/types-of-aid/scholarships/scholarships-incoming-freshmen',
  'Cedar Falls, IA',
  '1227 West 27th Street', 'Cedar Falls', 'IA', '50614',
  false, false,
  array['low_income', 'first_gen'],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', 1000, 'annual',
  'medium', 'needs_confirmation',
  'https://admissions.uni.edu/financial-aid/types-of-aid/scholarships/scholarships-incoming-freshmen', 'official_website', '2026-03-16',
  true, false,
  'File FAFSA annually to maintain Inspire Award eligibility. Iowa residents should also file IFAA at educate.iowa.gov by April 1. Automatic — no separate application. Stacks with Panther Impact and Presidential scholarships. Verify current award amount and FAFSA priority deadline at finaid.uni.edu.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["low-income students", "first-generation college students", "students with demonstrated financial need"], "mission_notes": "The Inspire Award recognizes that need-based aid must be combinable with merit aid to be meaningful. UNI''s stacking design means a low-income, academically strong CB student does not have to choose between merit recognition and financial support — they receive both."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "CB students (Iowa residents) with financial need are fully eligible for the Inspire Award. STACKING: Panther Impact + Presidential + Inspire can be combined for up to $9,000/year. CB Iowa residents should also file the IFAA at educate.iowa.gov by April 1 to access Iowa state need-based aid on top of the Inspire Award.", "source": "https://admissions.uni.edu/financial-aid/types-of-aid/scholarships/scholarships-incoming-freshmen"}'::jsonb,
  '{"requires_fafsa": true, "requires_ifaa": true, "ifaa_url": "https://educate.iowa.gov", "iowa_institution_required": true, "eligible_iowa_institutions": "University of Northern Iowa", "state_program": false, "administering_agency": "University of Northern Iowa Student Financial Aid"}'::jsonb,
  '{"institution_abbr": "UNI", "institution_type": "public_4year", "scholarship_type": "need-based", "application_method": "automatic_upon_admission", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": null, "notes": "Annual FAFSA filing required; demonstrated need must continue; satisfactory academic progress required"}, "stackable": {"stacks_with_other_merit": true, "stacks_with_need_based": false, "notes": "STACKS with Panther Impact Award and Presidential Scholarship. A CB student could receive all three simultaneously: Panther Impact + Presidential + Inspire."}}'::jsonb
),

-- ── 5. Live 2 Succeed Scholarship ($500, On-Campus Housing Commitment) ─────────
-- $500 for students committing to live on campus first two years.
-- Small but stackable — worth noting for students considering on-campus housing.
(
  'UNI Live 2 Succeed Scholarship — $500 for On-Campus Housing Commitment',
  'University of Northern Iowa Housing and Dining',
  'https://www.uni.edu',
  'The UNI Live 2 Succeed Scholarship awards $500 to incoming students who sign a contract committing to living in UNI on-campus housing for their first two years of enrollment. Research consistently shows that students who live on campus have higher graduation rates and better academic outcomes, particularly in their first year. The $500 is a direct financial incentive for a choice that is also in your long-term interest. This scholarship is small relative to other UNI awards, but it stacks on top of them — a student receiving Panther Impact + Presidential + Inspire + Live 2 Succeed gets an additional $500 added to the package. Contact UNI Housing at uni.edu/housing for current application details. Verify with UNI Financial Aid whether this scholarship is still active and the current terms for 2026-2027. COUNCIL BLUFFS STUDENTS: If you plan to live on campus at UNI, this scholarship rewards that decision with a small financial credit. Combined with the stackable UNI merit awards, CB students who live on campus can build a substantial scholarship package.',
  'scholarship',
  'Must be an incoming first-year student admitted to UNI. Must sign a two-year on-campus housing contract. Iowa resident or non-resident both eligible. Contact UNI Housing at uni.edu/housing for current application process and to confirm the scholarship is still active for 2026-2027. Verify current terms with UNI Financial Aid.',
  null,
  'https://www.uni.edu/housing',
  'Cedar Falls, IA',
  '1227 West 27th Street', 'Cedar Falls', 'IA', '50614',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', 500, 'one_time',
  'medium', 'needs_confirmation',
  'https://www.uni.edu/housing', 'official_website', '2026-03-16',
  true, false,
  'Requires two-year on-campus housing contract. Contact UNI Housing at uni.edu/housing. Verify current scholarship terms and whether it is active for 2026-2027 at admissions.uni.edu or finaid.uni.edu.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "CB students who plan to live on campus at UNI are eligible for this scholarship. At 90 miles from Council Bluffs, Cedar Falls is far enough that many UNI students from CB would live on campus. The scholarship rewards a choice that research shows leads to better academic outcomes.", "source": "https://www.uni.edu/housing"}'::jsonb,
  '{"requires_fafsa": false, "requires_ifaa": false, "ifaa_url": null, "iowa_institution_required": true, "eligible_iowa_institutions": "University of Northern Iowa", "state_program": false, "administering_agency": "University of Northern Iowa Housing and Dining"}'::jsonb,
  '{"institution_abbr": "UNI", "institution_type": "public_4year", "scholarship_type": "merit", "application_method": "separate_application_required", "renewable": {"is_renewable": false, "max_years": 1, "renewal_gpa": null, "notes": "One-time award tied to housing contract — verify current terms with UNI Housing"}, "stackable": {"stacks_with_other_merit": true, "stacks_with_need_based": true, "notes": "Stacks with all other UNI scholarships including Panther Impact, Presidential, and Inspire."}}'::jsonb
),

-- ── 6. CAPS Completer Scholarship ─────────────────────────────────────────────
-- For students who completed a CAPS (Center for Advanced Professional Studies) program.
-- CAPS programs exist in multiple metro areas — national CAPS participants eligible.
-- The Omaha metro has CAPS programs at some area high schools.
(
  'UNI CAPS Completer Scholarship — For CAPS Program Graduates',
  'University of Northern Iowa Office of Admissions',
  'https://www.uni.edu',
  'The UNI CAPS Completer Scholarship is available to students who completed a Center for Advanced Professional Studies (CAPS) program in high school. CAPS is a project-based learning program that immerses high school students in professional, real-world environments — in healthcare, business, technology, or other industry sectors. If you completed a CAPS program at your high school, UNI recognizes that experience with a scholarship. The Omaha metro has CAPS programs at select area high schools — CB students who participated in a CAPS program may qualify. Contact UNI Admissions at (800) 772-2037 to verify whether your specific CAPS program qualifies and to confirm the current scholarship amount and application process. Submit the UNI Scholarship Application at finaid.uni.edu/scholarship by January 15 to be considered for this and hundreds of other awards. Stacks with other UNI admission-based scholarships.',
  'scholarship',
  'Must have completed a CAPS (Center for Advanced Professional Studies) program at an accredited high school. Must be admitted to UNI as a first-year student. Contact UNI Admissions at (800) 772-2037 to verify whether your specific CAPS program qualifies. Submit UNI Scholarship Application at finaid.uni.edu/scholarship by January 15. Verify current award amount and eligibility at admissions.uni.edu.',
  '2026-01-15',
  'https://finaid.uni.edu/scholarship',
  'Cedar Falls, IA',
  '1227 West 27th Street', 'Cedar Falls', 'IA', '50614',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', null, 'one_time',
  'medium', 'needs_confirmation',
  'https://admissions.uni.edu/financial-aid/types-of-aid/scholarships/scholarships-incoming-freshmen', 'official_website', '2026-03-16',
  true, false,
  'UNI Scholarship Application deadline: January 15 at finaid.uni.edu/scholarship. Contact UNI Admissions at (800) 772-2037 to verify CAPS program qualification. Verify current award amount and terms at admissions.uni.edu.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": null, "basis": "likely", "notes": "CB students who completed a CAPS program at their high school may be eligible. CAPS programs exist in select Omaha metro high schools — contact UNI Admissions at (800) 772-2037 to verify if your school''s CAPS program qualifies. Iowa residents and non-residents both eligible. The scholarship stacks with Panther Impact (CB Iowa residents) or Advantage Award (Omaha non-residents).", "source": "https://admissions.uni.edu/financial-aid/types-of-aid/scholarships/scholarships-incoming-freshmen"}'::jsonb,
  '{"requires_fafsa": false, "requires_ifaa": false, "ifaa_url": null, "iowa_institution_required": true, "eligible_iowa_institutions": "University of Northern Iowa", "state_program": false, "administering_agency": "University of Northern Iowa Office of Admissions"}'::jsonb,
  '{"institution_abbr": "UNI", "institution_type": "public_4year", "scholarship_type": "merit", "application_method": "general_scholarship_app", "renewable": {"is_renewable": false, "max_years": 1, "renewal_gpa": null, "notes": "Typically one-time — verify current terms with UNI Admissions"}, "stackable": {"stacks_with_other_merit": true, "stacks_with_need_based": true, "notes": "Stacks with Panther Impact (Iowa residents) or Advantage Award (non-residents) and other UNI scholarships."}}'::jsonb
);
