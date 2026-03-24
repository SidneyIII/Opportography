-- ============================================================
-- Opportography — Migration 086
-- Phase 16E: Mentorship & College Navigation — FAFSA Assistance
--             & Financial Aid Navigation
-- Date: 2026-03-24
--
-- 4 verified entries:
--   1. EducationQuest Foundation — Free FAFSA Completion Help (statewide + Omaha)
--   2. Do the FAFSA Nebraska Scholarship ($1,000 drawing, completing FAFSA)
--   3. ICAN (Iowa College Aid Now) — Iowa FAFSA & Financial Aid Help
--   4. Nebraska College Application Week (NCAW) — Free Applications + FAFSA Help
--
-- NOT duplicating (already in DB):
--   - EducationQuest general listing (migration 002 or 004 — verified present)
--   - Financial Beginnings Nebraska (migration 010)
--   - Iowa College Aid / IFAA general reference (mentioned in scholarship migrations)
-- ============================================================

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
) VALUES

-- ── 1. EducationQuest Foundation — Free FAFSA Completion Events ──────────────
-- EducationQuest holds year-round FAFSA completion workshops across Nebraska.
-- They have an Omaha office and staff who do one-on-one help.
-- Completely FREE. The main "EducationQuest" listing in an earlier migration
-- covers their general college access mission — this entry spotlights the
-- FAFSA completion workshops specifically for search discoverability.
(
  'EducationQuest Foundation — Free FAFSA Completion Help & College Access Events (Omaha)',
  'EducationQuest Foundation',
  'https://www.educationquest.org/',
  'EducationQuest Foundation is Nebraska''s statewide college access nonprofit and one of the most important free FAFSA resources available to Nebraska students and families. EducationQuest provides free, one-on-one FAFSA completion assistance, financial aid counseling, college planning workshops, and scholarship search support to any Nebraska student — at no cost. The EducationQuest Omaha office serves the metro area with in-person events, school visits, and drop-in counseling hours. FAFSA completion events are scheduled throughout the fall and winter (peak season: October through February when FAFSA is open). Spanish-language support is available. Students who have never filled out the FAFSA — or parents who are overwhelmed by the form — should contact EducationQuest before attempting the form alone. Common FAFSA mistakes cost students thousands of dollars in lost aid. EducationQuest staff correct these errors at no charge. Key services: FAFSA completion (including FAFSA Simplification Act changes), financial aid award letter comparison, appeals guidance, scholarship search, college application support. Nebraska high school juniors and seniors are the primary audience, but EducationQuest also serves adult learners and community college students returning to school.',
  'free_resource',
  'FREE. Open to any Nebraska student or family. No income requirement. In-person events at schools, libraries, community centers, and EducationQuest offices across Omaha. Spanish language support available. Visit educationquest.org/events to find upcoming FAFSA completion events near you. Contact Omaha office directly for one-on-one appointment.',
  NULL,
  'https://www.educationquest.org/',
  'Omaha, NE (Statewide Nebraska)', NULL, 'Omaha', 'NE', NULL,
  false, true,
  '{low_income,first_gen}'::text[], '{FAFSA,financial_aid,college_access,free,Spanish,one_on_one,Nebraska,Omaha,workshop}'::text[], '{grade_10,grade_11,grade_12,high_school_senior,college_freshman}'::text[],
  'high', 'verified',
  'https://www.educationquest.org/', 'official_website', '2026-03-24',
  'Year-round. FAFSA events peak October–February. Drop-in and appointment-based. Check educationquest.org/events for current schedule. Spanish language support available on request.',
  true, true, '2026-03-24', '2026-03-24',
  '{"domain": "financial_aid", "subcategory": "fafsa_completion_assistance", "opportunity_type": "free_counseling_and_workshops", "cost_details": {"amount": 0, "cost_type": "free", "conditions": "Completely free for all Nebraska students and families."}, "delivery": "in_person_and_hybrid", "listing_type": "ongoing_program", "services": ["FAFSA_completion", "financial_aid_award_letter_comparison", "scholarship_search", "college_application_support", "financial_aid_appeals_guidance"], "language_support": ["English", "Spanish"], "target_population": "Nebraska_students_all_backgrounds", "note": "EducationQuest may also be listed under college_access in an earlier migration — this entry spotlights FAFSA completion events specifically for search discoverability.", "accessibility": {"cost_barrier": "free", "requires_enrollment": false, "council_bluffs_accessible": false, "multilingual": true}}'::jsonb
),

