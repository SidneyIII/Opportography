-- ============================================================
-- Opportography — Migration 021
-- Phase 10C: Omaha Metro Scholarships Accessible to CB Students
-- Research completed: March 9, 2026
--
-- The Missouri River is not a scholarship boundary.
-- This batch surfaces Omaha-area and Nebraska scholarships
-- that explicitly include Pottawattamie County / Council Bluffs
-- students, plus Iowa state programs CB students often miss.
--
-- Status summary:
--   Drake-Williams Steel          — OPEN  — deadline March 14, 2026 (CRITICAL)
--   Nebraska Eagle Scout          — OPEN  — deadline TBD (check site)
--   All Iowa Opportunity (AIOS)   — OPEN  — deadline ~April 1, 2026
--   Iowa Tuition Grant            — OPEN  — rolling (FAFSA by July 1)
--   TheDream.US                   — OPEN  — rolling (DACA-friendly)
--   Barrientos Scholarship        — OPEN  — deadline unconfirmed (Latino)
--   Youth Salute                  — OPEN  — for JUNIORS only (Class of 2027)
--   Aksarben/Horatio Alger        — CLOSED for 2026 — reference for 2027
--   OCCF Southwest Iowa           — CLOSED for main 2026 cycle — reference
--
-- Sources verified via official websites, March 9, 2026.
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
  cb_eligibility
) values

-- ── 1. Drake-Williams Steel Trade Scholarship — CRITICAL — March 14, 2026 ──
-- Verified open. CB explicitly named in eligibility. Welding focus.
-- Deadline is in 5 days as of research date — highest-priority entry in this batch.
(
  'Drake-Williams Steel Trade Scholarship — Spring 2026',
  'Drake-Williams Steel, Inc.',
  'https://dwsteel.com',
  'If you want a career in welding, this is $2,500 toward the cost of getting there — and Council Bluffs students are explicitly eligible. Drake-Williams Steel awards this scholarship to graduating high school seniors in the Omaha/Council Bluffs area who are pursuing a welding degree at any accredited institution. The application is at dwsteel.com/scholarship. The deadline is March 14, 2026 — that is five days from when this listing was researched. If you are interested in welding as a trade and you are a CB senior, apply immediately. Funds are applied directly to tuition for a welding program.',
  'scholarship',
  'Graduating high school senior in the Omaha or Council Bluffs metro area. Must be pursuing a welding degree at an accredited post-secondary institution (community college, vocational school, or university with a welding program). Council Bluffs students are explicitly named in the eligibility criteria.',
  '2026-03-14',
  'https://dwsteel.com/scholarship',
  'Omaha, NE / Council Bluffs, IA (Metro)',
  null, 'Omaha', 'NE', '68144',
  true, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship', 2500, 'one_time',
  'high', 'verified',
  'https://dwsteel.com/scholarship', 'official_website', '2026-03-09',
  true, true,
  'Application deadline: March 14, 2026.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["trades students", "vocational students", "Council Bluffs students"], "mission_notes": "Drake-Williams Steel explicitly includes Council Bluffs in eligibility — one of the few Omaha-area scholarships to do so by name. Welding is a high-wage career path with strong demand in the metro."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "Council Bluffs explicitly named in eligibility criteria", "source": "https://dwsteel.com/scholarship"}'::jsonb
),

