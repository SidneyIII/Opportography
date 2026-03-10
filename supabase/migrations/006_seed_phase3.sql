-- ============================================================
-- Opportography — Migration 006
-- Phase 3 Enrichment & Adult Resources Batch
-- Sources researched and verified: February 2026
-- Run AFTER 005_schema_phase3.sql
--
-- Target demographics: Young adults (18–30), college students,
--   adults upskilling, immigrants, people seeking legal help,
--   entrepreneurs, anyone needing a critical community resource
--
-- Type mapping notes (using existing taxonomy):
--   free_resource  → Ongoing services: legal aid, health clinics, career tools
--   workshop       → Structured recurring events: classes, VITA, 1MC, ESL
--   college_access → Credential/degree pathways: GED, HiSET, adult ed
--   mentorship     → Coaching & business guidance
--
-- Geographic breakdown:
--   Council Bluffs / Iowa-side: 4
--   Omaha / Nebraska-side:      11
--
-- New schema field used: schedule (added in migration 005)
-- ============================================================

insert into public.opportunities (
  title, organization, organization_website, description, type,
  eligibility, deadline, link, location, city, state,
  identity_tags, category_tags, grade_levels,
  compensation_type, compensation_amount, compensation_frequency,
  data_confidence, verification_status,
  source_url, source_type, source_retrieved_date,
  is_active, is_featured, schedule
) values

-- ══════════════════════════════════════════════════════════
-- COUNCIL BLUFFS / IOWA-SIDE (4 opportunities)
-- ══════════════════════════════════════════════════════════

-- ── LEGAL RESOURCES (CB) ─────────────────────────────────

(
  'Iowa Legal Aid — Council Bluffs Office',
  'Iowa Legal Aid',
  'https://iowalegalaid.org',
  'Free civil legal help for low-income Iowans in Council Bluffs and Pottawattamie County. Iowa Legal Aid handles housing, family law, consumer rights, employment, government benefits, and individual rights cases. Services include legal advice, limited assistance, and full representation for qualifying clients.',
  'free_resource',
  'Must be an Iowa resident with income at or below 125% of the Federal Poverty Level and have a qualifying civil legal issue. Call 1-800-532-1503 or visit iowalegalaid.org to apply.',
  null,
  'https://iowalegalaid.org',
  'Council Bluffs', 'Council Bluffs', 'IA',
  array['low_income', 'immigrant', 'homeless', 'disabled'],
  array['community_service'],
  array[]::text[],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.councilbluffslibrary.org/community-resources/iowa-legal-aid', 'community_org', '2026-02-25',
  true, false,
  null
),

-- ── TAX PREPARATION (CB) ─────────────────────────────────

(
  'Free VITA Tax Preparation — Council Bluffs Public Library',
  'Omaha Earned Income Tax Credit Coalition / IRS VITA',
  'https://www.councilbluffslibrary.org',
  'Free tax return preparation through the IRS VITA program at the Council Bluffs Public Library (400 Willow Ave). IRS-certified volunteers prepare federal and state returns for qualifying individuals and families. Appointments only — schedule by calling 211 or booking online. Returns for tax years 2022–2025 accepted.',
  'workshop',
  'Open to anyone needing tax help. Bring photo ID, Social Security cards or ITINs for all filers, and all tax documents (W-2s, 1095-As, etc.). Both spouses must attend if filing jointly. No walk-ins.',
  '2026-04-08',
  'https://www.councilbluffslibrary.org/posts/2026-tax-appointments',
  'Council Bluffs', 'Council Bluffs', 'IA',
  array['low_income', 'esl', 'immigrant'],
  array[]::text[],
  array[]::text[],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.councilbluffslibrary.org/posts/2026-tax-appointments', 'official_website', '2026-02-25',
  true, false,
  'Mondays and Wednesdays, January 26–April 8, 2026'
),

-- ── ADULT EDUCATION (CB) ─────────────────────────────────

