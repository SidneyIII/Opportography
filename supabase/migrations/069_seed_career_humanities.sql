-- ============================================================
-- Opportography — Migration 069
-- Phase 15G: Career Pathways — Humanities, Writing & Creative Careers
-- Date: 2026-03-18
--
-- 2 verified entries:
--   1. The Durham Museum — Volunteer Docent & Visitor Experience Program
--   2. Bemis Center for Contemporary Arts — Free Open Studios & Public Programs
--
-- Dead ends researched and excluded:
--   - Nebraska Writers Guild Annual Conference (Omaha, April 2025):
--     confirmed active, but membership required ($33–$39/year)
--     which exceeds the $20 threshold; no free public events confirmed
--   - Joslyn Art Museum volunteer program: confirmed NOT currently
--     accepting new volunteer applications (per official website)
--   - Society of Professional Journalists Nebraska: chapter confirmed
--     to exist but website/activity level could not be fully verified
--   - Union Pacific Museum Council Bluffs volunteer: museum confirmed
--     active (rrmuseums.org/union-pacific) but specific volunteer
--     program details/status could not be verified for 2025-2026
--   - Omaha Fringe Festival: already in database (Phase 8)
--   - Omaha Community Playhouse: already in database (Phase 8)
--   - Omaha Conservatory of Music: already in database (Phase 8)
-- ============================================================

-- 1. The Durham Museum — Volunteer Docent & Visitor Experience Program
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
  'The Durham Museum — Volunteer Docent & Visitor Experience Program',
  'The Durham Museum',
  'https://durhammuseum.org/support/volunteer/',
  'The Durham Museum — housed in Omaha''s stunning historic Union Station — trains volunteer docents and visitor experience staff to bring local, regional, and national history to life for guests. Volunteers facilitate educational programs, guide exhibition areas, assist at the admissions desk and museum shop, and serve as membership ambassadors. Training is provided through printed and digital resources and shadowing with experienced staff. Regular volunteer open houses are held to onboard new cohorts. This is a meaningful pathway for anyone interested in museum careers, public history, archival work, cultural heritage, education, or arts administration.',
  'community',
  'Free. No prior experience required. Volunteer shifts available daily (10am–1pm and 1pm–4pm). Complete a volunteer application at durhammuseum.org/support/volunteer or visit their ShareOmaha profile to respond to current openings.',
  NULL,
  'https://durhammuseum.org/support/volunteer/',
  'Omaha, NE', '801 S 10th St', 'Omaha', 'NE', '68108',
  false, false,
  '{low_income,first_gen}', '{humanities,history,museum,arts,education,volunteer,career_exploration,cultural_heritage}', '{}',
  'high', 'verified',
  'https://durhammuseum.org/support/volunteer/', 'official_website', '2026-03-18',
  'Year-round. Daily volunteer shifts (10am–1pm and 1pm–4pm). Regular open houses for new volunteers.',
  true, true, '2026-03-18', '2026-03-18',
  '{"career_field": "humanities", "subcategory": "museum_history", "opportunity_type": "volunteer", "cost_details": {"amount": 0, "cost_type": "free", "conditions": null, "waiver_available": false, "waiver_details": null}, "delivery": "in_person", "listing_type": "volunteer_program", "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
);

-- 2. Bemis Center for Contemporary Arts — Free Open Studios & Public Programs
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
  'Bemis Center for Contemporary Arts — Free Open Studios & Public Programs',
  'Bemis Center for Contemporary Arts',
  'https://www.bemiscenter.org/events',
  'The Bemis Center for Contemporary Arts is one of the premier artist residency programs in the country, and it opens its doors to the public through free programming including artist talks, open studio visits, curator-led tours, and hands-on workshops. The recurring Open House / Open Studios events — held in Spring and Fall — feature artist-led activities, exhibition tours, and access to artists-in-residence in their studios. All public programs are free and open to everyone. For anyone interested in careers as a visual artist, curator, arts administrator, gallery director, or arts educator, Bemis offers rare direct access to working professional artists and the contemporary art world.',
  'workshop',
  'Free. Open to the public. No registration required for most public programs; ticket reservations encouraged for Open Studios events. Visit bemiscenter.org/events for the current calendar.',
  NULL,
  'https://www.bemiscenter.org/events',
  'Omaha, NE', '724 S 12th St', 'Omaha', 'NE', '68102',
  false, false,
  '{low_income,first_gen}', '{humanities,visual_art,contemporary_art,arts_career,creative_career,career_exploration,artist_talk}', '{}',
  'high', 'verified',
  'https://www.bemiscenter.org/events/open-house-open-studios-spring-2025', 'official_website', '2026-03-18',
  'Recurring Spring and Fall Open Studios events. Additional public programs throughout the year — check bemiscenter.org/events.',
  true, true, '2026-03-18', '2026-03-18',
  '{"career_field": "humanities", "subcategory": "visual_arts", "opportunity_type": "open_house", "cost_details": {"amount": 0, "cost_type": "free", "conditions": null, "waiver_available": false, "waiver_details": null}, "delivery": "in_person", "listing_type": "community_event", "accessibility": {"cost_barrier": "free", "requires_enrollment": false, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
);
