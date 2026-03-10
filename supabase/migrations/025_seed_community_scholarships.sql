-- ============================================================
-- Opportography — Migration 025
-- Phase 10E: Community & Non-Institutional Scholarships
-- Research completed: March 9, 2026
--
-- These scholarships live inside civic infrastructure —
-- Elks lodges, LGBTQ+ advocacy orgs, agriculture associations,
-- trades foundations, veterans posts. No marketing budget.
-- No Instagram. A PDF in a guidance office or nothing at all.
-- This phase puts them where students can find them.
--
-- SWIEF deduplication: None of these entries route through
-- SWIEF. All require standalone applications through their
-- respective organizations.
--
-- Status summary:
--   Iowa Elks Vocational Grants         — URGENT — March deadline (call lodge)
--   First Friday LGBTQ+ Scholarship     — URGENT — mid-March (verify now)
--   Iowa Pork Producers                 — OPEN   — April deadline
--   Iowa Automobile Dealers Foundation  — OPEN   — April deadline
--   BNSF/AISES Native American          — OPEN   — June deadline
--   Iowa FFA Foundation (state-level)   — 2027 ref — Feb 1 deadline passed
--   CDI Conservation Scholarship        — 2027 ref — county deadline passed
--   Iowa Corn Growers Association       — 2027 ref — likely passed
--   ALA National Scholarship            — 2027 ref — March 1 likely passed
--   VFW Voice of Democracy              — 2027 ref — October deadline
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
  cb_eligibility, iowa_specific, swief_overlap, organization_type
) values

-- ── 1. Iowa State Elks Association Vocational Grants — URGENT — March 2026 ──
-- 20 grants of $1,500 each for Iowa students in 2-year vocational programs.
-- Standalone application through local Elks lodge — NOT through SWIEF.
-- Deadline historically early-to-mid March — may be closing this week.
(
  'Iowa State Elks Association Vocational Grants — Spring 2026',
  'Iowa State Elks Association / Benevolent and Protective Order of Elks',
  'https://ia-elks.org',
  'Twenty $1,500 vocational grants. Specifically for students going into a two-year or shorter trades or technical program — welding, HVAC, electrical, automotive, plumbing, cosmetology, CDL, medical assisting, dental assisting, CNA, EMT. If you are not taking the four-year route, this scholarship was built for you. The Iowa State Elks Association awards twenty of these grants every year to Iowa students pursuing vocational or technical education. The application goes through your local Elks lodge — Council Bluffs Elks Lodge is your starting point. This is a standalone application separate from SWIEF. Call or visit the lodge and ask about the Vocational Grant application. The deadline is historically in early-to-mid March, which means it may be closing right now. Do not wait. Contact the Council Bluffs Elks Lodge immediately. Even if the 2026 deadline has passed by the time you read this, the 2027 cycle will open again in January — this is a program worth knowing about if you are going into the trades.',
  'scholarship',
  'Must be an Iowa resident planning to enroll in a vocational or technical program of two years or less at an accredited institution. Program must lead to a career in a trade or technical field. Application submitted through the local Iowa Elks lodge. Contact Council Bluffs Elks Lodge to obtain the application and confirm the 2026 deadline. No four-year degree program required — this is specifically for vocational/technical students.',
  null,
  'https://ia-elks.org',
  'Council Bluffs, IA (Apply through local lodge)',
  null, 'Council Bluffs', 'IA', null,
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship', 1500, 'one_time',
  'medium', 'needs_confirmation',
  'https://ia-elks.org', 'community_org', '2026-03-09',
  true, true,
  'Deadline historically early-to-mid March. Contact CB Elks Lodge immediately to confirm 2026 deadline and obtain application. 2027 cycle: apply January 2027.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": false, "communities": ["vocational students", "trades students", "non-four-year students"], "mission_notes": "Most scholarships assume a four-year college path. The Elks Vocational Grant explicitly does not. It is one of the few substantial scholarship programs in Iowa that targets students going into the trades — the students least likely to think scholarships apply to them."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "Iowa state program. CB is in Iowa. Application goes through local CB Elks Lodge.", "source": "https://ia-elks.org"}'::jsonb,
  null,
  '{"administered_through_swief": false, "separate_application_available": true, "notes": "Standalone application through local Elks lodge — not administered through SWIEF. Contact Council Bluffs Elks Lodge directly to apply."}'::jsonb,
  'civic_service_club'
),

