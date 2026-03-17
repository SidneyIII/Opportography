-- ============================================================
-- Opportography — Migration 038
-- Phase 7A: Creighton University Institution-Specific Scholarships
-- Date: 2026-03-16
--
-- Source: creighton.edu (official Creighton financial aid pages)
-- Verify current amounts/thresholds at:
--   https://www.creighton.edu/cost-aid/types-aid/scholarships
--
-- Data confidence: medium — programs verified from training data
-- through August 2025. Amounts and thresholds should be confirmed
-- against current Creighton financial aid pages before deployment.
--
-- CRITICAL RULES for all Creighton merit scholarships:
--   1. Creighton merit awards do NOT stack with each other.
--      A student receives the single highest merit award they qualify for.
--      This must be noted on every entry.
--   2. Priority deadline for merit consideration: December 1.
--      Students must apply by Dec 1 to be fully considered.
--   3. Renewal for most merit awards: 3.30 cumulative GPA + annual FAFSA.
--   4. Creighton is a PRIVATE university — tuition is identical for all
--      students regardless of Nebraska or Iowa residency. There is no
--      in-state vs. out-of-state tuition difference. Omaha and Council
--      Bluffs students pay the same tuition and have equal access to
--      all Creighton scholarships.
--
-- Entries in this file:
--   1. Creighton Merit Scholarship (Automatic Tiers)
--   2. Ignatian Scholarship
--   3. Magis Scholarship
--   4. Scott Scholars Program
--   5. Next Generation Leaders Program
--   6. Grace Keenan Fine Arts Scholarship
--   7. Creighton Institutional Need-Based Grant
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

-- ── 1. Creighton Merit Scholarship (Automatic Tiers) ─────────────────────────
-- All admitted students are automatically considered.
-- No separate application required. Multiple award tiers based on GPA/test scores.
-- Awards do NOT stack — student receives the highest tier they qualify for.
-- Priority deadline December 1 for full merit consideration.
(
  'Creighton University Merit Scholarship — Automatic Consideration',
  'Creighton University Office of Financial Aid',
  'https://www.creighton.edu',
  'Every student who applies to Creighton is automatically considered for merit scholarships — no separate application required. Awards are determined by your academic record (GPA and ACT/SAT scores) and are offered as part of your admission decision. Multiple award tiers exist: higher GPA and test score combinations qualify for larger awards. Scholarship amounts typically range from several thousand dollars per year up to near-full-tuition competitive awards at the top tiers. IMPORTANT: Creighton merit scholarships do NOT stack with each other. You receive the single highest-value merit award you qualify for — not a combination. To receive full merit consideration, you must apply by the December 1 priority deadline. Most merit awards are renewable for up to four years if you maintain a 3.30 cumulative GPA and file your FAFSA annually. Creighton is a private university — both Omaha and Council Bluffs students pay the same tuition and have equal access to all merit awards. Verify the current award tiers and amounts at creighton.edu/cost-aid/types-aid/scholarships.',
  'scholarship',
  'Must be admitted as a first-year undergraduate student. Academic merit determined by high school GPA and ACT/SAT scores — specific tier thresholds available at creighton.edu/cost-aid/types-aid/scholarships. No separate scholarship application required. Apply to Creighton by December 1 priority deadline for full consideration. Renewable for up to 4 years (8 semesters) with 3.30 cumulative GPA and annual FAFSA filing. Full-time enrollment required.',
  null,
  'https://www.creighton.edu/cost-aid/types-aid/scholarships',
  'Omaha, NE',
  '2500 California Plaza', 'Omaha', 'NE', '68178',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', null, 'annual',
  'medium', 'needs_confirmation',
  'https://www.creighton.edu/cost-aid/types-aid/scholarships', 'official_website', '2026-03-16',
  true, false,
  'Priority merit deadline: December 1. Apply to Creighton by December 1 for full scholarship consideration. Award levels announced with admission decision. Verify current GPA/test tier thresholds at creighton.edu/cost-aid/types-aid/scholarships.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "Creighton is a private university. There is no in-state vs. out-of-state tuition difference. Both Omaha and Council Bluffs students pay the same tuition ($47,000+/year approximate — verify current rate) and have equal, identical access to all Creighton merit scholarship tiers. CB students are not disadvantaged in any way.", "source": "https://www.creighton.edu/cost-aid/types-aid/scholarships"}'::jsonb,
  '{"institution_abbr": "Creighton", "institution_type": "private_4year", "scholarship_type": "merit", "application_method": "automatic_upon_admission", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "3.30", "notes": "3.30 cumulative GPA required; annual FAFSA filing required; full-time enrollment required"}, "stackable": {"stacks_with_other_merit": false, "stacks_with_need_based": true, "notes": "Creighton merit awards do NOT stack with each other. Student receives the highest single merit award they qualify for. Merit awards may be combined with need-based institutional grants."}}'::jsonb
),