-- ── 2. Nebraska Eagle Scout Scholarship — OPEN — Deadline TBD ──────────────
-- Pottawattamie County (where CB is located) explicitly named in eligibility.
-- Must attend a Nebraska postsecondary institution — not Iowa schools.
-- Administered by Walter Scott Jr. Foundation.
(
  'Nebraska Eagle Scout Scholarship — Walter Scott Jr. Foundation',
  'Walter Scott Jr. Foundation / Nebraska Eagle Scout Scholarship Program',
  'https://neeaglescholar.org',
  'Pottawattamie County is one of the three Iowa counties explicitly listed as eligible for this scholarship. If you are a Council Bluffs student who has earned the Eagle Scout rank, you likely qualify — even though you live in Iowa — as long as you plan to attend a Nebraska college or university. Awards are up to $3,000 per year: $6,000 total for a two-year Nebraska institution, $12,000 total for a four-year Nebraska institution. One application covers all eligible scouts. The deadline is listed at neeaglescholar.org/applicationprocess — check it now, as spring deadlines are approaching. Eligible Nebraska institutions include UNO, UNL, Creighton, Nebraska Wesleyan, UNKC, Wayne State, Chadron State, Metropolitan Community College, and others accredited by the Nebraska Coordinating Commission for Postsecondary Education. You do not need to be in a Nebraska-chartered troop — your county of residence determines eligibility.',
  'scholarship',
  'Must have earned the Eagle Scout rank. Must be a resident of Nebraska OR one of three specifically named Iowa counties: Pottawattamie, Douglas (Iowa), or Harrison County (Iowa). Council Bluffs is in Pottawattamie County — explicitly eligible. Must be a graduating high school senior or current college freshman/sophomore applying within three years of Eagle Scout award. Must plan to attend or currently attend an eligible Nebraska postsecondary institution (Title IV, CCPE-authorized). Attending an Iowa school does not qualify.',
  null,
  'https://neeaglescholar.org/application',
  'Omaha Metro / Council Bluffs Eligible',
  null, 'Omaha', 'NE', null,
  true, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior', 'adult_learner'],
  'scholarship', 3000, 'annual',
  'high', 'verified',
  'https://neeaglescholar.org/eligibility', 'official_website', '2026-03-09',
  true, false,
  'Deadline not confirmed as of March 9, 2026 — check neeaglescholar.org/applicationprocess. Spring deadlines typically March–April.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": false, "communities": ["Eagle Scouts in Council Bluffs and Pottawattamie County"], "mission_notes": "One of the most valuable and least-known facts for CB Eagle Scouts: Pottawattamie County is explicitly in the eligibility zone despite being in Iowa. Students attending NE schools are fully eligible."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "Pottawattamie County, Iowa explicitly named in eligibility rules. CB is the county seat of Pottawattamie.", "source": "https://neeaglescholar.org/eligibility"}'::jsonb
),

-- ── 3. All Iowa Opportunity Scholarship (AIOS) — OPEN — ~April 1, 2026 ─────
-- Iowa state scholarship for students who aged out of foster care.
-- Council Bluffs = Iowa = fully eligible. Often missed by CB students.
(
  'All Iowa Opportunity Scholarship (AIOS) — 2026–2027 Academic Year',
  'Iowa College Student Aid Commission / Iowa Department of Education',
  'https://educate.iowa.gov',
  'If you grew up in Iowa foster care — or were adopted from Iowa foster care after age 16 — the state of Iowa will pay for your college. The All Iowa Opportunity Scholarship (AIOS) covers up to $5,334 per year for full-time enrollment and is renewable for up to four academic years (eight semesters). This applies to any accredited Iowa institution — Iowa Western Community College, the University of Iowa, Iowa State, private Iowa colleges, and more. Council Bluffs is in Iowa. You are eligible. You do not need a minimum GPA to apply. You do not need to have graduated from high school on a traditional timeline. Apply through the Iowa College Student Aid Commission at educate.iowa.gov. File your FAFSA first — AIOS is need-based. Priority deadline is approximately April 1, 2026.',
  'scholarship',
  'Must be an Iowa resident who (1) aged out of Iowa foster care at age 18, OR (2) was released from Iowa State Training School or similar juvenile facility, OR (3) was legally adopted from Iowa foster care after age 16. No minimum GPA requirement. No traditional high school graduation requirement — HiSET/GED accepted. Must enroll at an accredited Iowa postsecondary institution. Must complete FAFSA to determine need-based eligibility. Council Bluffs students in Pottawattamie County are Iowa residents — fully eligible.',
  '2026-04-01',
  'https://educate.iowa.gov/higher-ed/financial-aid/scholarships-grants/aios',
  'Iowa (Statewide)',
  null, 'Council Bluffs', 'IA', null,
  true, false,
  array['foster_youth', 'low_income', 'first_gen'],
  array['scholarship', 'college_access'],
  array['high_school_senior', 'adult_learner'],
  'scholarship', 5334, 'annual',
  'high', 'verified',
  'https://educate.iowa.gov/higher-ed/financial-aid/scholarships-grants/aios', 'government_db', '2026-03-09',
  true, true,
  'Priority deadline approximately April 1, 2026 for 2026–2027 academic year. File FAFSA as soon as possible.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["foster youth", "adopted youth", "low-income students", "first-generation college students"], "mission_notes": "AIOS is specifically for the population that is statistically least likely to attend college — students who grew up without stable family support. No GPA barrier. No traditional graduation barrier. Iowa state commitment to close the foster care college completion gap."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "Iowa state scholarship. Council Bluffs is in Iowa. All Iowa foster youth are eligible.", "source": "https://educate.iowa.gov/higher-ed/financial-aid/scholarships-grants/aios"}'::jsonb
),