-- ── 2. First Friday Breakfast Club LGBTQ+ Scholarship — URGENT — Mid-March ──
-- $3,000 for Iowa high school seniors who fight homophobia / educate on LGBTQ+ issues.
-- Open to ALL Iowa residents regardless of sexual orientation.
-- Iowa''s most important LGBTQ+-specific scholarship. Deadline may be closing now.
(
  'First Friday Breakfast Club LGBTQ+ Scholarship — Spring 2026',
  'First Friday Breakfast Club',
  'https://ffbciowa.org',
  'This is the scholarship for Iowa students who have stood up. The First Friday Breakfast Club awards $3,000 to Iowa high school seniors who have actively fought homophobia or educated their communities about LGBTQ+ issues — through a GSA, through advocacy, through art, through policy work, through any meaningful effort. You do not need to be LGBTQ+ to apply. This award is open to all Iowa residents regardless of sexual orientation, gender identity, race, or religion. What matters is what you have done. The deadline is historically mid-March, which means it may be open right now. Apply at ffbciowa.org/apply-for-a-scholarship. The organization is Des Moines-based and meets monthly at Hoyt Sherman Place. If the 2026 cycle is still open, apply now. If it has closed: if you are an Iowa junior who has been doing this work, put this scholarship in your planner for fall 2026 — the application typically opens in January.',
  'scholarship',
  'Must be an Iowa high school senior (Class of 2026). Must demonstrate active effort to fight homophobia or educate communities about LGBTQ+ issues. Open to all Iowa residents regardless of sexual orientation, gender identity, race, or religion — you do not need to be LGBTQ+ to apply. Iowa residency required. Contact the First Friday Breakfast Club directly to verify 2026 application status and deadline.',
  null,
  'https://ffbciowa.org/apply-for-a-scholarship/',
  'Iowa (Statewide)',
  null, null, 'IA', null,
  true, false,
  array['lgbtq', 'ally'],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship', 3000, 'one_time',
  'medium', 'needs_confirmation',
  'https://ffbciowa.org/apply-for-a-scholarship/', 'community_org', '2026-03-09',
  true, true,
  'Deadline historically mid-March. Verify immediately — may still be open. 2027 cycle expected to open January 2027.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["LGBTQ+ students", "LGBTQ+ allies", "student advocates"], "mission_notes": "Iowa''s legal landscape for LGBTQ+ students changed significantly in July 2025 (gender identity removed from Iowa Civil Rights Act). The First Friday Breakfast Club scholarship is one of the few Iowa-specific financial supports for students who have done LGBTQ+ advocacy work — and it explicitly includes allies, not just LGBTQ+ students themselves."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "Iowa statewide scholarship. CB is in Iowa. No geographic restriction within Iowa.", "source": "https://ffbciowa.org/apply-for-a-scholarship/"}'::jsonb,
  null,
  '{"administered_through_swief": false, "separate_application_available": true, "notes": "Direct application to First Friday Breakfast Club. Not administered through SWIEF."}'::jsonb,
  'advocacy_org'
),

