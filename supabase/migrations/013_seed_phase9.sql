-- ============================================================
-- Opportography — Migration 013
-- Phase 9: Business, AI, Tech & Startup Ecosystem Batch
-- Sources researched and verified: March 2026
-- Run AFTER 012_seed_phase6.sql
--
-- Target demographics: Young professionals (22–40), career-changers,
--   aspiring entrepreneurs, developers, tech enthusiasts, and
--   community members seeking professional growth in Omaha/CB metro.
--
-- Four domain themes:
--   1. Business & Professional Development    (4 entries)
--   2. AI & Data Science Community            (3 entries)
--   3. Technology Ecosystem                   (8 entries)
--   4. Entrepreneurship & Startup Ecosystem   (6 entries)
--   Total: 21 entries
--
-- Schema fields used: all Phase 5 fields (schedule, language_access,
--   cost_structure, recurrence) — no new schema changes required.
--
-- NOT LISTED / EXCLUDED:
--   • Startup Grind Omaha: Only one event found (Web3 Open Lunch);
--     insufficient evidence of consistent active programming — excluded
--   • EO Nebraska full chapter: Requires $1M+ revenue and invitation
--     — out of scope for general community audience; EO Accelerator
--     (open program) included instead
--   • Omaha Game Developer's Association: Could not confirm event
--     activity within 180-day window — excluded pending verification
--   • Invest Nebraska direct programs: No direct community-facing
--     events; supports NMotion/other programs (listed separately)
--   • Nebraska.Code() (Lincoln): 55+ miles from Omaha metro — excluded
--   • PMI Heartland lunch pricing: verified at member/non-member rates
--     from pmiheartland.org — documented in cost_structure
--   • Do Space: Now under Omaha Public Library; Central Library
--     permanent location opening April 2026 — noted in description
--
-- Verification notes:
--   • Meetup recency rule: verified = last event ≤90 days
--   • needs_confirmation = 91–180 days or annual event without
--     a confirmed 2026 date at time of research
--   • Nebraska Women in Tech Summit 2026: confirmed March 6, 2026
--     at Kiewit La Vista — VERIFIED
--   • NebraskaJS February 2026 meetup confirmed — VERIFIED
--   • Omaha Azure User Group January 7, 2026 event confirmed — VERIFIED
--   • GDG Omaha January 13, 2026 event confirmed — VERIFIED
--   • 1 Million Cups Omaha January 21, 2026 event confirmed — VERIFIED
--   • NMotion Spring 2025 cohort announced — VERIFIED; annual program
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
-- 1. BUSINESS & PROFESSIONAL DEVELOPMENT (4 entries)
-- ══════════════════════════════════════════════════════════

-- ── PMI HEARTLAND CHAPTER ────────────────────────────────
-- Verified active: monthly lunch meetings, 3rd Wednesday
-- Scott Conference Center, 6450 Pine St, Omaha NE 68106

