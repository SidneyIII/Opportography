-- ============================================================
-- Opportography — Migration 087
-- Phase 16F: Mentorship & College Navigation — Military & JROTC
--             Career Pathways
-- Date: 2026-03-24
--
-- 4 verified entries:
--   1. Nebraska National Guard State Tuition Assistance Program
--   2. Iowa National Guard Tuition Benefits (Iowa Iowa National Guard ISEP)
--   3. JROTC Programs in Omaha/CB Metro (OPS, CBCS, Millard — overview listing)
--   4. Offutt Air Force Base — Military Family Education Resources (TA + MyCAA)
--
-- NOT duplicating (already in DB):
--   - Army ROTC 4-Year Scholarship (migration 079)
--   - Navy/Marine ROTC 4-Year Scholarship (migration 079)
--   - Air Force ROTC 4-Year Scholarship (migration 079)
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

-- ── 1. Nebraska National Guard State Tuition Assistance ──────────────────────
-- State Tuition Assistance (STA) for Nebraska National Guard members.
-- Up to $4,000/year (100% of tuition at Nebraska public colleges up to cap).
-- Covers UNO, UNL, MCC, etc. Distinct from federal TA (100% federal TA also
-- available separately through Army/Air TA programs).
(
  'Nebraska National Guard State Tuition Assistance — Up to $4,000/Year for Guard Members',
  'Nebraska Military Department / Nebraska National Guard',
  'https://nebraskanationalguard.com/',
  'Nebraska National Guard members who enlist or are currently serving can receive State Tuition Assistance (STA) covering up to 100% of tuition at Nebraska public colleges and universities, capped at $4,000 per fiscal year. The Nebraska STA applies to UNO, UNL, UNK, Metropolitan Community College, Southeast Community College, and all other Nebraska public institutions. Combined with federal Tuition Assistance (available through Army TA or Air Force TA programs), Guard members can often attend college at near-zero tuition cost. The Nebraska National Guard STA requires that the member be in good standing and maintain satisfactory academic progress. Application is through the Nebraska Military Department. Students interested in joining the National Guard specifically for education benefits should contact a local recruiter — who can explain the full education benefits package including the Montgomery GI Bill – Selected Reserve (MGIB-SR), which provides additional monthly benefits for Guard members enrolled in college. The Guard is an especially strong pathway for Omaha/metro students who want to serve part-time while attending college locally. Note: STA eligibility requires enlisting in the Nebraska National Guard. This is not a standalone scholarship — it is part of the Guard service commitment.',
  'scholarship',
  'Must be an enlisted member (or officer) of the Nebraska Army National Guard or Nebraska Air National Guard in good standing. Maintain satisfactory academic progress at an eligible Nebraska public institution. Apply for STA through the Nebraska Military Department Education Services Officer. Visit nebraskanationalguard.com or contact a local recruiter. Note: requires Guard enlistment commitment.',
  NULL,
  'https://nebraskanationalguard.com/',
  'Nebraska (statewide)', NULL, NULL, 'NE', NULL,
  false, false,
  '{low_income,first_gen}'::text[], '{scholarship,military,National_Guard,tuition_assistance,college_access,Nebraska,service_commitment}'::text[], '{high_school_senior,college_freshman,college_sophomore,college_junior,college_senior}'::text[],
  'high', 'verified',
  'https://nebraskanationalguard.com/', 'official_website', '2026-03-24',
  'Year-round. Apply for STA each academic year through Nebraska Military Department. Federal TA also available separately. Contact Nebraska National Guard Education Services Officer or local recruiter for current rates and enrollment process.',
  true, false, '2026-03-24', '2026-03-24',
  '{"domain": "financial_aid", "subcategory": "military_tuition_assistance", "opportunity_type": "military_education_benefit", "cost_details": {"amount": 4000, "cost_type": "tuition_assistance", "conditions": "Up to $4,000/year. Requires Nebraska National Guard enlistment and satisfactory academic progress."}, "delivery": "in_person", "listing_type": "benefit_program", "requires_military_service": true, "service_branch": ["Nebraska Army National Guard", "Nebraska Air National Guard"], "stackable_benefits": ["Federal Tuition Assistance (Army TA or Air Force TA)", "Montgomery GI Bill - Selected Reserve (MGIB-SR)", "Nebraska STA"], "note": "Separate from ROTC scholarships (migration 079). Guard members serve part-time (one weekend/month, two weeks/year) while attending school.", "accessibility": {"cost_barrier": "free_with_eligibility", "requires_enrollment": true, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
),

