-- ============================================================
-- Opportography — Migration 108
-- Phase 17 Closure — Gap Fill: Category 6 Passion, Hobby
--                    & Interest Communities
-- Date: 2026-04-02
--
-- 1 verified entry:
--   1. Cinco de Mayo Omaha — Nebraska's Largest Cultural
--      Festival (South 24th Street, Free, Annual)
--
-- NOT duplicating (already in DB):
--   - Heartland Pride Annual LGBTQ+ Festival (migration 012)
--   - Omaha Metro Disc Golf Association (migration 055)
--   - Omaha Maker Faire: No confirmed 2026 event found.
--     The Omaha Maker Faire historically operated through the
--     Omaha STEM Ecosystem — no 2026 event announcement found
--     at time of research. Not added (would require a confirmed
--     active event).
--   - Omaha Axe Throwing leagues: Multiple commercial venues
--     (Bad Axe Throwing, Axe MGMT) offer drop-in and league
--     play — these are private commercial entertainment
--     businesses, not community organizations. Excluded per
--     platform scope (community organizations, not businesses).
--
-- RESEARCHED BUT EXCLUDED:
--   - CrossFit affiliates / yoga community classes: Individual
--     commercial gyms. No free or community-oriented program
--     with a stable URL identified that is not already covered
--     by existing community fitness entries.
--   - Sports officiating pipelines: Nebraska School Activities
--     Association (NSAA) registers officials for high school
--     sports but this is a statewide program, not metro-specific
--     enough for an Omaha/CB entry at this phase.
--   - Omaha Area Youth Orchestras: Audition-based, tuition-based
--     program ($300–400/year) for ages 8–18. More of an arts
--     education program than a community hobby group. Candidate
--     for a future "arts education" category expansion but does
--     not fit cleanly in the community/hobby bucket used here.
--
-- Sources verified 2026-04-02:
--   - cdmomaha.com (primary festival page — 2026 dates confirmed)
--   - cdmomaha.com/event-details/festival-cinco-de-mayo-omaha-2026
--   - visitomaha.com/events/annual-events-and-festivals/cinco-de-mayo
--   - culturaomaha.org (Casa de la Cultura — organizer)
--   - Patch.com event listing: May 15, 2026 confirmed
--
-- Confidence: 0.93
--   2026 dates confirmed across multiple sources. Free admission
--   confirmed. Nebraska's highest tourism honor (Henry Fonda
--   Award) recipient. Recurring annual event with 30+ year
--   history. Organized by Casa de la Cultura (501(c)(3)).
-- ============================================================

INSERT INTO public.opportunities (
  title, organization, organization_website, description,
  type, eligibility, deadline, link,
  location, address, city, state,
  is_remote, is_hybrid,
  identity_tags, category_tags, grade_levels,
  data_confidence, verification_status,
  source_url, source_type, source_retrieved_date,
  schedule, audience_type,
  is_active, is_featured, date_added, last_verified,
  metro_area_id,
  cb_eligibility,
  community_metadata
) VALUES
(
  'Cinco de Mayo Omaha — Nebraska''s Largest Free Cultural Festival (South 24th Street, May 15–17, 2026)',
  'Casa de la Cultura / Cinco de Mayo Omaha',
  'https://www.cdmomaha.com',
  'Cinco de Mayo Omaha (CDMO) is Nebraska''s largest cultural event and recipient of the state''s highest tourism honor — the Henry Fonda Award. Held annually on South 24th Street in historic South Omaha, the three-day festival is free and open to the public. The 2026 festival runs May 15–17 and features live music and cultural entertainment throughout the weekend, Omaha''s largest parade on Saturday morning, a STEM Kids'' Area, a community health fair, mariachi mass, carnival rides, and hundreds of food vendors and exhibitors from across the Midwest. South 24th Street is the heart of Omaha''s Latino community — this festival is both a celebration of Mexican heritage and a gathering point for the entire metro. Whether you''re connected to the Latino community, a first-time attendee, or simply looking for one of the largest and most vibrant community events in the region, Cinco de Mayo Omaha is worth showing up for.',
  'community',
  'Free and open to the public. No tickets, no registration. Show up at South 24th Street (L to Q Streets), Omaha, NE on May 15–17, 2026. Parade begins Saturday morning — check cdmomaha.com for the 2026 parade route and schedule.',
  NULL,
  'https://www.cdmomaha.com',
  'South Omaha, NE (South 24th Street, L–Q)', '24th & L St', 'Omaha', 'NE',
  false, false,
  '{hispanic_latino}'::text[],
  '{cultural_festival,Latino,Mexican_heritage,free,outdoor,community,parade,Omaha,South_Omaha,annual_event,family_friendly}'::text[],
  '{}'::text[],
  'high', 'verified',
  'https://www.cdmomaha.com/event-details/festival-cinco-de-mayo-omaha-2026', 'official_website', '2026-04-02',
  'Annual festival. 2026 dates: May 15–17 (Friday–Sunday). Location: South 24th Street, L to Q, Omaha NE. Free admission. Parade: Saturday morning. Check cdmomaha.com for 2026 full schedule and vendor/exhibitor information.',
  'community_all',
  true, true, '2026-04-02', '2026-04-02',
  1,
  '{"eligible": true, "basis": "explicit", "notes": "Free public festival open to all metro residents including Council Bluffs. Short drive across the river.", "source": "https://www.cdmomaha.com"}'::jsonb,
  '{"subcategory": "collecting_niche", "passion_tags": ["cultural_festival", "latino_culture", "mexican_heritage", "parade", "live_music", "food", "community_event", "South_Omaha", "free_event", "family_friendly", "annual"], "listing_type": "annual_event", "accessibility": {"cost_barrier": "free", "experience_required": "none", "age_restriction": "all_ages", "council_bluffs_accessible": true, "transit_accessible": true}}'::jsonb
);