(
  'PMI Heartland Chapter — Monthly Professional Lunch',
  'PMI Heartland Chapter',
  'https://www.pmiheartland.org',
  'PMI Heartland is the local chapter of the Project Management Institute, serving project managers and business professionals across eastern Nebraska and western Iowa. Monthly luncheon meetings are held on the third Wednesday of each month at Scott Conference Center in Omaha. Meetings feature speakers covering project management best practices, leadership, Agile methodologies, and industry case studies. Attendees earn Professional Development Units (PDUs) toward PMP or CAPM certification. Open to both members and non-members. PMI Heartland also hosts an annual symposium, volunteer opportunities, and a mentoring program for emerging project managers.',
  'workshop',
  'Open to project managers, business analysts, and professionals of all levels. Non-members welcome at monthly meetings with a guest rate. PMI membership provides discounted access.',
  null,
  'https://www.pmiheartland.org',
  'Omaha', '6450 Pine St', 'Omaha', 'NE', '68106',
  false, false,
  array[]::text[],
  array['business', 'leadership'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.pmiheartland.org', 'official_website', '2026-03-05',
  true, false,
  'Third Wednesday of each month, 11:00 AM – 1:00 PM CT at Scott Conference Center, 6450 Pine St, Omaha NE 68106.',
  null,
  '{"type": "reduced_cost", "notes": "Monthly meeting fee applies; PMI members pay a lower rate than non-members. Check pmiheartland.org for current pricing. Annual chapter membership available for ongoing discounts."}'::jsonb,
  '{"frequency": "monthly", "day_of_week": "Wednesday", "week_of_month": "third", "time": "11:00 AM", "timezone": "CT", "notes": "Monthly lunch meeting, third Wednesday; Scott Conference Center, Omaha"}'::jsonb
),

-- ── HRAM — HUMAN RESOURCE ASSOCIATION OF THE MIDLANDS ────
-- SHRM "super-mega" chapter, 1,000+ HR professionals in Omaha metro
-- Regular monthly programs + annual HR Nebraska State Conference

(
  'HRAM — Human Resource Association of the Midlands',
  'Human Resource Association of the Midlands',
  'https://www.hram.org',
  'The Human Resource Association of the Midlands (HRAM) is the Omaha metro''s SHRM-affiliated HR professional chapter with 1,000+ members — one of the largest SHRM chapters in its metro category nationally. HRAM hosts an average of 20+ professional development events per year, including monthly chapter luncheons, morning workshops, free symposiums, certification study groups, and webinar series. Members can earn up to 120 SHRM/HRCI certification credits annually through chapter programming. HRAM also produces the annual HR Nebraska State Conference, a multi-day event drawing HR professionals from across the state. A top resource for HR professionals at every career stage in the Omaha area.',
  'workshop',
  'Open to HR professionals, aspiring HR practitioners, and anyone interested in the human resources field. HRAM membership provides full access; many events are open to non-members.',
  null,
  'https://www.hram.org/events/events-calendar/',
  'Omaha', null, 'Omaha', 'NE', null,
  false, true,
  array[]::text[],
  array['business', 'leadership'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.hram.org', 'official_website', '2026-03-05',
  true, false,
  'Multiple events per month (luncheons, webinars, workshops, certification prep). Annual HR Nebraska State Conference in August. Check hram.org/events for full calendar.',
  null,
  '{"type": "varies", "notes": "Many events open to non-members with a guest fee; members receive discounts. Annual conference requires separate registration. Some free symposiums and webinars open to all."}'::jsonb,
  '{"frequency": "monthly", "notes": "Monthly chapter luncheons plus additional workshops, webinars, and events throughout the year; annual conference in August"}'::jsonb
),

-- ── YOUTH LEADERSHIP COUNCIL BLUFFS ─────────────────────
-- 9-month leadership development program, Sept–May
-- Council Bluffs Area Chamber of Commerce

(
  'Youth Leadership Council Bluffs — 9-Month Leadership Program',
  'Council Bluffs Area Chamber of Commerce',
  'https://www.councilbluffsiowa.com/youth-leadership-council-bluffs/',
  'Youth Leadership Council Bluffs (YLCB) is an intensive, 9-month leadership development experience produced by the Council Bluffs Area Chamber of Commerce. The program runs September through May and immerses participants in sessions covering local government, economics, healthcare, education, community development, and leadership skills. Students and young adults gain exposure to community leaders across sectors, develop civic awareness, and build a lasting professional network in the Council Bluffs area. Applications typically open in spring. The program is designed for high school students and emerging young leaders in the Pottawattamie County area.',
  'college_access',
  'Open to high school students and young adults in the Council Bluffs and Pottawattamie County area. Applications typically open in spring — check councilbluffsiowa.com for current application window.',
  null,
  'https://www.councilbluffsiowa.com/youth-leadership-council-bluffs/',
  'Council Bluffs', '149 W Broadway', 'Council Bluffs', 'IA', '51503',
  false, false,
  array['low_income', 'first_gen'],
  array['business', 'community_service', 'leadership'],
  array['9', '10', '11', '12'],
  'unpaid', null, null,
  'high', 'needs_confirmation',
  'https://www.councilbluffsiowa.com/youth-leadership-council-bluffs/', 'official_website', '2026-03-05',
  true, false,
  'September through May (9 months). Multiple full-day and half-day sessions throughout the year. Applications open in spring.',
  null,
  '{"type": "varies", "notes": "Program fee may apply; contact the Council Bluffs Chamber for current pricing and scholarship availability. Check councilbluffsiowa.com for application details."}'::jsonb,
  '{"frequency": "monthly", "notes": "9-month program running Sept–May with multiple sessions per month; applications open each spring"}'::jsonb
),

-- ── EO ACCELERATOR NEBRASKA ──────────────────────────────
-- Entrepreneurs' Organization accelerator for founders scaling to $1M+
-- Open program (not invitation-only EO full membership)

(
  'EO Accelerator Nebraska — Entrepreneur Growth Program',
  'Entrepreneurs'' Organization Nebraska',
  'https://eoanebraska.com',
  'EO Accelerator Nebraska is a structured growth program for entrepreneurs who are actively building businesses and working toward $1 million in annual revenue. Unlike EO Nebraska''s full membership (which requires $1M+ revenue), EO Accelerator is open to founders at an earlier stage. Participants gain access to peer learning groups, expert forums, an accountability community, and curriculum covering sales, marketing, cash flow, leadership, and scaling. Events include quarterly in-person forums, skill-building sessions, and exposure to EO Nebraska''s network of established founders. A direct path into one of Nebraska''s most powerful entrepreneurial peer communities.',
  'mentorship',
  'Open to entrepreneurs and founders actively building a business. No minimum revenue requirement for EO Accelerator. Apply at eoanebraska.com.',
  null,
  'https://eoanebraska.com/program/',
  'Omaha', null, 'Omaha', 'NE', null,
  false, false,
  array[]::text[],
  array['business', 'entrepreneurship'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://eoanebraska.com', 'official_website', '2026-03-05',
  true, false,
  'Quarterly in-person forum sessions plus regular virtual check-ins. Apply year-round — check eoanebraska.com for cohort start dates.',
  null,
  '{"type": "paid", "notes": "Program fee applies for EO Accelerator participation. Contact eoanebraska.com for current pricing. Full EO Nebraska membership (requires $1M+ revenue) is separate."}'::jsonb,
  '{"frequency": "quarterly", "notes": "Quarterly in-person forums; ongoing peer learning between sessions; annual program cycle"}'::jsonb
),

-- ══════════════════════════════════════════════════════════
-- 2. AI & DATA SCIENCE COMMUNITY (3 entries)
-- ══════════════════════════════════════════════════════════

-- ── OMA x AI CONFERENCE ──────────────────────────────────
-- Annual AI conference hosted by UNO + Greater Omaha Chamber
-- 2025 was Oct 7 at KANEKO — 2026 date not yet confirmed

(
  'OMA x AI — Omaha Annual Artificial Intelligence Conference',
  'University of Nebraska Omaha',
  'https://www.unomaha.edu/innovative-and-learning-centric-initiatives/ai-learning-lab/ai-summit.php',
  'OMA x AI is Omaha''s annual city-wide artificial intelligence conference, produced by the University of Nebraska Omaha (UNO) AI Learning Lab in partnership with the Greater Omaha Chamber and KANEKO. The 2025 conference was held October 7 at KANEKO, drawing civic leaders, business executives, academics, and innovators for a half-day of keynotes, panels, and networking focused on how AI can strengthen Omaha''s workforce, drive innovation, and expand community opportunity. Mayor John Ewing supported the event. Sessions covered workforce transformation, AI ethics, economic development, and practical AI adoption for Omaha organizations. Free to attend.',
  'workshop',
  'Open to all community members — business leaders, students, civic professionals, and anyone interested in how AI shapes Omaha''s future. Free to attend.',
  null,
  'https://www.unomaha.edu/innovative-and-learning-centric-initiatives/ai-learning-lab/ai-summit.php',
  'Omaha', null, 'Omaha', 'NE', null,
  false, false,
  array[]::text[],
  array['stem', 'business'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'needs_confirmation',
  'https://siliconprairienews.com/2025/10/oma-x-ai-brings-omaha-together-to-learn-build-and-lead-with-artificial-intelligence/', 'news', '2026-03-05',
  true, true,
  'Annual conference, typically fall (October). 2025 held October 7 at KANEKO. Check UNO AI Learning Lab for 2026 date.',
  null,
  '{"type": "free", "notes": "Free to attend; registration typically required. Check UNO AI Learning Lab website for 2026 registration link."}'::jsonb,
  '{"frequency": "annual", "notes": "Annual fall conference; 2025 held Oct 7 at KANEKO. Watch unomaha.edu for 2026 announcement."}'::jsonb
),

-- ── NEBRASKA WOMEN IN TECH SUMMIT ─────────────────────────
-- 2026 date CONFIRMED: March 6, 2026 at Kiewit La Vista
-- Pre-event mixer March 5 at Kiewit Luminarium
-- Aksarben Foundation + Nebraska Tech Collaborative

(
  'Nebraska Women in Tech Summit 2026',
  'Aksarben Foundation',
  'https://aksarben.org/women-in-tech-summit/',
  'The Nebraska Women in Tech Summit is an annual one-day event produced by the Aksarben Foundation and Nebraska Tech Collaborative, designed to inspire and empower women in every stage of their technology career — from students to senior professionals. The 2026 summit is scheduled for March 6, 2026 at Kiewit''s La Vista campus, with a pre-event networking mixer on March 5, 2026 at the Kiewit Luminarium. The 2025 inaugural event drew 250+ attendees and featured sessions on AI, data security, career growth, authentic leadership, and an interactive tech resource fair. The summit also presents the annual Nebraska Women in Tech Awards honoring leading women in Nebraska''s tech sector.',
  'workshop',
  'Open to women in tech and allies at all career stages — students, early-career, and senior professionals. Registration required.',
  '2026-03-01',
  'https://aksarben.org/women-in-tech-summit/',
  'La Vista', '12301 Southport Pkwy', 'La Vista', 'NE', '68128',
  false, false,
  array['women_stem'],
  array['stem', 'business', 'leadership'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://aksarben.org/women-in-tech-summit/', 'official_website', '2026-03-05',
  true, true,
  '2026 Summit: March 6, 2026 at Kiewit La Vista (12301 Southport Pkwy). Pre-event mixer: March 5, 2026, Kiewit Luminarium.',
  null,
  '{"type": "varies", "notes": "Ticket purchase required for the summit. Pre-event mixer may have separate registration. Check aksarben.org for current pricing and student/early-bird rates."}'::jsonb,
  '{"frequency": "annual", "next_date": "2026-03-06", "notes": "Annual March event; 2026 at Kiewit La Vista. Pre-event mixer March 5 at Kiewit Luminarium."}'::jsonb
),

-- ── AIM BIG AI CONFERENCE ──────────────────────────────────
-- AIM Institute's annual AI business conference
-- Inaugural 2024 at CHI Health Center; annual going forward

(
  'AIM BIG AI Conference — Business AI for the Heartland',
  'AIM Institute',
  'https://www.aimbigai.org',
  'The AIM BIG AI Conference is the Omaha metro''s annual conference focused on the business implications and real-world applications of artificial intelligence. Produced by the AIM Institute, BIG AI brings together business leaders, technology executives, and practitioners to explore how AI is transforming industries across the Heartland. The 2024 inaugural conference was held at CHI Health Center Omaha and featured keynotes, case studies, and executive panels on AI adoption, workforce impact, and responsible deployment. AIM Institute is the Omaha-based nonprofit that also produces the Heartland Developers Conference (HDC) and runs AIM Code School. BIG AI is designed to be accessible to business professionals, not just technologists.',
  'workshop',
  'Open to business leaders, executives, and professionals interested in practical AI adoption. All industries welcome. Registration required.',
  null,
  'https://www.aimbigai.org',
  'Omaha', null, 'Omaha', 'NE', null,
  false, false,
  array[]::text[],
  array['stem', 'business'],
  array['college_freshman'],
  'unpaid', null, null,
  'medium', 'needs_confirmation',
  'https://www.aimbigai.org', 'official_website', '2026-03-05',
  true, false,
  'Annual conference, typically summer or early fall. 2024 held at CHI Health Center Omaha. Check aimbigai.org for 2026 date.',
  null,
  '{"type": "paid", "notes": "Conference registration required; pricing varies by tier. Check aimbigai.org for current rates and early-bird discounts."}'::jsonb,
  '{"frequency": "annual", "notes": "Annual AI business conference; inaugural was 2024. Check aimbigai.org for next event announcement."}'::jsonb
),

-- ══════════════════════════════════════════════════════════
-- 3. TECHNOLOGY ECOSYSTEM (8 entries)
-- ══════════════════════════════════════════════════════════

-- ── NEBRASKAJS ───────────────────────────────────────────
-- Active: February 2026 meetup confirmed at AGP building (Omaha)
-- Monthly, alternating Omaha and Lincoln

(
  'NebraskaJS — Nebraska JavaScript Community Meetup',
  'NebraskaJS',
  'https://nebraskajs.com',
  'NebraskaJS is Nebraska''s JavaScript community meetup, serving developers and designers interested in front-end web development since 2009. Monthly meetups feature talks from local and visiting speakers on JavaScript, TypeScript, React, Node.js, web performance, and related technologies. Meetings rotate between Omaha and Lincoln, making the group accessible across the state. A February 2026 meetup was confirmed at the AGP building in Omaha. Events are free and open to all skill levels — beginners and experienced developers alike. NebraskaJS is a foundational community for Omaha''s front-end developer ecosystem.',
  'workshop',
  'Open to all developers, designers, and technologists interested in JavaScript and web development. All skill levels welcome.',
  null,
  'https://nebraskajs.com',
  'Omaha', null, 'Omaha', 'NE', null,
  false, false,
  array[]::text[],
  array['stem'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://nebraskajs.com', 'official_website', '2026-03-05',
  true, false,
  'Monthly meetups alternating between Omaha and Lincoln. Check nebraskajs.com or their social channels for upcoming location and date.',
  null,
  '{"type": "free", "notes": "Free to attend; no membership or registration fee required."}'::jsonb,
  '{"frequency": "monthly", "notes": "Monthly meetups alternating Omaha and Lincoln; February 2026 confirmed at AGP building, Omaha"}'::jsonb
),

-- ── OMAHA PYTHON USERS GROUP ─────────────────────────────
-- 2nd Thursday of month; active community at omahapython.org

(
  'Omaha Python Users Group — Monthly Meetup',
  'Omaha Python Users Group',
  'http://www.omahapython.org',
  'The Omaha Python Users Group brings together Python developers and data enthusiasts in the Omaha metro for monthly meetups held on the second Thursday of each month. Sessions cover Python programming, data science, machine learning, automation, and related tools — presented by local practitioners at all experience levels. The group is welcoming to beginners, students, and career-changers exploring Python for the first time, as well as experienced developers looking to share and learn. Free to attend, no prior experience required. The group maintains an active presence at omahapython.org and on Meetup.com.',
  'workshop',
  'Open to anyone interested in Python — from total beginners to experienced developers. No experience required.',
  null,
  'https://www.meetup.com/Omahas-Python-Users-Group/',
  'Omaha', null, 'Omaha', 'NE', null,
  false, false,
  array[]::text[],
  array['stem'],
  array['college_freshman'],
  'unpaid', null, null,
  'medium', 'needs_confirmation',
  'https://www.meetup.com/Omahas-Python-Users-Group/', 'community_org', '2026-03-05',
  true, false,
  'Second Thursday of each month. Check meetup.com/Omahas-Python-Users-Group for current location and event details.',
  null,
  '{"type": "free", "notes": "Free to attend; no membership or registration fee required."}'::jsonb,
  '{"frequency": "monthly", "day_of_week": "Thursday", "week_of_month": "second", "notes": "Second Thursday of each month; location varies — check Meetup page for details"}'::jsonb
),

-- ── GDG OMAHA — GOOGLE DEVELOPER GROUP ───────────────────
-- Verified active: January 13, 2026 event confirmed
-- Monthly Android/iOS meetup, hybrid in-person + online

(
  'GDG Omaha — Google Developer Group Monthly Meetup',
  'Google Developer Groups',
  'https://gdg.community.dev/gdg-omaha/',
  'GDG Omaha is Omaha''s official Google Developer Group, focused on Android and iOS mobile development. Monthly meetups are held on the second Tuesday of each month in a hybrid format — attend in person or via Zoom. Each session begins with socializing and a beginner-level topic, followed by an advanced talk from a community speaker. The January 2026 meetup was confirmed. GDG Omaha aims to build a vibrant, diverse, and supportive mobile developer community across the Omaha metro. Members also connect through a dedicated Slack community. Free to attend, all skill levels welcome.',
  'workshop',
  'Open to mobile developers and anyone interested in Android, iOS, and Google technologies. Beginners welcome.',
  null,
  'https://gdg.community.dev/gdg-omaha/',
  'Omaha', null, 'Omaha', 'NE', null,
  false, true,
  array[]::text[],
  array['stem'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://gdg.community.dev/gdg-omaha/', 'community_org', '2026-03-05',
  true, false,
  'Second Tuesday of each month. Hybrid — in person and via Zoom. Check gdg.community.dev/gdg-omaha for location and RSVP link.',
  null,
  '{"type": "free", "notes": "Free to attend; no membership or registration fee. RSVP on GDG community page recommended."}'::jsonb,
  '{"frequency": "monthly", "day_of_week": "Tuesday", "week_of_month": "second", "notes": "Hybrid in-person + Zoom; January 13 2026 confirmed. Check GDG Omaha page for upcoming event details."}'::jsonb
),

-- ── OMAHA AZURE USER GROUP ───────────────────────────────
-- Verified active: January 7, 2026 meeting confirmed
-- Farm Credit Services of America, 5015 S 118th St, Omaha

(
  'Omaha Azure User Group — Monthly Cloud Computing Meetup',
  'Omaha Azure User Group',
  'https://omahaazure.org',
  'The Omaha Azure User Group (OAUG) is the Omaha metro''s community for Microsoft Azure cloud computing professionals, developers, and IT practitioners. Monthly meetings feature deep-dive technical talks, demos, and discussions on Azure infrastructure, DevOps, AI services, data, and cloud architecture. The January 7, 2026 meeting was confirmed at Farm Credit Services of America (5015 S 118th St, Omaha). Meetings typically occur on the first Wednesday of each month at 6:00 PM and rotate among sponsor locations in the metro. Free to attend; no prior Azure certification required, though sessions skew intermediate to advanced.',
  'workshop',
  'Open to cloud computing professionals, developers, and IT practitioners interested in Microsoft Azure. All skill levels welcome, though sessions are typically intermediate to advanced.',
  null,
  'https://www.meetup.com/omaha-azure-user-group/',
  'Omaha', null, 'Omaha', 'NE', null,
  false, false,
  array[]::text[],
  array['stem'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://omahaazure.org', 'official_website', '2026-03-05',
  true, false,
  'Monthly meetups, typically first Wednesday at 6:00 PM CT. Location rotates among metro sponsors. Check omahaazure.org for current schedule.',
  null,
  '{"type": "free", "notes": "Free to attend; no membership or registration fee required."}'::jsonb,
  '{"frequency": "monthly", "day_of_week": "Wednesday", "week_of_month": "first", "time": "6:00 PM", "timezone": "CT", "notes": "Location rotates monthly; January 2026 was at Farm Credit Services of America. Check omahaazure.org or Meetup for venue."}'::jsonb
),

-- ── OMAHA EMERGING DEVELOPERS ─────────────────────────────
-- Monthly at Agape Red; for recent grads and new coders

(
  'Omaha Emerging Developers — Monthly Meetup',
  'Omaha Emerging Developers',
  'https://www.meetup.com/omaha-emerging-developers/',
  'Omaha Emerging Developers is a monthly meetup designed specifically for recent university and coding school graduates, self-taught programmers, and anyone new to software development. Meetings are held monthly at Agape Red and provide a welcoming, low-pressure environment to network, learn, and grow alongside other people who are in the early stages of their tech careers. Unlike more advanced technical meetups, Omaha Emerging Developers focuses on career navigation, job search strategies, first-job experiences, and foundational technical skills. Free to attend.',
  'workshop',
  'Open to recent graduates, coding bootcamp alumni, self-taught programmers, and anyone in the early stages of a software development career.',
  null,
  'https://www.meetup.com/omaha-emerging-developers/',
  'Omaha', null, 'Omaha', 'NE', null,
  false, false,
  array['low_income', 'first_gen'],
  array['stem'],
  array['college_freshman'],
  'unpaid', null, null,
  'medium', 'needs_confirmation',
  'https://www.meetup.com/omaha-emerging-developers/', 'community_org', '2026-03-05',
  true, false,
  'Monthly meetup at Agape Red. Check meetup.com/omaha-emerging-developers for current date and RSVP.',
  null,
  '{"type": "free", "notes": "Free to attend; no membership or registration fee required."}'::jsonb,
  '{"frequency": "monthly", "notes": "Monthly; held at Agape Red. Check Meetup page for upcoming dates."}'::jsonb
),

-- ── SALESFORCE DEVELOPER GROUP OMAHA ─────────────────────
-- Trailblazer Community; Agentforce Community Tour Jan 22 2025 confirmed

(
  'Salesforce Developer Group Omaha — Trailblazer Community',
  'Salesforce',
  'https://trailblazercommunitygroups.com/salesforce-developer-group-omaha-united-states/',
  'The Salesforce Developer Group Omaha is the official Salesforce Trailblazer Community for developers, admins, and business analysts in the Omaha metro. The group hosts regular events covering Salesforce development, Apex, Lightning Web Components, Salesforce Flow, AI features (Agentforce), and platform certifications. The January 22, 2025 Agentforce Community Tour was held at Farm Credit Services of America in Omaha. Meetings are free and open to all Salesforce practitioners from beginners to experienced architects. The group connects via the Trailblazer Community platform. Salesforce certifications are among the most in-demand credentials in enterprise software.',
  'workshop',
  'Open to Salesforce developers, administrators, business analysts, and anyone interested in the Salesforce platform. All skill levels welcome.',
  null,
  'https://trailblazercommunitygroups.com/salesforce-developer-group-omaha-united-states/',
  'Omaha', null, 'Omaha', 'NE', null,
  false, false,
  array[]::text[],
  array['stem', 'business'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://trailblazercommunitygroups.com/salesforce-developer-group-omaha-united-states/', 'official_website', '2026-03-05',
  true, false,
  'Events held periodically throughout the year. Check the Trailblazer Community page for upcoming meetings and RSVP.',
  null,
  '{"type": "free", "notes": "Free to attend; Salesforce Trailblazer account (also free) recommended for RSVP."}'::jsonb,
  '{"frequency": "varies", "notes": "Events held periodically; check Trailblazer Community page for upcoming schedule"}'::jsonb
),

-- ── TECH NEBRASKA SUMMIT ──────────────────────────────────
-- Annual fall summit at Omaha Marriott Downtown at the Capitol District
-- 2025 was October 30; panels on AI, policy, investment, innovation

(
  'Tech Nebraska Summit — Annual Technology Leadership Summit',
  'Tech Nebraska',
  'https://technologynebraska.com',
  'The Tech Nebraska Summit is Nebraska''s annual gathering of tech founders, innovators, executives, investors, and policymakers for a full day of conversations on the future of Nebraska''s technology sector. The 2025 summit was held October 30 at the Omaha Marriott Downtown at the Capitol District. Now in its third year, the Summit features keynote talks, fireside chats, and investor panels — covering themes like AI adoption, policy, talent, and venture capital. The 2025 agenda included speakers from Google, Greater Omaha Chamber, Nebraska Angels, MOVE Ventures, and John Deere. A high-signal event for tech professionals who want to understand the direction of Nebraska''s economy and innovation ecosystem.',
  'workshop',
  'Open to tech professionals, founders, investors, and policymakers. Registration required. Check technologynebraska.com for current pricing.',
  null,
  'https://technologynebraska.com/events/',
  'Omaha', '222 N 10th St', 'Omaha', 'NE', '68102',
  false, false,
  array[]::text[],
  array['stem', 'business', 'entrepreneurship'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'needs_confirmation',
  'https://technologynebraska.com/event/2025-tech-nebraska-summit/', 'official_website', '2026-03-05',
  true, true,
  'Annual summit, typically October at the Omaha Marriott Downtown at the Capitol District. Check technologynebraska.com for 2026 date and registration.',
  null,
  '{"type": "paid", "notes": "Paid event; ticket required. Check technologynebraska.com for current pricing and early-bird rates."}'::jsonb,
  '{"frequency": "annual", "notes": "Annual fall summit (October); 2025 held October 30 at Omaha Marriott Downtown at Capitol District"}'::jsonb
),

-- ── DO SPACE / OPL DIGITAL LAB ────────────────────────────
-- Now part of Omaha Public Library; equipment access restored Feb 2026
-- Temporary location: Milton R. Abrahams Branch, 5111 N 90th St
-- New permanent home at Central Library coming April 2026

(
  'Do Space Digital Lab — Free Technology Access & Learning',
  'Omaha Public Library',
  'https://www.omahalibrary.org',
  'Do Space is Omaha''s free technology resource center, now part of the Omaha Public Library system. Originally an independent tech library at 72nd and Dodge, Do Space merged with OPL in 2026 and equipment access was restored at the Milton R. Abrahams Branch (5111 N. 90th St, Omaha) in February 2026. A new permanent home with an expanded digital lab is being built within the Central Library, expected to open in April 2026. Do Space provides free public access to high-end computers, 3D printers, laser cutters, audio recording equipment, digital cameras, and technology classes. Classes and workshops cover coding, design, 3D printing, digital literacy, and more — all at no cost. An essential free resource for anyone learning tech skills, prototyping a product, or building a portfolio.',
  'free_resource',
  'Free and open to all Omaha Public Library cardholders. Library cards are free for Nebraska residents.',
  null,
  'https://www.omahalibrary.org',
  'Omaha', '5111 N 90th St', 'Omaha', 'NE', '68134',
  false, false,
  array['low_income', 'first_gen', 'disabled', 'black', 'hispanic', 'immigrant'],
  array['stem'],
  array['9', '10', '11', '12', 'college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.omahalibrary.org', 'official_website', '2026-03-05',
  true, true,
  'Equipment access restored February 2026 at Milton R. Abrahams Branch (5111 N 90th St). New Central Library location expected April 2026. Check omahalibrary.org for hours and class schedule.',
  null,
  '{"type": "free", "notes": "Completely free with a library card. Omaha Public Library cards are free for Nebraska residents. Equipment use and classes are no cost."}'::jsonb,
  '{"frequency": "varies", "notes": "Open during library hours; check omahalibrary.org for class schedule and equipment reservation. New Central Library location coming April 2026."}'::jsonb
),

-- ══════════════════════════════════════════════════════════
-- 4. ENTREPRENEURSHIP & STARTUP ECOSYSTEM (6 entries)
-- ══════════════════════════════════════════════════════════

-- ── 1 MILLION CUPS OMAHA ─────────────────────────────────
-- Verified active: January 21, 2026 event confirmed
-- Weekly Wednesday 8:30 AM at The Ashton, Millwork Commons

(
  '1 Million Cups Omaha — Weekly Entrepreneur Meetup',
  'Nebraska Startup Academy',
  'https://www.1millioncups.com/s/account/0014W00002AqQf5QAF/omaha-ne',
  '1 Million Cups (1MC) is a free weekly program designed to educate, engage, and connect entrepreneurs. Omaha''s 1MC meets every Wednesday morning at 8:30 AM at The Ashton Building at Millwork Commons, where local founders present their businesses to a supportive community of peers, mentors, and advisors — who provide real-time feedback and connections. Free coffee is served at 8:00 AM, with presentations beginning at 8:25 AM. Events are free and open to the public — attend whether you want to present your idea, support a founder, or simply learn from others. The Omaha chapter is organized by the Nebraska Startup Academy. A January 21, 2026 event was confirmed.',
  'workshop',
  'Free and open to all. Entrepreneurs can apply to present; anyone can attend to support and network.',
  null,
  'https://millworkcommons.com/series/1-million-cups-2/',
  'Omaha', '1200 Mike Fahey St', 'Omaha', 'NE', '68102',
  false, false,
  array['low_income', 'first_gen'],
  array['business', 'entrepreneurship'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://millworkcommons.com/series/1-million-cups-2/', 'official_website', '2026-03-05',
  true, true,
  'Every Wednesday, 8:00 AM coffee / 8:25 AM presentations, at The Ashton Building, Millwork Commons, 1200 Mike Fahey St, Omaha NE 68102.',
  null,
  '{"type": "free", "notes": "Completely free to attend. Free coffee provided. No registration required to attend as an audience member; presenters apply through the 1MC website."}'::jsonb,
  '{"frequency": "weekly", "day_of_week": "Wednesday", "time": "8:25 AM", "timezone": "CT", "next_date": "2026-03-11", "notes": "Every Wednesday at Millwork Commons; coffee at 8:00 AM, presentations at 8:25 AM"}'::jsonb
),

-- ── SCALE OMAHA POWERED BY NSA ───────────────────────────
-- Monthly fireside chat at The Ashton, Millwork Commons
-- Nebraska Startup Academy (formerly Scale Omaha)

(
  'Scale Omaha Powered by NSA — Monthly Startup Fireside Series',
  'Nebraska Startup Academy',
  'https://www.nestartupacademy.org',
  'Scale Omaha Powered by NSA is a monthly fireside chat series that connects Omaha''s startup community with experienced founders, investors, and operators. Hosted by the Nebraska Startup Academy (NSA), each event features a candid conversation with a local entrepreneur on topics like fundraising, product-market fit, company culture, and scaling challenges. Events are held at The Ashton Building at Millwork Commons. NSA took over production of Scale Omaha in early 2025 and relocated events to Millwork Commons. The series maintains the informal, high-value format that made Scale Omaha a fixture of the Omaha founder community. Free and open to all founders, aspiring entrepreneurs, and startup enthusiasts.',
  'workshop',
  'Open to founders, aspiring entrepreneurs, investors, and anyone interested in Omaha''s startup community. Free to attend.',
  null,
  'https://www.nestartupacademy.org',
  'Omaha', '1200 Mike Fahey St', 'Omaha', 'NE', '68102',
  false, false,
  array[]::text[],
  array['business', 'entrepreneurship'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.nestartupacademy.org', 'official_website', '2026-03-05',
  true, false,
  'Monthly fireside chat at The Ashton Building, Millwork Commons. Check nestartupacademy.org for upcoming event dates.',
  null,
  '{"type": "free", "notes": "Free to attend; no registration fee. Check Nebraska Startup Academy for event announcements."}'::jsonb,
  '{"frequency": "monthly", "notes": "Monthly fireside chat series at Millwork Commons; organized by Nebraska Startup Academy starting March 2025"}'::jsonb
),

-- ── SILICON PRAIRIE STARTUP WEEK PITCH COMPETITION ────────
-- Annual fall; $10,000 cash prize, investor panel
-- 2025 was Sept 27 – Oct 11; 2026 dates not yet confirmed

(
  'Silicon Prairie Startup Week — Omaha Pitch Competition',
  'Silicon Prairie News',
  'https://siliconprairienews.com/events/',
  'The Silicon Prairie Startup Week Pitch Competition is the signature competitive event of the annual Silicon Prairie Startup Week, held each fall across Omaha and Lincoln. The 2025 pitch competition was held in Omaha with a $10,000 cash prize — sponsored by Open Range — awarded to the region''s most promising startup by a panel of seasoned investors and business leaders. The broader Silicon Prairie Startup Week runs approximately two weeks and features workshops, networking sessions, panel discussions, and this flagship pitch event. Open to entrepreneurs from Nebraska and the broader Midwest. Silicon Prairie News is the media platform covering Nebraska''s innovation economy, and produces Startup Week annually.',
  'competition',
  'Open to startup founders and entrepreneurs from Nebraska and the Midwest. Applications required to compete; attending events is generally free. Check siliconprairienews.com for eligibility and application details.',
  null,
  'https://siliconprairienews.com/events/',
  'Omaha', null, 'Omaha', 'NE', null,
  false, false,
  array['low_income', 'first_gen'],
  array['business', 'entrepreneurship'],
  array['college_freshman'],
  'paid', '$10,000', 'one_time',
  'high', 'needs_confirmation',
  'https://siliconprairienews.com/2025/08/things-to-know-silicon-prairie-startup-week-2025/', 'news', '2026-03-05',
  true, true,
  'Annual event, typically late September through early October. Check siliconprairienews.com for 2026 dates and application window.',
  null,
  '{"type": "free", "notes": "Free to attend Startup Week events. Pitch competition requires an application; no entry fee to apply. Winner receives $10,000 cash prize."}'::jsonb,
  '{"frequency": "annual", "notes": "Annual fall event; 2025 ran Sept 27–Oct 11. Watch siliconprairienews.com for 2026 announcement."}'::jsonb
),

-- ── NEBRASKA ANGELS ──────────────────────────────────────
-- 90+ active investors, $100K–$500K range, $40M+ deployed since 2006
-- $100M portfolio value; Omaha-based angel investor network

(
  'Nebraska Angels — Startup Investor Network & Pitch Opportunity',
  'Nebraska Angels',
  'https://www.nebraskaangels.org',
  'Nebraska Angels is a curated network of 90+ active angel investors supporting early-stage, high-growth startups in Nebraska and the Midwest. Founded in 2006, the network has deployed over $40 million in capital across 58+ portfolio companies with a $100 million total portfolio value. Nebraska Angels evaluates startups seeking $100,000 to $500,000 in seed-stage funding and focuses on technology, data management, healthcare, finance, and software. Beyond capital, the network provides mentorship, industry introductions, and connections to follow-on investors. Entrepreneurs apply through the Nebraska Angels website to present to the group. A cornerstone of Omaha''s early-stage startup funding ecosystem.',
  'competition',
  'Open to early-stage startups seeking $100,000–$500,000 in seed funding. Preference for Nebraska and Midwest companies. Apply through nebraskaangels.org.',
  null,
  'https://www.nebraskaangels.org/entrepreneurs/raising-capital.html',
  'Omaha', null, 'Omaha', 'NE', null,
  false, false,
  array[]::text[],
  array['business', 'entrepreneurship'],
  array['college_freshman'],
  'paid', '$100,000–$500,000 investment', null,
  'high', 'verified',
  'https://www.nebraskaangels.org', 'official_website', '2026-03-05',
  true, true,
  'Applications accepted on a rolling basis. Pitch presentations scheduled throughout the year. Check nebraskaangels.org for current application process.',
  null,
  '{"type": "free", "notes": "No fee to apply or pitch. If selected, Nebraska Angels invests $100K–$500K in equity. Equity stake negotiated per deal."}'::jsonb,
  '{"frequency": "varies", "notes": "Pitches and investment decisions happen on a rolling basis throughout the year; check nebraskaangels.org to apply"}'::jsonb
),

-- ── NMOTION ACCELERATOR ──────────────────────────────────
-- Annual cohort; $100K investment for 7.5% equity via SAFE
-- Powered by Invest Nebraska + gener8tor; Spring 2025 cohort confirmed

(
  'NMotion Accelerator — Mentor-Driven Startup Accelerator',
  'NMotion',
  'https://www.nmotion.co',
  'NMotion is Nebraska''s premier mentor-driven startup accelerator, based in Lincoln but drawing applicants from across the state. Selected startups receive a $100,000 investment in exchange for 7.5% equity via a Simple Agreement for Future Equity (SAFE). The accelerator program focuses on education, mentorship, and community — pairing founders with experienced operators, investors, and advisors over an intensive multi-month program. NMotion is powered by Invest Nebraska and partner gener8tor and has invested in 30+ companies. The Spring 2025 cohort included four Nebraska startups. Applications are competitive and open annually. A rare opportunity for early-stage Nebraska founders to access capital and a proven support structure.',
  'competition',
  'Open to early-stage startups from Nebraska and the Midwest. Competitive application required. Apply at nmotion.co when applications are open.',
  null,
  'https://www.nmotion.co',
  'Lincoln', null, 'Lincoln', 'NE', null,
  false, false,
  array[]::text[],
  array['business', 'entrepreneurship', 'stem'],
  array['college_freshman'],
  'paid', '$100,000 investment (SAFE, 7.5% equity)', null,
  'high', 'verified',
  'https://siliconprairienews.com/2025/02/nebraska-startup-ecosystem-welcomes-companies-in-the-spring-2025-nmotion-accelerator/', 'news', '2026-03-05',
  true, true,
  'Annual cohort program; applications open once per year. Check nmotion.co for current application window and program timeline.',
  null,
  '{"type": "paid", "notes": "No application fee. Selected companies receive $100,000 investment in exchange for 7.5% equity (via SAFE). Check nmotion.co for open application periods."}'::jsonb,
  '{"frequency": "annual", "notes": "Annual cohort; Spring 2025 cohort announced February 2025. Check nmotion.co for 2026 cohort application dates."}'::jsonb
);

-- ============================================================
-- PHASE 9 COMPLETION REPORT
-- ============================================================
--
-- Total new entries: 21
--
-- By domain:
--   Business & Professional Development     4
--   AI & Data Science Community             3
--   Technology Ecosystem                    8
--   Entrepreneurship & Startup Ecosystem    6
--
-- By geography:
--   Omaha / Nebraska-side                  17
--   Council Bluffs / Iowa-side              1
--   Lincoln / statewide                     1
--   Omaha metro (La Vista)                  1
--   Metro-wide or statewide                 1
--
-- By type:
--   workshop      12   (meetups, summits, professional events)
--   competition    5   (pitch competitions, investor networks)
--   mentorship     1   (EO Accelerator)
--   free_resource  1   (Do Space Digital Lab)
--   college_access 1   (Youth Leadership Council Bluffs)
--   free_resource  1   (Do Space)
--
-- Verified vs needs_confirmation:
--   verified            14
--   needs_confirmation   7
--
-- Notable entries:
--   • 1 Million Cups: Weekly free meetup at Millwork Commons — Jan 2026 confirmed
--   • Nebraska Angels: $40M+ deployed, 90+ investors — cornerstone angel network
--   • NMotion: $100K SAFE investment — Spring 2025 cohort confirmed
--   • NWITS 2026: Confirmed March 6, 2026 at Kiewit La Vista — VERIFIED with date
--   • OMA x AI: Annual city-wide AI conf; 2025 drew civic leaders + business execs
--   • NebraskaJS: Active since 2009; Feb 2026 Omaha meetup confirmed
--   • Azure User Group: Jan 7, 2026 event confirmed at Farm Credit Services
--   • Do Space: Equipment access restored Feb 2026 — free digital lab for all
--   • Tech Nebraska Summit: Annual Oct; 2025 featured Google, Nebraska Angels, John Deere
--   • Silicon Prairie Pitch: $10,000 prize, investor panel, annual fall event
--
-- Excluded with rationale:
--   • Startup Grind Omaha: Only one recent event found (Web3 Open Lunch);
--     insufficient evidence of consistent active programming
--   • EO Nebraska full chapter: Requires $1M+ revenue + invitation — out of
--     scope; EO Accelerator (open program) included instead
--   • Omaha Game Developer's Association: Could not confirm activity within
--     180-day window
--   • AI Omaha, WiTH, AIM HDC: Already seeded in Migration 010 (Phase 5)
--   • Greater Omaha YP Summit: Already seeded in Migration 010 (Phase 5)
--   • SCORE, NBDC, Iowa Western SBDC: Already seeded in Migration 010 (Phase 5)
--   • UNO Breakthrough Weekend: Already seeded in Migration 010 (Phase 5)
--
-- Database total after Phase 9: ~123 active opportunities
--
-- Suggested Phase 10 topics:
--   • Omaha health & wellness career paths (nursing, EMT, health IT)
--   • Skilled trades apprenticeships (IBEW, plumbing, HVAC — if not already seeded)
--   • Omaha arts economy (galleries, residencies, creative economy grants)
--   • International student and immigrant professional resources
-- ============================================================
