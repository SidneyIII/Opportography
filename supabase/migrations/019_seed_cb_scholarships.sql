-- ============================================================
-- Opportography — Migration 019
-- Phase 10B: Council Bluffs Scholarships — Spring 2026
-- Time-sensitive deployment: week of March 9, 2026
--
-- Purpose: Put real, verified, still-open scholarship opportunities
-- in front of Council Bluffs seniors before the deadlines pass.
-- Every listing here must answer: where do I go, what do I need,
-- when is it due, am I eligible, how much is it.
--
-- Deadline research completed: March 9, 2026
-- Sources verified via official websites and local news.
--
-- Status summary:
--   SWIEF                    — OPEN  — deadline March 15, 2026 (CRITICAL)
--   IWCC Foundation          — OPEN  — deadline April 8, 2026 (APPROACHING)
--   Lewis Central Ed. Found. — OPEN  — deadline unconfirmed (APPROACHING)
--   STARS Scholarship        — OPEN  — rolling deadline (adult custodial parents)
--   Pottawattamie Promise    — UNVERIFIED (historically March 1 — likely closed)
--   CBSF 2026                — CLOSED — 2027 reference listing included
--
-- Excluded:
--   EducationQuest — Nebraska residents only; Iowa students ineligible
--   Iowa West Foundation — Funder, not a direct scholarship applicant portal
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
  learning_context, equity_focus
) values

-- ── 1. SWIEF — CRITICAL — March 15, 2026 ──────────────────────────────────────
-- Verified open as of March 9, 2026 (confirmed by local news Feb 28, 2026).
-- Single most important scholarship in this batch. One application = 100+ scholarships.
(
  'Southwest Iowa Educational Foundation (SWIEF) — Spring 2026 Scholarship Application',
  'Southwest Iowa Educational Foundation / Community Foundation for Western Iowa',
  'https://www.swiowaeducationalfoundation.org',
  'One application. Over 100 scholarships. Average award: $4,200. Total pool: $600,000+. If you are a senior at any high school in Pottawattamie County — Abraham Lincoln, Thomas Jefferson, Lewis Central, St. Albert, or any other — you are eligible. The application is scored blind: nobody on the board knows your name or your school. You need your transcript and an essay. Go to swiowaeducationalfoundation.org right now, fill out the application, and submit before March 15. After you submit, you will receive an email telling you which individual scholarships you qualify for — some may require supplemental materials due approximately March 22. Community scholarships automatically included in this one application include: Council Bluffs Area Chamber of Commerce Agriculture Scholarship, Council Bluffs Soccer Club Scholarship, Downtown Kiwanis of Council Bluffs Scholarship, Council Bluffs Guild of the Omaha Symphony Scholarship, Cari Farver Memorial Scholarship, Kerrie Orozco Memorial Scholarship, and 95+ others. This is the most money available to southwest Iowa seniors in one application. Do not miss it.',
  'scholarship',
  'High school seniors graduating in 2026 from schools in Pottawattamie, Cass, Fremont, Harrison, Mills, Montgomery, Page, or Shelby County, Iowa. Also eligible: Boyer Valley, Exira-EHK, IKM-Manning, and Southwest Valley schools. No GPA minimum stated — applications are scored by rubric.',
  '2026-03-15',
  'https://bit.ly/SWIEF',
  'Council Bluffs, IA (Southwest Iowa)',
  null, 'Council Bluffs', 'IA', '51501',
  false, false,
  array['low_income', 'first_gen'],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship', 4200, 'one_time',
  'high', 'verified',
  'https://www.swiowaeducationalfoundation.org/application', 'official_website', '2026-03-09',
  true, true,
  'Application deadline March 15, 2026. Supplemental materials (if required by specific scholarships) due approximately March 22, 2026.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["first-generation college students", "low-income students", "rural southwest Iowa students"], "mission_notes": "Blind scoring process ensures students are evaluated on merit, not school prestige or connections. One application removes barrier of applying to scholarships individually."}'::jsonb
),

