-- ============================================================
-- Opportography — Migration 077
-- Phase 15O: Scholarship Deep Dive — Identity-Specific National Scholarships
-- Date: 2026-03-20
--
-- 5 verified entries:
--   1. UNCF Scholarship Portal (United Negro College Fund)
--   2. P.E.O. Program for Continuing Education (women, chapter-sponsored)
--   3. Pat Tillman Foundation Scholarship (military/veterans)
--   4. Ron Brown Scholar Program (African American HS seniors)
--   5. APIASF General Scholarship (Asian Pacific Islander American)
--
-- Previously confirmed in DB (do not re-seed):
--   - Hispanic Scholarship Fund (migration 002)
--   - TheDream.US / DACA (migration 021)
--   - BNSF/AISES Native American scholarship (migration 025)
--   - American Indian College Fund (migration 012)
--   - Native Forward Scholars (migration 012)
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

-- ── 1. UNCF Scholarship Portal ───────────────────────────────────────────────
-- United Negro College Fund administers 400+ scholarships via a single portal.
-- African American students; financial need; 2.5+ GPA.
-- Rolling deadlines by fund — students should apply to all applicable.
(
  'UNCF Scholarship Portal — 400+ Scholarships for African American Students',
  'United Negro College Fund (UNCF)',
  'https://uncf.org/scholarships',
  'The United Negro College Fund (UNCF) administers more than 400 scholarships through a single unified portal at uncf.org/scholarships. Students create one profile and are automatically matched and considered for multiple UNCF-administered scholarships simultaneously. Individual awards range from $500 to $7,500 or more, with some corporate-partnered scholarships reaching higher amounts. Most awards require a minimum 2.5 GPA and demonstrated financial need, though requirements vary by fund. Many awards are open to students at any accredited institution (not just HBCUs). Deadlines are rolling throughout the year — each scholarship fund has its own deadline. The most important action is to create a UNCF profile at uncf.org/scholarships and keep it active as scholarships open and close throughout the year. UNCF has helped more than 500,000 students earn college degrees. Omaha and Council Bluffs African American students are strongly encouraged to create a UNCF profile and apply to all matching scholarships. This is one of the most efficient scholarship search tools available for African American students — one profile, hundreds of opportunities.',
  'scholarship',
  'African American students. U.S. citizen or permanent resident. Minimum GPA of 2.5 (varies by fund — some require higher). Demonstrated financial need (FAFSA required for most funds). Enrolled or planning to enroll at an accredited U.S. college or university. Most awards open to students at any accredited institution (not HBCUs only). Create a free profile at uncf.org/scholarships to be matched to available awards. Deadlines vary by fund — check portal regularly.',
  null,
  'https://uncf.org/scholarships',
  'Remote (National)',
  null, null, null, null,
  true, false,
  array['low_income', 'first_gen', 'bipoc']::text[],
  array['scholarship', 'college_access', 'need_based', 'diversity', 'national'],
  array['high_school_senior', 'college_freshman', 'college_sophomore', 'college_junior', 'college_senior'],
  'scholarship', null, 'varies',
  'high', 'verified',
  'https://uncf.org/scholarships', 'official_website', '2026-03-20',
  true, true,
  'Rolling deadlines throughout the year. Create a profile at uncf.org/scholarships and check regularly as new scholarships open. Many scholarships open in the fall for the following academic year.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["Black_African_American", "low_income", "first_gen"], "mission_notes": "UNCF is the nation''s largest minority education organization — 400+ scholarships through a single portal. Creating a profile is one of the highest-leverage scholarship actions for African American students."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "National scholarship portal. No geographic restriction. Omaha and Council Bluffs African American students are fully eligible.", "source": "https://uncf.org/scholarships"}'::jsonb,
  '{"scholarship_type": "need_merit_diversity", "application_method": "portal_single_profile", "award_count_national": "400+ scholarships in portal", "notes": "Students create one profile and are matched to all applicable UNCF scholarships. Rolling deadlines — check portal regularly throughout the year."}'::jsonb
),