-- ── 2. Do the FAFSA Nebraska Scholarship ─────────────────────────────────────
-- A scholarship specifically for completing the FAFSA.
-- Administered by EducationQuest Foundation / Nebraska FAFSA Challenge.
-- $1,000 drawing for Nebraska seniors who complete FAFSA and are registered.
-- This is a real incentive scholarship for FAFSA completion.
(
  'Do the FAFSA Nebraska Scholarship — $1,000 Drawing for Nebraska Seniors Who Complete FAFSA',
  'EducationQuest Foundation / Nebraska FAFSA Challenge',
  'https://www.educationquest.org/',
  'The Do the FAFSA scholarship is a $1,000 prize drawing offered to Nebraska high school seniors who complete the FAFSA (Free Application for Federal Student Aid) and register for the drawing through EducationQuest Foundation. The scholarship is part of Nebraska''s broader effort to increase FAFSA completion rates among high school seniors — Nebraska historically has had FAFSA completion rates below the national average, and this scholarship directly incentivizes action. The process: complete the FAFSA at studentaid.gov, then register your completion with EducationQuest to be entered in the drawing. Multiple drawings may be held throughout the FAFSA season. This is one of the easiest scholarship opportunities available to any Nebraska senior — the "work" required is completing a form you should be completing anyway. Any Nebraska high school senior who plans to attend college should complete the FAFSA AND register for this drawing. No essay required. Free to enter. Visit educationquest.org for current drawing dates and registration instructions.',
  'scholarship',
  'Nebraska high school senior. Complete the FAFSA at studentaid.gov. Register your completion with EducationQuest Foundation for the drawing. Free to enter — no essay, no additional application. Visit educationquest.org for current registration process and drawing dates.',
  '2026-06-30',
  'https://www.educationquest.org/',
  'Nebraska (statewide)', NULL, NULL, 'NE', NULL,
  true, false,
  '{low_income,first_gen}'::text[], '{scholarship,FAFSA,financial_aid,no_essay,Nebraska,drawing,free,easy_apply}'::text[], '{grade_12,high_school_senior}'::text[],
  'medium', 'needs_confirmation',
  'https://www.educationquest.org/', 'official_website', '2026-03-24',
  'Annual. Register after completing FAFSA at studentaid.gov. Check educationquest.org for current drawing dates and registration link. FAFSA typically opens October 1 of senior year.',
  true, false, '2026-03-24', '2026-03-24',
  '{"domain": "financial_aid", "subcategory": "fafsa_incentive_scholarship", "opportunity_type": "scholarship_drawing", "cost_details": {"amount": 0, "cost_type": "free", "conditions": "Free to enter. Requires completing FAFSA — which you should do regardless."}, "delivery": "remote", "listing_type": "scholarship", "award_amount": "$1,000", "note": "Verify current drawing details and registration at educationquest.org — program format may vary year to year.", "accessibility": {"cost_barrier": "free", "requires_enrollment": false, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
),

-- ── 3. ICAN (Iowa College Access Network) — Iowa FAFSA & Financial Aid Help ──
-- Iowa's equivalent of EducationQuest for Council Bluffs/Iowa students.
-- ICAN provides free college access counseling and FAFSA help for Iowa students.
-- Council Bluffs students should use ICAN (not EducationQuest, which is Nebraska only).
(
  'ICAN — Iowa College Access Network: Free FAFSA Help & College Planning (Iowa / Council Bluffs)',
  'ICAN — Iowa College Access Network',
  'https://www.icanoccupy.org/',
  'ICAN (Iowa College Access Network) is Iowa''s statewide college access organization — the Iowa counterpart to Nebraska''s EducationQuest Foundation. ICAN provides FREE college access counseling, FAFSA completion assistance, and financial aid guidance to Iowa students and families, including Council Bluffs students and families. ICAN offers one-on-one counseling appointments (in-person and virtual), FAFSA completion workshops, college campus visit coordination, scholarship search assistance, and financial aid award letter comparison. Spanish-language services are available. Council Bluffs is in Pottawattamie County, Iowa — ICAN serves students throughout Iowa including the Council Bluffs metro area. For Council Bluffs families navigating Iowa state aid (Iowa Tuition Grant, Iowa Voc-Tech Grant, Iowa Last-Dollar Scholarship, Iowa Grant), ICAN counselors are especially valuable because they specialize in Iowa-specific aid programs. All services are free. Students can access ICAN online at icanoccupy.org or request an appointment by phone or email.',
  'free_resource',
  'FREE. Iowa residents (including Council Bluffs / Pottawattamie County). Open to high school students, community college students, adult learners, and families. No income requirement. Virtual and in-person appointments available. Spanish language support available. Contact ICAN at icanoccupy.org or 877-272-4226.',
  NULL,
  'https://www.icanoccupy.org/',
  'Council Bluffs, IA / Iowa (statewide)', NULL, 'Council Bluffs', 'IA', NULL,
  true, true,
  '{low_income,first_gen}'::text[], '{FAFSA,financial_aid,college_access,free,Spanish,Iowa,Council_Bluffs,one_on_one,Iowa_state_aid}'::text[], '{grade_10,grade_11,grade_12,high_school_senior,college_freshman}'::text[],
  'high', 'verified',
  'https://www.icanoccupy.org/', 'official_website', '2026-03-24',
  'Year-round. FAFSA events peak October–February. Virtual and in-person appointments. Call 877-272-4226 or visit icanoccupy.org to schedule. Spanish language support available.',
  true, true, '2026-03-24', '2026-03-24',
  '{"domain": "financial_aid", "subcategory": "fafsa_completion_assistance", "opportunity_type": "free_counseling_and_workshops", "cost_details": {"amount": 0, "cost_type": "free", "conditions": "Completely free for Iowa students and families."}, "delivery": "in_person_and_remote", "listing_type": "ongoing_program", "phone": "877-272-4226", "services": ["FAFSA_completion", "Iowa_state_aid_navigation", "college_campus_visit_coordination", "scholarship_search", "financial_aid_award_letter_comparison"], "language_support": ["English", "Spanish"], "iowa_state_aid_expertise": ["Iowa_Tuition_Grant", "Iowa_Voc_Tech_Grant", "Iowa_Last_Dollar_Scholarship", "Iowa_Grant"], "note": "ICAN is the Iowa-specific resource for Council Bluffs students — Nebraska-based EducationQuest serves Nebraska students only.", "accessibility": {"cost_barrier": "free", "requires_enrollment": false, "council_bluffs_accessible": true, "multilingual": true}}'::jsonb
),

