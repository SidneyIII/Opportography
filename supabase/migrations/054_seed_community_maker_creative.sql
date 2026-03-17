-- ============================================================
-- Opportography — Migration 054
-- Phase 8G: Creative Hobbies, Maker Culture & Niche Interest Listings
-- Date: 2026-03-17
--
-- 4 entries: makerspace, woodworking, gem/rock club, chess
-- ============================================================

-- 1. Omaha Maker Group
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
  'Omaha Maker Group — Community Makerspace',
  'Omaha Maker Group (nonprofit)',
  'https://omahamakergroup.org',
  'Omaha''s community makerspace at 8410 K St — 3D printers, laser cutters, electronics bench, woodworking tools, sewing machines, and more. Tuesday open houses (6–10pm) are free to check out before joining. Keyholder membership is $40/month for 24/7 access. If you want to make things you can''t make in an apartment, this is where the tools are.',
  'community',
  'Open houses: free. Keyholder membership: $40/mo individual, $50/mo family; $20/mo for non-keyholder access. All ages (minors with adult supervision).',
  NULL,
  'https://omahamakergroup.org',
  '8410 K St, Suite 5, Omaha, NE', '8410 K St, Suite 5', 'Omaha', 'NE', '68127',
  false, false,
  '{}', '{stem}', '{}',
  'high', 'needs_confirmation',
  'https://omahamakergroup.org', 'official_website', '2026-03-17',
  'Open House: Tuesdays 6pm–10pm (1st Tue: presentation; 3rd Tue: business meeting). Keyholder access 24/7.',
  true, true, '2026-03-17', '2026-03-17',
  '{"subcategory": "creative_maker", "passion_tags": ["making", "3d_printing", "laser_cutting", "electronics", "woodworking", "sewing", "fabrication", "tinkering", "makerspace"], "listing_type": "venue_with_events", "accessibility": {"cost_barrier": "low_cost", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);

-- 2. Bench Omaha
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
  'Bench Omaha — Woodworking Shop & Artisan Classes',
  'Bench Omaha',
  'https://benchomaha.com',
  'A public woodworking shop and artisan co-working space near downtown Omaha, founded in 2012. Offers monthly hands-on classes (including Intro to Woodworking) and open shop access for members. The kind of place where you can build furniture, learn a craft, or finish a project that requires real tools and real space.',
  'community',
  'Classes: paid enrollment. Open shop: membership or day pass. Check benchomaha.com for current offerings, class schedule, and pricing.',
  NULL,
  'https://benchomaha.com',
  '1441 N 11th St, Omaha, NE', '1441 N 11th St', 'Omaha', 'NE', '68102',
  false, false,
  '{}', '{stem}', '{}',
  'high', 'needs_confirmation',
  'https://benchomaha.com', 'official_website', '2026-03-17',
  'Monthly hands-on classes (including Intro to Woodworking). Open shop hours vary. Check benchomaha.com for current schedule.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "creative_maker", "passion_tags": ["woodworking", "making", "crafts", "fabrication", "artisan_skills", "tools", "furniture_making"], "listing_type": "class_or_workshop", "accessibility": {"cost_barrier": "moderate", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);

-- 3. Nebraska Mineral and Gem Club
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
  'Nebraska Mineral and Gem Club — Rock, Gem & Lapidary Community',
  'Nebraska Mineral and Gem Club, Inc.',
  'https://nerockgem.org',
  'One of Nebraska''s oldest rock and mineral clubs, operating since the 1950s. Monthly meetings feature lectures, rock and gem identification, cabochon cutting demonstrations, wire wrapping, and swap events. Annual gem and mineral show open to the public. Third Wednesday of the month at 7pm — show up as a guest before deciding to join.',
  'community',
  'Meetings open to guests. Annual membership dues are modest. All ages welcome.',
  NULL,
  'https://nerockgem.org',
  'Omaha, NE (meeting location — check nerockgem.org)', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{}', '{}', '{}',
  'high', 'needs_confirmation',
  'https://nerockgem.org', 'official_website', '2026-03-17',
  '3rd Wednesday of each month at 7pm (no meeting in June). Annual gem and mineral show open to the public. Check nerockgem.org for current meeting location.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "collecting_niche", "passion_tags": ["rocks", "minerals", "gems", "lapidary", "wire_wrapping", "collecting", "geology", "cabochon_cutting"], "listing_type": "club_or_organization", "accessibility": {"cost_barrier": "free", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);

-- 4. Jack Spence Chess Club
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
  'Jack Spence Chess Club — Weekly Over-the-Board Chess',
  'Jack Spence Chess Club',
  'https://spencechessclub.org',
  'Omaha''s main over-the-board chess club, meeting most Wednesday evenings for casual and rated play. US Chess membership required for rated events (approximately $20–$30/year depending on age). Bring your own board and clock if you have them; people share. All skill levels welcome.',
  'community',
  'US Chess membership required for rated events (~$20–$30/yr). Club attendance open. Check spencechessclub.org for current meeting location and schedule.',
  NULL,
  'https://spencechessclub.org',
  'Omaha, NE (verify current meeting location at spencechessclub.org)', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{}', '{}', '{}',
  'high', 'needs_confirmation',
  'https://spencechessclub.org', 'official_website', '2026-03-17',
  'Most Wednesday evenings, 7–10pm (doors close ~6:45pm). Verify current location at spencechessclub.org.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "collecting_niche", "passion_tags": ["chess", "strategy_games", "competitive_chess", "board_games", "rated_play"], "listing_type": "recurring_meetup", "accessibility": {"cost_barrier": "low_cost", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);