-- ── 4. Iowa Tuition Grant — OPEN — Rolling (FAFSA by July 1) ──────────────
-- Iowa state need-based grant for students attending Iowa private colleges.
-- Up to $7,500/year. No separate application — FAFSA is the application.
(
  'Iowa Tuition Grant — Need-Based Aid for Iowa Private Colleges',
  'Iowa College Student Aid Commission / Iowa Department of Education',
  'https://educate.iowa.gov',
  'If you are going to an Iowa private college — Clarke University, Briar Cliff, Graceland, Iowa Wesleyan, Dordt, Northwestern Iowa, or any other qualifying private nonprofit — Iowa will help cover the cost. The Iowa Tuition Grant provides up to $7,500 per year to Iowa residents with demonstrated financial need who attend a qualifying Iowa private institution. There is no separate application: filing your FAFSA by the July 1 deadline is all it takes to be considered. If you are a Council Bluffs student choosing between a private Iowa college and Iowa Western, factor this grant into your comparison — it may significantly close the cost gap. Eligible schools include all accredited Iowa private nonprofit colleges. Grant is renewable for up to four years (must resubmit FAFSA annually and maintain enrollment).',
  'scholarship',
  'Must be an Iowa resident with financial need as determined by FAFSA. Must attend a qualifying Iowa private nonprofit college or university at least one-quarter time. Must file FAFSA by the annual July 1 deadline. Not available for public Iowa colleges (IWCC, UI, ISU) or out-of-state schools. No GPA minimum for initial award — satisfactory academic progress required for renewal.',
  '2026-07-01',
  'https://educate.iowa.gov/higher-ed/financial-aid/scholarships-grants/iowa-tuition-grant',
  'Iowa (Statewide)',
  null, 'Council Bluffs', 'IA', null,
  true, false,
  array['low_income', 'first_gen'],
  array['scholarship', 'college_access'],
  array['high_school_senior', 'adult_learner'],
  'scholarship', 7500, 'annual',
  'high', 'verified',
  'https://educate.iowa.gov/higher-ed/financial-aid/scholarships-grants/iowa-tuition-grant', 'government_db', '2026-03-09',
  true, false,
  'No separate application — FAFSA by July 1 is the deadline. Decisions made on rolling basis throughout spring.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["low-income students", "first-generation college students", "Iowa private college students"], "mission_notes": "Many CB students choose Iowa Western without knowing that a state grant of up to $7,500/year exists for Iowa private colleges. The Iowa Tuition Grant changes the affordability math for private college enrollment."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "Iowa state program. Council Bluffs is in Iowa. All Iowa residents attending qualifying Iowa private colleges are eligible.", "source": "https://educate.iowa.gov/higher-ed/financial-aid/scholarships-grants/iowa-tuition-grant"}'::jsonb
),

