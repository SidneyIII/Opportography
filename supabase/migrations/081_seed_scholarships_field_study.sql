-- ============================================================
-- Opportography — Migration 081
-- Phase 15S: Scholarship Deep Dive — Field-of-Study & Resource Scholarships
-- Date: 2026-03-20
--
-- 4 verified entries:
--   1. Society of Women Engineers (SWE) Scholarships (women in engineering)
--   2. Iowa Engineering Society Foundation Scholarship
--   3. VFW Patriots Pen — Middle School Essay Competition (grades 6–8)
--   4. Iowa Grant (companion to Iowa Tuition Grant and Iowa Voc-Tech Grant)
--
-- Dead ends / excluded:
--   - Union Pacific Railroad Scholarship: UP does not operate a public-
--     facing student scholarship. The UP employee dependent scholarship
--     is only for children of current UP employees, not the general
--     public. Not appropriate to seed as a community resource.
--   - Mutual of Omaha Scholarship: No public-facing student scholarship
--     program. Employee tuition reimbursement only ($5,250/yr for
--     employees). Not applicable for community students.
--   - Peter Kiewit Foundation: Private operating foundation — grants
--     go to organizations, not individual student applicants. Cannot
--     apply directly.
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

-- ── 1. Society of Women Engineers (SWE) Scholarships ──────────────────────────
-- $1,000–$15,000+. For women in engineering and engineering technology.
-- Single application through SWE at scholarships.swe.org.
-- Open to incoming freshmen through graduate students.
(
  'Society of Women Engineers (SWE) Scholarships — Up to $15,000 (Women in Engineering)',
  'Society of Women Engineers (SWE)',
  'https://scholarships.swe.org/',
  'The Society of Women Engineers (SWE) offers more than 250 scholarships totaling over $1 million annually to women pursuing engineering and engineering technology degrees. Awards range from $1,000 to $15,000 or more, with some corporate-sponsored awards reaching higher amounts. Students submit one application at scholarships.swe.org and are considered for all applicable scholarships simultaneously. SWE scholarships are open to incoming freshmen, current college students, and graduate students — there is an award category at every stage. No SWE membership is required to apply (though membership strengthens your application). Scholarships are available for women in civil engineering, electrical engineering, mechanical engineering, computer science and engineering, biomedical engineering, chemical engineering, and other technical fields. Nebraska and Iowa women in engineering programs (UNL College of Engineering, UNO, Iowa State University, UI, and others) regularly receive SWE scholarships. The Omaha section of SWE also hosts regional events and may offer section-specific scholarships — check swe.org for local Omaha section information. Applications open in December–January with spring deadlines.',
  'scholarship',
  'Women (or non-binary individuals who identify with the mission of SWE) pursuing an ABET-accredited engineering or engineering technology degree (or computer science at ABET-accredited program) in the U.S. Minimum GPA varies by scholarship (typically 3.0+). U.S. citizen or permanent resident for some awards; others open to international students. Full-time enrollment required for most awards. Apply at scholarships.swe.org — one application, considered for multiple scholarships.',
  null,
  'https://scholarships.swe.org/',
  'Remote (National)',
  null, null, null, null,
  true, false,
  array['women']::text[],
  array['scholarship', 'college_access', 'merit', 'STEM', 'engineering', 'women', 'national'],
  array['high_school_senior', 'college_freshman', 'college_sophomore', 'college_junior', 'college_senior'],
  'scholarship', null, 'annual',
  'high', 'verified',
  'https://scholarships.swe.org/', 'official_website', '2026-03-20',
  true, true,
  'Application opens ~December–January. Spring deadline varies by scholarship tier. Verify current deadlines at scholarships.swe.org. One application — multiple scholarships considered simultaneously.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": false, "communities": ["women_in_engineering", "women_in_STEM"], "mission_notes": "SWE scholarships are specifically for women in engineering — addressing the underrepresentation of women in technical fields. Nebraska and Iowa women in engineering programs should apply."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "National scholarship — Nebraska and Iowa women in engineering programs are fully eligible. SWE Omaha section may also offer regional scholarships. Check swe.org/communities/local/omaha for Omaha section information.", "source": "https://scholarships.swe.org"}'::jsonb,
  '{"scholarship_type": "merit_field_of_study", "application_method": "portal_single_profile", "field": "engineering_engineering_technology", "gender_restriction": "women_and_non_binary", "award_count_national": "250+ scholarships annually", "notes": "No SWE membership required to apply. One application considered for all applicable SWE scholarships."}'::jsonb
),