-- ── 2. P.E.O. Program for Continuing Education ───────────────────────────────
-- For women returning to or continuing higher education after interruption.
-- Must be sponsored by a local P.E.O. chapter (Omaha + SW Iowa chapters exist).
-- Up to $3,000. Must apply through local chapter — deadline varies by chapter.
(
  'P.E.O. Program for Continuing Education — Up to $3,000 (Women, Chapter-Sponsored)',
  'P.E.O. International',
  'https://www.peointernational.org/about-peo-pce',
  'The P.E.O. Program for Continuing Education (PCE) provides funding to women who need financial assistance to complete or continue their undergraduate or graduate education after an interruption in their schooling. Awards are up to $3,000 and are granted through local P.E.O. chapter sponsorship — meaning the applicant must be personally recommended by a member of a local P.E.O. chapter. P.E.O. chapters exist throughout the Omaha metro area and in southwest Iowa, including Council Bluffs. If you do not personally know a P.E.O. member, you can contact P.E.O. International to be connected with a chapter near you — many chapters actively seek deserving candidates to sponsor. The PCE is specifically for women who have experienced a break in their education (due to family, work, illness, or other life circumstances) and are now returning to complete their degree. This is particularly relevant for adult learners and returning students. Deadlines are set at the chapter level, typically November through February — contact your local P.E.O. chapter for current deadlines. A separate P.E.O. Scholar Award (up to $15,000) is available for women in doctoral programs.',
  'scholarship',
  'Women only. Must have experienced an interruption in education and be returning to complete undergraduate or graduate degree. Must be within 24 months of completing degree requirements at time of application. Must be nominated and sponsored by a local P.E.O. chapter member. U.S. or Canadian citizen or permanent resident. Demonstrate financial need. Contact P.E.O. International at peointernational.org to find a local chapter if you do not know a member.',
  null,
  'https://www.peointernational.org/about-peo-pce',
  'Remote (National — local chapter required)',
  null, null, null, null,
  true, false,
  array['women', 'low_income']::text[],
  array['scholarship', 'college_access', 'need_based', 'women', 'adult_learner', 'returning_student'],
  array['college_freshman', 'college_sophomore', 'college_junior', 'college_senior'],
  'scholarship', 3000, 'one_time',
  'high', 'verified',
  'https://www.peointernational.org/about-peo-pce', 'official_website', '2026-03-20',
  true, false,
  'Deadlines set at local chapter level — typically November through February. Contact your local P.E.O. chapter (or peointernational.org) for current deadlines. Requires chapter sponsorship — not a self-nomination process.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["women", "adult_learners", "returning_students", "low_income"], "mission_notes": "P.E.O. PCE is specifically for women who have faced interruptions to their education — a unique and often overlooked resource for returning adult learners in the Omaha/CB area."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "P.E.O. chapters exist in the Omaha metro area and in Council Bluffs / southwest Iowa. Contact peointernational.org to find your nearest chapter. Local chapter sponsorship is required — not a self-nomination process.", "source": "https://www.peointernational.org"}'::jsonb,
  '{"scholarship_type": "need_based", "application_method": "chapter_sponsorship_required", "special_requirement": "Must be sponsored by a local P.E.O. chapter member", "notes": "A companion program — P.E.O. Scholar Award — provides up to $15,000 for women in doctoral programs. Both require chapter sponsorship."}'::jsonb
),