-- ── 5. TheDream.US Scholarship — OPEN — Rolling ───────────────────────────
-- National scholarship for undocumented/DACA students.
-- Significant awards. Council Bluffs students attending partner colleges eligible.
(
  'TheDream.US National Scholarship — DACA and Undocumented Students',
  'TheDream.US',
  'https://www.thedream.us',
  'If you arrived in the United States before age 16 and before November 1, 2020, TheDream.US may cover your college costs. This is the largest private scholarship fund for undocumented and DACA-recipient students in the country — providing up to $100,000 over four years at a partner college (the "DREAMer''s Opportunity Scholarship") or up to $33,000 over two years at a partner community college or two-year school. Awards vary by institution and program type. Council Bluffs and Omaha-area students attending a partner college are eligible. The application opens each fall for the following academic year — check thedream.us/scholarships for the current open cycle, partner college list, and specific award amounts. You do not need to be a U.S. citizen or have legal status. You need: proof of high school completion (diploma, GED, or HiSET), arrival documentation (before age 16, before November 1, 2020), and acceptance at a partner school.',
  'scholarship',
  'Must have arrived in the United States before age 16 AND before November 1, 2020. Must have completed high school (diploma, GED, or HiSET equivalent). Must be accepted at or enrolled at a TheDream.US partner college. Must be DACA-eligible, DACA-recipient, or eligible for DACA but without current status. Cannot hold lawful permanent resident (green card) status. U.S. citizenship disqualifies. No minimum GPA for initial eligibility — partner schools may have their own requirements.',
  null,
  'https://www.thedream.us/scholarships/',
  'National (Partner Colleges)',
  null, null, null, null,
  true, false,
  array['undocumented', 'daca', 'low_income', 'first_gen'],
  array['scholarship', 'college_access'],
  array['high_school_senior', 'adult_learner'],
  'scholarship', 33000, 'one_time',
  'high', 'verified',
  'https://www.thedream.us/scholarships/', 'official_website', '2026-03-09',
  true, true,
  'Rolling application cycle — check thedream.us/scholarships for current open period and partner college list.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["undocumented students", "DACA recipients", "immigrant students", "first-generation college students", "low-income students"], "mission_notes": "TheDream.US is the largest private scholarship fund for immigrant students in the US. The federal policy climate makes DACA status uncertain — this scholarship provides a stable pathway regardless of policy changes. CB undocumented students attending partner colleges have access to the same awards as students nationwide."}'::jsonb,
  '{"eligible": true, "basis": "likely", "notes": "National program — CB students attending partner colleges are eligible. No Iowa or Nebraska restriction.", "source": "https://www.thedream.us/scholarships/"}'::jsonb
),

-- ── 6. Barrientos Scholarship Foundation — OPEN — Deadline Unconfirmed ────
-- Latino students in the Greater Omaha area attending Nebraska schools.
-- 60 awards of $1,000 each. CB students likely eligible if attending NE school.
(
  'Barrientos Scholarship Foundation — Latino Students in Greater Omaha Area',
  'Barrientos Scholarship Foundation',
  'https://www.barrientosscholarship.org',
  'The Barrientos Scholarship Foundation has awarded over $459,000 to Latino students in the Greater Omaha area since 2005. If you are a Latino/Hispanic student from Council Bluffs planning to attend a Nebraska college, university, community college, or trade/vocational school — you likely qualify. The foundation awards 60 scholarships of $1,000 each per cycle. One application. You need: proof of Latino heritage, a minimum 2.5 GPA, a personal essay (2+ pages), letters of recommendation, official transcripts, and FAFSA completion. Apply at barrientosscholarship.org/scholarships1. The 2026 cycle deadline is not published online — contact the foundation directly at info@barrientosscholarship.org or 402-215-5106 to confirm the deadline before applying. This is an Omaha-based organization whose geographic focus is "Greater Omaha area" — Council Bluffs has long been part of that definition for local organizations. CB-to-Nebraska-school students should apply.',
  'scholarship',
  'Must be of Latino/Hispanic heritage. Must be a high school senior, current college student, or returning adult student. Minimum 2.5 GPA. Must be attending or planning to attend an accredited Nebraska institution (community college, university, trade school, or vo-tech in Nebraska). Greater Omaha area students prioritized — Council Bluffs students who plan to attend a Nebraska school appear eligible based on geographic scope, but Iowa eligibility is not explicitly confirmed. Contact org to verify before applying. FAFSA must be completed.',
  null,
  'https://www.barrientosscholarship.org/scholarships1',
  'Omaha Metro / Council Bluffs (Likely)',
  null, 'Omaha', 'NE', null,
  true, false,
  array['latino', 'low_income', 'first_gen'],
  array['scholarship', 'college_access'],
  array['high_school_senior', 'adult_learner'],
  'scholarship', 1000, 'one_time',
  'medium', 'needs_confirmation',
  'https://www.barrientosscholarship.org/scholarships1', 'official_website', '2026-03-09',
  true, false,
  'Deadline not published for 2026 cycle. Contact info@barrientosscholarship.org or 402-215-5106 to confirm before applying.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["Latino students", "Hispanic students", "first-generation college students", "low-income students"], "mission_notes": "Barrientos has served the Greater Omaha Latino community for 20+ years. CB-to-Nebraska-school students fit the geographic and community scope — confirm eligibility directly with the foundation."}'::jsonb,
  '{"eligible": null, "basis": "likely", "notes": "Iowa residence not explicitly addressed. Greater Omaha scope likely includes CB. Must attend a Nebraska school. Confirm with org.", "source": "https://www.barrientosscholarship.org/scholarships1"}'::jsonb
),