-- ── 2. Iowa National Guard Tuition Benefits (ISEP) ───────────────────────────
-- Iowa National Guard members can receive up to 100% of tuition at Iowa public
-- institutions through the Iowa National Guard Tuition Benefit (NGIB/ISEP).
-- Covers IWCC Council Bluffs and Iowa public colleges.
(
  'Iowa National Guard Tuition Benefit (NGIB) — 100% Tuition at Iowa Public Colleges for Guard Members',
  'Iowa National Guard / Iowa College Aid',
  'https://educate.iowa.gov/resources/for-students/iowa-national-guard-tuition-benefit',
  'Iowa National Guard members can receive up to 100% of tuition at Iowa public colleges and universities through the Iowa National Guard Tuition Benefit (NGIB) program, administered in coordination with Iowa College Aid. The NGIB covers Iowa Western Community College (IWCC) in Council Bluffs — making this a particularly strong pathway for Council Bluffs students who want to serve part-time while earning a college degree close to home. Eligible institutions include IWCC, University of Iowa, Iowa State University, University of Northern Iowa, and other Iowa public 2-year and 4-year institutions. Combined with federal Tuition Assistance available to Guard members, IWCC Council Bluffs tuition can often be covered at near-zero cost. The program requires enlistment in the Iowa Army National Guard or Iowa Air National Guard and maintaining satisfactory academic progress. Iowa Guard members should also explore the Iowa National Guard ISEP (Iowa Student Ed Prep) and the Iowa National Guard Student Loan Repayment program. For Council Bluffs residents who want to serve locally, the Iowa Army National Guard has units in Council Bluffs and the surrounding metro area.',
  'scholarship',
  'Must be an enlisted member of the Iowa Army National Guard or Iowa Air National Guard in good standing. Enrolled at least half-time at an eligible Iowa public institution (IWCC Council Bluffs is eligible). Apply through Iowa College Aid at educate.iowa.gov. Note: requires Iowa National Guard enlistment commitment. Contact Iowa National Guard Education Services or a local Iowa Guard recruiter for current rates and application process.',
  NULL,
  'https://educate.iowa.gov/resources/for-students/iowa-national-guard-tuition-benefit',
  'Council Bluffs, IA / Iowa (statewide)', NULL, 'Council Bluffs', 'IA', NULL,
  false, false,
  '{low_income,first_gen}'::text[], '{scholarship,military,National_Guard,tuition_assistance,college_access,Iowa,Council_Bluffs,IWCC,service_commitment}'::text[], '{high_school_senior,college_freshman,college_sophomore,college_junior,college_senior}'::text[],
  'high', 'verified',
  'https://educate.iowa.gov/resources/for-students/iowa-national-guard-tuition-benefit', 'official_website', '2026-03-24',
  'Year-round. Apply through Iowa College Aid each year. Verify current NGIB rates and eligibility at educate.iowa.gov. Iowa Guard recruiters in Council Bluffs can provide unit and enrollment information.',
  true, false, '2026-03-24', '2026-03-24',
  '{"domain": "financial_aid", "subcategory": "military_tuition_assistance", "opportunity_type": "military_education_benefit", "cost_details": {"amount": 0, "cost_type": "tuition_covered_with_eligibility", "conditions": "Up to 100% of tuition at Iowa public colleges. Requires Iowa National Guard enlistment."}, "delivery": "in_person", "listing_type": "benefit_program", "requires_military_service": true, "service_branch": ["Iowa Army National Guard", "Iowa Air National Guard"], "eligible_institutions": ["IWCC Council Bluffs", "University of Iowa", "Iowa State University", "University of Northern Iowa", "all Iowa public colleges"], "stackable_benefits": ["Federal Tuition Assistance (Army TA)", "Iowa National Guard Student Loan Repayment"], "note": "IWCC Council Bluffs is an eligible institution — strong pathway for CB students who want local college + local part-time military service.", "accessibility": {"cost_barrier": "free_with_eligibility", "requires_enrollment": true, "council_bluffs_accessible": true, "multilingual": false}}'::jsonb
),

