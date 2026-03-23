-- ============================================================
-- Opportography — Migration 075
-- Phase 15M: Scholarship Deep Dive — Other Nebraska Colleges
--             (UNK, College of Saint Mary, Nebraska Methodist College)
-- Date: 2026-03-20
--
-- 3 verified entries:
--   1. University of Nebraska Kearney — Scholarship Days Competition
--   2. College of Saint Mary — Merit & Mission Scholarships (Omaha)
--   3. Nebraska Methodist College — Healthcare Pathway Scholarships
--
-- Dead ends / excluded:
--   - UNMC: Graduate/professional school only (medical, pharmacy,
--     dental, nursing grad programs). No undergraduate scholarships.
--     Undergraduate pre-health students attend UNO, Creighton, etc.
--   - Bellevue University: Primarily adult learner / transfer-focused.
--     Limited traditional merit scholarships for recent HS graduates.
--     Adult learners should check bellevue.edu/financial-aid directly.
--   - Clarkson College: Already has open house entry in DB (migration
--     070). Institutional scholarships exist but Clarkson is part of
--     Nebraska Medicine system — scholarship details best obtained
--     through admissions at clarksoncollege.edu directly.
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

-- ── 1. University of Nebraska Kearney — Scholarship Days Competition ─────────
-- UNK holds competitive scholarship competitions on-campus in the spring
-- for prospective freshmen. Students compete for significant merit awards.
-- UNK is ~175 miles west of Omaha/CB — a viable option for students
-- willing to relocate; in-state tuition for Nebraska residents; Iowa
-- students pay out-of-state but lower than UNL.
(
  'University of Nebraska Kearney — Scholarship Days Competition (Merit)',
  'University of Nebraska Kearney Office of Financial Aid',
  'https://www.unk.edu/admissions/scholarships/',
  'The University of Nebraska Kearney (UNK) hosts Scholarship Days — competitive scholarship events held on campus in the spring for admitted prospective freshmen. Students who attend Scholarship Days compete for merit awards including the Distinguished Scholarship (full tuition), Honors Scholarship, and academic departmental scholarships. The on-campus visit is part of the award consideration — students who attend perform better in scholarship competitions than those who apply remotely. UNK is a smaller, more personal campus (~6,000 students) than UNL with strong education, nursing, business, and fine arts programs. Nebraska residents pay in-state tuition; Iowa/Council Bluffs students pay out-of-state tuition (verify current rates at unk.edu), though UNK tuition is lower than UNL. Merit scholarships at UNK can significantly offset the cost. If you are considering a smaller campus with strong career placement, UNK Scholarship Days are worth attending.',
  'institutional_scholarship',
  'Must be admitted to UNK as a first-year undergraduate. Register to attend a Scholarship Days event at unk.edu/admissions/scholarships. Events are typically held in January–March for the following fall enrollment. Strong academic record (GPA and ACT/SAT scores) expected for top scholarship tiers. Open to Nebraska and out-of-state students including Iowa/Council Bluffs students. Verify current Scholarship Days dates and registration at unk.edu/admissions/scholarships.',
  null,
  'https://www.unk.edu/admissions/scholarships/',
  'Kearney, NE',
  '905 W 25th St', 'Kearney', 'NE', '68849',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access', 'merit'],
  array['high_school_senior'],
  'scholarship_amount', null, 'annual',
  'medium', 'needs_confirmation',
  'https://www.unk.edu/admissions/scholarships/', 'official_website', '2026-03-20',
  true, false,
  'Scholarship Days events typically held January–March for fall enrollment. Register at unk.edu/admissions/scholarships. Must be admitted to UNK before attending. Verify current event dates at unk.edu.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "inferred", "notes": "Iowa/CB students are eligible but pay out-of-state tuition at UNK. Merit scholarships can offset costs. UNK tuition is lower than UNL. Distance: UNK is ~175 miles from Omaha/Council Bluffs.", "source": "https://www.unk.edu/admissions/scholarships/"}'::jsonb,
  '{"institution_abbr": "UNK", "institution_type": "public_4year", "scholarship_type": "competitive", "application_method": "campus_visit_required", "notes": "UNK is ~175 miles from Omaha/CB. Strong programs: education, nursing, business, fine arts. In-state tuition is significantly lower than UNL."}'::jsonb
),