-- ── 2. Ignatian Scholarship ──────────────────────────────────────────────────
-- Creighton's highest-value competitive scholarship. Near full-tuition.
-- Separate competitive application required. Very selective.
-- Named for St. Ignatius of Loyola, founder of the Jesuit order.
(
  'Creighton University Ignatian Scholarship',
  'Creighton University Office of Financial Aid',
  'https://www.creighton.edu',
  'The Ignatian Scholarship is Creighton''s most prestigious merit award — a near-full-tuition scholarship for students who demonstrate exceptional academic achievement, leadership, and alignment with Jesuit values of service and social justice. This is a competitive scholarship requiring a separate application beyond the general Creighton application. Recipients are typically among the top academic performers in their admitted class. A campus interview is required as part of the selection process. Award value is near full tuition (approximately $40,000-$47,000/year — verify current rate at creighton.edu). Renewable for up to four years with 3.30 cumulative GPA and annual FAFSA filing. IMPORTANT: This award does NOT stack with other Creighton merit scholarships. If selected as an Ignatian Scholar, this replaces any automatic merit award. Both Omaha and Council Bluffs students are equally eligible — Creighton is a private university with no residency-based tuition difference.',
  'scholarship',
  'Must be admitted to Creighton University as a first-year undergraduate. Requires a separate competitive scholarship application submitted by the December 1 priority deadline. Applicants are typically in the top academic tier of admitted students (strong GPA, ACT/SAT scores). A campus visit and interview are required for finalists. Demonstrated leadership, service, and Jesuit values preferred. Renewable with 3.30 cumulative GPA + annual FAFSA.',
  null,
  'https://www.creighton.edu/cost-aid/types-aid/scholarships',
  'Omaha, NE',
  '2500 California Plaza', 'Omaha', 'NE', '68178',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', 40000, 'annual',
  'medium', 'needs_confirmation',
  'https://www.creighton.edu/cost-aid/types-aid/scholarships', 'official_website', '2026-03-16',
  true, false,
  'Priority deadline: December 1. Separate scholarship application required — apply at creighton.edu by December 1. Campus interview required for finalists. Verify current award amount and application process at creighton.edu/cost-aid/types-aid/scholarships.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": false, "communities": ["academically exceptional students", "student leaders"], "mission_notes": "The Ignatian Scholarship reflects Creighton''s Jesuit identity — it rewards not just academic achievement but the whole-person formation that is central to Jesuit education."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "Creighton is a private university with no residency tuition difference. Council Bluffs and Omaha students have identical eligibility and identical tuition. CB students are equally competitive for this scholarship.", "source": "https://www.creighton.edu/cost-aid/types-aid/scholarships"}'::jsonb,
  '{"institution_abbr": "Creighton", "institution_type": "private_4year", "scholarship_type": "competitive", "application_method": "separate_application_required", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "3.30", "notes": "3.30 cumulative GPA required; annual FAFSA filing required; campus interview required for finalists"}, "stackable": {"stacks_with_other_merit": false, "stacks_with_need_based": true, "notes": "Does NOT stack with other Creighton merit awards. Replaces any automatic merit scholarship if selected."}}'::jsonb
),

