-- ============================================================
-- Opportography — Migration 078
-- Phase 15P: Scholarship Deep Dive — Academic Recognition Programs
-- Date: 2026-03-20
--
-- 5 verified entries:
--   1. Phi Theta Kappa All-USA Academic Team (community college students)
--   2. QuestBridge College Prep Scholars (11th graders — distinct from
--      QuestBridge National College Match already in DB for 12th graders)
--   3. Barry Goldwater Scholarship (STEM undergrad research — faculty nomination)
--   4. Harry S. Truman Scholarship (public service, grad school funding)
--   5. Scholastic Art & Writing Awards (grades 7–12, up to $10,000)
--
-- Note: QuestBridge National College Match (for HS seniors) is ALREADY
-- in the DB (migration 002). This entry is for the companion College
-- Prep Scholars program for 11th graders — a distinct program.
--
-- Note: PTK All-Iowa Academic Team is a precursor to All-USA, managed
-- at the chapter level. IWCC PTK chapter advisors coordinate Iowa entries.
-- Students should contact IWCC PTK chapter directly for All-Iowa info.
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

-- ── 1. Phi Theta Kappa All-USA Academic Team ─────────────────────────────────
-- Top community college student recognition in the country.
-- 20 All-USA Team members receive up to $5,000. USA Today co-sponsors.
-- IWCC (Iowa Western Community College) students are eligible.
-- November deadline for community college students.
(
  'Phi Theta Kappa All-USA Academic Team — Up to $5,000 (Community College Students)',
  'Phi Theta Kappa Honor Society / USA Today',
  'https://www.ptk.org/programs/all-usa/',
  'The Phi Theta Kappa All-USA Academic Team is the nation''s most prestigious recognition program for two-year college students, co-sponsored by USA Today and Phi Theta Kappa (PTK) honor society. Each year, 20 students are selected as the All-USA Academic Team (1st, 2nd, and 3rd teams of 20 students total) from thousands of applications. First Team members receive up to $5,000 in scholarship funding; Second and Third Team members also receive significant recognition and smaller awards. PTK membership is required to apply. Iowa Western Community College (IWCC) has an active PTK chapter — students who are members are directly eligible to apply. The competition includes an academic portfolio, essays, and transcripts. All-USA winners are featured in USA Today and gain recognition that significantly boosts transfer applications to 4-year colleges. Successful candidates demonstrate intellectual engagement, academic excellence, and community leadership. The application deadline is typically in November for the current academic year. Students at IWCC interested in PTK membership should contact the IWCC PTK chapter advisor.',
  'scholarship',
  'Must be a current student at an accredited two-year community or technical college (IWCC, MCC, or other). Must be a member of Phi Theta Kappa honor society (PTK membership requires a 3.5 GPA and completion of at least 12 credit hours). Complete and submit All-USA application at ptk.org by the November deadline. Application includes academic portfolio, essays, and transcripts.',
  '2026-11-30',
  'https://www.ptk.org/programs/all-usa/',
  'Remote (National — community college students)',
  null, null, null, null,
  true, false,
  array[]::text[],
  array['scholarship', 'college_access', 'merit', 'honors', 'community_college', 'national'],
  array['college_freshman', 'college_sophomore'],
  'scholarship', 5000, 'one_time',
  'high', 'verified',
  'https://www.ptk.org/programs/all-usa/', 'official_website', '2026-03-20',
  true, true,
  'Application deadline: ~November annually. PTK membership required before applying. Verify exact deadline and current application at ptk.org/programs/all-usa.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "IWCC (Iowa Western Community College, Council Bluffs) has an active PTK chapter. IWCC students who meet GPA requirements are eligible for PTK membership and the All-USA Academic Team competition.", "source": "https://www.ptk.org"}'::jsonb,
  '{"scholarship_type": "merit_recognition", "application_method": "ptk_portal", "special_requirement": "PTK membership required (3.5 GPA, 12+ credit hours at two-year college)", "award_count_national": "20 All-USA members per year", "notes": "Also watch for PTK All-Iowa Academic Team — state-level precursor to All-USA managed at the IWCC PTK chapter level. Contact IWCC PTK chapter advisor for All-Iowa information."}'::jsonb
),