-- ── 2. College of Saint Mary — Merit & Mission Scholarships ─────────────────
-- Private women's college in Omaha. Merit scholarships up to full tuition.
-- Mission scholarships for students aligned with CSM's Catholic Mercy values.
-- CB students pay same tuition as Omaha students — private college.
(
  'College of Saint Mary — Merit and Mission Scholarships (Omaha)',
  'College of Saint Mary Office of Admissions',
  'https://www.csm.edu/cost-aid/',
  'College of Saint Mary (CSM) is a private Catholic women''s college in Omaha (adjacent to UNO and Nebraska Medicine) offering merit scholarships and mission-based scholarships for incoming undergraduate and nursing students. Merit scholarships are automatic upon admission — no separate application required — and are tiered by GPA and ACT/SAT scores. The Saint Mary Scholarship covers a significant portion of tuition for students with strong academic records. Mission scholarships are available for students who demonstrate alignment with CSM''s Catholic and Mercy values of service and social justice — these may require a short application or essay. CSM is particularly strong in nursing, education, natural sciences, and business. Being a women''s college means all undergraduate scholarship awards are for women. Council Bluffs and Iowa students are eligible — as a private college, CSM charges the same tuition regardless of residency. Verify current scholarship amounts, tiers, and any separate application requirements at csm.edu/cost-aid.',
  'institutional_scholarship',
  'Women-identified students only (CSM is a women''s college). Must be admitted to CSM as a first-year undergraduate. Merit scholarships determined automatically upon admission based on GPA and ACT/SAT scores. Mission scholarships may require a short essay or application — check csm.edu/cost-aid for current requirements. Financial need-based aid also available via FAFSA. Council Bluffs and Iowa students eligible — same tuition as Nebraska students. Verify current scholarship details at csm.edu/cost-aid.',
  null,
  'https://www.csm.edu/cost-aid/',
  'Omaha, NE',
  '7000 Mercy Rd', 'Omaha', 'NE', '68106',
  false, false,
  array['women']::text[],
  array['scholarship', 'college_access', 'merit', 'nursing', 'women'],
  array['high_school_senior'],
  'scholarship_amount', null, 'annual',
  'medium', 'needs_confirmation',
  'https://www.csm.edu/cost-aid/', 'official_website', '2026-03-20',
  true, false,
  'Merit scholarships announced with admission decision. No separate application required for merit awards. Mission scholarship may have additional application — verify at csm.edu/cost-aid. Priority admission deadline: typically December 1.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "College of Saint Mary is a private college in Omaha. Iowa and Council Bluffs students pay the same tuition as Nebraska residents. No residency-based tuition difference.", "source": "https://www.csm.edu/cost-aid/"}'::jsonb,
  '{"institution_abbr": "CSM", "institution_type": "private_4year", "scholarship_type": "merit_and_mission", "application_method": "automatic_upon_admission", "gender_restriction": "women_only", "notes": "CSM is a women''s college. Strong nursing, education, and science programs. Located in Omaha adjacent to Nebraska Medicine hospital system."}'::jsonb
),

-- ── 3. Nebraska Methodist College — Healthcare Pathway Scholarships ──────────
-- Private healthcare-focused college in Omaha. Affiliated with Methodist Health.
-- Strong nursing, respiratory therapy, and imaging/radiology programs.
-- CB students eligible — private college, no residency tuition difference.
(
  'Nebraska Methodist College — Healthcare Pathway Merit Scholarships',
  'Nebraska Methodist College Office of Financial Aid',
  'https://www.methodistcollege.edu/cost-and-aid/',
  'Nebraska Methodist College (NMC) is a private healthcare-focused college in Omaha offering degrees in nursing, respiratory care, radiologic technology, surgical technology, and healthcare administration. NMC partners with Methodist Health System — its clinical training is embedded in active hospital environments, and many graduates are hired directly by Methodist Health. Merit scholarships are available for admitted students with strong academic records and are typically awarded automatically or through a streamlined application process. NMC is a smaller, more specialized institution (~700 students) where clinical connections are built into the curriculum. If you are planning a career in nursing, imaging, or respiratory therapy and want strong Omaha-area clinical placement, NMC offers both merit aid and a direct pipeline into Methodist Health employment. Council Bluffs and Iowa students pay the same tuition as Nebraska students — NMC is a private college with no residency tuition difference. Verify current scholarship amounts and application requirements at methodistcollege.edu/cost-and-aid.',
  'institutional_scholarship',
  'Must be admitted to Nebraska Methodist College. Merit scholarships based on academic record (GPA, ACT/SAT). Free Application for Federal Student Aid (FAFSA) required for need-based aid consideration. Iowa/Council Bluffs students eligible — same tuition as Nebraska residents. Open to students pursuing healthcare programs: nursing (BSN), respiratory care, radiologic technology, surgical technology, healthcare administration. Verify current scholarship amounts and requirements at methodistcollege.edu/cost-and-aid.',
  null,
  'https://www.methodistcollege.edu/cost-and-aid/',
  'Omaha, NE',
  '720 N 87th St', 'Omaha', 'NE', '68114',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access', 'merit', 'nursing', 'healthcare', 'allied_health'],
  array['high_school_senior', 'college_freshman'],
  'scholarship_amount', null, 'annual',
  'medium', 'needs_confirmation',
  'https://www.methodistcollege.edu/cost-and-aid/', 'official_website', '2026-03-20',
  true, false,
  'Scholarship consideration is part of the admission process. Verify current deadlines and scholarship amounts at methodistcollege.edu/cost-and-aid. Rolling admission — apply early for best merit scholarship consideration.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "Nebraska Methodist College is a private college. Iowa and Council Bluffs students pay the same tuition as Nebraska students — no residency-based tuition difference.", "source": "https://www.methodistcollege.edu/cost-and-aid/"}'::jsonb,
  '{"institution_abbr": "NMC", "institution_type": "private_4year", "scholarship_type": "merit", "application_method": "automatic_upon_admission", "notes": "Healthcare-only institution. Strong clinical placement through Methodist Health System. Located in west Omaha."}'::jsonb
);