-- ── 2. IWCC Foundation Scholarships — APPROACHING — April 8, 2026 ─────────────
-- Verified open. Priority deadline Feb 10 passed; final deadline April 8 confirmed.
-- Only for students attending Iowa Western Community College.
(
  'Iowa Western Community College Foundation Scholarships — Spring 2026',
  'Iowa Western Community College Foundation',
  'https://www.iwcc.edu',
  '825+ scholarships. $2.5 million+ awarded annually. One application covers all of them. If you are planning to attend Iowa Western Community College, apply before April 8 — that is the final deadline for the 2026-2027 academic year. The priority deadline (February 10) has passed, but hundreds of scholarships are still available through the final deadline. Apply at iwcc.scholarships.ngwebsolutions.com. You will need your FAFSA (Student Aid Report) for any need-based awards. The Presidential Scholarship (up to $10,000 over two years for students with a 3.5+ GPA) required the February deadline — but general foundation scholarships are still open. This is the single application for every IWCC scholarship. If IWCC is your plan, do this now.',
  'scholarship',
  'Must be enrolling at Iowa Western Community College for fall 2026. High school diploma, HiSET, or GED required. Presidential Scholarship requires cumulative GPA of 3.5+ and living on campus or with parents (deadline passed — apply for general pool). FAFSA required for need-based and Last-Dollar scholarship awards.',
  '2026-04-08',
  'https://iwcc.scholarships.ngwebsolutions.com/',
  'Council Bluffs, IA',
  '2700 College Road', 'Council Bluffs', 'IA', '51503',
  false, false,
  array['low_income', 'first_gen'],
  array['scholarship', 'college_access'],
  array['high_school_senior', 'adult_learner'],
  'scholarship', 2500, 'annual',
  'high', 'verified',
  'https://www.iwcc.edu/financial-aid/scholarships/', 'official_website', '2026-03-09',
  true, true,
  'Final deadline: April 8, 2026. Priority deadline (Feb 10) has passed. Applications reviewed on rolling basis.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["first-generation college students", "low-income students", "Council Bluffs residents"], "mission_notes": "Iowa Last-Dollar Scholarship (Future Ready Iowa) may cover remaining tuition/fees after federal grants — included in the same application portal."}'::jsonb
),

-- ── 3. Lewis Central Education Foundation — APPROACHING — Deadline Unconfirmed ──
-- Application confirmed open as of March 9, 2026. Exact deadline not published.
-- For Lewis Central High School graduates only.
(
  'Lewis Central Education Foundation Scholarships — Spring 2026',
  'Lewis Central Education Foundation',
  'https://lewiscentraleducationfoundation.com',
  '13 named scholarships for Lewis Central High School graduating seniors. Awards range from $500 (one-time) to $2,000/year (renewable for 4 years). The application is open right now. The exact closing deadline is not published on the website — apply as soon as possible and do not wait. Go to lewiscentraleducationfoundation.com/scholarships to start. Named scholarships include: Bob & Dee Humphrey Memorial, Diane Wiese Clark Scholarship, James Fuller & Larry Wilwerding Wrestling Scholarship, Zella Duchman Memorial, Steve Clark Scholarship, Kevin Reedy Memorial, LeRoy Brown Scholarship, Nick Nahach Scholarship, Margaret Kilibarda Memorial, Clanton Family Scholarship, Mollett Killion Scholarship, Superior Honda/Acura Automotive & Diesel Mechanic Scholarship (for students pursuing automotive/diesel trades), and Joe Miller & Emily Strohmeier Memorial Scholarship. One application covers all 13. Contact the foundation to confirm the deadline before it closes.',
  'scholarship',
  'Must be a graduating senior from Lewis Central High School (Lewis Central Community School District). GPA minimums vary by individual scholarship (typically 2.0–3.4). Some scholarships are field-of-study specific (automotive/diesel, arts, etc.).',
  null,
  'https://docs.google.com/forms/d/e/1FAIpQLSdPp9Y0xf1s264Q0DFvvva3fJtS0jLLXsjB35wOB5PUv9-OnQ/viewform?pli=1',
  'Council Bluffs, IA (Lewis Central District)',
  null, 'Council Bluffs', 'IA', '51503',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship', 1000, 'annual',
  'high', 'verified',
  'https://lewiscentraleducationfoundation.com/scholarships/', 'official_website', '2026-03-09',
  true, false,
  'Deadline not published — apply immediately. Contact the foundation to confirm closing date.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null
),

