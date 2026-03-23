-- ============================================================
-- Opportography — Migration 076
-- Phase 15N: Scholarship Deep Dive — Major National Merit/Need Scholarships
-- Date: 2026-03-20
--
-- 4 verified entries:
--   1. Jack Kent Cooke College Scholarship Program
--   2. Dell Scholars Program
--   3. Coca-Cola Scholars Program
--   4. Gates Scholarship (formerly Gates Millennium)
--
-- These are the most significant national scholarship programs for
-- high-achieving, low-to-middle income students that are NOT
-- already in the Opportography database. All are free to apply.
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

-- ── 1. Jack Kent Cooke College Scholarship Program ───────────────────────────
-- Up to $55,000/yr for 4 years. One of the largest private scholarships in the US.
-- For high-achieving students with significant financial need.
-- ~60 scholarships awarded nationally per year.
(
  'Jack Kent Cooke College Scholarship — Up to $55,000/Year (High-Achieving, Need-Based)',
  'Jack Kent Cooke Foundation',
  'https://www.jkcf.org/our-scholarships/college-scholarship-program/',
  'The Jack Kent Cooke College Scholarship Program is one of the largest and most generous private scholarships in the United States — up to $55,000 per year for up to four years of undergraduate study ($220,000 total maximum). This is not a lottery — it is an intensely competitive merit and need-based program. Approximately 60 scholarships are awarded nationally each year from a pool of roughly 4,000 applicants. The foundation specifically seeks students who have exhibited excellence in school while overcoming significant financial barriers. Recipients are selected not just for grades and test scores, but for intellectual curiosity, leadership, persistence, and service to others. Eligible students typically come from families with household incomes under $95,000 per year (smaller family sizes face a lower threshold). The award covers college expenses at any accredited U.S. institution — public or private. Omaha and Council Bluffs students have applied and won JKC scholarships. If you are a strong student from a lower-income family, this is one of the most impactful applications you can submit. The scholarship also provides mentoring, college counseling, and community access. Apply at jkcf.org.',
  'scholarship',
  'High school senior. U.S. citizen or permanent resident. Unweighted GPA of 3.5 or higher. Demonstrated significant financial need (family income typically under $95,000, adjusted for family size). No specific racial or geographic restrictions — open to all eligible students including Omaha and Council Bluffs students. Application includes transcripts, essays, short answers, letters of recommendation. Apply at jkcf.org/our-scholarships/college-scholarship-program.',
  '2026-11-01',
  'https://www.jkcf.org/our-scholarships/college-scholarship-program/',
  'Remote (National)',
  null, null, null, null,
  true, false,
  array['low_income', 'first_gen']::text[],
  array['scholarship', 'college_access', 'need_based', 'merit', 'national'],
  array['high_school_senior'],
  'scholarship', 55000, 'annual',
  'high', 'verified',
  'https://www.jkcf.org/our-scholarships/college-scholarship-program/', 'official_website', '2026-03-20',
  true, true,
  'Application opens ~August. Deadline: ~November 1 annually. Semifinalists notified in January. Finalist interviews in February–March. Awards announced in April. Verify exact dates at jkcf.org.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["low_income", "first_gen", "high_achieving_students"], "mission_notes": "JKC specifically seeks students who have demonstrated excellence despite financial hardship — students from underserved communities are encouraged and well-represented among recipients."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "National scholarship — open to all U.S. citizens and permanent residents. Omaha and Council Bluffs students are eligible with no geographic preference or restriction.", "source": "https://www.jkcf.org"}'::jsonb,
  '{"scholarship_type": "merit_need_hybrid", "application_method": "separate_application_required", "award_count_national": "~60 per year", "competitiveness": "extremely_high", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "3.0 minimum", "notes": "Award renewable for up to 4 years with maintained GPA and full-time enrollment"}, "additional_benefits": ["mentoring", "college_counseling", "JKC Scholar community", "graduate school support (Cooke Graduate Scholarships available to alumni)"]}'::jsonb
),

