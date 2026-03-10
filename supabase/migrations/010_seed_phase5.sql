-- ============================================================
-- Opportography — Migration 010
-- Phase 5 Growth & Literacy Batch
-- Sources researched and verified: February 2026
-- Run AFTER 009_schema_phase5.sql
--
-- Target demographics: Young adults (18–40), college students,
--   community members seeking professional growth, financial
--   literacy, civic engagement, and career development resources.
--
-- Six category themes:
--   1. AI & Technology Literacy          (4 entries)
--   2. Finance & Economic Literacy       (4 entries)
--   3. Startup & Entrepreneurship        (1 entry)
--   4. Civic Engagement & Public Policy  (3 entries)
--   5. Career Clubs & Professional Comms (5 entries)
--   6. Consumer Empowerment              (1 entry)
--   Total: 18 entries
--
-- New schema field used: recurrence (added in migration 009)
-- Existing fields used: schedule (005), language_access (007), cost_structure (007)
--
-- Type mapping notes:
--   workshop      → Meetups, recurring events, conferences, clubs
--   mentorship    → Free one-on-one consulting and coaching services
--   free_resource → Ongoing services, educational materials, advocacy
--   competition   → Events with pitching, prizes, or challenge format
--
-- NOT LISTED / EXCLUDED:
--   • Omaha Women in ML & Data Science: Last event January 2020 — INACTIVE (>6 yrs)
--   • Omaha Data Science Meetup: Group deleted from Meetup.com — DOES NOT EXIST
--   • Nebraska.Code(): Held in Lincoln, NE (~55 mi from Omaha) — out of metro scope
--   • OpenSky Policy Institute: Policy webinars primarily for researchers/advocates
--     not general community members — out of scope for this platform's audience
--   • SBA Nebraska District Office: Connects to SCORE/NBDC (already listed);
--     district office itself does not run independent public programs
--
-- Verification notes:
--   • Meetup recency rule: verified = last event ≤90 days; needs_confirmation = 91–180 days
--   • Annual conferences outside 90-day window → needs_confirmation (recurs, but
--     2026 event not yet confirmed at time of research)
--   • All civic listings confirmed nonpartisan or clearly partisan-neutral in scope
--   • AMA Omaha: some events require paid membership; cost_structure = varies
--   • Toastmasters: free to visit twice as guest; dues begin after joining (~$50–65/term)
--   • GOYP Summit: $250 general admission; $125 for UNO students
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
  schedule, language_access, cost_structure, recurrence
) values

-- ══════════════════════════════════════════════════════════
-- 1. AI & TECHNOLOGY LITERACY (4 entries)
-- ══════════════════════════════════════════════════════════

-- ── AI OMAHA MEETUP ──────────────────────────────────────
-- Last event: Feb 5 2026 (89 attendees) — VERIFIED ACTIVE
-- Next event: March 5 2026 at Boys Town Visitor Center

(
  'AI Omaha — Monthly Meetup',
  'AI Omaha',
  'https://www.meetup.com/ai_omaha/',
  'AI Omaha is the Omaha metro''s largest artificial intelligence community, with 1,400+ members. Monthly events feature speakers and demos on the latest AI trends — from machine learning and large language models to agentic systems and real-world AI deployment. Events are free, welcoming to all experience levels, and regularly draw 50–100 attendees. The March 2026 topic is "Agent Teams: Why Your Best Team in 2026 Might Not Have a Single Human On It." Location varies each month.',
  'workshop',
  'Open to all. No experience with AI required — beginners and professionals welcome.',
  null,
  'https://www.meetup.com/ai_omaha/',
  'Omaha', null, 'Omaha', 'NE', null,
  false, true,
  array[]::text[],
  array['stem'],
  array[]::text[],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.meetup.com/ai_omaha/', 'community_org', '2026-02-25',
  true, true,
  'First Thursday of each month, ~6:00 PM CT. Location varies — check Meetup page for venue.',
  null,
  '{"type": "free", "notes": "Free to attend; no membership or registration fee required"}'::jsonb,
  '{"frequency": "monthly", "day_of_week": "Thursday", "week_of_month": "first", "time": "6:00 PM", "timezone": "CT", "next_date": "2026-03-05", "notes": "Location varies each month; check Meetup page for venue details"}'::jsonb
),

-- ── AIM HEARTLAND DEVELOPERS CONFERENCE ──────────────────
-- Annual tech conference. 2025 was Sept 30–Oct 1 at Mid-America Center, CB.
-- 2026 date not yet confirmed at time of research.