-- ── 4. STARS Scholarship — OPEN (Rolling) — Custodial Parents ─────────────────
-- Not for high school seniors — for custodial parents returning to school.
-- Funded by Iowa West Foundation, administered by Council Bluffs Schools Foundation.
(
  'STARS Scholarship — Council Bluffs Schools Foundation',
  'Council Bluffs Schools Foundation / Iowa West Foundation',
  'https://www.cbsf.org',
  'Up to $3,500 per year for custodial parents going back to school. This scholarship covers the costs that the Pell Grant does not: books, fees, uniforms, equipment, computers, transportation, and child care. If you are a parent raising a child on your own and you want to go back to school — this is for you. Applications are accepted on a rolling basis with no single published deadline. Start with an inquiry at cbsf.org/stars-scholarship. You will need to be Pell Grant eligible (complete your FAFSA first), a Pottawattamie County resident, a U.S. citizen, and enrolling full-time. Contact the STARS office at stars@cbsf.org or (712) 322-8941 to get started.',
  'scholarship',
  'Must be ALL of: (1) a custodial parent, (2) a Pottawattamie County resident, (3) a U.S. citizen, (4) enrolling full-time in a post-secondary program, and (5) Pell Grant eligible. This scholarship is for adult/returning students who are parents — not for high school seniors without children.',
  null,
  'https://www.cbsf.org/stars-scholarship',
  'Council Bluffs, IA',
  null, 'Council Bluffs', 'IA', '51501',
  false, false,
  array['low_income', 'single_parent'],
  array['scholarship', 'college_access'],
  array['adult_learner'],
  'scholarship', 3500, 'annual',
  'high', 'verified',
  'https://www.cbsf.org/stars-scholarship', 'official_website', '2026-03-09',
  true, false,
  'Rolling admissions — no single published deadline. Contact stars@cbsf.org to inquire.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["single parents", "custodial parents", "low-income adults", "first-generation college students"], "mission_notes": "STARS specifically targets the gap between Pell Grant coverage and actual cost of attending — covering the non-tuition costs (childcare, transportation, books) that cause custodial parents to drop out."}'::jsonb
),