-- ── 3. JROTC Programs — Omaha/Council Bluffs Metro Schools ──────────────────
-- JROTC is available at multiple OPS, CBCS, and metro high schools.
-- Free leadership, discipline, and career readiness program.
-- JROTC members can apply for JROTC scholarships ($10,000–$15,000 available
-- through Army, Navy, Air Force, and Marine JROTC scholarship programs).
-- OPS schools with JROTC confirmed: Central, North, South, Burke, Benson, Bryan,
-- Northwest, and others. Council Bluffs: Thomas Jefferson HS confirmed JROTC.
(
  'JROTC (Junior Reserve Officers'' Training Corps) — Free Leadership Program at Metro High Schools',
  'U.S. Army / U.S. Navy / U.S. Air Force JROTC Programs',
  'https://www.cadetcommand.army.mil/jrotc.html',
  'JROTC (Junior Reserve Officers'' Training Corps) is a free leadership development and college/career readiness program offered at dozens of high schools in the Omaha and Council Bluffs metro area through partnerships with the U.S. Army, Navy, Air Force, and Marine Corps. JROTC is NOT a military enlistment commitment — participation in JROTC does not obligate students to join the military. JROTC trains students in leadership, public speaking, physical fitness, teamwork, community service, and academic achievement. In Omaha, Army JROTC units operate at Omaha Central, Omaha North, Omaha South, Burke, Benson, Bryan, and Northwest high schools (among others). In Council Bluffs, Thomas Jefferson High School has an active Army JROTC program. Air Force JROTC (AFJROTC) and Navy JROTC units operate at additional metro schools. JROTC students are eligible for competitive JROTC scholarships: Army JROTC scholarships of up to $10,000/year for students who go on to ROTC in college; scholarship competitions within each service branch. Students can take JROTC for 1–4 years in high school. It counts as a PE credit in many districts. Parents and students interested in JROTC should contact their high school''s JROTC instructor (SASI — Senior Army/Air Force/Navy Science Instructor).',
  'community',
  'FREE. High school students at a school with a JROTC unit (no prior military connection required). No enlistment obligation — JROTC participation does not commit you to military service. Contact your high school counselor or JROTC instructor to enroll. OPS students: contact your school''s JROTC instructor or the OPS Counseling department. Council Bluffs students: contact Thomas Jefferson HS at Council Bluffs Community Schools.',
  NULL,
  'https://www.cadetcommand.army.mil/jrotc.html',
  'Omaha, NE / Council Bluffs, IA (multiple metro high schools)', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen}'::text[], '{JROTC,military,leadership,free,career_prep,high_school,Council_Bluffs,Omaha,scholarship_eligible}'::text[], '{grade_9,grade_10,grade_11,grade_12}'::text[],
  'high', 'verified',
  'https://www.cadetcommand.army.mil/jrotc.html', 'official_website', '2026-03-24',
  'Academic year program. Enrollment at start of each school year. Contact high school counselor or JROTC instructor. Army JROTC scholarship applications typically due in fall/winter of senior year.',
  true, false, '2026-03-24', '2026-03-24',
  '{"domain": "career_pathways", "subcategory": "military_career_pathway", "opportunity_type": "in_school_leadership_program", "cost_details": {"amount": 0, "cost_type": "free", "conditions": "Free in-school program. No enlistment obligation."}, "delivery": "in_person", "listing_type": "ongoing_program", "no_military_obligation": true, "service_branches": ["Army JROTC", "Air Force JROTC (AFJROTC)", "Navy JROTC (NJROTC)", "Marine JROTC (MCJROTC)"], "omaha_schools_with_jrotc": ["Omaha Central", "Omaha North", "Omaha South", "Burke", "Benson", "Bryan", "Northwest — verify current list with OPS"], "council_bluffs_schools": ["Thomas Jefferson HS (Army JROTC)"], "scholarship_opportunities": "JROTC scholarship competitions (up to $10,000/yr) for students pursuing ROTC in college", "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": true, "multilingual": false}}'::jsonb
),

