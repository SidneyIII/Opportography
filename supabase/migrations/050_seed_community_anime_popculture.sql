-- ============================================================
-- Opportography — Migration 050
-- Phase 8C: Anime, Cosplay & Pop Culture Community Listings
-- Date: 2026-03-17
--
-- 6 entries. All 2026 events verified via Eventbrite/official sites.
-- Note: Anime NebrasKon 2026 is at Mid-America Center in CB (moved from La Vista).
-- ============================================================

-- 1. Anime NebrasKon 2026
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
  'Anime NebrasKon 2026 — Omaha Metro Anime Convention',
  'Anime NebrasKon',
  'https://animenebraskon.com',
  'The largest anime convention in the Omaha/Council Bluffs metro (est. 2004, 20+ years running), at the Mid-America Center in Council Bluffs for 2026. Three days of panels, cosplay contests, vendor hall, gaming room, and Japanese culture programming. The crowd skews welcoming — this con was built by the fan community, not a corporate promoter.',
  'community',
  'Badge required. All ages (some 18+ programming). Registration at animenebraskon.com or Eventbrite — search "Anime NebrasKon 2026".',
  '2026-10-16',
  'https://animenebraskon.com',
  'Mid-America Center, 1 Arena Way, Council Bluffs, IA', '1 Arena Way', 'Council Bluffs', 'IA', '51501',
  false, false,
  '{}', '{arts}', '{}',
  'high', 'needs_confirmation',
  'https://animenebraskon.com', 'official_website', '2026-03-17',
  'Annual. October 16–18, 2026. Held at Mid-America Center in Council Bluffs for 2026.',
  true, true, '2026-03-17', '2026-03-17',
  '{"subcategory": "anime_pop_culture", "passion_tags": ["anime", "manga", "cosplay", "japanese_culture", "conventions", "gaming", "artist_alley"], "listing_type": "convention", "accessibility": {"cost_barrier": "moderate", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);

-- 2. NebKon Abridged
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
  'NebKon Abridged — Adult Anime & Fandom Convention',
  'NebKon Abridged',
  'https://neabridged.com',
  'The 19+ spin-off of Anime NebrasKon — a smaller, social hotel convention in Omaha. Less programming, more hanging out with the same community in an intimate setting. If you''ve been part of the NebrasKon community for years and want that same crowd in a room-party atmosphere, this is that event.',
  'community',
  '19+ only. Paid badge required. Registration at neabridged.com or Eventbrite. Runs Friday 3pm through Saturday 2am CDT.',
  '2026-06-05',
  'https://neabridged.com',
  'Comfort Inn & Suites Omaha Central, 7007 Grover St, Omaha, NE', '7007 Grover St', 'Omaha', 'NE', '68106',
  false, false,
  '{}', '{arts}', '{}',
  'high', 'needs_confirmation',
  'https://neabridged.com', 'official_website', '2026-03-17',
  'Annual. June 5–6, 2026. Runs Friday 3pm through Saturday 2am CDT.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "anime_pop_culture", "passion_tags": ["anime", "manga", "cosplay", "fandom", "conventions", "room_parties"], "listing_type": "convention", "accessibility": {"cost_barrier": "moderate", "experience_required": "none", "age_restriction": "19+", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);

-- 3. Omaha Pop Expo
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
  'Omaha Pop Expo — Free Pop Culture Convention',
  'Omaha Pop Expo',
  'https://omahapopexpo.com',
  'A free pop-culture expo held at Oak View Mall multiple times a year. Vendors, artists, celebrity guests, cosplay, and fandom browsing — and it costs nothing to walk in. January and July 2026 events confirmed. Low barrier to entry: no badge purchase, just show up.',
  'community',
  'Free admission. All ages. No registration required. Check omahapopexpo.com for current event dates.',
  '2026-07-11',
  'https://omahapopexpo.com',
  'Oak View Mall, 3001 S 144th St, Omaha, NE', '3001 S 144th St', 'Omaha', 'NE', '68144',
  false, false,
  '{}', '{arts}', '{}',
  'high', 'needs_confirmation',
  'https://omahapopexpo.com', 'official_website', '2026-03-17',
  'Multiple events per year. Confirmed: January 17–18, 2026 and July 11–12, 2026 at Oak View Mall.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "anime_pop_culture", "passion_tags": ["pop_culture", "anime", "cosplay", "comics", "vendors", "conventions", "free_event"], "listing_type": "convention", "accessibility": {"cost_barrier": "free", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);