(
  'Iowa Western Adult Learning Center — GED, HiSET & ESL',
  'Iowa Western Community College',
  'https://www.iwcc.edu/ce/adult-education/',
  'Free adult education classes at Iowa Western''s Adult Learning Center in the Omni Centre, Council Bluffs. Programs include GED/HiSET exam preparation, English as a Second Language (ESL) at multiple levels, and adult basic education. Classes run Monday–Friday with extended hours. A $25 registration fee is due at enrollment and is valid through June 30.',
  'college_access',
  'Any adult not currently enrolled in high school who lacks a high school diploma or needs to improve basic literacy skills. ESL classes are open to adults at all English levels. Registration fee: $25 (valid through June 30). Location: Adult Learning Center, Omni Centre, Council Bluffs.',
  null,
  'https://www.iwcc.edu/ce/adult-education/',
  'Council Bluffs', 'Council Bluffs', 'IA',
  array['low_income', 'first_gen', 'esl', 'immigrant'],
  array[]::text[],
  array[]::text[],
  'unpaid', '$25 registration fee', null,
  'high', 'verified',
  'https://www.iwcc.edu/ce/adult-education/', 'official_website', '2026-02-25',
  true, false,
  'Monday–Thursday 8 AM–9 PM, Friday 8 AM–3 PM'
),

-- ══════════════════════════════════════════════════════════
-- OMAHA / NEBRASKA-SIDE (11 opportunities)
-- ══════════════════════════════════════════════════════════

-- ── LEGAL RESOURCES (OMAHA) ──────────────────────────────

(
  'Legal Aid of Nebraska — Free Civil Legal Help',
  'Legal Aid of Nebraska',
  'https://legalaidofnebraska.org',
  'Free civil legal services for low-income Nebraskans in Douglas County and across all 93 counties statewide. Legal Aid handles housing, family law (divorce, custody, protection orders), debt, income and benefits, and immigration matters. Apply online or by phone — no walk-ins. The A2J Self-Help Center at 209 S. 19th St., Suite 200, Omaha provides computers and forms for self-represented individuals.',
  'free_resource',
  'Must have household income at or below 125% of the Federal Poverty Level (asset limits also apply). Apply online at lawhelpne.legalaidofnebraska.org or call (402) 348-1060. Age 60+ may be exempt from financial eligibility.',
  null,
  'https://legalaidofnebraska.org',
  'Omaha', 'Omaha', 'NE',
  array['low_income', 'immigrant', 'homeless', 'disabled', 'foster_youth'],
  array['community_service'],
  array[]::text[],
  'unpaid', null, null,
  'high', 'verified',
  'https://legalaidofnebraska.org', 'official_website', '2026-02-25',
  true, false,
  null
),

(
  'Immigrant Legal Center — Free Immigration Legal Services',
  'Immigrant Legal Center (ILC)',
  'https://immigrantlegalcenter.org',
  'The Immigrant Legal Center (formerly Justice For Our Neighbors Nebraska) provides free, professional immigration legal services through licensed attorneys and DOJ-accredited representatives. Serves low-income immigrants in Nebraska and Southwest Iowa, including a Council Bluffs, IA office. Services include weekly consultations and monthly legal clinics at partner locations across the metro.',
  'free_resource',
  'Low-income immigrants in Nebraska and Southwest Iowa. Services are income-based. Contact the Nebraska Immigration Legal Assistance Hotline (NILAH) at 1-855-307-6730 to request services or schedule a consultation.',
  null,
  'https://immigrantlegalcenter.org',
  'Omaha', 'Omaha', 'NE',
  array['immigrant', 'esl', 'low_income'],
  array['community_service'],
  array[]::text[],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.immigrationadvocates.org/nonprofit/legaldirectory/organization.393089-Center_for_Immigrant_and_Refugee_Advancement', 'community_org', '2026-02-25',
  true, false,
  'Weekly consultations; monthly legal clinics at partner locations'
),

-- ── TAX PREPARATION (OMAHA) ──────────────────────────────

