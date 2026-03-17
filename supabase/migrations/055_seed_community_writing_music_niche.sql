-- ============================================================
-- Opportography — Migration 055
-- Phase 8H: Writing, Music & Niche Interest Community Listings
-- Date: 2026-03-17
--
-- 4 entries: free writing workshop, music school, writers group, disc golf
-- Nebraska Writers Workshop (est. 1985) is free and fully verified.
-- ============================================================

-- 1. Nebraska Writers Workshop
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
  'Nebraska Writers Workshop — Free Weekly Writing Group (est. 1985)',
  'Nebraska Writers Workshop',
  'https://nebraskawritersworkshop.info',
  'A free, weekly writing workshop operating since 1985 with 50+ active Omaha-area members. Alternates between in-person at the Ralston Public Library (1st and 3rd Wednesdays) and Zoom (2nd and 4th Wednesdays). All genres, all experience levels — the only expectation is that you show up with work to share or feedback to offer.',
  'community',
  'Free. Open to adults of all experience levels. In-person location: Ralston Baright Public Library, 5555 S 77th St, Ralston. Zoom link provided on membership. No fee.',
  NULL,
  'https://nebraskawritersworkshop.info',
  'Ralston Baright Public Library / Zoom (hybrid)', '5555 S 77th St', 'Ralston', 'NE', '68127',
  false, true,
  '{}', '{arts}', '{}',
  'high', 'needs_confirmation',
  'https://nebraskawritersworkshop.info', 'official_website', '2026-03-17',
  '1st & 3rd Wed: in-person, 6–8pm at Ralston Baright Public Library. 2nd & 4th Wed: Zoom, 7pm.',
  true, true, '2026-03-17', '2026-03-17',
  '{"subcategory": "writing_literary", "passion_tags": ["creative_writing", "fiction", "poetry", "screenwriting", "workshops", "critique_groups", "literary_community"], "listing_type": "recurring_meetup", "accessibility": {"cost_barrier": "free", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": true}}'::jsonb
);

-- 2. Romance Authors of the Heartland
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
  'Romance Authors of the Heartland — Writers Group & Professional Community',
  'Romance Authors of the Heartland',
  'https://romanceauthorsoftheheartland.com',
  'An Omaha-based writers group for romance and women''s fiction, offering monthly online meetings, semi-annual in-person retreats, critique groups, and beta reader matching. Career-focused — not a casual book club. For writers taking the craft seriously who want community and professional development alongside it.',
  'community',
  'Membership dues required (check website for current rates). Monthly meetings online; semi-annual retreats in Omaha area. Adults.',
  NULL,
  'https://romanceauthorsoftheheartland.com',
  'Omaha metro (hybrid — online meetings + in-person retreats)', NULL, 'Omaha', 'NE', NULL,
  false, true,
  '{}', '{arts}', '{}',
  'medium', 'needs_confirmation',
  'https://romanceauthorsoftheheartland.com', 'official_website', '2026-03-17',
  'Monthly online meetings; semi-annual in-person retreats. Critique groups and beta reader matching for members.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "writing_literary", "passion_tags": ["creative_writing", "romance_fiction", "womens_fiction", "critique_groups", "beta_reading", "publishing"], "listing_type": "club_or_organization", "accessibility": {"cost_barrier": "paid_membership", "experience_required": "some", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": true}}'::jsonb
);

-- 3. Omaha Conservatory of Music
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
  'Omaha Conservatory of Music — Community Music Classes & Lessons',
  'Omaha Conservatory of Music (nonprofit)',
  'https://omahacm.org',
  'A nonprofit community music school at 70th and Cass offering private lessons, group classes, and ensembles for all ages. Awards $290,000+ in financial aid annually — cost doesn''t have to be the barrier. Adult programs include group classes and performance ensembles for non-majors and recreational musicians who just want to play.',
  'community',
  'Open enrollment. Tuition varies by program. Financial aid and scholarships available — apply at omahacm.org. All ages.',
  NULL,
  'https://omahacm.org',
  '7023 Cass St, Omaha, NE', '7023 Cass St', 'Omaha', 'NE', '68132',
  false, false,
  '{low_income}', '{arts}', '{}',
  'high', 'needs_confirmation',
  'https://omahacm.org', 'official_website', '2026-03-17',
  'Semester-based. Adult music classes ongoing. Financial aid available. Check omahacm.org/adult-music-classes/ for current offerings.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "music", "passion_tags": ["music_lessons", "music_classes", "instruments", "ensembles", "music_education", "performing_arts", "adult_music"], "listing_type": "class_or_workshop", "accessibility": {"cost_barrier": "moderate", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);

-- 4. Omaha Metro Disc Golf Association (OMDGA)
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
  'Omaha Metro Disc Golf Association — Weekly Leagues & Recreational Play',
  'Omaha Metro Disc Golf Association (nonprofit)',
  'https://omahadiscgolf.com',
  'The metro''s primary disc golf organization, running weekly leagues at Seymour Smith Park (Thursday Doubles) and Hummel Park (Tuesday nights). Open to all skill levels; small per-round entry fees fund player payouts. Council Bluffs has its own disc golf courses at Fairmount Park, making this one of the most CB-accessible outdoor recreational activities in the metro.',
  'community',
  'Open to all skill levels. Per-round entry fees apply for league play. No disc golf experience required — check omahadiscgolf.com or their Facebook page for current league info.',
  NULL,
  'https://omahadiscgolf.com',
  'Seymour Smith Park / Hummel Park, Omaha, NE (also Fairmount Park, Council Bluffs)', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{}', '{athletics}', '{}',
  'high', 'needs_confirmation',
  'https://omahadiscgolf.com', 'official_website', '2026-03-17',
  'Tuesdays at Hummel Park; Thursdays (Doubles) at Seymour Smith Park. Seasonal; weather-dependent. CB: Fairmount Park has local courses.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "collecting_niche", "passion_tags": ["disc_golf", "frisbee", "outdoor_sports", "park_sports", "leagues", "recreational_sports"], "listing_type": "recurring_meetup", "accessibility": {"cost_barrier": "low_cost", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);