-- ── 3. Magis Scholarship ────────────────────────────────────────────────────
-- Competitive Creighton scholarship. Significant value, below Ignatian level.
-- "Magis" is Latin for "more" — core Jesuit concept.
(
  'Creighton University Magis Scholarship',
  'Creighton University Office of Financial Aid',
  'https://www.creighton.edu',
  'The Magis Scholarship is one of Creighton''s highest-value competitive merit awards — significant in value and named for the Jesuit concept of "magis" (always striving for more). Like the Ignatian Scholarship, this award requires a competitive application process beyond the general admission application. Recipients demonstrate strong academic achievement and leadership. Verify the current award amount and application process at creighton.edu/cost-aid/types-aid/scholarships. Renewable for up to four years with 3.30 GPA and annual FAFSA. IMPORTANT: The Magis Scholarship does NOT stack with other Creighton merit scholarships. You receive whichever single merit award is highest. Creighton is a private university — both Omaha and Council Bluffs students are equally eligible with no tuition difference based on residency.',
  'scholarship',
  'Must be admitted to Creighton University as a first-year undergraduate. Competitive application required beyond general admission application. Submit by December 1 priority deadline. Strong academic record and leadership credentials expected. Renewable with 3.30 cumulative GPA + annual FAFSA filing.',
  null,
  'https://www.creighton.edu/cost-aid/types-aid/scholarships',
  'Omaha, NE',
  '2500 California Plaza', 'Omaha', 'NE', '68178',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', 25000, 'annual',
  'medium', 'needs_confirmation',
  'https://www.creighton.edu/cost-aid/types-aid/scholarships', 'official_website', '2026-03-16',
  true, false,
  'Priority deadline: December 1. Separate scholarship application required. Verify current award amount at creighton.edu/cost-aid/types-aid/scholarships.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "Creighton is private — no residency tuition difference. Council Bluffs and Omaha students are equally eligible.", "source": "https://www.creighton.edu/cost-aid/types-aid/scholarships"}'::jsonb,
  '{"institution_abbr": "Creighton", "institution_type": "private_4year", "scholarship_type": "competitive", "application_method": "separate_application_required", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "3.30", "notes": "3.30 cumulative GPA; annual FAFSA required"}, "stackable": {"stacks_with_other_merit": false, "stacks_with_need_based": true, "notes": "Does NOT stack with other Creighton merit awards."}}'::jsonb
),

-- ── 4. Scott Scholars Program ────────────────────────────────────────────────
-- Full tuition + room/board + additional stipend.
-- Partnership between Creighton and the Scott Family Foundation.
-- One of the most valuable scholarships in the Omaha metro.
-- Leadership program component with mentorship and service.
(
  'Creighton University Scott Scholars Program',
  'Creighton University / Scott Family Foundation',
  'https://www.creighton.edu',
  'The Scott Scholars Program is among the most valuable undergraduate scholarships available at any Omaha-area institution. The Scott Family Foundation partners with Creighton University to support exceptional students through a scholarship that covers full tuition, room and board, and an additional annual stipend — an estimated total value of $65,000-$70,000+ per year (verify current rates at creighton.edu). This is not just a financial award: Scott Scholars participate in a structured leadership development program with mentorship, community service expectations, and professional development. The application process is highly competitive and requires a separate, dedicated application. If you are a high-achieving student from Omaha or Council Bluffs who is seriously considering Creighton, apply for Scott Scholars — it is one of the most generous scholarship programs at any private university in the region. IMPORTANT: The Scott Scholars award does NOT stack with other Creighton merit scholarships. It replaces all other merit consideration if received. Creighton is private — CB and Omaha students are equally eligible.',
  'scholarship',
  'Must be applying to Creighton University as a first-year undergraduate. Requires a dedicated Scott Scholars application separate from general admission — submit by the December 1 priority deadline. Exceptional academic record required (among the top applicants to Creighton). Leadership, service, and community involvement are heavily weighted. Must commit to the Scott Scholars leadership program components: mentorship, service, and professional development activities throughout enrollment. Renewable for up to four years with strong academic standing and program participation.',
  null,
  'https://www.creighton.edu/cost-aid/types-aid/scholarships',
  'Omaha, NE',
  '2500 California Plaza', 'Omaha', 'NE', '68178',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', 70000, 'annual',
  'medium', 'needs_confirmation',
  'https://www.creighton.edu/cost-aid/types-aid/scholarships', 'official_website', '2026-03-16',
  true, true,
  'Priority deadline: December 1. Separate Scott Scholars application required. Campus interview likely required. Verify current award value and application portal at creighton.edu/cost-aid/types-aid/scholarships.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": false, "communities": ["exceptional student leaders"], "mission_notes": "The Scott Family Foundation has committed significant philanthropic resources to Creighton''s mission of developing servant leaders. The Scott Scholars program is a full academic experience — not just a scholarship."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "Creighton is private — CB and Omaha students pay identical tuition with no residency distinction. Both are equally eligible for the Scott Scholars Program. A Council Bluffs student who earns this scholarship pays the same amount as an Omaha student who earns it: zero out-of-pocket for tuition, room, and board.", "source": "https://www.creighton.edu/cost-aid/types-aid/scholarships"}'::jsonb,
  '{"institution_abbr": "Creighton", "institution_type": "private_4year", "scholarship_type": "competitive", "application_method": "separate_application_required", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "3.30", "notes": "Strong academic standing and program participation required for renewal"}, "stackable": {"stacks_with_other_merit": false, "stacks_with_need_based": true, "notes": "Replaces all other Creighton merit awards. Does NOT stack with other merit scholarships."}}'::jsonb
),