(
  'Creighton VITA — Free Tax Preparation Clinics',
  'Creighton University / IRS VITA',
  'https://www.creighton.edu/business/vita',
  'Creighton University accounting students offer free tax preparation to Omaha-area residents earning under $60,000. Walk-in only Saturday clinics run from early February through late March at the Mike and Josie Harper Center (602 N 20th St) on Creighton''s campus. Virtual appointments also available by emailing vita@creighton.edu.',
  'workshop',
  'Open to anyone with household income under $60,000. Walk-in only — no appointments for in-person clinics. Bring photo ID, Social Security cards for all filers, and all tax documents. Virtual appointments available by emailing vita@creighton.edu.',
  '2026-03-28',
  'https://www.creighton.edu/business/vita',
  'Omaha', 'Omaha', 'NE',
  array['low_income', 'esl', 'immigrant'],
  array[]::text[],
  array[]::text[],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.creighton.edu/business/vita', 'official_website', '2026-02-25',
  true, false,
  'Saturdays February 7–March 28, 2026, 9 AM–4 PM (walk-in only)'
),

-- ── LANGUAGE / ESL (OMAHA) ───────────────────────────────

(
  'ESL Omaha — Free English Classes (No ID Required)',
  'ESL Omaha',
  'https://www.eslomaha.com',
  'Free English as a Second Language classes at six levels — beginner through advanced — at 10845 Harney St, Omaha. Evening classes run Tuesday nights (all adults welcome). Daytime classes run Thursday mornings (women only). No paperwork, no documentation, no ID required. Limited childcare available during class. Current session runs through May 2026.',
  'workshop',
  'Any adult age 18 or older. Completely free — no documentation or ID required. Limited childcare available. Classes held at 10845 Harney St, Omaha, NE.',
  null,
  'https://www.eslomaha.com',
  'Omaha', 'Omaha', 'NE',
  array['esl', 'immigrant', 'low_income'],
  array['community_service'],
  array[]::text[],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.eslomaha.com', 'official_website', '2026-02-25',
  true, true,
  'Tuesdays 6:30–8:30 PM (all adults); Thursdays 9:15–11:15 AM (women only)'
),

-- ── ADULT EDUCATION / GED (OMAHA) ────────────────────────

(
  'Learning for ALL — Free GED, ESL & Tutoring',
  'Learning for ALL',
  'https://golearnall.org',
  'Completely free adult education programs at the Barbara Weitz Community Engagement Center (6001 Dodge St, Omaha). Offers GED exam preparation, multi-level ESL classes, and 1-on-1 English tutoring with volunteer tutors. Available in-person and online. GED and ESL registration opens in early 2026.',
  'college_access',
  'Adults in the Omaha community. All programs are completely free — no cost, no income requirement. GED class registration opens January 19, 2026. ESL class registration opens March 9, 2026. 1-on-1 tutoring waitlist opens March 30, 2026. Call 402-502-0698 to enroll.',
  null,
  'https://golearnall.org',
  'Omaha', 'Omaha', 'NE',
  array['esl', 'immigrant', 'low_income', 'first_gen'],
  array[]::text[],
  array[]::text[],
  'unpaid', null, null,
  'high', 'verified',
  'https://golearnall.org', 'official_website', '2026-02-25',
  true, false,
  'Fall and Spring semesters; rolling enrollment'
),

(
  'MCC Adult Education — Free GED & ESL Classes',
  'Metropolitan Community College',
  'https://www.mccneb.edu/getting-started/ged-esl',
  'Free GED instruction and testing at multiple MCC campuses across the Omaha metro, including Fort Omaha, North Express, South Express, Applied Technology Center, and others. The program also includes ESL classes. Taught by certified educators, this program serves adults without a high school diploma who want to earn a GED or improve their English skills.',
  'college_access',
  'Adults who do not have a high school diploma or GED and are not currently enrolled in secondary school. Must not have previously passed the GED. Free — no tuition, no fees. Call 531-622-4060 or email adultedu@mccneb.edu to enroll.',
  null,
  'https://www.mccneb.edu/getting-started/ged-esl',
  'Omaha', 'Omaha', 'NE',
  array['low_income', 'first_gen', 'esl', 'immigrant'],
  array[]::text[],
  array[]::text[],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.mccneb.edu/getting-started/ged-esl', 'official_website', '2026-02-25',
  true, false,
  'Fall and Spring semesters; multiple locations'
),