-- ── 2. QuestBridge College Prep Scholars (11th Grade) ────────────────────────
-- DISTINCT from QuestBridge National College Match (already in DB for 12th grade).
-- This is for current 11th graders. No monetary award — recognition +
-- access to college prep resources and early connection with QuestBridge partners.
-- April deadline. Students from low-income families with strong academics.
(
  'QuestBridge College Prep Scholars — 11th Grade College Access Program',
  'QuestBridge',
  'https://www.questbridge.org/college-prep-scholars',
  'QuestBridge College Prep Scholars is a free program for high-achieving 11th graders from low-income families — distinct from the QuestBridge National College Match program (which is for 12th graders and is already listed in this database). College Prep Scholars does not provide a monetary award, but it gives 11th graders early access to QuestBridge''s college guidance resources, college partner information, mentorship, and a community of similarly high-achieving low-income students. Being selected as a College Prep Scholar also positions students well for the QuestBridge National College Match (the full-ride scholarship program) in their senior year. The application is free and straightforward — it is one of the highest-leverage things a high-achieving 11th grader from a low-income family can do to prepare for the college scholarship process. QuestBridge specifically targets students whose families earn less than $65,000 per year, though higher incomes with unique circumstances are considered. The deadline is typically in April. Omaha and Council Bluffs students have successfully used QuestBridge — this program is the gateway into that pathway.',
  'scholarship',
  'Current 11th grade student (high school junior). Strong academic record (typically top of class; GPA of 3.5+ recommended). From a low-income or first-generation family (household income typically under $65,000; larger families with higher incomes may still qualify). U.S. citizen or permanent resident (or undocumented students — QuestBridge accepts undocumented applicants). Apply at questbridge.org/college-prep-scholars. Deadline: ~April annually.',
  '2026-04-01',
  'https://www.questbridge.org/college-prep-scholars',
  'Remote (National)',
  null, null, null, null,
  true, false,
  array['low_income', 'first_gen']::text[],
  array['scholarship', 'college_access', 'need_based', 'merit', 'national', 'college_prep'],
  array['grade_11'],
  null, null, null,
  'high', 'verified',
  'https://www.questbridge.org/college-prep-scholars', 'official_website', '2026-03-20',
  true, true,
  'Application opens ~February. Deadline: ~April annually. Scholars notified in May. Verify exact dates at questbridge.org/college-prep-scholars.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["low_income", "first_gen"], "mission_notes": "QuestBridge College Prep Scholars is the 11th grade gateway into the QuestBridge ecosystem — completing this program in junior year prepares students for the full-ride National College Match in senior year."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "National program — all eligible 11th graders across the U.S. are eligible. Omaha and Council Bluffs students have successfully participated in QuestBridge programs.", "source": "https://www.questbridge.org"}'::jsonb,
  '{"scholarship_type": "recognition_college_prep", "application_method": "separate_application_required", "award_count_national": "varies", "notes": "No monetary award — access to college prep resources and QuestBridge network. Positions students for QuestBridge National College Match (full-ride) in 12th grade. QuestBridge National College Match is separately listed in this database (migration 002)."}'::jsonb
),

