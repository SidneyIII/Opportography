-- ============================================================
-- Opportography — Migration 080
-- Phase 15R: Scholarship Deep Dive — Local Civic & Regional Scholarships
-- Date: 2026-03-20
--
-- 5 verified entries:
--   1. Horatio Alger National Scholarship (distinct from NE/IA state entry)
--   2. Aksarben Foundation Scholarships (general pool, non-Horatio-Alger)
--   3. Council Bluffs Rotary Club Scholarship
--   4. Nebraska Nurses Foundation Scholarship
--   5. Iowa Vocational-Technical Tuition Grant
--
-- Note: The Horatio Alger NEBRASKA/IOWA state scholarship (co-administered
-- by Aksarben Foundation, $10,000 over 4 years for NE + western Iowa
-- students) is ALREADY in the DB (migration 021, entry 8). This entry
-- is for the separate NATIONAL Horatio Alger Scholarship program
-- (up to $25,000, October deadline, all 50 states), which is a distinct
-- and separate award.
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

-- ── 1. Horatio Alger National Scholarship ────────────────────────────────────
-- DISTINCT from the NE/IA state scholarship already in DB (migration 021).
-- Up to $25,000. October deadline. All 50 states eligible.
-- For HS seniors who have overcome significant adversity. Critical financial need.
(
  'Horatio Alger National Scholarship — Up to $25,000 (Adversity + Financial Need)',
  'Horatio Alger Association of Distinguished Americans',
  'https://scholars.horatioalger.org/',
  'The Horatio Alger National Scholarship is a separate and distinct award from the Horatio Alger Nebraska/Western Iowa state scholarship (which is co-administered by the Aksarben Foundation and is already listed in this database for Nebraska and Council Bluffs students). The National scholarship awards up to $25,000 to high school seniors from all 50 states who have demonstrated strength of character in overcoming adversity and who have critical financial need. Approximately 106 scholarships are awarded nationally per year. The Horatio Alger Association was founded to honor the American ideal that adversity and hard circumstances do not determine a person''s future — the scholarship specifically seeks students who have persevered through difficult family situations, poverty, instability, or hardship. Unlike purely merit-based scholarships, Horatio Alger national emphasizes the student''s personal story of resilience. Financial need is a hard requirement — family income typically under $55,000. The application opens in April with an October 25 deadline. Omaha and Council Bluffs students who have overcome significant life challenges are encouraged to apply.',
  'scholarship',
  'High school senior. U.S. citizen. Critical financial need (family income typically under $55,000 annually). Minimum 2.0 GPA — this is a low threshold intentionally, as the scholarship emphasizes resilience over grades. Demonstrated record of perseverance in overcoming adverse circumstances (financial hardship, family instability, illness, or other significant challenges). Engaged in community service or extracurricular activities. Apply at scholars.horatioalger.org by October 25. Note: This is the NATIONAL program — a distinct award from the Nebraska/Western Iowa state scholarship (also in this database, migration 021).',
  '2026-10-25',
  'https://scholars.horatioalger.org/',
  'Remote (National)',
  null, null, null, null,
  true, false,
  array['low_income', 'first_gen']::text[],
  array['scholarship', 'college_access', 'need_based', 'national', 'adversity', 'resilience'],
  array['high_school_senior'],
  'scholarship', 25000, 'one_time',
  'high', 'verified',
  'https://scholars.horatioalger.org/', 'official_website', '2026-03-20',
  true, true,
  'Application opens ~April. Deadline: October 25 annually. Verify exact dates at scholars.horatioalger.org. NOTE: The Nebraska/Western Iowa state-level Horatio Alger scholarship (different program, same organization) is separately listed in this database.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["low_income", "first_gen", "adversity_survivors"], "mission_notes": "The Horatio Alger National Scholarship is specifically for students who have overcome significant adversity. A 2.0 GPA minimum — unlike most scholarships — reflects the program''s recognition that difficult life circumstances affect academic records."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "National program — all 50 states eligible. Omaha and Council Bluffs students are fully eligible. IMPORTANT: This is the National scholarship (all states). The Nebraska/Western Iowa state scholarship ($10,000, Aksarben co-administered) is a SEPARATE program already in this database (migration 021).", "source": "https://scholars.horatioalger.org"}'::jsonb,
  '{"scholarship_type": "need_adversity", "application_method": "separate_application_required", "award_count_national": "~106 per year", "notes": "Minimum 2.0 GPA is intentionally low — this scholarship explicitly recognizes that adversity affects academic performance. Students who have faced significant hardship should apply regardless of GPA concerns."}'::jsonb
),