-- ── 7. Greater Omaha–Council Bluffs Youth Salute — OPEN — For JUNIORS ─────
-- Recognition + scholarship program for high school JUNIORS (Class of 2027).
-- CB is in the program name. Lewis Central and other CB schools have won.
-- Note: This is for Class of 2027 — not current seniors. Include for juniors.
(
  'Greater Omaha–Council Bluffs Youth Salute — Leadership Scholarship (Class of 2027)',
  'Greater Omaha–Council Bluffs Youth Salute',
  'https://www.greateromaha.youthsalute.com',
  'Council Bluffs is in the name of this program. Youth Salute recognizes outstanding high school junior leaders in the Greater Omaha and Council Bluffs metro — and awards them scholarships. If you are a current 11th grader at any CB high school (Abraham Lincoln, Thomas Jefferson, Lewis Central, St. Albert), you can be nominated. Each school selects nominees — talk to your school counselor or principal to find out how your school participates. Awards: the Paul W. Brandel Scholarship ($1,000 — male National Leader of the Year) and the Carpenter Family Scholarship ($1,000 — female National Leader of the Year) are the top individual awards; 10 runner-up students receive $200 each. UNO has a five-year partnership with Youth Salute that adds additional scholarship opportunities at UNO for recognized students. Applications open in November each year for the spring ceremony. If you are a junior this year, inquire with your school counselor now about the 2026–2027 cycle.',
  'scholarship',
  'Must be a current high school JUNIOR (Class of 2027 — graduating in spring 2027). Must attend a high school in the Greater Omaha or Council Bluffs metro area. Abraham Lincoln, Thomas Jefferson, Lewis Central, and St. Albert High School students in Council Bluffs are all in the program area. Minimum 3.0 GPA. Must be nominated through a peer and adult selection process at your school — contact your school counselor to find out how your school participates.',
  null,
  'https://www.greateromaha.youthsalute.com/apply',
  'Omaha, NE / Council Bluffs, IA (Metro)',
  null, null, null, null,
  true, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_junior'],
  'scholarship', 1000, 'one_time',
  'high', 'verified',
  'https://www.greateromaha.youthsalute.com', 'official_website', '2026-03-09',
  true, false,
  'Applications open November each year. 2026–2027 cycle opens November 2026 for current sophomores. Current juniors: inquire with school counselor about 2025–2026 cycle status.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": false, "communities": ["high school leaders in Council Bluffs and Omaha metro"], "mission_notes": "Youth Salute has recognized student leaders from CB schools for years. Lewis Central students have won National Youth Leader of the Year. The program explicitly names Council Bluffs — CB students are not an afterthought, they are in the title."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "Program name includes Council Bluffs. Metro-wide — all CB high schools participate.", "source": "https://www.greateromaha.youthsalute.com"}'::jsonb
),

-- ── 8. Aksarben / Horatio Alger State Scholarship — 2026 CLOSED — 2027 Ref ─
-- For Nebraska and western Iowa students. CB/Pottawattamie = western Iowa.
-- Feb 15, 2026 deadline passed. Include so 2027 seniors know to apply in Dec.
(
  'Aksarben / Horatio Alger Scholarship — Plan for 2027 (2026 Cycle Closed)',
  'Aksarben Foundation / Horatio Alger Association',
  'https://aksarben.org',
  'The 2026 deadline for this scholarship (February 15) has passed. If you are a current junior, bookmark this and apply in December 2026. The Aksarben/Horatio Alger Scholarship is a $10,000 award (over four years) for Nebraska and western Iowa students with demonstrated critical financial need. Council Bluffs — in Pottawattamie County — is considered western Iowa for the purposes of this scholarship. Participating colleges match the Horatio Alger award dollar-for-dollar, meaning your actual package may be worth significantly more at some schools. What you need: 2.0+ GPA, demonstrated critical financial need (determined by application), a commitment to pursuing a bachelor''s degree, and demonstrated perseverance through hardship. Applications open approximately December 1 each year through February 15. The Horatio Alger Association also has national-level scholarships — visit horatioalger.org for the full portfolio. Set a reminder for December 1, 2026.',
  'scholarship',
  'Must be a graduating high school senior from Nebraska or western Iowa (Pottawattamie County, Iowa and surrounding western Iowa counties qualify). Minimum 2.0 GPA. Must demonstrate critical financial need. Must be planning to pursue a bachelor''s degree at a four-year institution. Strong preference for students who have overcome significant adversity. For 2027 cycle: applications expected December 1, 2026 – February 15, 2027.',
  null,
  'https://aksarben.org/scholarships-and-internships/',
  'Omaha Metro / Western Iowa',
  null, 'Omaha', 'NE', null,
  true, false,
  array['low_income', 'first_gen'],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship', 10000, 'one_time',
  'high', 'verified',
  'https://aksarben.org/scholarships-and-internships/', 'official_website', '2026-03-09',
  true, false,
  '2026 cycle closed (deadline was February 15, 2026). 2027 cycle expected to open December 1, 2026. Set a reminder.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["low-income students", "first-generation college students", "western Iowa students", "students who have overcome adversity"], "mission_notes": "The Horatio Alger mission is to honor students who have demonstrated determination in the face of hardship. CB students in western Iowa are explicitly eligible — this is not a Nebraska-only award."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "Explicitly for Nebraska and western Iowa students. Pottawattamie County (CB) qualifies as western Iowa.", "source": "https://aksarben.org/scholarships-and-internships/"}'::jsonb
),