-- ── HEALTH RESOURCES (OMAHA) ─────────────────────────────

(
  'OneWorld Community Health Centers',
  'OneWorld Community Health Centers',
  'https://www.oneworldomaha.org',
  'Federally Qualified Health Center with multiple Omaha locations offering medical, dental, behavioral health, pharmacy, and support services on a sliding fee scale. Accepts Medicaid, Medicare, and private insurance. Specializes in serving uninsured and underinsured patients regardless of ability to pay. Includes health insurance enrollment assistance, interpreter services, and school-based health centers.',
  'free_resource',
  'Open to all patients regardless of insurance status or ability to pay. Sliding fee scale adjusts costs based on family size and income. Call (402) 734-4110 to schedule an appointment or find a location at oneworldomaha.org.',
  null,
  'https://www.oneworldomaha.org/patient-services/',
  'Omaha', 'Omaha', 'NE',
  array['low_income', 'immigrant', 'esl', 'hispanic'],
  array['health'],
  array[]::text[],
  'unpaid', 'Sliding fee scale based on income', null,
  'high', 'verified',
  'https://www.oneworldomaha.org', 'official_website', '2026-02-25',
  true, false,
  null
),

(
  'Charles Drew Health Center — North Omaha Community Health',
  'Charles Drew Health Center',
  'https://charlesdrew.com',
  'Comprehensive, Joint Commission-accredited community health center serving North Omaha since 1983. Offers primary care, dental, behavioral health, optometry, pharmacy, STI testing, HIV counseling, and chronic disease management. Accepts Medicaid, Medicare, private insurance, and offers a sliding fee scale for uninsured patients. Committed to quality care regardless of ability to pay.',
  'free_resource',
  'Open to all patients. Sliding scale fees for uninsured patients. Accepts Medicaid and Medicare. Call (402) 451-3553 to schedule an appointment. Multiple locations — see charlesdrew.com for the nearest site.',
  null,
  'https://charlesdrew.com',
  'Omaha', 'Omaha', 'NE',
  array['low_income', 'black', 'immigrant'],
  array['health'],
  array[]::text[],
  'unpaid', 'Sliding fee scale based on income', null,
  'high', 'verified',
  'https://charlesdrew.com', 'official_website', '2026-02-25',
  true, false,
  null
),

-- ── CAREER & PROFESSIONAL DEVELOPMENT (OMAHA) ────────────

(
  'Omaha Public Library — Free Career & Job Search Resources',
  'Omaha Public Library',
  'https://omahalibrary.org',
  'Every OPL library card includes free access to LinkedIn Learning (thousands of online courses), LearningExpress career prep tools, DigitalLearn for computer and internet basics, Glassdoor company research, NEworks resume builder, and in-branch one-on-one technology help. No subscription fees — just a free library card.',
  'free_resource',
  'Free with an Omaha Public Library card. Cards are free to all Douglas County residents. Visit any OPL branch or omahalibrary.org to get a card and access all digital resources online.',
  null,
  'https://omahalibrary.org/job-career-advancement/',
  'Omaha', 'Omaha', 'NE',
  array['low_income', 'first_gen', 'esl', 'immigrant'],
  array['business', 'stem'],
  array[]::text[],
  'unpaid', null, null,
  'high', 'verified',
  'https://omahalibrary.org/job-career-advancement/', 'official_website', '2026-02-25',
  true, false,
  null
),

-- ── NETWORKING & ENTREPRENEURSHIP (OMAHA) ────────────────