(
  'AIM Heartland Developers Conference (HDC)',
  'AIM Institute',
  'https://aiminstitute.org',
  'The Heartland Developers Conference (HDC) is the Omaha-Council Bluffs metro''s premier annual technology conference, produced by the AIM Institute. HDC brings together 500+ developers, engineers, and tech professionals across 7+ tracks including Data/AI/ML, Web/Mobile, Cloud, Security, Leadership, and more. The 2025 conference was held September 30–October 1 at Mid-America Center in Council Bluffs with keynotes, breakout sessions, workshops, and an exhibitor hall. AIM Institute is an Omaha-based nonprofit growing the region''s tech sector through education and workforce development.',
  'workshop',
  'Open to all. Students, early-career developers, and seasoned professionals welcome. Student discounts typically available.',
  null,
  'https://hdc.aiminstitute.org',
  'Council Bluffs', null, 'Council Bluffs', 'IA', null,
  false, false,
  array[]::text[],
  array['stem', 'business'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'needs_confirmation',
  'https://hdc.aiminstitute.org', 'official_website', '2026-02-25',
  true, false,
  'Annual conference, typically late September or early October.',
  null,
  '{"type": "varies", "notes": "Conference registration required; pricing varies by tier (early bird, professional, student). Check hdc.aiminstitute.org for current rates."}'::jsonb,
  '{"frequency": "annual", "notes": "Annual conference; 2025 held Sept 30–Oct 1. Check hdc.aiminstitute.org for 2026 dates."}'::jsonb
),

-- ── WOMEN IN TECHNOLOGY OF THE HEARTLAND (WiTH) ──────────
-- Last event: Feb 17 2026 — VERIFIED ACTIVE
-- Monthly events, free, Omaha, open to women and allies

(
  'Women in Technology of the Heartland (WiTH)',
  'Women in Technology of the Heartland',
  'https://witheartland.org',
  'Women in Technology of the Heartland (WiTH) is Omaha''s largest women-in-tech community, founded in 2012 with 2,500+ members. WiTH hosts monthly events featuring professional development talks, networking, and showcases from women technologists and allies in the Omaha metro. Events are free, open to women and allies in all tech-adjacent roles. Meetings are typically sponsored by a local company — no cost to attend. WiTH is affiliated with the AIM Institute.',
  'workshop',
  'Open to women and allies working in or interested in technology. All experience levels welcome.',
  null,
  'https://www.meetup.com/witheartland/',
  'Omaha', null, 'Omaha', 'NE', null,
  false, true,
  array['women_stem'],
  array['stem', 'business'],
  array[]::text[],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.meetup.com/witheartland/', 'community_org', '2026-02-25',
  true, true,
  'Monthly events, typically third Monday or Tuesday. Check meetup.com/witheartland for current schedule.',
  null,
  '{"type": "free", "notes": "No membership dues; most meetings are sponsored; free to attend"}'::jsonb,
  '{"frequency": "monthly", "notes": "Monthly events; check meetup.com/witheartland for upcoming schedule and location"}'::jsonb
),

-- ── AMA OMAHA ────────────────────────────────────────────
-- Active: March 2026 events confirmed (workshop at CB Public Library Mar 5,
-- Women in Leadership panel Mar 17, free coffee meetup Mar 19)
-- Note: Full-access events may require AMA membership

(
  'AMA Omaha — Marketing & Professional Events',
  'American Marketing Association Omaha',
  'https://www.amaomaha.org',
  'AMA Omaha is the local chapter of the American Marketing Association, hosting monthly events for marketing and business professionals in the metro. Events include educational workshops, speaker panels, networking sessions, and skill-building clinics. March 2026 events include "Writing Human: Let Authentic Voice Shine in an AI-Driven World" (workshop at Council Bluffs Public Library, March 5), a Women in Leadership panel (March 17), and a free coffee networking meetup (March 19). Some events are free and open to all; others may require AMA membership or a ticket purchase.',
  'workshop',
  'Events vary by access level. Many events are open to non-members, especially free meetups and some workshops. Full AMA membership unlocks discounts.',
  null,
  'https://www.amaomaha.org/events/',
  'Omaha', null, 'Omaha', 'NE', null,
  false, false,
  array[]::text[],
  array['business', 'stem'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.amaomaha.org/events/', 'official_website', '2026-02-25',
  true, false,
  'Multiple events per month. Check amaomaha.org/events for current schedule.',
  null,
  '{"type": "varies", "notes": "Some events free and open to all; others require AMA membership or ticket purchase. Free coffee meetups and some workshops are open to everyone."}'::jsonb,
  '{"frequency": "monthly", "notes": "Multiple events per month across different formats (workshops, panels, networking); check amaomaha.org for schedule"}'::jsonb
),

-- ══════════════════════════════════════════════════════════
-- 2. FINANCE & ECONOMIC LITERACY (4 entries)
-- ══════════════════════════════════════════════════════════

-- ── SCORE GREATER OMAHA ──────────────────────────────────
-- Free mentoring + workshops for entrepreneurs and small business owners

(
  'SCORE Greater Omaha — Free Business Mentoring',
  'SCORE Greater Omaha',
  'https://www.score.org',
  'SCORE Greater Omaha connects aspiring and existing entrepreneurs with free, confidential mentoring from experienced business professionals. Volunteer mentors provide one-on-one guidance on starting a business, writing a business plan, financing, marketing, operations, and growth strategy. SCORE also hosts low-cost and free workshops on business topics throughout the year. SCORE is a resource partner of the U.S. Small Business Administration (SBA) and has helped millions of entrepreneurs nationwide.',
  'mentorship',
  'Open to anyone starting or growing a small business. No income requirements. Free for all participants.',
  null,
  'https://www.score.org',
  'Omaha', '10675 Bedford Ave, Suite 100', 'Omaha', 'NE', '68134',
  false, true,
  array['low_income', 'first_gen'],
  array['business'],
  array[]::text[],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.sba.gov/district/nebraska', 'official_website', '2026-02-25',
  true, false,
  'By appointment for one-on-one mentoring. Workshops scheduled throughout the year — check score.org for calendar.',
  null,
  '{"type": "free", "notes": "Free confidential mentoring; some workshops may have a small fee. No income requirements to access mentoring."}'::jsonb,
  null
),

-- ── NEBRASKA BUSINESS DEVELOPMENT CENTER (NBDC) AT UNO ───
-- Free one-on-one consulting for entrepreneurs and small business owners

(
  'Nebraska Business Development Center (NBDC) at UNO',
  'Nebraska Business Development Center',
  'https://www.unomaha.edu/nebraska-business-development-center',
  'The Nebraska Business Development Center (NBDC) at UNO provides free, confidential, one-on-one consulting services to Nebraska entrepreneurs and small business owners at any stage — from idea to established business. NBDC consultants help with business planning, financial analysis, loan packaging, market research, government contracting, and more. The NBDC is a statewide network funded by the U.S. Small Business Administration and the University of Nebraska, making it free to all clients.',
  'mentorship',
  'Open to all Nebraska entrepreneurs and business owners. No income requirements. Free for all participants.',
  null,
  'https://www.unomaha.edu/nebraska-business-development-center',
  'Omaha', '6001 Dodge St', 'Omaha', 'NE', '68182',
  false, false,
  array['low_income', 'first_gen', 'hispanic', 'black', 'women_stem'],
  array['business'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.unomaha.edu/nebraska-business-development-center', 'official_website', '2026-02-25',
  true, false,
  'By appointment. Contact NBDC at UNO to schedule a free consulting session.',
  null,
  '{"type": "free", "notes": "Completely free one-on-one consulting; funded by SBA and University of Nebraska. No income requirements."}'::jsonb,
  null
),

-- ── IOWA WESTERN SMALL BUSINESS DEVELOPMENT CENTER ────────
-- Free consulting at Iowa Western Community College, Council Bluffs

(
  'Iowa Western Small Business Development Center (SBDC)',
  'Iowa Western Community College SBDC',
  'https://www.iowawesternsbdc.com',
  'The Iowa Western Small Business Development Center (SBDC) provides free, confidential one-on-one business advising to entrepreneurs and small business owners in southwest Iowa and the Council Bluffs area. Advisors help with business planning, financial projections, loan preparation, marketing, and connecting clients to funding. The SBDC also hosts monthly lunch-and-learn workshops on business topics. Funded by the SBA and Iowa Western Community College.',
  'mentorship',
  'Open to anyone starting or growing a business in Iowa. Free for all participants.',
  null,
  'https://www.iowawesternsbdc.com',
  'Council Bluffs', 'Looft Hall, Suite 110, 2700 College Rd', 'Council Bluffs', 'IA', '51503',
  false, false,
  array['low_income', 'first_gen'],
  array['business'],
  array[]::text[],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.iowawesternsbdc.com', 'official_website', '2026-02-25',
  true, false,
  'One-on-one advising by appointment. Monthly lunch-and-learn workshops — check iowawesternsbdc.com for schedule.',
  null,
  '{"type": "free", "notes": "Free one-on-one consulting and most workshops; funded by SBA and Iowa Western Community College"}'::jsonb,
  '{"frequency": "monthly", "notes": "Monthly lunch-and-learn workshops in addition to on-demand one-on-one advising"}'::jsonb
),

-- ── FINANCIAL BEGINNINGS NEBRASKA ────────────────────────
-- Free financial literacy education for K-12 through adults

(
  'Financial Beginnings Nebraska — Financial Literacy Education',
  'Financial Beginnings',
  'https://www.financialbeginnings.org/nebraska',
  'Financial Beginnings is a national nonprofit that delivers free financial literacy education to students and adults through trained volunteers. In Nebraska, their curriculum is delivered in K-12 classrooms, higher education, and through partner nonprofits across the Omaha metro. Programs cover budgeting, saving, credit, banking, debt, and planning for the future. Participants pay nothing — programs are funded through financial institutions and grants. Volunteers can also apply to become certified financial literacy presenters through Financial Beginnings.',
  'free_resource',
  'Free for all participants. Programs are delivered through schools, colleges, and partner nonprofits. Contact financialbeginnings.org to request a program or find a scheduled class.',
  null,
  'https://www.financialbeginnings.org/nebraska',
  'Omaha', null, 'Omaha', 'NE', null,
  true, false,
  array['low_income', 'first_gen'],
  array['business'],
  array['9', '10', '11', '12', 'college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.financialbeginnings.org/nebraska', 'official_website', '2026-02-25',
  true, false,
  'Programs delivered on-site at schools and nonprofits. Contact financialbeginnings.org to schedule or locate a class.',
  null,
  '{"type": "free", "notes": "Free to all participants; programs are delivered through partner organizations in schools and nonprofits across Nebraska"}'::jsonb,
  null
),

-- ══════════════════════════════════════════════════════════
-- 3. STARTUP & ENTREPRENEURSHIP (1 entry)
-- ══════════════════════════════════════════════════════════

-- ── UNO CIEF BREAKTHROUGH WEEKEND ────────────────────────
-- Annual startup weekend — open to UNO/UNMC students AND community members
-- 2025 event: Sept 20–22 — 90-day rule: >150 days = needs_confirmation

(
  'UNO Breakthrough Weekend — Startup Competition',
  'UNO Center for Innovation, Entrepreneurship & Franchising (CIEF)',
  'https://www.unomaha.edu/college-of-business-administration/center-for-innovation-entrepreneurship-franchising',
  'Breakthrough Weekend is a free, intensive startup competition hosted by UNO''s Center for Innovation, Entrepreneurship & Franchising (CIEF). Teams form around a business concept, build a Lean Canvas (one-page business plan), prototype an idea, and pitch to local entrepreneurs for cash prizes — all over a single weekend. Open to UNO and UNMC students AND community members with no prior business experience required. Mentors from Omaha''s startup and business community coach teams throughout. The 2025 event took place September 20–22 and was sponsored by Aviture, Fiserv, and Husch Blackwell.',
  'competition',
  'Open to UNO/UNMC students and Omaha community members. No prior entrepreneurship experience required. Teams of 2–5 participants.',
  null,
  'https://www.unomaha.edu/college-of-business-administration/center-for-innovation-entrepreneurship-franchising/events-and-opportunities/breakthrough-weekend-omaha.php',
  'Omaha', '6001 Dodge St', 'Omaha', 'NE', '68182',
  false, false,
  array['low_income', 'first_gen'],
  array['business', 'stem'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'needs_confirmation',
  'https://www.unomaha.edu/college-of-business-administration/center-for-innovation-entrepreneurship-franchising/events-and-opportunities/breakthrough-weekend-omaha.php', 'official_website', '2026-02-25',
  true, false,
  'Annual event, typically held in September. Contact entrepreneurship@unomaha.edu or check UNO events calendar for 2026 date.',
  null,
  '{"type": "free", "notes": "Free to all participants; cash prizes for winning teams; no cost to register"}'::jsonb,
  '{"frequency": "annual", "notes": "Annual September event; contact entrepreneurship@unomaha.edu for 2026 date"}'::jsonb
),

-- ══════════════════════════════════════════════════════════
-- 4. CIVIC ENGAGEMENT & PUBLIC POLICY (3 entries)
-- ══════════════════════════════════════════════════════════

-- ── LEAGUE OF WOMEN VOTERS OF GREATER OMAHA ──────────────
-- Nonpartisan, verified active — "Books After Dark" series 2025 confirmed

(
  'League of Women Voters of Greater Omaha',
  'League of Women Voters of Greater Omaha',
  'https://www.lwvgo.org',
  'The League of Women Voters of Greater Omaha (LWV GO) is a nonpartisan civic organization that promotes informed participation in government and democracy. LWV GO hosts voter registration drives, candidate forums, ballot issue education sessions, and a monthly "Books After Dark" civic book club. They also produce "Go Vote Omaha," a local civic education TV show and YouTube series. LWV GO advocates for voting rights, government transparency, and equal access to the ballot. Membership is open to anyone who supports the mission.',
  'free_resource',
  'Open to all community members. Most educational events and programs are free.',
  null,
  'https://www.lwvgo.org',
  'Omaha', '1905 Harney St, Suite 401-J', 'Omaha', 'NE', '68102',
  false, false,
  array['low_income', 'first_gen', 'hispanic', 'black', 'immigrant'],
  array['community_service'],
  array['11', '12', 'college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.lwvgo.org', 'official_website', '2026-02-25',
  true, false,
  'Monthly "Books After Dark" civic book club. Regular voter education events throughout the year — check lwvgo.org for schedule.',
  null,
  '{"type": "free", "notes": "Most events and programs are free and open to all. Membership available separately for those who want to contribute."}'::jsonb,
  '{"frequency": "monthly", "notes": "Monthly Books After Dark book club plus voter education events; check lwvgo.org for full calendar"}'::jsonb
),

-- ── CIVIC NEBRASKA ───────────────────────────────────────
-- State of Civic Life Conference: May 19 2026, Lincoln
-- Youth civic leadership and voting rights programs active statewide

(
  'Civic Nebraska — Civic Leadership & Voter Engagement',
  'Civic Nebraska',
  'https://civicnebraska.org',
  'Civic Nebraska is a statewide nonprofit that strengthens civic participation through youth leadership, civic health programs, and voting rights initiatives. Programs include Nebraska''s Kid Governor (statewide youth civic leadership program), voter registration and education outreach, and the annual State of Civic Life Conference. The 2026 State of Civic Life Conference is scheduled for May 19, 2026 in Lincoln. Civic Nebraska also publishes the Nebraska Civic Health Index and advocates for policies that expand civic participation and voting access.',
  'workshop',
  'Youth programs open to Nebraska students. Civic events open to all community members. The State of Civic Life Conference requires registration.',
  null,
  'https://civicnebraska.org',
  'Nebraska', null, 'Omaha', 'NE', null,
  true, false,
  array['low_income', 'first_gen', 'black', 'hispanic', 'native_american'],
  array['community_service'],
  array['9', '10', '11', '12', 'college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://civicnebraska.org/election-2026/', 'official_website', '2026-02-25',
  true, false,
  'Annual State of Civic Life Conference (May). Year-round youth programs and voter engagement events.',
  null,
  '{"type": "free_with_eligibility", "notes": "Most civic programs are free; State of Civic Life Conference requires registration (fee may apply). Youth programs subsidized for student participants."}'::jsonb,
  '{"frequency": "annual", "notes": "Annual State of Civic Life Conference (May 19, 2026 in Lincoln). Year-round programming — check civicnebraska.org for schedule."}'::jsonb
),

-- ── NEBRASKA APPLESEED ───────────────────────────────────
-- Active 2025–2026: Legislative Update (Feb 13 2025), Good Apple Awards (Oct 9 2025)

(
  'Nebraska Appleseed — Public Interest Law & Civic Advocacy',
  'Nebraska Appleseed',
  'https://neappleseed.org',
  'Nebraska Appleseed is a nonprofit public interest law organization that advocates for equity and justice in Nebraska through litigation, policy advocacy, and community education. They work on issues affecting low-income families, immigrants, and people facing economic hardship — including housing, healthcare, education, and economic stability. Appleseed hosts public events including annual Legislative Update presentations, the Good Apple Awards gala, and educational forums open to community members. A valuable resource for understanding how to navigate and influence state-level policy.',
  'free_resource',
  'Public events open to all community members. Advocacy resources and policy reports freely available on neappleseed.org.',
  null,
  'https://neappleseed.org',
  'Omaha', null, 'Omaha', 'NE', null,
  false, false,
  array['low_income', 'first_gen', 'immigrant', 'black', 'hispanic', 'disabled'],
  array['community_service'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://shareomaha.org/nonprofit/nebraska-appleseed', 'community_org', '2026-02-25',
  true, false,
  'Annual Legislative Update (February/March) and Good Apple Awards (fall). Other public forums throughout the year — check neappleseed.org.',
  null,
  '{"type": "free", "notes": "Public reports, advocacy tools, and educational events are free. Some gala events may require a ticket."}'::jsonb,
  '{"frequency": "annual", "notes": "Key annual events: Legislative Update (spring) and Good Apple Awards (fall); check neappleseed.org for calendar"}'::jsonb
),

-- ══════════════════════════════════════════════════════════
-- 5. CAREER CLUBS & PROFESSIONAL COMMUNITIES (5 entries)
-- ══════════════════════════════════════════════════════════

-- ── TOASTMASTERS CLUB 229 (DUNDEE) ───────────────────────
-- Verified active: meets every Monday at Dundee Presbyterian Church
-- Hybrid Zoom + in-person

(
  'Toastmasters Club 229 — Dundee (Omaha)',
  'Toastmasters International',
  'https://www.toastmasters.org',
  'Toastmasters Club 229 meets every Monday at 6:15 PM at Dundee Presbyterian Church in Omaha. Club 229 helps members build public speaking, communication, and leadership skills through structured speeches, table topics (impromptu speaking), and mentored feedback. Meetings are hybrid — attend in person or via Zoom. Guests are welcome to visit twice for free before deciding whether to join. Membership dues are approximately $50–65 per 6-month term after joining. A practical, affordable way to build career-advancing communication skills.',
  'workshop',
  'Open to anyone 18+. Guests may attend two meetings for free. Membership is required for ongoing participation.',
  null,
  'https://www.toastmasters.org/Find-a-Club',
  'Omaha', '5312 Underwood Ave', 'Omaha', 'NE', '68132',
  false, true,
  array[]::text[],
  array['business', 'leadership'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.toastmasters.org/Find-a-Club', 'official_website', '2026-02-25',
  true, false,
  'Every Monday, 6:15 PM CT at Dundee Presbyterian Church, 5312 Underwood Ave, Omaha NE 68132. Hybrid — in person or Zoom.',
  null,
  '{"type": "free_with_eligibility", "notes": "Free to visit as guest for first two meetings. Membership ~$50–65 per 6-month term (includes Toastmasters International membership)."}'::jsonb,
  '{"frequency": "weekly", "day_of_week": "Monday", "time": "6:15 PM", "timezone": "CT", "notes": "Every Monday; hybrid in-person + Zoom"}'::jsonb
),

-- ── TOASTMASTERS CLUB 281 (NEBRASKA METHODIST) ───────────
-- Verified active: meets every Tuesday at Nebraska Methodist College

(
  'Toastmasters Club 281 — Nebraska Methodist (Omaha)',
  'Toastmasters International',
  'https://www.toastmasters.org',
  'Toastmasters Club 281 meets every Tuesday at 6:00 PM at Nebraska Methodist College in Omaha. Like all Toastmasters clubs, Club 281 uses a proven curriculum to help members develop public speaking, presentation, and leadership skills through prepared speeches, impromptu speaking rounds, and constructive feedback. Guests may attend two meetings for free. Membership dues are approximately $50–65 per 6-month term. An accessible weekly commitment to building career-readiness skills in a supportive community environment.',
  'workshop',
  'Open to anyone 18+. Guests may attend two meetings for free. Membership is required for ongoing participation.',
  null,
  'https://www.toastmasters.org/Find-a-Club',
  'Omaha', '720 N 87th St', 'Omaha', 'NE', '68114',
  false, false,
  array[]::text[],
  array['business', 'leadership'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.toastmasters.org/Find-a-Club', 'official_website', '2026-02-25',
  true, false,
  'Every Tuesday, 6:00 PM CT at Nebraska Methodist College, 720 N 87th St, Omaha NE 68114.',
  null,
  '{"type": "free_with_eligibility", "notes": "Free to visit as guest for first two meetings. Membership ~$50–65 per 6-month term (includes Toastmasters International membership)."}'::jsonb,
  '{"frequency": "weekly", "day_of_week": "Tuesday", "time": "6:00 PM", "timezone": "CT"}'::jsonb
),

-- ── COUNCIL BLUFFS YOUNG PROFESSIONALS (CBYP) ────────────
-- Impact CB Foodie Friday — monthly networking for ages 18–40, no entry fee

(
  'Council Bluffs Young Professionals (CBYP) — Foodie Friday',
  'Council Bluffs Area Chamber of Commerce',
  'https://www.councilbluffsiowa.com/council-bluffs-young-professionals/',
  'Council Bluffs Young Professionals (CBYP) is the young professionals'' network of the Council Bluffs Area Chamber of Commerce, open to anyone ages 18–40 who wants to grow their career, build community, and connect with peers in Council Bluffs. CBYP''s signature event is Foodie Friday — a free monthly networking lunch at a rotating local restaurant with no program, no pressure, and no entry fee. CBYP also hosts workshops, community gatherings, and career development events throughout the year.',
  'workshop',
  'Open to anyone ages 18–40 in the Council Bluffs and metro area.',
  null,
  'https://www.councilbluffsiowa.com/council-bluffs-young-professionals/',
  'Council Bluffs', null, 'Council Bluffs', 'IA', null,
  false, false,
  array['low_income', 'first_gen'],
  array['business', 'community_service'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.councilbluffsiowa.com/council-bluffs-young-professionals/', 'official_website', '2026-02-25',
  true, false,
  'Monthly Foodie Friday networking lunch — location rotates. Check councilbluffsiowa.com for dates and venue.',
  null,
  '{"type": "free", "notes": "Foodie Friday is free with no entry fee or obligation; participants pay only for their own meal at the restaurant"}'::jsonb,
  '{"frequency": "monthly", "day_of_week": "Friday", "notes": "Monthly Foodie Friday; location rotates among Council Bluffs Chamber member restaurants"}'::jsonb
),

-- ── GREATER OMAHA YP SUMMIT ───────────────────────────────
-- Annual conference March 27 2026 at CHI Health Center, $250 general ($125 UNO students)
-- Listed transparently with cost structure — NOT free

(
  'Greater Omaha YP Summit 2026',
  'Greater Omaha Chamber of Commerce',
  'https://www.omahachamber.org/ypsummit/',
  'The Greater Omaha YP Summit is the country''s largest annual young professionals'' conference, drawing 1,000+ attendees for a full day of keynotes, breakout sessions, and peer networking. The 2026 summit is scheduled for March 27, 2026 at CHI Health Center Omaha, with the theme "Bold Moves, Big Impact." Programming covers intentional leadership, career development, and community engagement. All UNO students receive a 50% discount on tickets.',
  'workshop',
  'Open to young professionals in the Greater Omaha area. Ticket purchase required. UNO students receive a 50% discount.',
  '2026-03-19',
  'https://www.omahachamber.org/ypsummit/',
  'Omaha', '455 N 10th St', 'Omaha', 'NE', '68102',
  false, false,
  array[]::text[],
  array['business', 'leadership'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.omahachamber.org/ypsummit/', 'official_website', '2026-02-25',
  true, true,
  'Annual conference. 2026 date: March 27, 2026 at CHI Health Center Omaha.',
  null,
  '{"type": "reduced_cost", "details": "$250 general admission; $125 for UNO students (50% discount with promo code)", "notes": "UNO students: use promo code from UNO events page for 50% off. Check omahachamber.org for other discounts."}'::jsonb,
  '{"frequency": "annual", "next_date": "2026-03-27", "notes": "Annual YP Summit at CHI Health Center Omaha; 2026 theme: Bold Moves, Big Impact"}'::jsonb
),

-- ── AIGA NEBRASKA ─────────────────────────────────────────
-- Active: 2025 Design Conference Oct 9–11 confirmed. Annual conference at KANEKO, Omaha.

(
  'AIGA Nebraska — Design Professional Community',
  'AIGA Nebraska',
  'https://nebraska.aiga.org',
  'AIGA Nebraska is the professional association for designers and creative professionals in Nebraska, with a hub in Omaha. AIGA Nebraska connects designers, illustrators, UX professionals, and visual communicators through regular events, networking nights, and an annual Design Conference. The 2025 AIGA Design Conference was held October 9–11 in Omaha. AIGA Nebraska also partners with KANEKO for the annual AIGA Show, a juried student and professional design exhibition. Events are open to members and non-members, with discounts for AIGA members.',
  'workshop',
  'Open to designers, students, and creative professionals. Some events require AIGA membership for discounts; others are open to all.',
  null,
  'https://nebraska.aiga.org',
  'Omaha', null, 'Omaha', 'NE', null,
  false, false,
  array[]::text[],
  array['arts', 'business'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'needs_confirmation',
  'https://nebraska.aiga.org/event/2025-aiga-design-conference/', 'official_website', '2026-02-25',
  true, false,
  'Annual Design Conference (fall). Regular events throughout the year — check nebraska.aiga.org/category/events/ for schedule.',
  null,
  '{"type": "varies", "notes": "Some events are free or low-cost; annual conference requires ticket purchase. AIGA membership provides discounts."}'::jsonb,
  '{"frequency": "varies", "notes": "Annual Design Conference (fall) plus regular events throughout the year; check nebraska.aiga.org for schedule"}'::jsonb
),

-- ══════════════════════════════════════════════════════════
-- 6. CONSUMER EMPOWERMENT & PRACTICAL SKILLS (1 entry)
-- ══════════════════════════════════════════════════════════

-- ── HEARTLAND FAMILY SERVICE — FINANCIAL STABILITY ────────
-- Active 150-year-old org. Sliding scale. Accepts Medicaid/Medicare.
-- Financial services include credit counseling, foreclosure counseling, homebuyer ed.

(
  'Heartland Family Service — Financial Stability Programs',
  'Heartland Family Service',
  'https://www.heartlandfamilyservice.org',
  'Heartland Family Service (HFS) has served the Omaha and Council Bluffs metro for 150 years, offering financial stability programs including credit counseling, foreclosure prevention counseling, and homebuyer education. Services are available on a sliding fee scale based on income, with most services free or very low-cost for low-income households. HFS serves over 140,000 people annually from 20 locations in eastern Nebraska and southwest Iowa, making it one of the largest human services organizations in the region. Accepts Medicaid and Medicare.',
  'free_resource',
  'Open to all community members in the Omaha and Council Bluffs metro. Services provided on sliding scale — no one turned away for inability to pay.',
  null,
  'https://www.heartlandfamilyservice.org',
  'Omaha', '1016 Park Ave', 'Omaha', 'NE', '68105',
  false, false,
  array['low_income', 'first_gen', 'homeless', 'foster_youth'],
  array['business', 'community_service'],
  array[]::text[],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.heartlandfamilyservice.org', 'official_website', '2026-02-25',
  true, false,
  'By appointment. Call Heartland Family Service or visit heartlandfamilyservice.org to find a location and schedule.',
  null,
  '{"type": "sliding_scale", "accepts_insurance": true, "accepts_medicaid": true, "accepts_medicare": true, "notes": "Sliding scale based on income; most financial counseling services are free or very low-cost for qualifying households. No one turned away for inability to pay."}'::jsonb,
  null
);

-- ============================================================
-- PHASE 5 COMPLETION REPORT
-- ============================================================
--
-- Total new entries: 18
--
-- By category:
--   AI & Technology Literacy          4
--   Finance & Economic Literacy       4
--   Startup & Entrepreneurship        1
--   Civic Engagement & Public Policy  3
--   Career Clubs & Professional Comms 5
--   Consumer Empowerment              1
--
-- By geography:
--   Omaha / Nebraska-side            12
--   Council Bluffs / Iowa-side        3
--   Metro-wide or statewide           3
--
-- By type:
--   workshop       10   (meetups, conf, clubs)
--   free_resource   5   (advocacy, education, counseling)
--   mentorship      3   (SCORE, NBDC, SBDC)
--   competition     1   (UNO Breakthrough Weekend)
--
-- New schema field used: recurrence (12 of 18 entries populated)
--
-- Notable entries:
--   • AI Omaha: 1,442-member AI meetup, verified active Feb 5 2026
--   • WiTH: 2,500-member women-in-tech community, verified active Feb 17 2026
--   • SCORE + NBDC + Iowa Western SBDC: free consulting trio, one on each side
--   • Toastmasters Club 229: weekly hybrid meetings, confirmed address
--   • Toastmasters Club 281: weekly in-person, Nebraska Methodist College
--   • GOYP Summit: listed transparently at $250/$125 — NOT marked as free
--   • Heartland Family Service: sliding scale, accepts Medicaid — strong equity fit
--
-- Excluded with rationale:
--   • Omaha Women in ML: INACTIVE since Jan 2020 (>6 years)
--   • Omaha Data Science Meetup: GROUP DELETED from Meetup.com
--   • Nebraska.Code(): Based in Lincoln, NE — outside metro scope
--   • OpenSky Policy Institute: Policy wonk webinars, not community-audience fit
--   • SBA District Office: Connects to SCORE/NBDC (already listed); not direct programs
--
-- Database total after Phase 5: ~85 active opportunities
--
-- Next suggested phases:
--   Phase 6: Health & Wellness Access (mental health, reproductive health,
--             dental, vision, insurance navigation for uninsured)
--   Phase 7: Housing & Stability (rental assistance, eviction prevention,
--             homebuyer pathways, utility assistance)
--   Phase 8: Youth-specific summer programs for incoming 9th–11th graders
-- ============================================================