-- ── 9. OCCF Southwest Iowa Scholarships — Main Cycle Closed — Check Remaining ─
-- Omaha Community Foundation has Iowa affiliate funds.
-- Main Feb 15 deadline passed, but fund-specific deadlines may remain open.
-- SW Iowa affiliate page at omahafoundation.org covers Pottawattamie County.
(
  'Omaha Community Foundation — Southwest Iowa Scholarship Funds (Check Status)',
  'Omaha Community Foundation (Iowa Affiliates)',
  'https://omahafoundation.org',
  'The Omaha Community Foundation is not just for Omaha. Its Iowa Affiliates program explicitly covers Pottawattamie County and has a dedicated Southwest Iowa Scholarships page at omahafoundation.org/iowa-affiliates/southwest-iowa-scholarships. Multiple scholarship funds within this program are specifically for Council Bluffs and Pottawattamie County students. The main 2026 universal application deadline was February 15, 2026 — that cycle has closed. However: some individual fund deadlines may extend beyond the universal deadline. Go to omahafoundation.org/iowa-affiliates/southwest-iowa-scholarships to check whether any Council Bluffs-specific funds are still accepting applications. If all 2026 funds are closed, bookmark this page and apply through the universal application when it opens in October 2026 for the 2026–2027 academic year. The universal application matches you to all funds you are eligible for — you apply once and the system finds every scholarship you qualify for. Awards range from $2,000 to $20,000 depending on the individual fund.',
  'scholarship',
  'Varies by individual scholarship fund. Southwest Iowa / Pottawattamie County funds are specifically for CB-area students. Check omahafoundation.org/iowa-affiliates/southwest-iowa-scholarships for current eligibility requirements, open funds, and deadlines. Universal application eligibility is determined by the matching system — apply and let it identify the awards you qualify for.',
  null,
  'https://omahafoundation.org/iowa-affiliates/southwest-iowa-scholarships/',
  'Council Bluffs, IA / Pottawattamie County',
  null, 'Council Bluffs', 'IA', null,
  true, false,
  array['low_income', 'first_gen'],
  array['scholarship', 'college_access'],
  array['high_school_senior', 'adult_learner'],
  'scholarship', 2000, 'one_time',
  'medium', 'needs_confirmation',
  'https://omahafoundation.org/iowa-affiliates/southwest-iowa-scholarships/', 'official_website', '2026-03-09',
  true, false,
  'Main universal application deadline was February 15, 2026. Check site for fund-specific remaining deadlines. Universal application opens October 2026 for next cycle.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["Council Bluffs students", "Pottawattamie County students", "Southwest Iowa students"], "mission_notes": "The Omaha Community Foundation has an entire Iowa affiliate infrastructure specifically because the metro area crosses state lines. CB students should know they are inside OCCF''s geographic mission, not outside it."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "OCCF Iowa Affiliates has a dedicated Southwest Iowa / Pottawattamie County scholarship page. CB is the county seat.", "source": "https://omahafoundation.org/iowa-affiliates/southwest-iowa-scholarships/"}'::jsonb
);