-- ── 3. Pat Tillman Foundation Scholarship ────────────────────────────────────
-- For U.S. military service members, veterans, and military spouses.
-- Up to $25,000/yr. Leadership and community service focus.
-- Omaha has a substantial military and veteran community.
(
  'Pat Tillman Foundation Scholarship — Up to $25,000/Year (Military & Veterans)',
  'Pat Tillman Foundation',
  'https://pattillmanfoundation.org/tillman-scholars/',
  'The Pat Tillman Foundation Scholarship is a prestigious national award for U.S. military service members, veterans, and military spouses enrolled in accredited undergraduate or graduate programs. Named for NFL player and Army Ranger Pat Tillman, who was killed in Afghanistan in 2004, the scholarship awards up to $25,000 per year and is renewable. Tillman Scholars are selected not just for academic achievement, but for demonstrated leadership, commitment to service, and the potential to make a positive impact in their communities and fields. The foundation seeks applicants who are driven by purpose and are actively engaged in making a difference. Approximately 60–80 Tillman Scholars are selected annually from a highly competitive national pool. The scholarship can be used at any accredited U.S. college or university. Omaha has a significant military and veteran community including veterans from offutt Air Force Base (Bellevue) and the Nebraska Army National Guard — Omaha and Council Bluffs veterans and service members are encouraged to apply. The application opens in January with a deadline in late February.',
  'scholarship',
  'U.S. military service member (active duty, reserve, or National Guard), veteran, or military spouse enrolled at an accredited U.S. college or university at the undergraduate or graduate level. U.S. citizen or permanent resident. Demonstrated leadership, community service, and academic achievement. Application includes essays, resume, and letters of recommendation. Apply at pattillmanfoundation.org/tillman-scholars.',
  '2027-02-28',
  'https://pattillmanfoundation.org/tillman-scholars/',
  'Remote (National)',
  null, null, null, null,
  true, false,
  array['military', 'veterans']::text[],
  array['scholarship', 'college_access', 'military', 'veterans', 'leadership', 'national'],
  array['college_freshman', 'college_sophomore', 'college_junior', 'college_senior'],
  'scholarship', 25000, 'annual',
  'high', 'verified',
  'https://pattillmanfoundation.org/tillman-scholars/', 'official_website', '2026-03-20',
  true, true,
  'Application opens ~January. Deadline: ~late February annually. Verify exact dates at pattillmanfoundation.org.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": false, "communities": ["military", "veterans", "military_spouses"], "mission_notes": "Named for Pat Tillman — a scholarship defined by leadership and service values. Omaha-area veterans near Offutt Air Force Base and the Nebraska National Guard are encouraged to apply."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "National scholarship — all U.S. military service members, veterans, and military spouses attending accredited colleges are eligible. Offutt AFB (Bellevue) and Nebraska/Iowa National Guard members near Omaha/CB are eligible.", "source": "https://pattillmanfoundation.org"}'::jsonb,
  '{"scholarship_type": "merit_service", "application_method": "separate_application_required", "award_count_national": "~60-80 per year", "competitiveness": "very_high", "renewable": {"is_renewable": true, "notes": "Renewable with continued enrollment and satisfactory academic progress"}, "special_populations": ["active_duty", "reserve", "National_Guard", "veterans", "military_spouses"]}'::jsonb
),

-- ── 4. Ron Brown Scholar Program ─────────────────────────────────────────────
-- $40,000 total ($10,000/yr x 4 years). For African American HS seniors.
-- Leadership, academic excellence, community service, financial need.
-- ~20 scholarships awarded per year nationally. Named for late SecComm Ron Brown.
(
  'Ron Brown Scholar Program — $40,000 (African American High School Seniors)',
  'Ron Brown Scholar Program',
  'https://www.ronbrown.org/',
  'The Ron Brown Scholar Program awards $40,000 scholarships ($10,000 per year for four years) to African American high school seniors who demonstrate academic excellence, leadership, community service, and financial need. Approximately 10–20 scholarships are awarded annually from a pool of highly competitive applicants. The program is named for the late U.S. Secretary of Commerce Ron Brown, who died in a plane crash in 1996 while on a trade mission. Scholars receive not just financial support but access to the Ron Brown Scholar community, mentoring, and career development resources. The program values community engagement and leadership as much as GPA and test scores — students who have made a meaningful impact in their communities, schools, or organizations are competitive applicants. The scholarship is renewable for four years contingent on academic performance and continued community engagement. Applications open in August with a November deadline. Omaha and Council Bluffs African American students who meet the academic and service profile are strongly encouraged to apply.',
  'scholarship',
  'African American high school senior. U.S. citizen or permanent resident. Demonstrated academic excellence (high GPA and test scores). Demonstrated financial need. Strong record of community service and leadership. Application includes transcripts, test scores, essays, letters of recommendation, and a financial need assessment. Apply at ronbrown.org.',
  '2026-11-01',
  'https://www.ronbrown.org/',
  'Remote (National)',
  null, null, null, null,
  true, false,
  array['low_income', 'first_gen', 'bipoc']::text[],
  array['scholarship', 'college_access', 'need_based', 'merit', 'leadership', 'diversity', 'national'],
  array['high_school_senior'],
  'scholarship', 10000, 'annual',
  'high', 'verified',
  'https://www.ronbrown.org/', 'official_website', '2026-03-20',
  true, true,
  'Application opens ~August. Deadline: ~November annually. Verify exact dates at ronbrown.org.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["Black_African_American", "low_income", "student_leaders"], "mission_notes": "Ron Brown Scholar Program honors the legacy of Secretary Ron Brown — a scholarship for African American students who combine academic excellence with meaningful community service."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "National scholarship — all eligible African American high school seniors are eligible regardless of geography. Omaha and Council Bluffs students are fully eligible.", "source": "https://www.ronbrown.org"}'::jsonb,
  '{"scholarship_type": "merit_need_leadership", "application_method": "separate_application_required", "award_count_national": "~10-20 per year", "competitiveness": "extremely_high", "renewable": {"is_renewable": true, "max_years": 4, "notes": "Renewable with continued academic performance and community engagement"}}'::jsonb
),

