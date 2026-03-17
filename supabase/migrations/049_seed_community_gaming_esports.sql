-- ============================================================
-- Opportography — Migration 049
-- Phase 8B: Video Gaming & Esports Community Listings
-- Date: 2026-03-17
--
-- 2 entries. MAGE excluded — last confirmed event 2023, no 2025/2026
-- dates found. NETWAR 46.0 confirmed for March 2026.
-- ============================================================

-- 1. NETWAR LAN Event
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
  'NETWAR — LAN Party & Esports Tournament',
  'NETWAR (nonprofit)',
  'https://www.netwar.org',
  'One of the Midwest''s largest LAN parties, held twice yearly at College of Saint Mary. Bring your PC or console, pay the participant entry fee, and game for a weekend alongside hundreds of other players. All proceeds benefit Gamers Outreach, a charity that delivers gaming equipment to hospitalized children — NETWAR has raised $140,000+ for the cause. NETWAR 46.0 confirmed for spring 2026.',
  'community',
  'Participant tickets required; spectating is free. All ages welcome. See netwar.org for registration and equipment requirements.',
  '2026-03-06',
  'https://www.netwar.org',
  'College of Saint Mary, 7000 Mercy Rd, Omaha, NE', '7000 Mercy Rd', 'Omaha', 'NE', '68106',
  false, false,
  '{}', '{stem}', '{}',
  'high', 'needs_confirmation',
  'https://www.netwar.org', 'official_website', '2026-03-17',
  'Biannual (spring and fall). NETWAR 46.0: March 6–7, 2026. Second 2026 event TBD — check netwar.org.',
  true, true, '2026-03-17', '2026-03-17',
  '{"subcategory": "video_gaming", "passion_tags": ["lan_party", "esports", "gaming", "pc_gaming", "console_gaming", "charity_gaming", "tournaments"], "listing_type": "annual_event", "accessibility": {"cost_barrier": "low_cost", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);

-- 2. IWCC Esports
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
  'IWCC Esports — Competitive Collegiate Gaming Team',
  'Iowa Western Community College',
  'https://www.goreivers.com/sports/esports/index',
  'Iowa Western Community College''s competitive esports program at their Council Bluffs campus, with a 4x national championship record (NJCAAE) across Call of Duty, Mario Kart, and Super Smash Bros. If you''re enrolled at IWCC or considering it, this is a legitimate collegiate esports pathway — a nationally competing team, not a casual gaming club.',
  'community',
  'Must be an enrolled Iowa Western Community College student. Contact ialumbaugh@iwcc.edu for tryout information and season schedule.',
  NULL,
  'https://www.goreivers.com/sports/esports/index',
  'Iowa Western Community College, 2700 College Rd, Council Bluffs, IA', '2700 College Rd', 'Council Bluffs', 'IA', '51503',
  false, false,
  '{}', '{stem}', '{}',
  'high', 'needs_confirmation',
  'https://www.goreivers.com/sports/esports/index', 'official_website', '2026-03-17',
  'Competitive seasons align with the academic calendar. Contact program for tryout schedule. Instagram: @iwccesports.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "video_gaming", "passion_tags": ["esports", "competitive_gaming", "call_of_duty", "mario_kart", "smash_bros", "collegiate_esports"], "listing_type": "club_or_organization", "accessibility": {"cost_barrier": "free", "experience_required": "intermediate", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);