-- ── 5. Pottawattamie Promise — UNVERIFIED (Likely Closed for 2026) ─────────────
-- Historical deadline March 1 — likely passed. iwcc.edu/promise returns 404.
-- Listed so students know this exists and can plan for 2027.
(
  'Pottawattamie Promise — Full-Ride Scholarship at Iowa Western (Verify Status)',
  'Iowa West Foundation / Peter Kiewit Foundation / Iowa Western Community College',
  'https://www.iwcc.edu',
  'IMPORTANT: The 2026 application deadline for Pottawattamie Promise has likely passed (historically March 1), and the iwcc.edu/promise page is currently returning a 404 error. If you are a Pottawattamie County student planning to attend Iowa Western, call IWCC Financial Aid immediately at (712) 325-3200 to ask whether any 2026 slots remain or whether a late application is possible. Do not assume it is closed until you have spoken with a financial aid counselor directly. What this scholarship is: a last-dollar scholarship covering 100% of tuition, fees, and books at Iowa Western for up to two years — everything not already covered by the Pell Grant and other scholarships. Estimated total value: $16,000+. It also includes individual support and guidance through the enrollment process. If you missed 2026, set a calendar reminder for February 2027 to apply for the next cycle. This is the most generous local scholarship available to IWCC-bound Pottawattamie County students.',
  'scholarship',
  'Must be from a Pottawattamie County school district (Council Bluffs CSD, Lewis Central CSD, Riverside CSD, AHSTW CSD, and other county districts). Must be Pell Grant eligible. Must enroll at Iowa Western Community College. Minimum 2.0 GPA. Process is partially school-mediated — speak with your school counselor.',
  null,
  'https://www.iwcc.edu/financial-aid/',
  'Council Bluffs, IA',
  '2700 College Road', 'Council Bluffs', 'IA', '51503',
  false, false,
  array['low_income', 'first_gen'],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship', 16000, 'one_time',
  'medium', 'needs_confirmation',
  'https://www.iwcc.edu/promise', 'official_website', '2026-03-09',
  true, false,
  'Historically: application deadline around March 1 annually. 2026 deadline status unconfirmed. Call IWCC Financial Aid at (712) 325-3200 to verify.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["low-income students", "first-generation college students", "Pottawattamie County residents"], "mission_notes": "Last-dollar design means students pay nothing after Pell Grant. Funded jointly by Iowa West Foundation and Peter Kiewit Foundation since 2015, serving hundreds of Pottawattamie County students."}'::jsonb
),

-- ── 6. CBSF General Scholarship Pool — 2026 CLOSED — 2027 Reference ───────────
-- The 2026 application cycle has closed (est. mid-February 2026).
-- Listed so CB students know it exists and can apply in 2027.
(
  'Council Bluffs Schools Foundation Scholarships — Plan for 2027 (2026 Cycle Closed)',
  'Council Bluffs Schools Foundation',
  'https://www.cbsf.org',
  'The 2026 CBSF scholarship application has closed. If you are a current junior at Abraham Lincoln or Thomas Jefferson High School, bookmark this and apply in January 2027. Over $71,000 in scholarships was awarded to the 2025 graduating class through this single application. Named scholarships covered by one application include: Joseph DeHoyos Carle Memorial Scholarship (in memory of Joe Carle, ALHS student, who passed away July 2, 2020), Jacob Hemmingsen Memorial Scholarship (for students pursuing art or music), Grant A. Hamilton Scholarship (for accounting students), Richard & Joyce Schoeppner Scholarship for Vocational/Technical Education, Michael Miller Memorial Scholarship, Larry Argersinger Memorial Scholarship, National Honor Society Scholarship, Henry & Laura May Peterson Scholarship (for students with physical limitations), ALHS Class of 1929/1979 Scholarship, TJHS Class of 1977 Scholarship, Donald Scheibler Scholarship, Robert & Karen Capel Memorial, and 20+ others. One application through Reviewr covers all of them. The 2027 portal will open in January at my.reviewr.com/s2/site/cbsf2027 (or similar URL). Tip: applications without at least one letter of recommendation are not reviewed — line up your recommenders before the portal opens.',
  'scholarship',
  'Must be a currently enrolled student at Abraham Lincoln High School or Thomas Jefferson High School (Council Bluffs Community School District). Requirements vary by individual scholarship — most require a letter of recommendation, extracurricular involvement, and financial information.',
  null,
  'https://www.cbsf.org/scholarships',
  'Council Bluffs, IA',
  '315 Willow Ave', 'Council Bluffs', 'IA', '51503',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship', 71000, 'one_time',
  'high', 'verified',
  'https://www.cbsf.org/scholarships', 'official_website', '2026-03-09',
  true, false,
  '2026 cycle closed. 2027 application expected to open January 2027. Set a reminder.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["Council Bluffs CSD students", "first-generation college students"], "mission_notes": "Memorial scholarships within this pool honor former ALHS and TJHS students and staff — applying is a way to carry forward their legacy. The DeHoyos Carle scholarship honors Joe Carle, age 16, who passed away in 2020 and would have been a member of the Class of 2023."}'::jsonb
);