-- ── 3. Iowa Pork Producers Association Scholarship — OPEN — April 2026 ───────
-- $1,000 for Iowa students with interest in pork/agriculture industry.
-- April deadline — still open. Standalone application.
(
  'Iowa Pork Producers Association Scholarship — Spring 2026',
  'Iowa Pork Producers Association',
  'https://www.iowapork.org',
  'If agriculture is your future — or your family''s present — the Iowa Pork Producers Association awards $1,000 scholarships to Iowa students pursuing post-secondary education. The deadline is typically in April, which means the 2026 application is likely still open. Go to iowapork.org and find the scholarship section to apply. You do not need to be a farmer to qualify — interest in the pork industry, agriculture, or rural Iowa is the foundation. This is a standalone application through IPPA directly.',
  'scholarship',
  'Must be an Iowa resident. Must be a graduating high school senior or current college student. Interest in the pork industry or agriculture-related field. Verify current eligibility requirements and 2026 deadline at iowapork.org. FAFSA not required.',
  null,
  'https://www.iowapork.org',
  'Iowa (Statewide)',
  null, null, 'IA', null,
  true, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior', 'adult_learner'],
  'scholarship', 1000, 'one_time',
  'medium', 'needs_confirmation',
  'https://www.iowapork.org', 'community_org', '2026-03-09',
  true, false,
  'Deadline typically April annually. Verify 2026 exact date at iowapork.org.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": false, "communities": ["agriculture students", "rural Iowa students", "pork industry families"], "mission_notes": "Pottawattamie County has significant agricultural presence. CB students from farm families — or students interested in agricultural careers — have a direct path to this scholarship."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "Iowa statewide scholarship. CB is in Iowa.", "source": "https://www.iowapork.org"}'::jsonb,
  null,
  '{"administered_through_swief": false, "separate_application_available": true, "notes": "Direct application through Iowa Pork Producers Association. Not administered through SWIEF."}'::jsonb,
  'industry_group'
),

-- ── 4. Iowa Automobile Dealers Foundation Scholarship — OPEN — April 2026 ───
-- $1,000 for Iowa students pursuing automotive careers.
-- April deadline — likely still open. Standalone application.
(
  'Iowa Automobile Dealers Foundation for Education Scholarship — Spring 2026',
  'Iowa Automobile Dealers Association Foundation for Education',
  'https://www.iada.com',
  'If your plan is automotive technology — mechanics, auto body, dealership management, or a related field — the Iowa Automobile Dealers Association Foundation awards $1,000 scholarships to Iowa students pursuing those careers. The deadline is typically in April, which means the 2026 application is likely still open. Go to iada.com to find the scholarship application. This is a standalone application specific to the automotive industry. Council Bluffs students planning to study automotive technology at Iowa Western Community College or another Iowa institution should apply.',
  'scholarship',
  'Must be an Iowa resident pursuing post-secondary education in automotive technology, auto body, dealership management, or a related automotive career field. Must be an Iowa high school senior or current college student. Verify current eligibility requirements and 2026 deadline at iada.com.',
  null,
  'https://www.iada.com',
  'Iowa (Statewide)',
  null, null, 'IA', null,
  true, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior', 'adult_learner'],
  'scholarship', 1000, 'one_time',
  'low', 'needs_confirmation',
  'https://www.iada.com', 'community_org', '2026-03-09',
  true, false,
  'Deadline typically April annually. Verify 2026 exact date and application URL at iada.com.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": false, "communities": ["automotive students", "trades students"], "mission_notes": "One of the few scholarships specifically for students entering the automotive trades — the exact population most likely to think scholarships are not for them."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "Iowa statewide scholarship for Iowa students in automotive careers. CB is in Iowa.", "source": "https://www.iada.com"}'::jsonb,
  null,
  '{"administered_through_swief": false, "separate_application_available": true, "notes": "Direct application through Iowa Automobile Dealers Association Foundation. Not administered through SWIEF."}'::jsonb,
  'industry_group'
),

