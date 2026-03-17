-- ============================================================
-- Opportography — Migration 048
-- Phase 8A: Tabletop Gaming Community Listings
-- Date: 2026-03-17
--
-- 7 entries: venues, conventions, online communities, teen programs
-- All verified active as of March 2026.
-- Data confidence: medium-high (verify schedules and pricing at URLs)
-- ============================================================

-- 1. Krypton Comics
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
  'Krypton Comics — TCG Events & Gaming Community',
  'Krypton Comics',
  'https://www.kryptoncomicsomaha.com',
  'Omaha''s oldest comic and game shop (est. 1993) runs TCG events nearly every weekday — Modern on Thursdays, Commander Parties on Fridays, Pokémon and Lorcana leagues through the week. Regulars know each other by name, but showing up as a new face isn''t unusual at a shop that has been around this long. Bring your deck or buy singles at the counter; someone will tell you what''s running tonight.',
  'community',
  'Open to all. Some tournaments require a paid entry fee. Bring your own deck or browse the shop''s singles inventory.',
  NULL,
  'https://www.kryptoncomicsomaha.com',
  '2809 S 125th Ave, Suite 378, Omaha, NE', '2809 S 125th Ave, Suite 378', 'Omaha', 'NE', '68144',
  false, false,
  '{}', '{}', '{}',
  'high', 'needs_confirmation',
  'https://www.kryptoncomicsomaha.com', 'official_website', '2026-03-17',
  'Mon: Pokémon League; Wed: Lorcana League 6pm; Thu: Modern 6:30pm ($11 entry); Fri: Commander Party 6pm; prerelease events on new set release weekends.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "tabletop_gaming", "passion_tags": ["magic_the_gathering", "pokemon_tcg", "lorcana", "commander", "trading_card_games", "comic_books"], "listing_type": "venue_with_events", "accessibility": {"cost_barrier": "low_cost", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);

-- 2. The Game Shoppe
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
  'The Game Shoppe — Board Games, Leagues & Open Gaming',
  'The Game Shoppe',
  'https://thegameshoppe.com',
  'Omaha''s flagship board game and hobby store hosts regular open gaming nights, leagues, and tournaments across a wide selection of games. Show up, ask to join a table, and regulars will teach whatever is being played. They also organize the Great Plains Game Festival Harvest Edition in Omaha each fall.',
  'community',
  'Open to all. Free open gaming nights; paid entry for select tournaments. Check thegameshoppe.com for current event schedule.',
  NULL,
  'https://thegameshoppe.com',
  '4014 N 144th St, Omaha, NE', '4014 N 144th St', 'Omaha', 'NE', '68116',
  false, false,
  '{}', '{}', '{}',
  'high', 'needs_confirmation',
  'https://thegameshoppe.com', 'official_website', '2026-03-17',
  'Multiple weekly gaming nights and leagues. Check thegameshoppe.com for current event calendar.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "tabletop_gaming", "passion_tags": ["board_games", "tabletop_gaming", "open_gaming", "tournaments", "hobby_games"], "listing_type": "venue_with_events", "accessibility": {"cost_barrier": "free", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);

-- 3. Nuke-Con 2026
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
  'Nuke-Con 2026 — Annual Gaming Convention (Council Bluffs)',
  'Nuke-Con',
  'https://www.nuke-con.com',
  'One of the Midwest''s longest-running gaming conventions (30+ years) held at the Mid-America Center — in Council Bluffs, right across the river. Three days of tabletop RPGs, board games, miniature wargaming, card games, and video games, run entirely by volunteers. Family-oriented and one of the most welcoming conventions in the region; the all-volunteer culture means everyone here genuinely loves this stuff.',
  'community',
  'Badge purchase required. All ages welcome. Pricing and registration at nuke-con.com. Also runs occasional one-day game days throughout the year.',
  '2026-10-02',
  'https://www.nuke-con.com',
  'Mid-America Center, 1 Arena Way, Council Bluffs, IA', '1 Arena Way', 'Council Bluffs', 'IA', '51501',
  false, false,
  '{}', '{}', '{}',
  'high', 'needs_confirmation',
  'https://www.nuke-con.com', 'official_website', '2026-03-17',
  'Annual. October 2–4, 2026. Also runs one-day game days throughout the year — check nuke-con.com.',
  true, true, '2026-03-17', '2026-03-17',
  '{"subcategory": "tabletop_gaming", "passion_tags": ["tabletop_rpg", "d_and_d", "board_games", "wargaming", "video_games", "card_games", "conventions"], "listing_type": "convention", "accessibility": {"cost_barrier": "low_cost", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);