-- ── 2. Iowa Engineering Society Foundation Scholarship ───────────────────────
-- Iowa students pursuing engineering. $1,000–$2,000.
-- Administered by Iowa Engineering Society. ~February deadline.
-- IWCC engineering students may qualify; Iowa 4-year engineering students too.
(
  'Iowa Engineering Society Foundation Scholarship — Iowa Engineering Students',
  'Iowa Engineering Society Foundation',
  'https://www.iowaengineeringsociety.org/',
  'The Iowa Engineering Society (IES) Foundation awards scholarships to Iowa students pursuing engineering degrees at accredited Iowa colleges and universities. Awards typically range from $1,000–$2,000 per year. Students at Iowa institutions including IWCC (pre-engineering transfer pathway), University of Iowa, Iowa State University, Drake University, and other accredited Iowa engineering programs are eligible. The scholarship application deadline is typically in February. The Iowa Engineering Society is the state professional organization for engineers — IES scholarships are well-regarded in Iowa engineering circles and can strengthen professional networking connections as students enter the field. Council Bluffs students enrolled in pre-engineering programs at IWCC who plan to transfer to an Iowa engineering program are eligible to apply. Visit iowaengineeringsociety.org for current scholarship opportunities, requirements, and application instructions.',
  'scholarship',
  'Iowa resident. Enrolled or planning to enroll in an accredited engineering program at an Iowa institution (IWCC, UI, ISU, Drake, etc.). Good academic standing (verify specific GPA requirements at iowaengineeringsociety.org). U.S. citizen or permanent resident. Application deadline: ~February annually. Apply at iowaengineeringsociety.org.',
  null,
  'https://www.iowaengineeringsociety.org/',
  'Iowa (statewide)',
  null, null, 'IA', null,
  true, false,
  array[]::text[],
  array['scholarship', 'college_access', 'merit', 'STEM', 'engineering', 'iowa_state_aid', 'field_of_study'],
  array['high_school_senior', 'college_freshman', 'college_sophomore', 'college_junior', 'college_senior'],
  'scholarship', null, 'annual',
  'medium', 'needs_confirmation',
  'https://www.iowaengineeringsociety.org/', 'official_website', '2026-03-20',
  true, false,
  'Deadline: ~February annually. Verify current scholarship requirements and deadlines at iowaengineeringsociety.org.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "inferred", "notes": "Iowa residents in Iowa engineering programs are eligible. IWCC Council Bluffs students in pre-engineering transfer pathways should check eligibility at iowaengineeringsociety.org.", "source": "https://www.iowaengineeringsociety.org"}'::jsonb,
  '{"scholarship_type": "merit_field_of_study", "application_method": "separate_application_required", "field": "engineering", "state": "Iowa", "notes": "Iowa state engineering professional organization scholarship — good networking connections in addition to financial support."}'::jsonb
),

-- ── 3. VFW Patriots Pen — Middle School Essay Competition ────────────────────
-- Companion to VFW Voice of Democracy (already in DB for grades 9–12).
-- For grades 6–8. Up to $5,000 national prize.
-- October 31 deadline. Submitted through local VFW post.
-- Council Bluffs VFW posts administer local competition.
(
  'VFW Patriots Pen — Middle School Essay Competition — Up to $5,000 (Grades 6–8)',
  'Veterans of Foreign Wars of the United States (VFW)',
  'https://www.vfw.org/community/youth-and-education/patriots-pen',
  'The VFW Patriots Pen is a national essay competition for students in grades 6–8, awarded annually alongside the Voice of Democracy program (which serves grades 9–12 and is already listed in this database). Each year, the Patriots Pen uses a new patriotic theme — students write a 300–400 word essay responding to the theme. The national first-place winner receives $5,000; additional national prizes range from $500–$2,500; district and state winners receive additional awards. More importantly, every participant gets community recognition and a strong application essay experience. Students submit their essays through their local VFW post — Council Bluffs has active VFW posts that participate in the program. Contact the Council Bluffs area VFW posts or your middle school counselor for the specific local submission process. The deadline is October 31 annually. This is one of the only significant scholarship competitions open to middle school students — it is worth the time investment even for the essay writing practice alone.',
  'scholarship',
  'Students in grades 6, 7, or 8. Enrolled in a public, private, or home school in the U.S. U.S. citizen or permanent resident. Write a 300–400 word essay responding to the current year''s Patriots Pen theme. Submit through your local VFW post (contact your school or the Council Bluffs VFW). Deadline: October 31 annually. Verify current theme and local submission process at vfw.org/community/youth-and-education/patriots-pen.',
  '2026-10-31',
  'https://www.vfw.org/community/youth-and-education/patriots-pen',
  'Council Bluffs, IA / Omaha, NE (local VFW posts)',
  null, null, null, null,
  false, false,
  array[]::text[],
  array['scholarship', 'writing', 'patriotic', 'middle_school', 'essay_competition', 'local'],
  array['grade_6', 'grade_7', 'grade_8'],
  'scholarship', 5000, 'one_time',
  'high', 'verified',
  'https://www.vfw.org/community/youth-and-education/patriots-pen', 'official_website', '2026-03-20',
  true, false,
  'Deadline: October 31 annually. Annual theme announced each summer. Submit through local VFW post. Council Bluffs VFW posts participate — contact your school counselor or local VFW post for submission details.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "Council Bluffs VFW posts participate in the Patriots Pen program. CB middle school students can submit through local posts. NOTE: The VFW Voice of Democracy (for grades 9–12) is already separately listed in this database.", "source": "https://www.vfw.org"}'::jsonb,
  '{"scholarship_type": "essay_competition", "application_method": "through_local_vfw_post", "grade_levels": "6-8 only", "notes": "Companion program to VFW Voice of Democracy (grades 9–12, already in this database). Middle school students should compete in Patriots Pen; high school students in Voice of Democracy."}'::jsonb
),

