-- ============================================================
-- Opportography — Migration 071
-- Phase 15I: Career Pathways — Software Engineering & Technical Careers
--             (NEW entries only — not duplicating Phases 5 & 9)
-- Date: 2026-03-18
--
-- 1 verified entry:
--   1. DC402 — Omaha Cybersecurity Meetup (DEF CON 402)
--
-- Dead ends researched and excluded:
--   - Year Up United Omaha: program is confirmed free and
--     nationally active (yearup.org) but no confirmed Omaha
--     site or Nebraska program location found; national program
--     with no local presence verified
--   - Per Scholas Omaha: not found in Nebraska — operates in
--     select major cities, Omaha not among confirmed sites
--   - LaunchCode Omaha: LaunchCode is a national nonprofit but
--     no confirmed Omaha chapter/presence found as of 2025-2026
--   - freeCodeCamp Omaha study group: local Meetup group found
--     but last activity could not be confirmed as current (2025)
--   - OWASP Omaha chapter: OWASP retiring Meetup platform as of
--     Jan 31, 2026; no current dedicated Omaha chapter page found
--     on new OWASP platform; DC402 is the active security community
--
-- Note: Tech field is thin relative to other fields due to Phase 5
-- and Phase 9 coverage. Flag for Phase 16 to find more entry-level
-- pathways (Year Up if/when Omaha site confirmed, etc.)
-- ============================================================

-- 1. DC402 — Omaha Cybersecurity & Hacker Meetup
INSERT INTO public.opportunities (
  title, organization, organization_website, description,
  type, eligibility, deadline, link,
  location, address, city, state, zip,
  is_remote, is_hybrid,
  identity_tags, category_tags, grade_levels,
  data_confidence, verification_status,
  source_url, source_type, source_retrieved_date,
  schedule, is_active, is_featured, date_added, last_verified,
  community_metadata
) VALUES (
  'DC402 — Omaha Cybersecurity & Hacker Meetup (Free, Monthly)',
  'DC402 / DEF CON 402',
  'https://dc402.org',
  'DC402 is Omaha''s local cybersecurity and ethical hacker community, affiliated with DEF CON — the world''s largest hacker conference. The group meets every second Tuesday of the month at DJ''s Dugout in the Miracle Hills area. Meetings are free, informal, and cover security topics, CTF (Capture the Flag) challenges, hardware hacking, IoT security, and other technical discussions. An active Slack channel supplements the monthly meetups. DC402 community members also co-organize Kernelcon, Omaha''s annual regional security conference. For anyone exploring careers in cybersecurity, penetration testing, security research, or IT security, DC402 is the free, welcoming, no-credential-required entry point into Omaha''s security community.',
  'community',
  'Free. Open to anyone interested in cybersecurity, hacking, and technology. No prior experience required. Visit dc402.org or follow @defcon402 for meeting details and Slack community link.',
  NULL,
  'https://dc402.org',
  'Omaha, NE (DJ''s Dugout, Miracle Hills area)', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen}', '{cybersecurity,software_engineering,technology,career_exploration,hacking,CTF,security,networking}', '{}',
  'high', 'verified',
  'https://cybersecurityomaha.com/community', 'official_website', '2026-03-18',
  'Monthly, every second Tuesday. Free admission. Community Slack is available for ongoing discussion.',
  true, true, '2026-03-18', '2026-03-18',
  '{"career_field": "software", "subcategory": "cybersecurity", "opportunity_type": "meetup", "cost_details": {"amount": 0, "cost_type": "free", "conditions": null, "waiver_available": false, "waiver_details": null}, "delivery": "in_person", "listing_type": "community_event", "accessibility": {"cost_barrier": "free", "requires_enrollment": false, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
);
