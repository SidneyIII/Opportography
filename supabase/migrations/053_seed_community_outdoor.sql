-- ============================================================
-- Opportography — Migration 053
-- Phase 8F: Outdoor Exploration & Adventure Community Listings
-- Date: 2026-03-17
--
-- 5 entries. Prairie Bloom Cycling Club EXCLUDED — confirmed closed
-- end of 2024. MAGE excluded (see migration 049 notes).
-- Hitchcock Nature Center is specifically CB-area; featured accordingly.
-- ============================================================

-- 1. Nebraska Adventure Group (NAG)
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
  'Nebraska Adventure Group — Outdoor Activities for All Levels',
  'Nebraska Adventure Group (community Meetup group)',
  'https://www.meetup.com/NE-Adventurers/',
  'An Omaha-area Meetup group covering the full outdoor spectrum: day hiking, camping, backpacking, cycling, kayaking, rock climbing, and snow sports. Open to all abilities and experience levels — browse the Meetup page, find an activity that fits, and show up. Most events welcome solo attendees.',
  'community',
  'Free to browse Meetup. Meetup account required to RSVP (free or paid tier). Profile must have a clear headshot photo. Individual activity costs vary.',
  NULL,
  'https://www.meetup.com/NE-Adventurers/',
  'Omaha metro and surrounding region (various locations)', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{}', '{athletics}', '{}',
  'high', 'needs_confirmation',
  'https://www.meetup.com/NE-Adventurers/', 'community_org', '2026-03-17',
  'Ongoing. Member-organized outings posted on Meetup. Frequency varies by season and activity type.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "outdoor_exploration", "passion_tags": ["hiking", "camping", "backpacking", "cycling", "kayaking", "rock_climbing", "snow_sports", "outdoor_adventure", "social_outdoors"], "listing_type": "club_or_organization", "accessibility": {"cost_barrier": "free", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);

-- 2. Hikers of Omaha
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
  'Hikers of Omaha — Weekly Group Hikes',
  'Hikers of Omaha (Meetup group)',
  'https://www.meetup.com/hikers-of-omaha/',
  'A Meetup-based hiking group exploring trails and nature areas in and around Omaha, weekly when weather permits. Pace is moderate; people chat while they walk. Water and sturdy shoes are all you need — no equipment, no experience, no fitness test required.',
  'community',
  'Free. Meetup account required to RSVP. All ages welcome. No fitness requirements.',
  NULL,
  'https://www.meetup.com/hikers-of-omaha/',
  'Various trails and nature areas, Omaha metro', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{}', '{athletics}', '{}',
  'high', 'needs_confirmation',
  'https://www.meetup.com/hikers-of-omaha/', 'community_org', '2026-03-17',
  'Weekly hikes, weather permitting. Hike location varies each week. Check the Meetup page for upcoming events.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "outdoor_exploration", "passion_tags": ["hiking", "nature", "walking", "trails", "outdoor_social", "fitness"], "listing_type": "recurring_meetup", "accessibility": {"cost_barrier": "free", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);

-- 3. Omaha Running Club
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
  'Omaha Running Club — Community Running & the Omaha Marathon',
  'Omaha Running Club (nonprofit)',
  'https://omaharun.org',
  'Omaha''s primary nonprofit running community, hosting free Fun Runs at parks around the city throughout the year. All paces and distances welcome — these are group runs, not races. Also organizes the Omaha Marathon (September 27, 2026) for those wanting a structured race goal.',
  'community',
  'Fun Runs: free and open to all. Marathon: paid entry (see omaharun.org). All ages; all paces.',
  NULL,
  'https://omaharun.org',
  'Various parks and locations, Omaha metro', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{}', '{athletics}', '{}',
  'high', 'needs_confirmation',
  'https://omaharun.org', 'official_website', '2026-03-17',
  'Fun Runs: scattered throughout the year at various Omaha parks. Omaha Marathon: September 27, 2026.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "outdoor_exploration", "passion_tags": ["running", "marathon_training", "jogging", "fitness", "community_running", "5k", "road_racing"], "listing_type": "club_or_organization", "accessibility": {"cost_barrier": "free", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);

-- 4. Hitchcock Nature Center Volunteer Program (Council Bluffs area)
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
  'Hitchcock Nature Center — Volunteer Programs & HawkWatch',
  'Pottawattamie County Conservation',
  'https://www.pottconservation.com/parks/hitchcock_nature_center/',
  'A Pottawattamie County nature reserve in the Loess Hills, 10 miles west of Council Bluffs. Volunteer roles include the annual HawkWatch (September 1–December 13) counting migrating raptors — no birding experience required, training provided on-site. Also offers land stewardship, raptor recovery, and education volunteer opportunities year-round.',
  'community',
  'Free to volunteer. All ages; some roles may require adult supervision for minors. No experience required for most roles — training provided. Contact Pottawattamie County Conservation to get started.',
  NULL,
  'https://www.pottconservation.com/parks/hitchcock_nature_center/',
  'Hitchcock Nature Center, 27792 Ski Hill Loop, Honey Creek, IA', '27792 Ski Hill Loop', 'Honey Creek', 'IA', '51542',
  false, false,
  '{}', '{community_service}', '{}',
  'high', 'needs_confirmation',
  'https://www.pottconservation.com/parks/hitchcock_nature_center/', 'official_website', '2026-03-17',
  'HawkWatch: September 1–December 13 annually. Other volunteer roles: year-round. Workdays posted on Pottawattamie County Conservation website.',
  true, true, '2026-03-17', '2026-03-17',
  '{"subcategory": "outdoor_exploration", "passion_tags": ["birdwatching", "hawkwatch", "nature", "conservation", "volunteering", "hiking", "raptors", "citizen_science", "loess_hills"], "listing_type": "club_or_organization", "accessibility": {"cost_barrier": "free", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);

-- 5. Omaha Pedalers Bicycle Club
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
  'Omaha Pedalers Bicycle Club — Recreational Cycling',
  'Omaha Pedalers Bicycle Club (nonprofit)',
  'https://opbc.clubexpress.com',
  'An established recreational cycling club with a full-season calendar: Monday evening rides, Thursday morning Rusty Spokes rides, and weekend events including the Great American Pie Ride and Omaha Historical Tour. Not a racing club — the focus is recreational riding and community at all fitness levels.',
  'community',
  'Annual membership required. See opbc.clubexpress.com for membership pricing. All ages; all fitness levels welcome.',
  NULL,
  'https://opbc.clubexpress.com',
  'Various departure points, Omaha metro', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{}', '{athletics}', '{}',
  'high', 'needs_confirmation',
  'https://opbc.clubexpress.com', 'official_website', '2026-03-17',
  'Monday evenings; Thursday mornings (Rusty Spokes); seasonal weekend rides and special events. Annual membership required.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "outdoor_exploration", "passion_tags": ["cycling", "biking", "recreational_cycling", "group_rides", "fitness"], "listing_type": "club_or_organization", "accessibility": {"cost_barrier": "paid_membership", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);