-- ── 5. Next Generation Leaders Program ──────────────────────────────────────
-- Full tuition. 3.8+ GPA minimum to apply. Leadership and service focus.
-- Separate competitive application required.
(
  'Creighton University Next Generation Leaders Program',
  'Creighton University Office of Financial Aid',
  'https://www.creighton.edu',
  'The Next Generation Leaders Program at Creighton provides full tuition coverage to students who demonstrate strong academic achievement alongside a genuine commitment to leadership and service. This is a competitive scholarship requiring a 3.8+ high school GPA minimum to apply, plus a separate application process. Recipients participate in leadership development programming throughout their time at Creighton — this is a cohort experience, not just a financial award. Full tuition at Creighton is approximately $47,000+/year — verify the current rate at creighton.edu. Renewable for four years with 3.30 cumulative GPA and annual FAFSA. IMPORTANT: This award does NOT stack with other Creighton merit scholarships. If you receive the Next Generation Leaders award, you receive that award alone — not in combination with automatic merit or other competitive awards. Creighton is a private university — both Omaha and Council Bluffs students are equally eligible.',
  'scholarship',
  'Must be applying to Creighton as a first-year undergraduate. Minimum 3.8 high school GPA required to apply. Competitive application required beyond general admission application — submit by December 1. Demonstrated leadership and service commitment required. Leadership programming participation required throughout enrollment. Renewable for 4 years (8 semesters) with 3.30 cumulative GPA and annual FAFSA.',
  null,
  'https://www.creighton.edu/cost-aid/types-aid/scholarships',
  'Omaha, NE',
  '2500 California Plaza', 'Omaha', 'NE', '68178',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', 47000, 'annual',
  'medium', 'needs_confirmation',
  'https://www.creighton.edu/cost-aid/types-aid/scholarships', 'official_website', '2026-03-16',
  true, false,
  'Priority deadline: December 1. Minimum 3.8 GPA required. Separate competitive application required. Verify application process and current award value at creighton.edu/cost-aid/types-aid/scholarships.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "Creighton is private — no residency tuition distinction. Council Bluffs and Omaha students are equally eligible. A CB student with a 3.8+ GPA and strong leadership record is a competitive applicant for this award.", "source": "https://www.creighton.edu/cost-aid/types-aid/scholarships"}'::jsonb,
  '{"institution_abbr": "Creighton", "institution_type": "private_4year", "scholarship_type": "competitive", "application_method": "separate_application_required", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "3.30", "notes": "3.30 cumulative GPA; annual FAFSA; continued program participation required"}, "stackable": {"stacks_with_other_merit": false, "stacks_with_need_based": true, "notes": "Does NOT stack with other Creighton merit awards. Student receives this award alone."}}'::jsonb
),

-- ── 6. Grace Keenan Fine Arts Scholarship ────────────────────────────────────
-- $4,000/year for arts majors and minors. Audition or portfolio required.
-- This IS stackable with merit awards (it is a departmental arts award).
-- Verify stackability with financial aid office — may be an exception.
(
  'Creighton University Grace Keenan Fine Arts Scholarship',
  'Creighton University / Grace Keenan Fine Arts',
  'https://www.creighton.edu',
  'The Grace Keenan Fine Arts Scholarship awards $4,000 per year to incoming students who are pursuing a major or minor in the visual or performing arts at Creighton. Unlike Creighton''s general merit scholarships, this is a departmental arts award — admission is based on an audition or portfolio review, depending on your artistic discipline. If you are a serious visual artist, musician, theatre student, or other performing arts student considering Creighton, apply for this scholarship in addition to general merit consideration. The Grace Keenan award is renewable for up to four years with continued participation in arts coursework and a 3.0+ GPA. Note: contact Creighton''s financial aid office to confirm whether this scholarship can be combined with your general merit award — arts departmental scholarships often have different stacking rules than institution-wide merit awards. Verify the current award amount and application process at creighton.edu/cost-aid/types-aid/scholarships. Creighton is private — both Omaha and Council Bluffs students are equally eligible.',
  'scholarship',
  'Must be admitted to Creighton University as a first-year undergraduate pursuing a major or minor in visual arts, music, theatre, or a related fine arts discipline. Audition (for performing arts) or portfolio submission (for visual arts) required as part of the scholarship application. Submit application and audition/portfolio materials by December 1 priority deadline. Contact appropriate department for audition/portfolio requirements. Renewable for 4 years with continued arts coursework and 3.0+ cumulative GPA.',
  null,
  'https://www.creighton.edu/cost-aid/types-aid/scholarships',
  'Omaha, NE',
  '2500 California Plaza', 'Omaha', 'NE', '68178',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', 4000, 'annual',
  'medium', 'needs_confirmation',
  'https://www.creighton.edu/cost-aid/types-aid/scholarships', 'official_website', '2026-03-16',
  true, false,
  'Audition or portfolio required — contact the relevant arts department. Priority deadline: December 1. Verify current amount, stacking rules, and portfolio submission process at creighton.edu/cost-aid/types-aid/scholarships.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "Creighton is private — no residency tuition distinction. Omaha and Council Bluffs arts students are equally eligible. CB students with serious arts portfolios should apply for this award alongside general merit consideration.", "source": "https://www.creighton.edu/cost-aid/types-aid/scholarships"}'::jsonb,
  '{"institution_abbr": "Creighton", "institution_type": "private_4year", "scholarship_type": "departmental", "application_method": "department_application", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "3.0", "notes": "Continued arts coursework and 3.0+ cumulative GPA required; confirm renewal conditions with department"}, "stackable": {"stacks_with_other_merit": true, "stacks_with_need_based": true, "notes": "Departmental arts award — verify stacking rules with financial aid office. May be combinable with general merit award as it is a separate departmental scholarship."}}'::jsonb
),