-- ── 5. BNSF/AISES Scholarship — OPEN — June 2026 — Native American Students ─
-- $2,500 renewable for Native American STEM/business students.
-- Iowa is a BNSF-served state. June deadline — months out.
(
  'BNSF Railway Foundation Scholarship — Native American Students (through AISES)',
  'American Indian Science and Engineering Society (AISES) / BNSF Railway Foundation',
  'https://www.aises.org/scholarships',
  'If you are a Council Bluffs student with American Indian, Alaska Native, Native Hawaiian, or Pacific Islander heritage, and you are going into a STEM or business field — this scholarship is renewable, $2,500 per year, and the June deadline gives you time to prepare a strong application. The BNSF Railway Foundation funds this scholarship through AISES (the American Indian Science and Engineering Society). Iowa is a BNSF-served state, which means Iowa students are eligible. You apply through AISES at aises.org/scholarships. You will need: proof of tribal enrollment or heritage, a 3.0+ GPA, and a plan to study engineering, science, technology, or business. This is one of the most accessible renewable scholarships for Native students in the Iowa/Nebraska region with a realistic spring deadline.',
  'scholarship',
  'Must be an American Indian, Alaska Native, Native Hawaiian, or Pacific Islander high school senior or college student. Must have a minimum 3.0 GPA. Must reside in a state served by BNSF Railway (Iowa qualifies — Council Bluffs is on the BNSF network). Must be pursuing a degree in science, technology, engineering, mathematics, or business. Must apply through AISES at aises.org/scholarships. Tribal enrollment or documentation of heritage required.',
  null,
  'https://www.aises.org/scholarships',
  'Iowa / National (BNSF-served states)',
  null, null, 'IA', null,
  true, false,
  array['native_american', 'indigenous'],
  array['scholarship', 'college_access'],
  array['high_school_senior', 'adult_learner'],
  'scholarship', 2500, 'annual',
  'medium', 'verified',
  'https://www.aises.org/scholarships', 'official_website', '2026-03-09',
  true, true,
  'Deadline historically June. Verify exact 2026 date at aises.org/scholarships. Renewable annually with satisfactory progress.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["American Indian students", "Alaska Native students", "Native Hawaiian students", "Pacific Islander students", "Indigenous STEM students"], "mission_notes": "Native American students are the most underrepresented population in Iowa''s higher education data. The BNSF/AISES scholarship is renewable, well-funded, and has a June deadline that gives spring applicants time to build a competitive application. CB sits directly on the BNSF rail network — Iowa eligibility is unambiguous."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "Iowa is a BNSF-served state. CB students with eligible heritage qualify. No Iowa institution requirement.", "source": "https://www.aises.org/scholarships"}'::jsonb,
  null,
  '{"administered_through_swief": false, "separate_application_available": true, "notes": "Direct application through AISES. National program. Not administered through SWIEF."}'::jsonb,
  'professional_association'
),