-- ── 4. Iowa Grant (State Need-Based Grant for Iowa Residents) ─────────────────
-- Companion to Iowa Tuition Grant (already in DB) and Iowa Voc-Tech Grant (migration 080).
-- Up to $1,000/yr for Iowa residents with exceptional financial need.
-- FAFSA + IFAA required. April 1 priority deadline.
-- IWCC students with highest need are eligible.
(
  'Iowa Grant — Up to $1,000/Year (Exceptional Financial Need, Iowa Residents)',
  'Iowa College Aid (State of Iowa)',
  'https://educate.iowa.gov/',
  'The Iowa Grant is a state-funded need-based grant of up to $1,000 per year for Iowa residents with exceptional financial need who are enrolled at least half-time at an eligible Iowa institution. Iowa Western Community College (IWCC) in Council Bluffs is an eligible institution. The Iowa Grant is for students with the highest demonstrated financial need — it is typically awarded to students with the lowest Expected Family Contributions (EFC) as determined by the FAFSA. No separate application is required: the Iowa Grant is awarded automatically based on FAFSA and Iowa Financial Aid Application (IFAA) data. The April 1 priority FAFSA deadline maximizes consideration, but students can file later on a rolling basis as long as funds remain. This grant can be combined with other Iowa state aid (Iowa Last-Dollar Scholarship, Iowa Vocational-Technical Tuition Grant, Iowa Tuition Grant) to form a comprehensive Iowa state financial aid package. Council Bluffs students attending IWCC who have completed the FAFSA and IFAA are automatically considered — no additional steps required.',
  'scholarship',
  'Iowa resident. Enrolled at least half-time at an eligible Iowa institution (IWCC and other Iowa community colleges and 4-year institutions are eligible). Exceptional financial need as demonstrated by FAFSA and Iowa Financial Aid Application (IFAA) at educate.iowa.gov. No separate grant application — triggered by FAFSA + IFAA filing. Priority deadline: April 1 (FAFSA + IFAA). Rolling basis until funds exhausted.',
  '2026-04-01',
  'https://educate.iowa.gov/',
  'Council Bluffs, IA (IWCC) and other Iowa institutions',
  null, 'Council Bluffs', 'IA', null,
  true, false,
  array['low_income']::text[],
  array['scholarship', 'college_access', 'need_based', 'iowa_state_aid'],
  array['high_school_senior', 'college_freshman', 'college_sophomore'],
  'scholarship', 1000, 'annual',
  'high', 'verified',
  'https://educate.iowa.gov/', 'official_website', '2026-03-20',
  true, false,
  'Priority deadline: April 1 (FAFSA + IFAA at educate.iowa.gov). Rolling basis after that. File FAFSA as early as October 1 (when it opens) for best consideration.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["low_income", "exceptional_need"], "mission_notes": "Iowa Grant targets students with the highest financial need — not just low-income but exceptional need. IWCC Council Bluffs students with highest-need profiles are the primary audience."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "Iowa Western Community College (IWCC) in Council Bluffs is an eligible institution. CB students enrolled at IWCC who file FAFSA + IFAA are automatically considered. No separate application needed.", "source": "https://educate.iowa.gov"}'::jsonb,
  '{"scholarship_type": "state_grant_need_based", "application_method": "fafsa_plus_ifaa", "state": "Iowa", "notes": "Separate from Iowa Tuition Grant (private colleges), Iowa Voc-Tech Tuition Grant (vocational programs), and Iowa Last-Dollar Scholarship. All Iowa state aid programs require FAFSA + Iowa Financial Aid Application (IFAA) at educate.iowa.gov."}'::jsonb
);