-- ── 5. APIASF General Scholarship ────────────────────────────────────────────
-- Asian Pacific Islander American Scholarship Fund.
-- $2,500–$20,000. For APIA students with financial need.
-- Omaha has a growing APIA community. January deadline.
(
  'APIASF Scholarship — Up to $20,000 (Asian Pacific Islander American Students)',
  'Asian Pacific Islander American Scholarship Fund (APIASF)',
  'https://www.apiasf.org/',
  'The Asian Pacific Islander American Scholarship Fund (APIASF) provides scholarships of $2,500 to $20,000 to Asian Pacific Islander American (APIA) students who have financial need and strong academic records. APIASF administers a general scholarship as well as scholarship funds partnered with major corporations including Walmart, Wells Fargo, and others. Students submit one application to be considered for multiple APIASF scholarship programs simultaneously. The scholarship is open to U.S. citizens, nationals, permanent residents, and citizens of Micronesia, Palau, and the Marshall Islands. Eligible students must have a GPA of 2.7 or higher and demonstrate financial need. APIASF serves students from diverse Asian Pacific communities including South Asian, Southeast Asian, East Asian, and Pacific Islander backgrounds. The Omaha metro has a growing APIA community — students of Filipino, Vietnamese, Chinese, Korean, South Asian, and Pacific Islander backgrounds are among those commonly served. Applications open in October with a January deadline. Becoming an APIASF Scholar also provides access to leadership development programs and a national APIA scholar network.',
  'scholarship',
  'Asian Pacific Islander American heritage. U.S. citizen, U.S. national, permanent resident, or citizen of Micronesia, Palau, or Marshall Islands. GPA of 2.7 or higher. Demonstrated financial need. Enrolled or planning to enroll at an accredited U.S. college or university. Application includes transcripts, essays, and financial information. Apply at apiasf.org. Application opens October, deadline in January.',
  '2027-01-31',
  'https://www.apiasf.org/',
  'Remote (National)',
  null, null, null, null,
  true, false,
  array['low_income', 'first_gen', 'bipoc']::text[],
  array['scholarship', 'college_access', 'need_based', 'diversity', 'national', 'APIA'],
  array['high_school_senior', 'college_freshman', 'college_sophomore', 'college_junior'],
  'scholarship', null, 'annual',
  'high', 'verified',
  'https://www.apiasf.org/', 'official_website', '2026-03-20',
  true, false,
  'Application opens ~October. Deadline: ~January annually. Verify exact dates at apiasf.org.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["Asian_Pacific_Islander_American", "low_income", "first_gen"], "mission_notes": "APIASF serves the diverse APIA community — South Asian, Southeast Asian, East Asian, Pacific Islander. The Omaha metro APIA community (Filipino, Vietnamese, Chinese, Korean, South Asian, Pacific Islander) is fully eligible."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "National scholarship — all eligible APIA students are eligible regardless of geography. Omaha and Council Bluffs APIA students are fully eligible.", "source": "https://www.apiasf.org"}'::jsonb,
  '{"scholarship_type": "need_merit_diversity", "application_method": "portal_single_profile", "notes": "One application considered for multiple APIASF scholarship programs. Also access to corporate-partnered scholarship funds through APIASF portal."}'::jsonb
);