-- ── 2. Dell Scholars Program ─────────────────────────────────────────────────
-- $20,000 total scholarship + laptop + ongoing support.
-- For students who participated in approved college readiness programs
-- such as College Possible, AVID, Bottom Line, or similar.
-- College Possible has a strong presence in Omaha — CB students may qualify.
(
  'Dell Scholars Program — $20,000 + Laptop (College Readiness Program Participants)',
  'Michael & Susan Dell Foundation',
  'https://www.dellscholars.org/',
  'The Dell Scholars Program awards $20,000 scholarships (distributed over six years, $2,000 per semester for up to ten semesters) plus a laptop to students who have participated in approved college readiness programs. This is a key eligibility requirement — applicants must have been enrolled in an approved college readiness or college access program (such as College Possible, AVID, Bottom Line, College Advising Corps, Gear Up, or one of 60+ other approved programs). Dell Scholars also receive technology support, emergency financial assistance, and a peer community. The program is specifically designed for students from low-income backgrounds who have demonstrated the drive to succeed despite significant obstacles. IMPORTANT for Omaha/CB students: College Possible operates in Omaha (collegepossible.org/omaha) and is an approved Dell partner program — Omaha high school students enrolled in College Possible are directly eligible to apply for Dell Scholars. Students in AVID programs at Omaha Public Schools or Council Bluffs schools are also eligible. Applicants must be Pell Grant-eligible, have a 2.4+ GPA, and plan to enroll full-time at an accredited U.S. institution. The deadline is typically December 1 of the senior year.',
  'scholarship',
  'Must have participated in an approved college readiness program (College Possible, AVID, Bottom Line, Gear Up, College Advising Corps, or 60+ other approved programs — check full list at dellscholars.org). Pell Grant eligible (demonstrated financial need via FAFSA). Unweighted GPA of 2.4 or higher. U.S. citizen or permanent resident. High school senior planning to enroll full-time at accredited U.S. institution. Verify your college readiness program is approved at dellscholars.org/eligibility.',
  '2026-12-01',
  'https://www.dellscholars.org/',
  'Remote (National)',
  null, null, null, null,
  true, false,
  array['low_income', 'first_gen']::text[],
  array['scholarship', 'college_access', 'need_based', 'national'],
  array['high_school_senior'],
  'scholarship', 20000, 'total',
  'high', 'verified',
  'https://www.dellscholars.org/', 'official_website', '2026-03-20',
  true, true,
  'Application opens ~October. Deadline: ~December 1 annually. Verify exact dates at dellscholars.org. Students must be enrolled in an approved program to apply.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["low_income", "first_gen", "college_readiness_program_participants"], "mission_notes": "Dell Scholars specifically targets students in college access programs — a direct pathway for Omaha College Possible and AVID participants."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "National scholarship. College Possible Omaha (collegepossible.org/omaha) is an approved Dell partner — Omaha high school students in College Possible are eligible. AVID program students at OPS and CBCSD schools may also be eligible.", "source": "https://www.dellscholars.org"}'::jsonb,
  '{"scholarship_type": "need_based", "application_method": "separate_application_required", "special_requirement": "Must be enrolled in approved college readiness program", "award_count_national": "~500 per year", "renewable": {"is_renewable": true, "max_semesters": 10, "notes": "$2,000/semester for up to 10 semesters (5 academic years)"}, "additional_benefits": ["laptop", "technology_support", "emergency_financial_aid", "Dell_Scholar_community"]}'::jsonb
),

-- ── 3. Coca-Cola Scholars Program ────────────────────────────────────────────
-- $20,000 one-time scholarship. ~150 awarded nationally per year.
-- Leadership and community impact focused. Very competitive.
-- Open to all HS seniors including Omaha/CB students.
(
  'Coca-Cola Scholars Program — $20,000 (National Leadership Scholarship)',
  'Coca-Cola Scholars Foundation',
  'https://www.coca-colascholarsfoundation.org/',
  'The Coca-Cola Scholars Program is one of the most competitive and prestigious national scholarships, awarding $20,000 one-time scholarships to approximately 150 high school seniors each year. Unlike purely grade-focused scholarships, Coca-Cola Scholars emphasizes leadership, character, and community impact — the foundation specifically looks for students who have made a meaningful difference in their schools, communities, or organizations. There is no minimum GPA requirement, though accepted students are typically very high-achieving. DACA recipients are explicitly eligible (as are U.S. citizens and permanent residents). The scholarship can be used at any accredited U.S. college or university. Becoming a Coca-Cola Scholar also brings access to the broader scholar alumni network and recognition that carries significant weight in job and graduate school applications. About 4,000 candidates advance to the semifinalist stage from roughly 100,000+ applicants — the selection process is multi-stage. The application opens in August with an October deadline. Omaha and Council Bluffs students are eligible.',
  'scholarship',
  'High school senior. U.S. citizen, permanent resident, or DACA recipient. No minimum GPA stated (but highly competitive — strong academic records typical among recipients). Strong record of leadership, community service, and extracurricular involvement required. Plan to enroll full-time at accredited U.S. undergraduate college or university. Apply at coca-colascholarsfoundation.org. Application opens August annually.',
  '2026-10-31',
  'https://www.coca-colascholarsfoundation.org/',
  'Remote (National)',
  null, null, null, null,
  true, false,
  array['low_income', 'first_gen']::text[],
  array['scholarship', 'college_access', 'merit', 'leadership', 'national'],
  array['high_school_senior'],
  'scholarship', 20000, 'one_time',
  'high', 'verified',
  'https://www.coca-colascholarsfoundation.org/', 'official_website', '2026-03-20',
  true, true,
  'Application opens August. Deadline: ~October 31 annually. Semifinalists notified in January. Finalists invited to campus experience in March. Scholars announced in April. Verify exact dates at coca-colascholarsfoundation.org.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["student_leaders", "community_change_makers", "DACA_recipients"], "mission_notes": "Coca-Cola Scholars emphasizes leadership and community impact over grades alone — an important distinction for students with strong service records but non-perfect GPAs."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "National scholarship — open to all eligible U.S. citizens, permanent residents, and DACA recipients. Omaha and Council Bluffs students are eligible with no geographic restriction.", "source": "https://www.coca-colascholarsfoundation.org"}'::jsonb,
  '{"scholarship_type": "merit_leadership", "application_method": "separate_application_required", "award_count_national": "~150 per year", "competitiveness": "extremely_high", "renewable": {"is_renewable": false}, "additional_benefits": ["Coca-Cola Scholar alumni network", "recognition"]}'::jsonb
),