-- ── 6. Iowa FFA Foundation Scholarships — 2027 Ref — Feb 1 Deadline ─────────
-- Iowa-specific FFA scholarships: 100+ awards via one application at iowaffafoundation.org
-- DISTINCT from National FFA Foundation (ffa.org/scholarships — see Migration 023).
-- Feb 1, 2026 deadline has passed. Include for permanent database / 2027 seniors.
(
  'Iowa FFA Foundation Scholarships — Plan for 2027 (2026 Deadline Passed Feb 1)',
  'Iowa FFA Foundation',
  'https://www.iowaffafoundation.org',
  'One application at iowaffafoundation.org covers 100+ Iowa FFA scholarships — awards ranging from $500 to $1,500 each, totaling hundreds of thousands of dollars for Iowa FFA members annually. This is different from the National FFA Foundation (ffa.org/scholarships) — the Iowa FFA Foundation administers Iowa-specific awards with a separate single application. The 2026 deadline was February 1, which has passed. If you are a current Iowa FFA member who is a junior, put February 1, 2027 in your calendar right now. Fill out the Iowa FFA Foundation application at iowaffafoundation.org early in your senior fall semester — it is the single most efficient scholarship application available to Iowa FFA members, covering dozens of individual awards at once. Council Bluffs students who are active in FFA through Abraham Lincoln, Thomas Jefferson, or Lewis Central chapters are eligible.',
  'scholarship',
  'Must be an active Iowa FFA member. Must be a graduating high school senior or enrolled college student. Field of study requirements vary by individual scholarship within the pool. One application at iowaffafoundation.org determines eligibility for all applicable awards. For 2027 cycle: application expected to open fall 2026; deadline February 1, 2027.',
  null,
  'https://www.iowaffafoundation.org',
  'Iowa (Statewide)',
  null, null, 'IA', null,
  true, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship', 1000, 'one_time',
  'high', 'verified',
  'https://www.iowaffafoundation.org', 'official_website', '2026-03-09',
  true, false,
  '2026 cycle deadline: February 1, 2026 (passed). 2027 cycle expected to open fall 2026; deadline February 1, 2027. Start application early in senior fall semester.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": false, "communities": ["Iowa FFA members", "agriculture students", "vocational students"], "mission_notes": "Iowa FFA Foundation scholarships cover agriculture, trades, business, science, and more. One application opens access to 100+ awards. CB FFA chapter members who miss this deadline consistently leave substantial scholarship money on the table."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "Iowa FFA Foundation serves Iowa FFA members. CB FFA chapters are Iowa FFA chapters.", "source": "https://www.iowaffafoundation.org"}'::jsonb,
  null,
  '{"administered_through_swief": false, "separate_application_available": true, "notes": "Standalone application at iowaffafoundation.org. Distinct from SWIEF and from National FFA (ffa.org/scholarships)."}'::jsonb,
  'civic_service_club'
),

-- ── 7. CDI Conservation Scholarship — 2027 Ref — County Deadline Feb 6 ───────
-- $500–$3,000 for Iowa seniors in conservation/agriculture.
-- County deadline Feb 6 passed. Documents full timeline for 2027 planning.
(
  'Conservation Districts of Iowa Conservation Scholarship — Plan for 2027',
  'Conservation Districts of Iowa / Pottawattamie Soil and Water Conservation District',
  'https://www.iowacdi.net',
  'The Conservation Districts of Iowa awards $500 to $3,000 scholarships to Iowa high school seniors pursuing conservation, natural resources, or agriculture at the post-secondary level. The 2026 cycle county-level deadline was February 6 — that window has closed. But this scholarship is worth knowing for 2027. Here is how it works: you apply first at the county level through your local Soil and Water Conservation District (for Council Bluffs students, that is the Pottawattamie SWCD). County winners advance to regional selection (historically around March 13) and then state selection (historically around April 3). State winners are notified in May. To apply in 2027: contact the Pottawattamie County Soil and Water Conservation District in January 2027 at (712) 328-4547 or visit pottswcd.org. Set a reminder now. This is a standalone application through the county SWCD, not through SWIEF.',
  'scholarship',
  'Must be an Iowa high school senior interested in pursuing a career in conservation, natural resources, environmental science, or agriculture at an accredited post-secondary institution. Application is a multi-stage process: county → regional → state selection. Apply through your county Soil and Water Conservation District — for Council Bluffs students, contact Pottawattamie SWCD at (712) 328-4547. County application deadline historically early February.',
  null,
  'https://www.iowacdi.net',
  'Pottawattamie County, IA / Iowa (Statewide)',
  null, 'Council Bluffs', 'IA', null,
  true, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship', 1500, 'one_time',
  'medium', 'verified',
  'https://www.iowacdi.net', 'official_website', '2026-03-09',
  true, false,
  '2026 county deadline: February 6 (passed). Regional selection: March 13. State selection: April 3. Winners notified: May. 2027 county deadline expected early February 2027 — contact Pottawattamie SWCD in January.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": false, "communities": ["conservation students", "environmental science students", "agriculture students"], "mission_notes": "Council Bluffs students with interest in conservation, natural resources, or environmental careers have a county-level pathway through Pottawattamie SWCD. The multi-stage process rewards local connection and community investment — qualities CB students in rural or agricultural settings often have."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "Iowa program with county-level application. CB/Pottawattamie County students apply through Pottawattamie SWCD.", "source": "https://www.iowacdi.net"}'::jsonb,
  null,
  '{"administered_through_swief": false, "separate_application_available": true, "notes": "Application goes through county SWCD, not SWIEF. Contact Pottawattamie SWCD at (712) 328-4547."}'::jsonb,
  'government_program'
),