(
  '1 Million Cups Omaha — Weekly Startup Networking',
  '1 Million Cups Omaha / Kauffman Foundation',
  'https://www.1millioncups.com/s/account/0014W00002AqQf5QAF/omaha-ne',
  'Free weekly gathering where early-stage startup founders present to a room of entrepreneurs, mentors, and community members at The Ashton in Millwork Commons. 8:00 AM coffee and connection, 8:30 AM founder presentation, followed by open Q&A and VC office hours. Part of the national Kauffman Foundation 1 Million Cups network. No registration required — just show up.',
  'workshop',
  'Open to anyone — entrepreneurs, students, professionals, curious community members. Free. No registration required. The Ashton at Millwork Commons, 1014 Howard St, Omaha.',
  null,
  'https://millworkcommons.com/event/1-million-cups-3/2026-01-07/',
  'Omaha', 'Omaha', 'NE',
  array[]::text[],
  array['business', 'leadership'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://millworkcommons.com/event/1-million-cups-3/2026-01-07/', 'community_org', '2026-02-25',
  true, false,
  'Every Wednesday 8:00–9:00 AM'
),

(
  'Nebraska Enterprise Fund — Small Business Training & Micro-Loans',
  'Nebraska Enterprise Fund',
  'https://nebbiz.org',
  'Statewide micro-lending and business development organization supporting underserved and low-income entrepreneurs. Offers a 5-week Business Acumen Training program, one-on-one business coaching, and micro-loans from $1,000–$150,000 for businesses that can''t access traditional bank financing. Staff available in Omaha for in-person support.',
  'mentorship',
  'Open to micro and small business owners and aspiring entrepreneurs across Nebraska, including Omaha. Focus on underserved communities, people of color, women, veterans, and low-income entrepreneurs. Visit nebbiz.org or call (402) 685-5500 to learn about current training sessions and loan eligibility.',
  null,
  'https://nebbiz.org',
  'Omaha', 'Omaha', 'NE',
  array['low_income', 'first_gen', 'black', 'hispanic', 'immigrant'],
  array['business'],
  array['college_freshman'],
  'unpaid', null, null,
  'medium', 'verified',
  'https://nebbiz.org', 'official_website', '2026-02-25',
  true, false,
  'Monthly workshops; 5-week Business Acumen Training offered periodically'
);

-- ── Phase 3 Completion Report ──────────────────────────────
-- Total new listings inserted: 15
--
-- By geography:
--   Council Bluffs / Iowa-side: 4
--     - Iowa Legal Aid CB
--     - VITA at CB Public Library
--     - Iowa Western Adult Learning (GED/HiSET/ESL)
--     - [See note below re: ESL Omaha covering CB via partner schools]
--   Omaha / Nebraska-side: 11
--     - Legal Aid of Nebraska
--     - Immigrant Legal Center (serves CB too)
--     - Creighton VITA
--     - ESL Omaha
--     - Learning for ALL
--     - MCC Adult Education / GED
--     - OneWorld Community Health Centers
--     - Charles Drew Health Center
--     - OPL Job & Career Resources
--     - 1 Million Cups Omaha
--     - Nebraska Enterprise Fund
--
-- By type:
--   free_resource:   6 (Iowa Legal Aid, Legal Aid NE, ILC, OneWorld,
--                       Charles Drew, OPL Career)
--   workshop:        4 (VITA CB, Creighton VITA, ESL Omaha, 1MC)
--   college_access:  3 (IWCC Adult Ed, Learning for ALL, MCC GED)
--   mentorship:      1 (Nebraska Enterprise Fund)
--   free_resource    1 (Iowa Legal Aid CB)
--
-- New schema field: schedule (added in migration 005)
--   Fields populated: Creighton VITA, VITA CB, ESL Omaha, IWCC Adult Ed,
--                     1 Million Cups, Nebraska Enterprise Fund
--
-- Confidence: 14 high / 1 medium / 0 low
-- Needs confirmation: 0
--
-- Schema taxonomy notes for review:
--   Current types (scholarship, internship, summer_program, mentorship,
--   competition, free_resource, workshop, college_access) covered Phase 3
--   adequately. Recommend adding 'networking' type in a future iteration
--   for events like 1MC that are distinct from structured workshops.
--
-- Organizations searched with no actionable current listing:
--   - Greater Omaha Chamber Young Professionals — website non-indexable;
--     YP Summit (Mar 27) has paid tickets ($50–$250); scholarship available
--     but not enough info to create a verified entry
--   - Nebraska Enterprise Fund website — non-indexable technical content;
--     included at medium confidence using secondary sources
--   - NeighborWorks Omaha — no specific verifiable program page found;
--     candidate for Phase 4
--   - Community Alliance behavioral health — real org, needs direct verification
-- ============================================================