-- 4. Teen D&D at Omaha ForUs
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
  'Teen D&D at Omaha ForUs',
  'Omaha ForUs',
  'https://www.omahaforus.org',
  'A free monthly tabletop RPG night at Omaha ForUs, the metro''s LGBTQ+ community center. Ages 13–19, all supplies provided, no experience needed. Third Thursday of every month at 5–7pm — if you''ve been curious about D&D but didn''t have a group to start with, this is that group.',
  'community',
  'Ages 13–19. LGBTQ+ focused; allies welcome. Free, all supplies provided. No experience required.',
  NULL,
  'https://www.omahaforus.org/events/teen-dungeons-and-dragons-1',
  'Omaha ForUs, 3337 N 107th St, Omaha, NE', '3337 N 107th St', 'Omaha', 'NE', '68134',
  false, false,
  '{lgbtq}', '{}', '{9,10,11,12,college_freshman}',
  'high', 'needs_confirmation',
  'https://www.omahaforus.org/events/teen-dungeons-and-dragons-1', 'official_website', '2026-03-17',
  '3rd Thursday of each month, 5:00–7:00 PM. Free; all supplies provided.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "tabletop_gaming", "passion_tags": ["d_and_d", "tabletop_rpg", "lgbtq_community", "teen_programming"], "listing_type": "recurring_meetup", "accessibility": {"cost_barrier": "free", "experience_required": "none", "age_restriction": "13+", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);

-- 5. Omaha Nebraska D&D Facebook Group
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
  'Omaha Nebraska D&D — Community Facebook Group',
  'Community-run (no formal organization)',
  NULL,
  'The Omaha metro''s largest D&D player community — a Facebook group where people post session listings, look for players and DMs, and ask beginner questions. This is where people in Omaha actually find each other to play. If you''re new to the area or just starting out, posting here is a reasonable first move.',
  'community',
  'Free. Facebook account required to join. Search "Omaha Nebraska D&D" on Facebook. Community skews 18+ by practice but has no formal restriction.',
  NULL,
  'https://www.facebook.com/groups/OmahaNebraskaDnD/',
  'Online (Omaha metro community)', NULL, 'Omaha', 'NE', NULL,
  true, false,
  '{}', '{}', '{}',
  'medium', 'needs_confirmation',
  'https://www.facebook.com/groups/OmahaNebraskaDnD/', 'community_org', '2026-03-17',
  'Ongoing. Member-organized sessions and player matchmaking posted continuously.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "tabletop_gaming", "passion_tags": ["d_and_d", "tabletop_rpg", "online_community", "player_matchmaking"], "listing_type": "online_community", "accessibility": {"cost_barrier": "free", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": true}}'::jsonb
);

-- 6. Great Plains Game Festival
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
  'Great Plains Game Festival — Board Gaming Convention',
  'Great Plains Gaming Project',
  'https://greatplainsgamingproject.com',
  'Nebraska''s flagship board gaming convention run by the nonprofit Great Plains Gaming Project. The main spring event is in Lincoln (April 10–12, 2026); a Harvest Edition runs in Omaha each fall. Open game library, publisher demos, and tournaments — the kind of event where you can show up solo and spend all day learning games you''ve never tried before.',
  'community',
  'Badge required for both events. All ages. Registration at tabletop.events — search "Great Plains Game Festival 2026". Omaha Harvest Edition dates to be announced.',
  '2026-04-10',
  'https://greatplainsgamingproject.com',
  'The Cornhusker Hotel, Lincoln, NE (main); Omaha, NE (Harvest Edition)', NULL, 'Lincoln', 'NE', NULL,
  false, false,
  '{}', '{}', '{}',
  'high', 'needs_confirmation',
  'https://tabletop.events/conventions/great-plains-game-festival-2026', 'official_website', '2026-03-17',
  'Annual. Main event: April 10–12, 2026 (Lincoln, NE). Harvest Edition: Fall 2026 (Omaha, dates TBD).',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "tabletop_gaming", "passion_tags": ["board_games", "tabletop_gaming", "conventions", "open_gaming", "publisher_demos"], "listing_type": "convention", "accessibility": {"cost_barrier": "low_cost", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);

-- 7. Omaha Gaming Convention
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
  'Omaha Gaming Convention — Board Game Convention',
  'Our Family Plays Games (OFPG) & Board Game Wagon (BGW)',
  'https://omahagamingcon.com',
  'A newer board game convention with a 1,500+ game lending library, organized by two established Omaha gaming community groups. Parking is covered for all attendees. Designed for people who want to show up and play without needing to own games or know in advance what they want to try.',
  'community',
  'Badge required. All ages. Pricing and registration at omahagamingcon.com.',
  '2026-07-10',
  'https://omahagamingcon.com',
  'EVEN Hotel Omaha Downtown', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{}', '{}', '{}',
  'high', 'needs_confirmation',
  'https://omahagamingcon.com', 'official_website', '2026-03-17',
  'Annual. July 10–12, 2026.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "tabletop_gaming", "passion_tags": ["board_games", "tabletop_gaming", "conventions", "open_gaming", "game_library"], "listing_type": "convention", "accessibility": {"cost_barrier": "low_cost", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);