-- ── 8. Iowa Corn Growers Association Scholarships — 2027 Ref — Jan/Feb Deadline
-- 18 scholarships at $1,000 each — 9 for high school seniors.
-- Deadline typically January/February — passed for 2026.
(
  'Iowa Corn Growers Association Scholarships — Plan for 2027 (2026 Deadline Passed)',
  'Iowa Corn Growers Association / Iowa Corn Promotion Board',
  'https://www.iowacorn.org',
  'The Iowa Corn Growers Association awards 18 scholarships of $1,000 each — 9 for high school seniors and 9 for current college students — to Iowa students with ties to agriculture and the corn industry. The 2026 deadline was likely in January or February, which has passed. For 2027: set a January 2027 reminder and apply at iowacorn.org. Awards go to students in agriculture and related fields, though you do not need to be pursuing an ag degree — broader STEM and rural Iowa connections count. Pottawattamie County''s agricultural footprint means many CB students or their families have legitimate connections to the corn industry. One application covers all applicable awards.',
  'scholarship',
  'Must be an Iowa resident. For high school senior awards: graduating senior with interest in agriculture or ties to the corn industry. For college awards: currently enrolled college student. Iowa family connection to agriculture is helpful but may not be required. Verify current eligibility at iowacorn.org. Deadline historically January–February annually.',
  null,
  'https://www.iowacorn.org',
  'Iowa (Statewide)',
  null, null, 'IA', null,
  true, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior', 'adult_learner'],
  'scholarship', 1000, 'one_time',
  'medium', 'needs_confirmation',
  'https://www.iowacorn.org', 'community_org', '2026-03-09',
  true, false,
  '2026 deadline: likely January–February (passed). 2027 applications expected January 2027. Set a reminder.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "Iowa statewide scholarship. CB is in Iowa.", "source": "https://www.iowacorn.org"}'::jsonb,
  null,
  '{"administered_through_swief": false, "separate_application_available": true, "notes": "Direct application at iowacorn.org. Not administered through SWIEF."}'::jsonb,
  'industry_group'
),

-- ── 9. American Legion Auxiliary National Scholarship — 2027 Ref — March 1 ───
-- For relatives of veterans. Historically March 1 deadline — likely just passed.
-- Document for permanent database and 2027 planning.
(
  'American Legion Auxiliary National Scholarship — Plan for 2027 (2026 Deadline Passed)',
  'American Legion Auxiliary',
  'https://www.alaforveterans.org',
  'If a family member has served in the U.S. Armed Forces, the American Legion Auxiliary has scholarship programs for you. The ALA National Scholarship is historically due March 1, which means the 2026 deadline has likely just passed. But this is a scholarship to know: the ALA offers multiple programs including the Spirit of Youth Scholarship and Non-Traditional Student Award, with awards ranging from $500 to $2,500. For 2027, start the process in January through your local American Legion Auxiliary unit — contact the Pottawattamie County ALA unit or look up the Council Bluffs American Legion posts on alaforveterans.org. Unit-level scholarships within the ALA sometimes have different deadlines than the national program — contact your local unit to ask about any remaining 2026 opportunities and how to plan for 2027.',
  'scholarship',
  'Must be related to a past or present member of the U.S. Armed Forces (veteran, active duty, or service member). Various ALA scholarships have different family connection requirements. Some programs require ALA membership in the family; others do not. Pottawattamie County ALA unit is the local contact for CB students. Visit alaforveterans.org for the full scholarship portfolio.',
  null,
  'https://www.alaforveterans.org',
  'Iowa (Statewide) / National',
  null, null, 'IA', null,
  true, false,
  array['military_family'],
  array['scholarship', 'college_access'],
  array['high_school_senior', 'adult_learner'],
  'scholarship', 1500, 'one_time',
  'medium', 'verified',
  'https://www.alaforveterans.org', 'official_website', '2026-03-09',
  true, false,
  '2026 national deadline: March 1 (passed). Unit-level scholarships may have different deadlines — contact Pottawattamie County ALA unit. 2027 national deadline expected March 1, 2027.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": false, "communities": ["military families", "veteran families"], "mission_notes": "Council Bluffs has a significant military-connected population given proximity to Offutt AFB and strong local Veterans of Foreign Wars and American Legion infrastructure. Military family connections are common among CB students who would not otherwise think to apply."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "National program. Iowa and CB students with qualifying veteran family members are eligible.", "source": "https://www.alaforveterans.org"}'::jsonb,
  null,
  '{"administered_through_swief": false, "separate_application_available": true, "notes": "Direct application through ALA. Contact local Pottawattamie County ALA unit for local scholarship opportunities."}'::jsonb,
  'military_connected'
),