-- ── 3. Barry Goldwater Scholarship ───────────────────────────────────────────
-- Up to $7,500/yr for STEM undergrad researchers. Faculty nomination required.
-- One of the most prestigious STEM scholarships in the U.S.
-- For college sophomores and juniors planning STEM research careers.
(
  'Barry Goldwater Scholarship — Up to $7,500/Year (STEM Research, Undergrad)',
  'Barry Goldwater Scholarship and Excellence in Education Foundation',
  'https://goldwaterscholarship.gov/',
  'The Barry Goldwater Scholarship is the premier undergraduate STEM scholarship in the United States, awarded to college sophomores and juniors who demonstrate outstanding potential for a research career in natural sciences, mathematics, or engineering. Up to $7,500 per year is awarded (for up to two years). Approximately 400–500 scholarships are awarded annually from a pool of ~5,000 nominations. IMPORTANT: This is a faculty-nominated scholarship — students must be nominated by their college or university. Each institution may nominate up to four students per year. Students interested in the Goldwater must approach their undergraduate research faculty and institution scholarship coordinator early (typically in the fall of their sophomore year) to be considered for a nomination. Creighton University, UNO, UNL, and other Nebraska/Iowa institutions all have Goldwater coordinators. Goldwater Scholars are consistently admitted to top PhD programs and receive NSF Graduate Fellowships, NIH, and other prestigious graduate funding. If you are doing undergraduate research in STEM at a Nebraska or Iowa institution, speak with your faculty mentor and scholarship office about Goldwater nomination.',
  'scholarship',
  'Currently enrolled as a sophomore or junior at an accredited U.S. college or university (2 or 3 years remaining). Pursuing a degree in natural sciences, mathematics, or engineering (NOT including pre-med students who plan only clinical careers — must intend to pursue a PhD research career). U.S. citizen, permanent resident, or national. Must be nominated by your institution — self-nomination is NOT accepted. GPA typically 3.7+ among competitive nominees. Undergraduate research experience strongly preferred. Contact your institution''s Goldwater campus representative or scholarship office.',
  null,
  'https://goldwaterscholarship.gov/',
  'Remote (National — institution-nominated)',
  null, null, null, null,
  true, false,
  array[]::text[],
  array['scholarship', 'college_access', 'merit', 'STEM', 'research', 'national'],
  array['college_sophomore', 'college_junior'],
  'scholarship', 7500, 'annual',
  'high', 'verified',
  'https://goldwaterscholarship.gov/', 'official_website', '2026-03-20',
  true, false,
  'Campus nomination deadlines: typically November–January (varies by institution). National deadline: ~January. Students must approach their institution''s Goldwater coordinator by fall of sophomore year. Verify institutional deadline with your scholarship/honors office.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "inferred", "notes": "Omaha/CB students attending Creighton, UNO, UNL, UNMC graduate programs, Iowa institutions, and other accredited universities are eligible for institutional nomination. Contact your school''s honors or scholarship office.", "source": "https://goldwaterscholarship.gov"}'::jsonb,
  '{"scholarship_type": "merit_research", "application_method": "institution_nomination_required", "award_count_national": "~400-500 per year", "competitiveness": "extremely_high", "notes": "Faculty nomination required — not self-nominated. Start conversations with faculty mentors and scholarship office in sophomore year fall semester. STEM research experience is essential."}'::jsonb
),

-- ── 4. Harry S. Truman Scholarship ───────────────────────────────────────────
-- Up to $30,000 for graduate school. For college juniors committed to public service.
-- Faculty nomination required. One per state per year (competitive).
-- Named for President Truman. Leadership and public service focus.
(
  'Harry S. Truman Scholarship — Up to $30,000 for Graduate School (Public Service)',
  'Harry S. Truman Scholarship Foundation',
  'https://www.truman.gov/',
  'The Harry S. Truman Scholarship is a prestigious federal fellowship providing up to $30,000 for graduate school to college juniors who are committed to public service careers in government, nonprofit work, or public interest advocacy. Approximately 55–65 Truman Scholars are selected nationally each year. Like the Goldwater, this is an institution-nominated award — students must be nominated by their college or university (typically one nomination per institution, though large research universities may nominate more). Selection criteria include intellectual ability, leadership potential, public service commitment, and a well-defined plan to pursue a public service career. Truman Scholars receive not just funding but access to federal internship opportunities, a strong alumni network in government and public service, and priority consideration in federal hiring. If you are a junior planning a career in law, government, policy, public health, nonprofit management, education policy, or social services — and you have demonstrated public service leadership — speak with your institution''s Truman representative early in your junior year. Nebraska and Iowa institutions with active Truman programs include Creighton, UNL, UNO, UI, ISU, and UNI.',
  'scholarship',
  'Currently enrolled as a college junior (3rd year) at an accredited U.S. college or university. U.S. citizen or national. Committed to a career in public service (government, nonprofit, public interest law, education policy, public health, etc.). Strong academic record (GPA typically 3.7+ among competitive nominees). Must be nominated by your institution — self-nomination is NOT accepted. Contact your institution''s Truman campus representative or scholarship office. Deadline: ~late January.',
  null,
  'https://www.truman.gov/',
  'Remote (National — institution-nominated)',
  null, null, null, null,
  true, false,
  array[]::text[],
  array['scholarship', 'college_access', 'merit', 'leadership', 'public_service', 'graduate', 'national'],
  array['college_junior'],
  'scholarship', 30000, 'total',
  'high', 'verified',
  'https://www.truman.gov/', 'official_website', '2026-03-20',
  true, false,
  'Campus nomination deadlines: typically November–January (varies by institution). National deadline: ~late January. Contact your institution''s Truman coordinator in the fall of your junior year. Finalists invited to regional interviews in April.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "inferred", "notes": "Students at Creighton, UNO, UNL, UNMC, Iowa institutions, and other accredited universities attending are eligible for Truman nomination. Contact your honors or scholarship office in fall of junior year.", "source": "https://www.truman.gov"}'::jsonb,
  '{"scholarship_type": "merit_public_service", "application_method": "institution_nomination_required", "award_count_national": "~55-65 per year", "competitiveness": "extremely_high", "notes": "Faculty/institution nomination required. Public service career commitment is essential. Truman Scholars receive federal internship priority and strong alumni network access."}'::jsonb
),