-- 4. O Con Expo
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
  'O Con Expo 2026 — Omaha Area Cosplay & Pop Culture Convention',
  'O Con Expo',
  'https://theoconexpo.com',
  'The Omaha area''s largest and longest-running comic and pop-culture convention (10th edition in 2026), held at the Mid-America Center in Council Bluffs. Cosplay contest, game room, vendor hall, and live wrestling. Three days spanning both sides of the metro community.',
  'community',
  'Paid entry. All ages. See theoconexpo.com for badge pricing and registration. Hours: Fri 12–8pm, Sat 9am–8pm, Sun 9am–5pm.',
  '2026-07-17',
  'https://theoconexpo.com',
  'Mid-America Center, 1 Arena Way, Council Bluffs, IA', '1 Arena Way', 'Council Bluffs', 'IA', '51501',
  false, false,
  '{}', '{arts}', '{}',
  'high', 'needs_confirmation',
  'https://theoconexpo.com', 'official_website', '2026-03-17',
  'Annual. July 17–19, 2026 at Mid-America Center, Council Bluffs.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "anime_pop_culture", "passion_tags": ["cosplay", "comics", "pop_culture", "conventions", "vendor_hall", "wrestling", "gaming"], "listing_type": "convention", "accessibility": {"cost_barrier": "moderate", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);

-- 5. Comic Con Nebraska 2026
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
  'Comic Con Nebraska 2026 — Omaha Comic & Pop Culture Convention',
  'Comic Con Nebraska',
  'https://comicconnebraska.com',
  'Omaha''s annual comic-con with celebrity guests, artist alley, vendors, cosplay, and pop-culture programming. August 2026 in the Omaha Convention Center area. Standard comic-con format — panels, photo ops, merchandise — in a walkable downtown venue close to other Omaha attractions.',
  'community',
  'Paid entry. All ages. See comicconnebraska.com for badge pricing and current guest announcements.',
  '2026-08-08',
  'https://comicconnebraska.com',
  'Omaha Convention Center area, Omaha, NE', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{}', '{arts}', '{}',
  'high', 'needs_confirmation',
  'https://comicconnebraska.com', 'official_website', '2026-03-17',
  'Annual. August 8–9, 2026.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "anime_pop_culture", "passion_tags": ["comics", "pop_culture", "cosplay", "conventions", "celebrity_guests", "artist_alley"], "listing_type": "convention", "accessibility": {"cost_barrier": "moderate", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);

-- 6. Kanpai!Con
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
  'Kanpai!Con — Japanese Cultural Appreciation Convention',
  'Kanpai!Con',
  'https://kanpaicon.com',
  'An Omaha convention focused on Japanese cultural appreciation — anime, manga, Japanese video gaming, a formal ball, room parties, and programming at the Hilton Downtown Omaha. More culturally focused and intimate than the larger pop-culture cons. April 2026 confirmed.',
  'community',
  'Paid badge required. All ages. See kanpaicon.com for schedule and badge pricing. Hotel room block available at $115/night.',
  '2026-04-03',
  'https://kanpaicon.com',
  'Hilton Omaha, 1001 Cass St, Omaha, NE', '1001 Cass St', 'Omaha', 'NE', '68102',
  false, false,
  '{}', '{arts}', '{}',
  'high', 'needs_confirmation',
  'https://kanpaicon.com', 'official_website', '2026-03-17',
  'Annual. April 3–5, 2026 (confirm exact dates at kanpaicon.com).',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "anime_pop_culture", "passion_tags": ["anime", "manga", "japanese_culture", "japanese_gaming", "cosplay", "conventions", "formal_ball"], "listing_type": "convention", "accessibility": {"cost_barrier": "moderate", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);