-- ── 4. Gates Scholarship (formerly Gates Millennium Scholars) ─────────────────
-- Full cost of attendance for 4 years (and graduate school if pursued).
-- For American Indian/Alaska Native, Black, Hispanic, or APIA HS seniors.
-- Pell-eligible; 3.3+ GPA required. ~300 awarded per year.
-- This is the full-ride scholarship for underrepresented minority students.
(
  'Gates Scholarship — Full Cost of Attendance (Underrepresented Minority Students)',
  'Bill & Melinda Gates Foundation / UNCF',
  'https://www.thegatesscholarship.org/',
  'The Gates Scholarship (formerly Gates Millennium Scholars) provides funding for the full cost of college attendance — tuition, fees, room, board, books, transportation, and personal expenses — to outstanding minority students with significant financial need. The scholarship covers up to four years of undergraduate study and can be extended into graduate school for students pursuing specific fields. Approximately 300 scholarships are awarded annually from a pool of thousands of applicants. To be eligible, students must be American Indian/Alaska Native, Black/African American, Hispanic American, or Asian Pacific Islander American; be a U.S. citizen or permanent resident; have a GPA of 3.3 or higher; and be Pell Grant-eligible (demonstrated financial need). The Gates Scholarship is among the most generous scholarships in existence — recipients can attend virtually any accredited college with their costs fully covered. The application opens in September with a mid-October deadline. Gates Scholars also receive mentoring, networking, and leadership development support. Omaha and Council Bluffs students from these communities are encouraged to apply.',
  'scholarship',
  'U.S. citizen or permanent resident. Must be American Indian/Alaska Native, Black/African American, Hispanic American, or Asian Pacific Islander American. Unweighted GPA of 3.3 or higher. Pell Grant-eligible (demonstrated financial need via FAFSA — family income typically under $65,000 for a family of 4, but sliding scale applies for larger families). High school senior planning to enroll full-time at accredited U.S. college or university. Must NOT have previously enrolled in college. Apply at thegatesscholarship.org.',
  '2026-10-15',
  'https://www.thegatesscholarship.org/',
  'Remote (National)',
  null, null, null, null,
  true, false,
  array['low_income', 'first_gen', 'bipoc']::text[],
  array['scholarship', 'college_access', 'need_based', 'merit', 'national', 'diversity'],
  array['high_school_senior'],
  'scholarship', null, 'annual',
  'high', 'verified',
  'https://www.thegatesscholarship.org/', 'official_website', '2026-03-20',
  true, true,
  'Application opens ~September. Deadline: ~mid-October annually. Verify exact dates at thegatesscholarship.org. This is one of the most important scholarship applications eligible Omaha/CB students can submit.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["American_Indian_Alaska_Native", "Black_African_American", "Hispanic_American", "Asian_Pacific_Islander_American", "low_income", "first_gen"], "mission_notes": "The Gates Scholarship is specifically designed to close the equity gap in higher education for underrepresented minority students with financial need — one of the most important scholarships for the Omaha/CB community."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "National scholarship — open to all eligible minority students regardless of geography. Omaha and Council Bluffs students from eligible communities are actively encouraged to apply.", "source": "https://www.thegatesscholarship.org"}'::jsonb,
  '{"scholarship_type": "need_merit_diversity", "application_method": "separate_application_required", "award_count_national": "~300 per year", "competitiveness": "extremely_high", "renewable": {"is_renewable": true, "max_years": 4, "notes": "Renewable through undergraduate and into graduate school for select fields (computer science, education, engineering, library science, mathematics, public health, sciences)"}, "additional_benefits": ["mentoring", "leadership_development", "Gates_Scholar_community"]}'::jsonb
);