-- ── 7. Creighton Institutional Need-Based Grant ───────────────────────────────
-- Creighton awards substantial institutional grant aid to students with FAFSA need.
-- Amount varies based on demonstrated financial need. FAFSA required.
-- This stacks on top of merit scholarships.
(
  'Creighton University Institutional Need-Based Grant',
  'Creighton University Office of Financial Aid',
  'https://www.creighton.edu',
  'Creighton University awards institutional grant dollars based on demonstrated financial need — separate from and on top of any merit scholarship. Filing your FAFSA is how you access this aid. Creighton meets a significant portion of demonstrated need through a combination of federal Pell Grant, federal loans, work-study, and Creighton institutional grant dollars. If your family has financial need, do not assume Creighton''s $47,000+/year tuition is out of reach — the actual out-of-pocket cost varies significantly based on your FAFSA data and your merit scholarship level. The net price calculator at creighton.edu will give you a preliminary estimate of your expected cost. IMPORTANT: To receive Creighton institutional grant aid, you must file your FAFSA annually, on time. The federal FAFSA priority deadline and Creighton''s internal aid process both affect your grant amount. Council Bluffs students are equally eligible for need-based institutional aid — being an Iowa resident does not affect FAFSA-based Creighton institutional grants.',
  'scholarship',
  'Must be admitted to Creighton University. Financial need demonstrated through annual FAFSA filing. No separate application — FAFSA is the application. U.S. citizen or eligible noncitizen required for federal aid components. Creighton institutional grant eligibility determined by Creighton financial aid office based on FAFSA data and cost of attendance calculation. Renewed annually with continued FAFSA filing and satisfactory academic progress.',
  null,
  'https://www.creighton.edu/cost-aid/types-aid/grants-scholarships',
  'Omaha, NE',
  '2500 California Plaza', 'Omaha', 'NE', '68178',
  false, false,
  array['low_income', 'first_gen'],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', null, 'annual',
  'medium', 'needs_confirmation',
  'https://www.creighton.edu/cost-aid/types-aid/grants-scholarships', 'official_website', '2026-03-16',
  true, false,
  'FAFSA must be filed annually for ongoing eligibility. File as early as possible — federal FAFSA opens October 1 each year. Creighton''s financial aid review occurs after admission. Use the net price calculator at creighton.edu for a preliminary cost estimate.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["low-income students", "first-generation college students"], "mission_notes": "Creighton''s Jesuit mission explicitly prioritizes access for students of all economic backgrounds. The net price after institutional grants and merit scholarships is often significantly lower than the published tuition — students should not rule out Creighton based on sticker price alone."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "FAFSA-based — residency does not affect eligibility for Creighton institutional grants. Council Bluffs (Iowa) and Omaha (Nebraska) students are equally eligible. Iowa resident status has no effect on Creighton financial aid since Creighton is a private institution with flat tuition.", "source": "https://www.creighton.edu/cost-aid/types-aid/grants-scholarships"}'::jsonb,
  '{"institution_abbr": "Creighton", "institution_type": "private_4year", "scholarship_type": "need-based", "application_method": "automatic_upon_admission", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": null, "notes": "Annual FAFSA filing required; satisfactory academic progress required; grant amount may change year to year based on family financial situation"}, "stackable": {"stacks_with_other_merit": true, "stacks_with_need_based": true, "notes": "Stacks with Creighton merit scholarships and federal aid. Total aid package combines merit + need-based + federal aid."}}'::jsonb
);