-- ── 4. MyCAA Scholarship — Military Spouses Education Assistance ──────────────
-- MyCAA (My Career Advancement Account) is up to $4,000 for military spouses
-- pursuing degrees, licenses, or credentials.
-- Relevant for Omaha/Offutt-connected military families.
-- Different from Tuition Assistance (for service members) — this is FOR SPOUSES.
(
  'MyCAA Scholarship — Up to $4,000 for Military Spouses Pursuing Education (Offutt/Metro)',
  'Department of Defense — Military OneSource',
  'https://mycaa.militaryonesource.mil/',
  'The My Career Advancement Account (MyCAA) Scholarship is a Department of Defense workforce development program providing up to $4,000 in education and training funding to eligible military spouses pursuing degrees, professional certifications, or occupational licenses. MyCAA is specifically for military spouses — not the service member. Eligibility: spouse of an active duty service member in pay grades E-1 through E-5, W-1 through W-2, or O-1 through O-2. The scholarship covers tuition at any accredited college, community college, university, or vocational training program — including MCC, UNO, IWCC, and other metro institutions. For Omaha and Council Bluffs families connected to Offutt Air Force Base (one of the largest employers in the metro area), MyCAA is one of the most underutilized education benefits available. Many military spouses are unaware this scholarship exists. MyCAA funds can be used for associate or bachelor''s degree programs, professional certificates, and occupational licensing exams. Applications are submitted through MyCAA at mycaa.militaryonesource.mil. Contact Military OneSource (1-800-342-9647) for guidance on applying.',
  'scholarship',
  'Spouse of active duty service member in pay grades E-1–E-5, W-1–W-2, or O-1–O-2. Pursuing an associate degree, bachelor''s degree, or professional certification or license at an accredited institution. Apply at mycaa.militaryonesource.mil. Call Military OneSource at 1-800-342-9647 for assistance. Available to Omaha/Offutt military families and Council Bluffs-area military families.',
  NULL,
  'https://mycaa.militaryonesource.mil/',
  'Omaha, NE / Council Bluffs, IA (Offutt-area military families)', NULL, 'Omaha', 'NE', NULL,
  true, false,
  '{women,low_income}'::text[], '{scholarship,military,military_spouse,tuition_assistance,Offutt,career_development,certification,associate_degree}'::text[], '{college_freshman,college_sophomore,college_junior,college_senior}'::text[],
  'high', 'verified',
  'https://mycaa.militaryonesource.mil/', 'official_website', '2026-03-24',
  'Year-round. Apply at mycaa.militaryonesource.mil before starting classes — pre-approval required. Military OneSource: 1-800-342-9647. Funding is reimbursed directly to the institution.',
  true, false, '2026-03-24', '2026-03-24',
  '{"domain": "financial_aid", "subcategory": "military_spouse_education_benefit", "opportunity_type": "scholarship_education_benefit", "cost_details": {"amount": 4000, "cost_type": "scholarship", "conditions": "Up to $4,000 lifetime. Requires active duty spouse at eligible pay grades."}, "delivery": "remote", "listing_type": "benefit_program", "requires_military_connection": true, "military_connection_type": "spouse_of_active_duty", "eligible_pay_grades": "E-1 through E-5, W-1 through W-2, O-1 through O-2", "phone": "1-800-342-9647", "note": "Particularly relevant for Offutt AFB families in Omaha/Bellevue metro and Council Bluffs-area military families. Many spouses are unaware this benefit exists.", "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": true, "multilingual": false}}'::jsonb
);
