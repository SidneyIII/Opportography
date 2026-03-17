-- ============================================================
-- Opportography — Migration 056
-- Phase 8I: Science, Nature & Exploration Community Listings
-- Date: 2026-03-17
--
-- 3 entries: astronomy club, Audubon birding chapter, Fontenelle Forest
-- Audubon Society of Omaha confirmed active through 2025–2026 officer election.
-- Omaha Astronomical Society part of NASA Night Sky Network.
-- ============================================================

-- 1. Omaha Astronomical Society (OAS)
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
  'Omaha Astronomical Society — Monthly Meetings & Stargazing',
  'Omaha Astronomical Society (nonprofit)',
  'https://www.omahaastro.com',
  'The metro''s main astronomy club, meeting the first Friday of each month at UNO''s Durham Science Center in a hybrid format (in-person + Zoom). Part of the NASA Night Sky Network. Monthly meetings cover observing updates, equipment, and current space events — open to the public. Members receive the Stella newsletter with detailed observing schedules.',
  'community',
  'Monthly meetings open to the public. Membership available (check omahaastro.com for dues). All ages welcome.',
  NULL,
  'https://www.omahaastro.com',
  'Durham Science Center, UNO Campus, Omaha, NE', 'S 67th & Dodge St (Durham Science Center, Room 115)', 'Omaha', 'NE', '68182',
  false, true,
  '{}', '{stem}', '{}',
  'high', 'needs_confirmation',
  'https://www.omahaastro.com', 'official_website', '2026-03-17',
  'First Friday of each month, 7:30pm. Hybrid: in-person at UNO Durham Science Center + Zoom. Check omahaastro.com for holiday schedule exceptions.',
  true, true, '2026-03-17', '2026-03-17',
  '{"subcategory": "science_nature", "passion_tags": ["astronomy", "stargazing", "space", "telescopes", "astrophotography", "citizen_science", "nasa"], "listing_type": "club_or_organization", "accessibility": {"cost_barrier": "free", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);

-- 2. Audubon Society of Omaha
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
  'Audubon Society of Omaha — Birding Field Trips & Monthly Meetings',
  'Audubon Society of Omaha (local chapter)',
  'https://audubon-omaha.org',
  'The local Audubon chapter holds monthly general meetings (September–May) open to the public at no cost, plus monthly field trips within 50 miles of the metro. No birding experience needed — trips are led by experienced members and designed to welcome beginners. The Omaha metro sits on major migratory flyways, making this a genuinely productive place to watch birds.',
  'community',
  'Meetings and field trips free and open to the public. Annual membership available (dues support chapter activities). All ages welcome.',
  NULL,
  'https://audubon-omaha.org',
  'Omaha metro (meetings and field trips at various locations)', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{}', '{community_service}', '{}',
  'high', 'needs_confirmation',
  'https://audubon-omaha.org', 'official_website', '2026-03-17',
  'General meetings: monthly, September–May. Field trips: monthly, September–April (except December). Check audubon-omaha.org for locations.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "science_nature", "passion_tags": ["birdwatching", "birding", "nature", "wildlife", "conservation", "citizen_science", "field_trips", "ecology"], "listing_type": "club_or_organization", "accessibility": {"cost_barrier": "free", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);

-- 3. Fontenelle Forest Volunteer Program
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
  'Fontenelle Forest — Volunteer & Conservation Opportunities',
  'Fontenelle Forest (nonprofit nature reserve)',
  'https://fontenelleforest.org/volunteer/',
  'Fontenelle Forest in Bellevue accepts volunteers for land stewardship (trail maintenance, invasive species removal), raptor recovery, and nature education programs year-round. One of the most significant forested natural areas in the region. If you want to do hands-on conservation work rather than just donate, specific volunteer workdays are posted on their site.',
  'community',
  'Free to volunteer. Year-round opportunities. All ages; minors may need adult supervision for some roles. No prior experience required for most roles. Check fontenelleforest.org/volunteer/ for current workday listings.',
  NULL,
  'https://fontenelleforest.org/volunteer/',
  'Fontenelle Forest, 1111 Bellevue Blvd N, Bellevue, NE', '1111 Bellevue Blvd N', 'Bellevue', 'NE', '68005',
  false, false,
  '{}', '{community_service}', '{}',
  'high', 'needs_confirmation',
  'https://fontenelleforest.org/volunteer/', 'official_website', '2026-03-17',
  'Year-round volunteer opportunities. Specific workdays posted at fontenelleforest.org/volunteer/.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "science_nature", "passion_tags": ["conservation", "nature", "volunteering", "environmental_work", "trails", "ecology", "raptors", "land_stewardship"], "listing_type": "club_or_organization", "accessibility": {"cost_barrier": "free", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": false, "transit_accessible": false}}'::jsonb
);