-- ── 2. Aksarben Foundation Scholarships (General Pool) ───────────────────────
-- Aksarben Foundation offers scholarships beyond the Horatio Alger program.
-- General scholarship pool for Nebraska + western Iowa students.
-- $1,000–$5,000 range. ~March deadline. aksarben.org/scholarships.
(
  'Aksarben Foundation Scholarships — Nebraska & Western Iowa Students',
  'Aksarben Foundation',
  'https://aksarben.org/scholarships-and-internships/',
  'The Aksarben Foundation administers multiple scholarship programs for Nebraska and western Iowa (including Council Bluffs / Pottawattamie County) students beyond the Horatio Alger award. The Aksarben general scholarship pool awards $1,000–$5,000 per year to students pursuing higher education at Nebraska or Iowa accredited institutions. Scholarship categories vary by year and may include general merit/need awards, women in STEM awards, and field-of-study specific awards. Some Aksarben scholarships are partnered with corporate sponsors. The Aksarben Foundation also administers a paid internship program that places Nebraska and western Iowa college students with Omaha-area employers in STEM and business fields — a parallel opportunity worth investigating at aksarben.org. Deadlines for the general Aksarben scholarship pool are typically in February–March. Aksarben has been a cornerstone of Nebraska civic and educational life since 1895 — the name is Nebraska spelled backwards. Council Bluffs students are explicitly named in Aksarben''s western Iowa eligibility. Visit aksarben.org/scholarships-and-internships for current scholarship opportunities and deadlines.',
  'scholarship',
  'Nebraska resident or western Iowa (Pottawattamie County / Council Bluffs area) resident. Enrolled or planning to enroll at an accredited Nebraska or Iowa institution. Various awards have different GPA, field-of-study, and demographic requirements — check aksarben.org/scholarships-and-internships for current eligible programs. Apply at aksarben.org. Typical deadline: February–March annually.',
  null,
  'https://aksarben.org/scholarships-and-internships/',
  'Omaha, NE',
  null, 'Omaha', 'NE', null,
  true, false,
  array['low_income']::text[],
  array['scholarship', 'college_access', 'merit', 'need_based', 'regional'],
  array['high_school_senior', 'college_freshman', 'college_sophomore', 'college_junior', 'college_senior'],
  'scholarship', null, 'annual',
  'medium', 'needs_confirmation',
  'https://aksarben.org/scholarships-and-internships/', 'official_website', '2026-03-20',
  true, false,
  'Deadlines typically February–March annually. Check aksarben.org/scholarships-and-internships for current scholarship offerings, as specific programs change year to year. Also check for Aksarben internship program (paid, NE/western IA students, STEM + business).',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "Aksarben Foundation explicitly includes western Iowa and Pottawattamie County / Council Bluffs students in their scholarship eligibility. CB students are fully eligible.", "source": "https://aksarben.org"}'::jsonb,
  '{"scholarship_type": "merit_need_regional", "application_method": "separate_application_required", "notes": "Aksarben also administers the Horatio Alger Nebraska/Western Iowa state scholarship (separately listed in this database, migration 021) and a paid internship program. Check aksarben.org for current portfolio of programs."}'::jsonb
),