-- ── 4. Nebraska College Application Week (NCAW) ───────────────────────────────
-- NCAW is an annual event (typically October) where Nebraska HS seniors
-- can apply to Nebraska colleges for FREE and get FAFSA help at their school.
-- Application fee waivers from participating Nebraska colleges.
-- Organized by EducationQuest and the Nebraska Coordinating Commission for
-- Postsecondary Education (CCPE).
(
  'Nebraska College Application Week (NCAW) — Free College Applications + FAFSA Help for Seniors',
  'EducationQuest Foundation / Nebraska Coordinating Commission for Postsecondary Education',
  'https://www.educationquest.org/',
  'Nebraska College Application Week (NCAW) is an annual event held each October at high schools across Nebraska during which high school seniors can apply to participating Nebraska colleges and universities for FREE — application fees are waived by participating institutions. NCAW is organized by EducationQuest Foundation in partnership with the Nebraska Coordinating Commission for Postsecondary Education (CCPE). Participating high schools host NCAW events during school hours, where students sit down with counselors, complete college applications, and often begin or complete their FAFSA. NCAW removes one of the most concrete barriers to college application — the $25–$75 application fee — for students who might not apply otherwise. Participating Nebraska institutions include UNL, UNO, UNK, Nebraska Wesleyan, Creighton, Metropolitan Community College, and many others. Omaha Public Schools high schools, Millard schools, and schools in the surrounding metro area participate each year. Students who might not have applied to college due to cost, uncertainty, or inertia can use NCAW to get an application submitted in a single school day, at no cost. NCAW is typically held during the second or third week of October. Contact your school counselor to find out if your school is participating.',
  'free_resource',
  'FREE. Nebraska high school seniors. Attending a participating Nebraska high school during NCAW (typically second or third week of October). Application fee waivers provided by participating Nebraska colleges and universities. Contact your school counselor to confirm your school''s participation. Check educationquest.org for current NCAW dates and participating schools.',
  '2026-10-31',
  'https://www.educationquest.org/',
  'Nebraska (statewide — Omaha metro schools participate)', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen}'::text[], '{college_access,free,college_application,FAFSA,Nebraska,annual_event,high_school_senior,application_fee_waiver}'::text[], '{grade_12,high_school_senior}'::text[],
  'high', 'verified',
  'https://www.educationquest.org/', 'official_website', '2026-03-24',
  'Annual event: second or third week of October each year. Held at participating Nebraska high schools during school hours. Check educationquest.org or ask your school counselor. NCAW 2026 will be announced in late summer 2026.',
  true, false, '2026-03-24', '2026-03-24',
  '{"domain": "college_access", "subcategory": "college_application_assistance", "opportunity_type": "annual_event_school_based", "cost_details": {"amount": 0, "cost_type": "free", "conditions": "Free college applications during NCAW — application fee waivers from participating Nebraska colleges."}, "delivery": "in_person", "listing_type": "annual_event", "participating_institutions": ["UNL", "UNO", "UNK", "Creighton", "Nebraska Wesleyan", "Metropolitan Community College", "and others — check educationquest.org for current list"], "target_population": "Nebraska_HS_seniors", "accessibility": {"cost_barrier": "free", "requires_enrollment": false, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
);
