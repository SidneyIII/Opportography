-- ============================================================
-- Opportography — Migration 051
-- Phase 8D: Theater & Performing Arts Community Listings
-- Date: 2026-03-17
--
-- 6 entries: venues, classes, community theaters, open-access festivals
-- Focus on participation pathways — auditions, classes, volunteering
-- ============================================================

-- 1. Omaha Community Playhouse
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
  'Omaha Community Playhouse — Classes, Auditions & Productions',
  'Omaha Community Playhouse',
  'https://omahaplayhouse.com',
  'One of the largest community theaters in the United States — and it''s community, meaning the people on stage are regular people who auditioned. OCP runs full-season productions with open auditions plus the Fonda Theatre Academy offering adult classes in acting, improv, and stagecraft. If you want to be on stage or behind the scenes, this is the place to start.',
  'community',
  'Open to all. Auditions are free and open to community members. Classes have enrollment fees; some assistance available. Check omahaplayhouse.com for current audition and class schedule.',
  NULL,
  'https://omahaplayhouse.com',
  '6915 Cass St, Omaha, NE', '6915 Cass St', 'Omaha', 'NE', '68132',
  false, false,
  '{}', '{arts}', '{}',
  'high', 'needs_confirmation',
  'https://omahaplayhouse.com', 'official_website', '2026-03-17',
  'Classes: semester-based. Auditions: rolling per production. Box office: Tue–Sat 10am–6:30pm, Sun noon–4pm.',
  true, true, '2026-03-17', '2026-03-17',
  '{"subcategory": "theater_performing_arts", "passion_tags": ["theater", "acting", "stagecraft", "improv", "auditions", "community_theater", "playwriting", "backstage"], "listing_type": "venue_with_events", "accessibility": {"cost_barrier": "free", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);

-- 2. The Rose Theater
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
  'The Rose Theater — Performance Classes & Education Programs',
  'The Rose Theater',
  'https://rosetheater.org',
  'Primarily a youth performing arts center, The Rose offers acting, improv, and theater classes for teens and adults through their education programs at the W Center Rd studios. If you''re an adult curious about improv or stage work for the first time, check their current adult class schedule at rosetheater.org/education/classes/.',
  'community',
  'Classes have enrollment fees. Check rosetheater.org/education/classes/ for current adult and teen class availability and pricing.',
  NULL,
  'https://rosetheater.org/education/classes/',
  'The Rose Theater Studios, 12202 W Center Rd, Omaha, NE', '12202 W Center Rd', 'Omaha', 'NE', '68144',
  false, false,
  '{}', '{arts}', '{9,10,11,12,college_freshman}',
  'medium', 'needs_confirmation',
  'https://rosetheater.org/education/classes/', 'official_website', '2026-03-17',
  'Semester-based. Check rosetheater.org for current class schedule and enrollment. Main theater: 2001 Farnam St, Omaha.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "theater_performing_arts", "passion_tags": ["theater", "acting", "improv", "performance_classes", "youth_arts", "stagecraft", "sketch_comedy"], "listing_type": "class_or_workshop", "accessibility": {"cost_barrier": "moderate", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);

-- 3. BLUEBARN Theatre
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
  'BLUEBARN Theatre — Auditions & Community Engagement',
  'BLUEBARN Theatre',
  'https://bluebarn.org',
  'A 37-season professional non-Equity theater near 10th and Pacific doing contemporary, adventurous work and holding open auditions throughout the year. Casting is committed to countering all forms of discrimination. If you''re a serious adult performer looking for quality auditions in Omaha, BLUEBARN is one of the city''s most respected stages.',
  'community',
  'Auditions open to adults. Check bluebarn.org/auditions/ for current production listings and audition dates. Free to audition.',
  NULL,
  'https://bluebarn.org/auditions/',
  '1106 S 10th St, Omaha, NE', '1106 S 10th St', 'Omaha', 'NE', '68108',
  false, false,
  '{}', '{arts}', '{}',
  'high', 'needs_confirmation',
  'https://bluebarn.org', 'official_website', '2026-03-17',
  'Auditions: rolling per production through the season. Season 37 running 2025–2026. Check bluebarn.org/auditions/ for upcoming dates.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "theater_performing_arts", "passion_tags": ["theater", "acting", "auditions", "contemporary_theater", "professional_theater", "directing"], "listing_type": "venue_with_events", "accessibility": {"cost_barrier": "free", "experience_required": "some", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);