-- ── 3. Council Bluffs Rotary Club Scholarship ─────────────────────────────────
-- Local civic scholarship for CB-area high school seniors.
-- ~$1,000–$2,500. March–April deadline. Community service focus.
-- Applied through local Rotary clubs — no single central portal.
(
  'Council Bluffs Rotary Club Scholarship — CB-Area High School Seniors',
  'Rotary District 5970 / Council Bluffs Rotary Clubs',
  'https://rotary5970.org/',
  'The Council Bluffs area Rotary clubs (operating under Rotary District 5970) offer scholarships to graduating high school seniors from the Council Bluffs metro area. Rotary scholarships typically range from $1,000–$2,500 and emphasize community service, leadership, and character — the core values of Rotary International. Individual Rotary clubs in Council Bluffs administer their own scholarship funds, so there is no single centralized application portal. Students should contact the Council Bluffs Rotary Club or Lewis Central, Thomas Jefferson, Abraham Lincoln, or other CB-area high school counselors to find out which local Rotary club sponsors scholarships for their school. Deadlines are typically in March or April for May graduation. The application process usually involves a short essay, letters of recommendation, and a brief interview with Rotary club members. Rotary scholarships are often less competitive than national scholarships because they are community-focused and have a smaller applicant pool — CB seniors who meet the service and character requirements should apply.',
  'scholarship',
  'Graduating high school senior from the Council Bluffs metropolitan area (Lewis Central, Thomas Jefferson, Abraham Lincoln, St. Albert, or other CB-area schools). Strong record of community service and leadership. Good academic standing. Contact your high school counselor or the Council Bluffs Rotary Club at rotary5970.org to find the relevant local scholarship opportunity. Deadlines: typically March–April annually.',
  null,
  'https://rotary5970.org/',
  'Council Bluffs, IA',
  null, 'Council Bluffs', 'IA', null,
  false, false,
  array[]::text[],
  array['scholarship', 'college_access', 'local', 'leadership', 'community_service'],
  array['high_school_senior'],
  'scholarship', null, 'one_time',
  'medium', 'needs_confirmation',
  'https://rotary5970.org/', 'official_website', '2026-03-20',
  true, false,
  'Deadlines typically March–April annually. Contact high school counselor or local Rotary club directly — no central application portal. Each local Rotary club manages its own scholarship fund and timeline.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "This scholarship is specifically for Council Bluffs area students. CB high school seniors are the primary intended audience.", "source": "https://rotary5970.org"}'::jsonb,
  '{"scholarship_type": "local_civic", "application_method": "contact_local_club", "notes": "Individual Rotary clubs manage their own scholarship funds. Students should contact their high school counselor for the specific local Rotary club sponsoring scholarships for their school. No single central application."}'::jsonb
),

-- ── 4. Nebraska Nurses Foundation Scholarship ─────────────────────────────────
-- For Nebraska nursing students pursuing RN or advanced nursing degrees.
-- $500–$2,000. ~March–April deadline. Affiliated with Nebraska Nurses Assn.
(
  'Nebraska Nurses Foundation Scholarship — Nebraska Nursing Students',
  'Nebraska Nurses Foundation / Nebraska Nurses Association',
  'https://www.nebraskanurses.org/',
  'The Nebraska Nurses Foundation (NNF), affiliated with the Nebraska Nurses Association, awards scholarships to Nebraska nursing students pursuing their initial RN licensure (LPN-to-RN bridge, ADN, or BSN programs) or advancing their nursing education (BSN-to-MSN, DNP). Award amounts typically range from $500–$2,000, with multiple scholarships awarded per cycle. The application deadline is typically in March or April for the following academic year. Priority is given to Nebraska residents enrolled in Nebraska nursing programs, though some awards consider Iowa residents enrolled in Nebraska nursing programs (IWCC students completing nursing at partnering NE institutions may qualify). Nebraska is experiencing significant nursing shortages — these scholarships are designed to support the pipeline of new nurses into the state''s healthcare system. Students should also check with their specific nursing program (MCC, UNO, Nebraska Methodist College, Clarkson College) for institution-specific nursing scholarships in addition to NNF awards. Visit nebraskanurses.org for current scholarship opportunities and application instructions.',
  'scholarship',
  'Nebraska resident. Enrolled in an accredited nursing program in Nebraska (LPN-to-RN, ADN, BSN, MSN, or DNP). Demonstrated academic achievement and commitment to nursing in Nebraska. Some awards may require NNA student membership (verify at nebraskanurses.org). Financial need may be required for specific awards. Application deadline: ~March–April annually. Verify current scholarship requirements at nebraskanurses.org.',
  null,
  'https://www.nebraskanurses.org/',
  'Nebraska (statewide)',
  null, null, 'NE', null,
  true, false,
  array['low_income']::text[],
  array['scholarship', 'college_access', 'nursing', 'healthcare', 'need_based', 'field_of_study'],
  array['college_freshman', 'college_sophomore', 'college_junior', 'college_senior'],
  'scholarship', null, 'one_time',
  'medium', 'needs_confirmation',
  'https://www.nebraskanurses.org/', 'official_website', '2026-03-20',
  true, false,
  'Deadline: ~March–April annually. Verify current scholarship listings and requirements at nebraskanurses.org.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": false, "communities": ["nursing_students"], "mission_notes": "Nebraska faces significant nursing shortages — these scholarships support the pipeline of nurses into the state''s healthcare workforce."}'::jsonb,
  '{"eligible": true, "basis": "inferred", "notes": "Nebraska residents enrolled in Nebraska nursing programs. IWCC Council Bluffs nursing students may qualify if enrolled in Nebraska nursing program partnerships. Verify at nebraskanurses.org.", "source": "https://www.nebraskanurses.org"}'::jsonb,
  '{"scholarship_type": "field_of_study", "application_method": "separate_application_required", "field": "nursing", "notes": "Also check MCC, UNO, Nebraska Methodist College, Clarkson College for institution-specific nursing scholarships in addition to NNF awards."}'::jsonb
),

