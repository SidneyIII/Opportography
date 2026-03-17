-- ============================================================
-- Opportography — Migration 052
-- Phase 8E: Comedy & Improv Community Listings
-- Date: 2026-03-17
--
-- 3 entries: nonprofit improv, active class venue, professional club
-- ============================================================

-- 1. Big Canvas Comedy / Blackstone Theater
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
  'Big Canvas Comedy — Improv Shows & Classes at Blackstone Theater',
  'Big Canvas Comedy (nonprofit)',
  'https://blackstonetheater.org',
  'Omaha''s nonprofit short-form improv company, performing every Friday at the Blackstone Theater — family show at 7pm, stand-up at 8:30pm — and music improv on the 3rd Saturday. Also runs 4-week rolling improv classes with a student showcase on the final Friday. The nonprofit structure means they''re building community, not just filling seats.',
  'community',
  'Shows: modest admission (check blackstonetheater.org). Classes: paid 4-week rolling enrollment, no experience required. Family shows all ages; stand-up 18+.',
  NULL,
  'https://blackstonetheater.org',
  'Blackstone Theater, 3624 Farnam St, Omaha, NE', '3624 Farnam St', 'Omaha', 'NE', '68131',
  false, false,
  '{}', '{arts}', '{}',
  'high', 'needs_confirmation',
  'https://blackstonetheater.org', 'official_website', '2026-03-17',
  'Shows: Fri 7pm (family improv) & 8:30pm (stand-up); 3rd Sat 7pm (music improv). Classes: 4-week rolling sessions, 7–9pm. Check blackstonetheater.org/classes/ for current enrollment.',
  true, true, '2026-03-17', '2026-03-17',
  '{"subcategory": "comedy_improv", "passion_tags": ["improv", "stand_up_comedy", "performance_classes", "sketch_comedy", "music_improv", "community_theater"], "listing_type": "venue_with_events", "accessibility": {"cost_barrier": "low_cost", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);

-- 2. Backline Comedy Theatre
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
  'Backline Comedy Theatre — Improv, Sketch & Stand-Up Classes',
  'Backline Comedy',
  'https://backlinecomedy.com',
  'Downtown Omaha''s most active comedy venue, with shows nearly every Thursday through Saturday covering improv, sketch, and stand-up. Also offers rolling classes in improv, sketch writing, and stand-up — this is where people in Omaha actually learn and perform comedy, not just watch it.',
  'community',
  'Shows: modest admission. Classes: paid, rolling schedule — check backlinecomedy.com/home/classes/. Most shows 18+.',
  NULL,
  'https://backlinecomedy.com',
  '1618 Harney St, Omaha, NE', '1618 Harney St', 'Omaha', 'NE', '68102',
  false, false,
  '{}', '{arts}', '{}',
  'high', 'needs_confirmation',
  'https://backlinecomedy.com', 'official_website', '2026-03-17',
  'Shows: Thu–Sat evenings. Classes: rolling schedule. Check backlinecomedy.com/home/classes/ for current class offerings and enrollment.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "comedy_improv", "passion_tags": ["improv", "stand_up_comedy", "sketch_comedy", "performance_classes", "open_mic", "comedy_writing"], "listing_type": "venue_with_events", "accessibility": {"cost_barrier": "low_cost", "experience_required": "none", "age_restriction": "18+", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);

-- 3. Funny Bone Comedy Club
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
  'Funny Bone Comedy Club — Professional Comedy Venue',
  'Funny Bone Comedy Club',
  'https://omaha.funnybone.com',
  'Omaha''s national-chain comedy club with a packed 2026 calendar of touring headliners. A professional watching experience rather than a community participation space — dinner, drinks, and comedy. 21+ due to the alcohol environment. Good for a night out; look elsewhere if your goal is to get on stage yourself.',
  'community',
  '21+ only (alcohol environment). Cover charge varies by performer; food/drink minimum may apply. See omaha.funnybone.com for current show calendar and pricing.',
  NULL,
  'https://omaha.funnybone.com',
  '710 N 114th St, Suite 210, Omaha, NE', '710 N 114th St, Suite 210', 'Omaha', 'NE', '68154',
  false, false,
  '{}', '{arts}', '{}',
  'high', 'needs_confirmation',
  'https://omaha.funnybone.com', 'official_website', '2026-03-17',
  'Regular shows Fri–Sat evenings; occasional weeknight shows. Check omaha.funnybone.com for current calendar. Verify current address before visiting.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "comedy_improv", "passion_tags": ["stand_up_comedy", "comedy_club", "live_entertainment", "touring_comics"], "listing_type": "venue_with_events", "accessibility": {"cost_barrier": "moderate", "experience_required": "none", "age_restriction": "21+", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);