-- ── 10. VFW Voice of Democracy — 2027 Ref — October Deadline ────────────────
-- Up to $30,000. Audio essay competition on patriotic theme.
-- October 31 deadline — passed for 2026. Critical 2027 planning listing.
(
  'VFW Voice of Democracy Scholarship Program — Plan for 2027 (October Deadline)',
  'Veterans of Foreign Wars',
  'https://www.vfw.org/community/youth-and-education/voice-of-democracy',
  'The VFW Voice of Democracy is one of the largest high school scholarship competitions in the United States — awards go up to $30,000, with scholarships at every level from post to state to national. It is a recorded audio essay competition on a patriotic theme that changes each year. The October 31 deadline has passed for 2026. But if you are a junior or a sophomore: mark October 31 as a deadline in your planner right now. Entry is through your local VFW post — there are multiple VFW posts in Council Bluffs. Contact any local CB VFW post to enter when the 2026-2027 theme is announced (typically late summer). The competition is open to students in grades 9-12. Most students who win at the national level started competing in earlier grades. If you have not entered before, start next fall. The Patriot''s Pen competition ($5,000 top award) is the middle school version for grades 6-8 — relevant for younger siblings.',
  'scholarship',
  'Must be a student in grades 9–12 (high school). Must be a U.S. citizen or national. Entry filed through a local VFW post. Annual theme announced late summer — essay recorded as audio. Competition is post-level → district → state → national, with scholarship awards at each level. No prior VFW connection required. Contact Council Bluffs VFW post to enter.',
  null,
  'https://www.vfw.org/community/youth-and-education/voice-of-democracy',
  'Council Bluffs, IA (Apply through local VFW post)',
  null, 'Council Bluffs', 'IA', null,
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior', 'high_school_junior'],
  'scholarship', 5000, 'one_time',
  'high', 'verified',
  'https://www.vfw.org/community/youth-and-education/voice-of-democracy', 'official_website', '2026-03-09',
  true, false,
  '2026 deadline: October 31, 2026 (next cycle). Theme announced late summer 2026. Entry through local VFW post. 2026-27 cycle: contact CB VFW post by September.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": false, "communities": ["high school students", "military family communities"], "mission_notes": "VFW Voice of Democracy has made CB students nationally competitive in past years. The path to national-level scholarships ($30,000) runs through the local lodge. Students who start early — sophomore or junior year — have the best track record."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "National program. CB students apply through local VFW post. No VFW family connection required.", "source": "https://www.vfw.org/community/youth-and-education/voice-of-democracy"}'::jsonb,
  null,
  '{"administered_through_swief": false, "separate_application_available": true, "notes": "Application goes through local VFW post — completely separate from SWIEF."}'::jsonb,
  'military_connected'
);