-- ── 5. Iowa Vocational-Technical Tuition Grant ───────────────────────────────
-- Companion to Iowa Tuition Grant (already in DB) and Iowa Last-Dollar (in DB).
-- Up to $1,200/yr for Iowa residents in vocational/technical programs.
-- FAFSA + IFAA required. July 1 priority deadline.
-- IWCC Council Bluffs students in vocational programs are eligible.
(
  'Iowa Vocational-Technical Tuition Grant — Up to $1,200/Year (Iowa Voc-Tech Students)',
  'Iowa College Aid (State of Iowa)',
  'https://educate.iowa.gov/',
  'The Iowa Vocational-Technical Tuition Grant is a state-funded grant for Iowa residents enrolled at least half-time in vocational or technical programs at eligible Iowa institutions, including Iowa Western Community College (IWCC) in Council Bluffs. Awards are up to $1,200 per year and are based on financial need demonstrated through the FAFSA and Iowa Financial Aid Application (IFAA). This grant is separate from — and can be used alongside — the Iowa Last-Dollar Scholarship (Future Ready Iowa) and the Iowa Tuition Grant, both of which are already listed in this database. Students in vocational/technical programs at IWCC (welding, HVAC, automotive, nursing assistant, medical coding, computer technology, culinary arts, and other workforce programs) should complete the FAFSA and the Iowa Financial Aid Application (IFAA) at educate.iowa.gov before the July 1 priority deadline to be considered for this grant and all other Iowa state aid programs simultaneously. No separate application is required beyond the FAFSA and IFAA.',
  'scholarship',
  'Iowa resident. Enrolled at least half-time in a vocational or technical program at an eligible Iowa institution (IWCC in Council Bluffs is eligible). Demonstrated financial need via FAFSA and Iowa Financial Aid Application (IFAA) at educate.iowa.gov. Priority deadline: July 1 (complete FAFSA by July 1 for maximum consideration). No separate grant application — triggered by FAFSA + IFAA filing.',
  '2026-07-01',
  'https://educate.iowa.gov/',
  'Council Bluffs, IA (IWCC) and other Iowa institutions',
  null, 'Council Bluffs', 'IA', null,
  true, false,
  array['low_income']::text[],
  array['scholarship', 'college_access', 'need_based', 'vocational', 'trades', 'iowa_state_aid'],
  array['high_school_senior', 'college_freshman', 'college_sophomore'],
  'scholarship', 1200, 'annual',
  'high', 'verified',
  'https://educate.iowa.gov/', 'official_website', '2026-03-20',
  true, false,
  'Priority deadline: July 1 (FAFSA + IFAA at educate.iowa.gov). Rolling basis after that until funds run out. File as early as October 1 (when FAFSA opens) for maximum consideration.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["low_income", "vocational_technical_students"], "mission_notes": "Iowa state grant specifically supporting vocational and technical education — a key resource for IWCC Council Bluffs students in workforce programs."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "Iowa Western Community College (IWCC) in Council Bluffs is an eligible institution. Council Bluffs students enrolled in vocational/technical programs at IWCC are eligible for this Iowa state grant.", "source": "https://educate.iowa.gov"}'::jsonb,
  '{"scholarship_type": "state_grant_need_based", "application_method": "fafsa_plus_ifaa", "state": "Iowa", "institution_requirements": "Accredited Iowa vocational/technical program", "notes": "Separate from Iowa Tuition Grant (private colleges) and Iowa Last-Dollar Scholarship (Future Ready Iowa). All Iowa state aid programs require the Iowa Financial Aid Application (IFAA) at educate.iowa.gov in addition to FAFSA."}'::jsonb
);