-- 4. Florentine Players / Florence Community Theater
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
  'Florentine Players — North Omaha Community Theater (est. 1964)',
  'The Florentine Players',
  'https://florentineplayers.com',
  'North Omaha''s community theater since 1964, staging about 6 productions and events per year including comedies, melodramas, and an annual Battle of the Improv All-Stars in January. Small community theater energy — people become regulars over years. Open auditions for all productions.',
  'community',
  'Auditions open to the community. Ticket prices are low-cost community theater rates. Check florentineplayers.com for 2026 production schedule.',
  NULL,
  'https://florentineplayers.com',
  'Florence City Hall, 2864 State St, Omaha, NE', '2864 State St', 'Omaha', 'NE', '68112',
  false, false,
  '{}', '{arts}', '{}',
  'medium', 'needs_confirmation',
  'https://florentineplayers.com', 'official_website', '2026-03-17',
  'Approximately 6 productions/events per year. Battle of the Improv All-Stars (January), Melodrama (May), Comedy/Farce (August). Check florentineplayers.com for 2026 dates.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "theater_performing_arts", "passion_tags": ["theater", "acting", "improv", "community_theater", "melodrama", "comedy"], "listing_type": "club_or_organization", "accessibility": {"cost_barrier": "free", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);

-- 5. Omaha Fringe Festival
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
  'Omaha Fringe Festival — Open-Access Performance Festival',
  'Omaha Fringe Festival',
  'https://omahafringe.org',
  'An annual multi-venue performing arts festival in the Edinburgh Fringe tradition — uncensored, independent, and open to any performer willing to register. Audiences pick shows based on short descriptions; performers have complete creative freedom. August 2026. If you have a show idea and want to try it on a real Omaha audience, the Fringe is the accessible entry point.',
  'community',
  'Audience: individual show tickets (~$10–$15). Performers: registration fee to submit a show — check omahafringe.org for performer deadlines. Audience shows vary in age rating.',
  '2026-08-06',
  'https://omahafringe.org',
  'Multiple venues, Omaha, NE', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{}', '{arts}', '{}',
  'high', 'needs_confirmation',
  'https://omahafringe.org', 'official_website', '2026-03-17',
  'Annual. August 6–9, 2026. Held across multiple Omaha venues.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "theater_performing_arts", "passion_tags": ["theater", "performance_art", "comedy", "dance", "fringe_festival", "experimental_arts", "open_access_performance"], "listing_type": "annual_event", "accessibility": {"cost_barrier": "low_cost", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);

-- 6. Omaha Performing Arts Education (O-PA)
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
  'Omaha Performing Arts Education — Community Classes & Workshops',
  'Omaha Performing Arts',
  'https://o-pa.org/learn-engage/',
  'The education arm of O-PA offers classes, workshops, and camps in theater, dance, and music for all ages at the new Tenaska Center (opening Spring 2026). Financial aid is available through their Arts Access fund. Spring and summer 2026 enrollment is currently open — if cost has been a barrier to arts participation, the access programs are worth checking.',
  'community',
  'Open enrollment. Classes have fees. Arts Access financial aid available — apply at o-pa.org/learn-engage/arts-access/. All ages (programs divided by age group).',
  NULL,
  'https://o-pa.org/learn-engage/',
  'Omaha Performing Arts / Tenaska Center, Omaha, NE', '409 S 16th St', 'Omaha', 'NE', '68102',
  false, false,
  '{low_income}', '{arts}', '{}',
  'high', 'needs_confirmation',
  'https://o-pa.org/learn-engage/', 'official_website', '2026-03-17',
  'Semester-based. Spring/Summer 2026 enrollment open. Check o-pa.org/learn-engage/ for current schedule and Arts Access financial aid.',
  true, false, '2026-03-17', '2026-03-17',
  '{"subcategory": "theater_performing_arts", "passion_tags": ["theater", "dance", "music", "performance_classes", "arts_education", "broadway", "summer_camps"], "listing_type": "class_or_workshop", "accessibility": {"cost_barrier": "moderate", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": false}}'::jsonb
);