-- ── 5. Scholastic Art & Writing Awards ───────────────────────────────────────
-- For students in grades 7–12. Largest national recognition program for K-12 art/writing.
-- Gold Medal winners receive scholarships up to $10,000.
-- Submissions open December–January for spring awards.
(
  'Scholastic Art & Writing Awards — Up to $10,000 (Grades 7–12)',
  'Alliance for Young Artists & Writers',
  'https://www.artandwriting.org/',
  'The Scholastic Art & Writing Awards is the nation''s largest and most prestigious recognition program for creative students in grades 7–12. Since 1923, Scholastic has identified teen artists and writers of exceptional talent — past award recipients include Andy Warhol, Sylvia Plath, Joyce Carol Oates, Truman Capote, and more. Students may submit work in visual arts (painting, drawing, photography, sculpture, film, animation, and more) or writing (poetry, short story, novel, personal essay, humor, journalism, and more). Work is judged by industry professionals. Gold Medal winners at the national level receive scholarships up to $10,000. Winning work is exhibited in New York City. Regional competitions (administered through schools or directly) happen in fall/winter — winning regional work advances to national consideration. Nebraska and Iowa students participate through regional affiliates. There is a small submission fee (often $5–$10 per submission), but fee waivers are available for students with financial need. If you are a creative student in middle or high school, the Scholastic Awards are the most important national recognition you can pursue — they carry significant weight in college admissions and creative program applications.',
  'scholarship',
  'Students in grades 7–12 enrolled in a U.S. school (public, private, or homeschool). Must submit original artwork or writing in an eligible category (visual art, writing, or combined categories). Small submission fee (~$5–$10 per submission) — fee waivers available for students with financial need. Submissions judged regionally first, then nationally. Verify regional affiliate and submission process at artandwriting.org.',
  '2027-01-15',
  'https://www.artandwriting.org/',
  'Remote (National)',
  null, null, null, null,
  true, false,
  array['low_income']::text[],
  array['scholarship', 'merit', 'arts', 'writing', 'creative', 'national', 'youth'],
  array['grade_7', 'grade_8', 'grade_9', 'grade_10', 'grade_11', 'grade_12'],
  'scholarship', 10000, 'one_time',
  'high', 'verified',
  'https://www.artandwriting.org/', 'official_website', '2026-03-20',
  true, false,
  'Submissions typically open ~October. Regional deadlines: ~December–January. National awards announced in spring. Verify current regional affiliate and deadlines at artandwriting.org.',
  null,
  '{"type": "low_cost", "cost_amount": 10, "waiver_available": true}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "National program — Nebraska and Iowa students submit through regional affiliates. Fee waivers available for students with financial need.", "source": "https://www.artandwriting.org"}'::jsonb,
  '{"scholarship_type": "merit_creative", "application_method": "portfolio_submission", "award_count_national": "varies", "notes": "Gold Medal winners featured in national exhibition in NYC. Past recipients include Andy Warhol, Sylvia Plath, Joyce Carol Oates. Significant college admissions value for creative programs."}'::jsonb
);
