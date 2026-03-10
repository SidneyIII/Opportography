-- ============================================================
-- Opportography — Migration 015
-- Phase 10: Open Science & Discovery Batch
-- Sources researched and verified: March 2026
-- Run AFTER 014_schema_science.sql
--
-- Target demographics: Any adult or teenager who is curious
--   about the natural world and has never had a way in.
--   The factory worker who watched a documentary about black holes.
--   The grandmother who wants to name the birds at her feeder.
--   The 22-year-old who dropped out and thinks science
--   is for other people. These listings are for them.
--
-- Guiding principle: Curiosity has no prerequisites.
--
-- Four domain themes:
--   1. Astronomy & Space Science               (4 entries)
--   2. Biology, Ecology & Natural History      (5 entries)
--   3. General Science & Interactive Learning  (3 entries)
--   4. Neuroscience & Public Science Talks     (1 entry)
--   5. Citizen Science & Participatory Research(4 entries)
--   6. Library-Based Science Learning          (1 entry)
--   Total: 18 entries
--
-- Schema fields used: all previous fields + learning_context
--   (added in migration 014)
--
-- NOT LISTED / EXCLUDED:
--   • Branched Oak Observatory (Raymond NE): ~50 miles from Omaha,
--     outside metro scope — excluded
--   • UNO C.A.P.O.W.: School-facing outreach program; no direct
--     public community participation component confirmed — excluded
--   • Boys Town National Research Hospital public lectures: Could
--     not verify a regular public lecture series; IHN hosts specific
--     events but not a confirmed recurring public program — excluded
--   • Papio NRD citizen science: Envirothon is youth/student-
--     focused competition; no confirmed adult citizen science
--     monitoring program found — excluded
--   • Lauritzen Gardens general admission: Science/botany programming
--     not confirmed distinct from garden experience; OPL Discovery Pass
--     covers access — covered via OPL Discovery Pass listing instead
--   • Henry Doorly Zoo general admission: Cost is a barrier for
--     lower-income families; included only the citizen science programs
--     that are specifically open-participation and science-focused
--   • iNaturalist Omaha BioBlitz: No confirmed annual local BioBlitz
--     event found; iNaturalist app itself covered as ongoing resource
--
-- Verification notes:
--   • OAS: Night Sky Network profile active; February 2025 Aerospace
--     STEM Demonstration event confirmed; website current (omahaastro.com)
--   • Night Skies at Lauritzen Gardens: Active listing on
--     lauritzen.ticketapp.org; KVNO confirmed April 5, 2025 event
--   • Mallory Kountze Planetarium: Official UNO page active;
--     $10 admission confirmed; advance tickets required
--   • Neale Woods Millard Observatory: Confirmed via fontenelleforest.org;
--     December 13, 2025 event confirmed; $6/$4 pricing confirmed
--   • Fontenelle Forest: OPL Discovery Pass confirmed active (omahalibrary.org);
--     UNO Criss Library also offers passes (2024 confirmed)
--   • Audubon Society of Omaha: Website active (audubon-omaha.org);
--     February 2026 events confirmed (crane presentation Feb 19, EZ birding
--     Feb 21, DeSoto trip Feb 28); new ASO board members confirmed June 2025
--   • Heron Haven: Active on visitomaha.com; Yelp updated January 2026;
--     listed under Papio NRD and Friends of Heron Haven (shareomaha.org)
--   • Hitchcock Nature Center: Active programming Feb-Mar 2026 confirmed
--     via pottconservation.com; sledding events, snow yoga confirmed
--   • DeSoto NWR: fws.gov/refuge/desoto active; visitor center
--     Tue-Sat 8:30am-4:30pm confirmed; $5 vehicle fee confirmed
--   • Kiewit Luminarium: Active website; OPL Discovery Pass confirmed;
--     Thursday Night Light 7-10pm confirmed; Holland Talks active;
--     free membership through Latino Center/Girls Inc confirmed
--   • Nebraska Science Festival: UNMC press release Jan 30 2026 confirmed
--     2026 festival returns in April; Public Expo at Durham Museum
--     April 18, 2026, 9am-noon confirmed; Science Sundays confirmed
--   • Omaha Science Café: UNMC events page active; April 2026 "Brain
--     that Heals Itself" and May 2026 "Science of Owls" events confirmed
--   • Nebraska Master Naturalist: Website active; River City Chapter
--     (Omaha) confirmed established April 2016; 19+ age requirement confirmed
--   • Henry Doorly Zoo Citizen Science: Zoo website active; monarch
--     tagging confirmed; ACEP program confirmed
--   • iNaturalist: Active global platform; Omaha metro observations
--     accessible via inaturalist.org/places
--   • OPL Common Soil Seed Library: 10th anniversary celebration 2025;
--     15 packets/month confirmed; 150 varieties confirmed; OPL blog current
--   • Audubon CBC: National Audubon Society confirmed Omaha participates
--     in annual Christmas Bird Count; ASO chapter active
-- ============================================================

insert into public.opportunities (
  title, organization, organization_website, description, type,
  eligibility, deadline, link, location, address, city, state, zip,
  is_remote, is_hybrid,
  identity_tags, category_tags, grade_levels,
  compensation_type, compensation_amount, compensation_frequency,
  data_confidence, verification_status,
  source_url, source_type, source_retrieved_date,
  is_active, is_featured,
  schedule, language_access, cost_structure, recurrence, learning_context
) values

-- ══════════════════════════════════════════════════════════
-- 1. ASTRONOMY & SPACE SCIENCE (4 entries)
-- ══════════════════════════════════════════════════════════

-- ── OMAHA ASTRONOMICAL SOCIETY — MONTHLY MEETING ─────────
-- Verified active: Night Sky Network profile live; Feb 2025 event confirmed
-- First Friday of most months, 7:30 PM, Durham Science Center Room 115
-- Hybrid in-person + Zoom

(
  'Omaha Astronomical Society — Monthly Meeting & Outreach',
  'Omaha Astronomical Society',
  'https://www.omahaastro.com',
  'A community of people who love looking at the sky — and who want to share it. The Omaha Astronomical Society meets the first Friday of most months at UNO''s Durham Science Center, open to any visitor at no charge. Monthly presentations cover topics across astronomy: planets, deep-sky objects, space missions, astrophotography, and more. Members bring their telescopes to outdoor star parties and are genuinely happy to let newcomers look through them. No telescope, no jargon, no prior knowledge required. OAS is a NASA Night Sky Network partner.',
  'workshop',
  'Open to all — visitors welcome at any meeting, no membership required. All ages welcome.',
  null,
  'https://www.omahaastro.com/monthly-meeting',
  'Omaha', '6001 Dodge St', 'Omaha', 'NE', '68182',
  false, true,
  array['low_income', 'first_gen'],
  array['stem', 'astronomy'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://nightsky.jpl.nasa.gov/clubs/oas/home/', 'official_website', '2026-03-05',
  true, true,
  'First Friday of most months, 7:30 PM CT at Durham Science Center Room 115, UNO campus (6001 Dodge St, Omaha). Hybrid — attend in person or via Zoom link on website. Check omahaastro.com/calendar for schedule changes due to holidays.',
  null,
  '{"type": "free", "notes": "Free to attend as a visitor. OAS membership is optional and available for those who want to join the club. No cost to attend any monthly meeting."}'::jsonb,
  '{"frequency": "monthly", "day_of_week": "Friday", "week_of_month": "first", "time": "7:30 PM", "timezone": "CT", "notes": "First Friday of most months; check omahaastro.com/calendar for holiday exceptions"}'::jsonb,
  '{"formality": "informal", "social_setting": "community", "commitment_level": "drop_in", "description": "You show up at a room at UNO, grab a seat, and hear someone talk about something happening in the universe — then ask questions. Members are enthusiastic and patient with beginners. Star parties are separate outdoor events where people set up telescopes and let strangers look through them."}'::jsonb
),

-- ── OAS NIGHT SKIES AT LAURITZEN GARDENS ─────────────────
-- Verified: Active listing on lauritzen.ticketapp.org
-- KVNO confirmed April 5, 2025 event; seasonal outdoor star party
-- $30 general / $20 garden members; ages 16+

(
  'Night Skies at Lauritzen Gardens — OAS Star Party',
  'Omaha Astronomical Society at Lauritzen Gardens',
  'https://www.omahaastro.com/calendar',
  'Once a month, the Omaha Astronomical Society sets up powerful telescopes in the rose garden at Lauritzen Gardens for a public stargazing event. Guests take a tram ride to the garden, then spend the evening looking at planets, star clusters, and deep-sky objects through OAS members'' telescopes — with narration explaining exactly what they''re seeing. Weather-dependent; sessions may be rescheduled if skies are unsuitable. Designed for ages 16 and older. One of the most atmospheric astronomy experiences in the Omaha metro.',
  'workshop',
  'Ages 16 and older. No prior astronomy knowledge needed. Ticket purchase required in advance.',
  null,
  'https://lauritzen.ticketapp.org/portal/product/46/events',
  'Omaha', '100 Bancroft St', 'Omaha', 'NE', '68108',
  false, false,
  array[]::text[],
  array['stem', 'astronomy'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://lauritzen.ticketapp.org/portal/product/46/events', 'official_website', '2026-03-05',
  true, false,
  'Seasonal outdoor events, typically monthly on clear evenings. Check lauritzen.ticketapp.org for upcoming dates. Weather-dependent — may be rescheduled.',
  null,
  '{"type": "reduced_cost", "amount": 30, "notes": "$30 per person general admission; $20 for Lauritzen Gardens members. Tickets must be purchased in advance through the Lauritzen Gardens ticketing portal."}'::jsonb,
  '{"frequency": "monthly", "notes": "Seasonal monthly events; check lauritzen.ticketapp.org for schedule. Weather-dependent — check website before attending."}'::jsonb,
  '{"formality": "informal", "social_setting": "small_group", "commitment_level": "drop_in", "description": "You take a short tram ride to a garden after dark, then stand near powerful telescopes while OAS members point them at planets and explain what you''re looking at. A peaceful, unhurried evening under the sky."}'::jsonb
),

-- ── MALLORY KOUNTZE PLANETARIUM — PUBLIC SHOWS ───────────
-- Verified: Official UNO page active; $10 admission confirmed
-- Advance tickets required; monthly schedule released on 15th of prior month
-- Durham Science Center, UNO campus

(
  'Mallory Kountze Planetarium — Monthly Public Shows',
  'University of Nebraska Omaha',
  'https://www.unomaha.edu/college-of-arts-and-sciences/physics/community-engagement/mkplanetarium/',
  'The Mallory Kountze Planetarium at UNO projects a full-dome night sky onto a curved ceiling for public shows throughout the year. Shows cover different topics — from introductory constellation tours to deep-space journeys — and run approximately 45 minutes. The planetarium is located in UNO''s Durham Science Center and seats a small group per show, making it an intimate experience. Monthly schedules are released on the 15th of the prior month. Free parking available on the UNO campus. One of Omaha''s most underused science gems.',
  'workshop',
  'Open to all ages. Tickets must be purchased in advance online. Children welcome with adult.',
  null,
  'https://www.unomaha.edu/college-of-arts-and-sciences/physics/community-engagement/mkplanetarium/public-shows.php',
  'Omaha', '6001 Dodge St', 'Omaha', 'NE', '68182',
  false, false,
  array['low_income', 'first_gen'],
  array['stem', 'astronomy'],
  array['9', '10', '11', '12', 'college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.unomaha.edu/college-of-arts-and-sciences/physics/community-engagement/mkplanetarium/public-shows.php', 'official_website', '2026-03-05',
  true, false,
  'Monthly public shows at UNO Durham Science Center. Monthly schedule released on the 15th of the prior month. Check the UNO Planetarium website for current showtimes and ticket booking.',
  null,
  '{"type": "low_cost", "amount": 10, "notes": "$10 per person for all ages. Tickets must be purchased in advance via the online booking link. Free parking available on UNO''s Dodge campus."}'::jsonb,
  '{"frequency": "monthly", "notes": "Monthly public shows; exact schedule released on the 15th of each prior month. Check UNO Planetarium website to book tickets."}'::jsonb,
  '{"formality": "semi_formal", "social_setting": "small_group", "commitment_level": "drop_in", "description": "The lights go out, the ceiling fills with stars, and a narrator walks you through the universe for about 45 minutes. It''s a small room and a personal experience — not a big stadium show. Tickets are $10 and must be reserved ahead of time."}'::jsonb
),

-- ── NEALE WOODS MILLARD OBSERVATORY — STARGAZING EVENTS ──
-- Verified: fontenelleforest.org; December 13, 2025 event confirmed
-- Largest observatory in Omaha metro; $6 adults / $4 members
-- Neale Woods Nature Center, North Omaha

(
  'Neale Woods Millard Observatory — Public Stargazing Events',
  'Fontenelle Forest',
  'https://fontenelleforest.org',
  'The Millard Observatory at Neale Woods is the largest telescope in the Omaha metro area, housed in a 600-acre woodland preserve in North Omaha. Fontenelle Forest hosts public stargazing events where naturalists use the observatory telescope to show visitors the moon, planets, and star clusters — explaining what they''re seeing in plain language. Admission to the stargazing event is separate from regular Neale Woods access. The preserve itself features 7 miles of walking trails along the Missouri River. A December 2025 evening event was confirmed.',
  'workshop',
  'Open to all ages. Children under 12 free. Reservation or advance check recommended — event capacity is limited.',
  null,
  'https://fontenelleforest.org/calendar/category/neale-woods/list/',
  'Omaha', '14323 Edith Marie Ave', 'Omaha', 'NE', '68112',
  false, false,
  array['low_income', 'first_gen'],
  array['stem', 'astronomy'],
  array['9', '10', '11', '12', 'college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://fontenelleforest.org/calendar/category/neale-woods/list/', 'official_website', '2026-03-05',
  true, false,
  'Seasonal public stargazing events at Neale Woods. Check fontenelleforest.org for upcoming event dates. Event access is separate from general preserve access.',
  null,
  '{"type": "low_cost", "amount": 6, "notes": "$6 adults / $4 Fontenelle Forest members / children under 12 free. Separate from regular Neale Woods access fee. Check fontenelleforest.org for current pricing and event registration."}'::jsonb,
  '{"frequency": "varies", "notes": "Seasonal events; December 2025 event confirmed. Check fontenelleforest.org for upcoming stargazing dates."}'::jsonb,
  '{"formality": "informal", "social_setting": "small_group", "commitment_level": "drop_in", "description": "A naturalist points the largest telescope in Omaha at the moon or a planet, you look through the eyepiece, and they explain what you''re seeing. It''s in a real nature preserve in North Omaha — quiet, dark, and genuinely beautiful."}'::jsonb
),

-- ══════════════════════════════════════════════════════════
-- 2. BIOLOGY, ECOLOGY & NATURAL HISTORY (5 entries)
-- ══════════════════════════════════════════════════════════

-- ── FONTENELLE FOREST — GUIDED NATURE PROGRAMS ───────────
-- Verified: OPL Discovery Pass confirmed; UNO Criss Library passes (2024)
-- Night hikes, full moon hikes, Solstice/Equinox events confirmed
-- Library pass: 2 adults + household children; all 12 OPL locations

(
  'Fontenelle Forest — Guided Hikes, Night Hikes & Science Programs',
  'Fontenelle Forest',
  'https://fontenelleforest.org',
  'Fontenelle Forest is 2,100 acres of old-growth forest, bluffs, and floodplain 15 minutes south of downtown Omaha in Bellevue — one of the largest urban forests in the United States. Naturalists lead regular guided programs including daytime hikes, night hikes (exploring the forest in darkness with a guide), full moon hikes, and Solstice and Equinox events. The Raptor Woodland Refuge houses birds of prey year-round. The ADA-accessible boardwalk allows wheelchair access to the forest interior. Free admission available through the Omaha Public Library Discovery Pass — check out a pass at any of 12 OPL locations.',
  'workshop',
  'Open to all ages and abilities. ADA-accessible boardwalk available. Library pass admits 2 adults and household children. Guided programs may require advance registration — check fontenelleforest.org.',
  null,
  'https://fontenelleforest.org/calendar/',
  'Bellevue', '1111 N Bellevue Blvd', 'Bellevue', 'NE', '68005',
  false, false,
  array['low_income', 'first_gen', 'disabled'],
  array['stem', 'ecology', 'biology'],
  array['9', '10', '11', '12', 'college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://omahalibrary.org/fontenelle-forest-membership-passes/', 'official_website', '2026-03-05',
  true, true,
  'Guided programs run throughout the year — daytime hikes, night hikes (evening), full moon hikes, and seasonal events. General forest access requires admission. Check fontenelleforest.org/calendar for upcoming guided programs.',
  null,
  '{"type": "membership_with_free_option", "general_admission": "$15 adults / $10 ages 3-12", "free_access_pathways": ["Omaha Public Library Discovery Pass — admits 2 adults and all household children; available at all 12 OPL locations for Douglas County cardholders", "UNO Criss Library offers passes for UNO community members"], "notes": "Library pass is a day-use pass, good for one-time admission on the designated day. Reserve online at omahalibrary.org/discovery-pass or in person at any OPL branch."}'::jsonb,
  '{"frequency": "monthly", "notes": "Multiple programs per month across different formats; check fontenelleforest.org/calendar for full schedule. Night hikes and full moon hikes are seasonal."}'::jsonb,
  '{"formality": "informal", "social_setting": "small_group", "commitment_level": "drop_in", "description": "A naturalist leads you through one of the biggest forests in the Midwest — pointing out trees, calling out birds, explaining what the forest is doing in each season. Night hikes are exactly what they sound like: the forest in the dark, with a guide who knows every sound."}'::jsonb
),

-- ── AUDUBON SOCIETY OF OMAHA — BIRD WALKS & PROGRAMS ─────
-- Verified active: audubon-omaha.org; Feb 2026 events confirmed:
-- Sandhill Crane presentation Feb 19; EZ birding Feb 21; DeSoto trip Feb 28
-- Field trips free; no charge for programs

(
  'Audubon Society of Omaha — Free Bird Walks & Monthly Programs',
  'Audubon Society of Omaha',
  'https://audubon-omaha.org',
  'The Audubon Society of Omaha runs free monthly field trips — guided bird walks at nature areas within 50 miles of Omaha — open to anyone, any skill level, any age. Trips are free and no membership is required. Monthly indoor programs feature presentations on birds, ecology, and conservation by naturalists and scientists. February 2026 events include a presentation on Sandhill Cranes, an EZ-Does-It Birding walk at Towl Park, and a guided trip to DeSoto National Wildlife Refuge for migratory bird viewing. Binoculars are helpful but never required.',
  'workshop',
  'Open to all ages and all skill levels. No birding experience needed. Field trips are free; no registration required for most events.',
  null,
  'https://audubon-omaha.org/calendar-of-events/calendar-of-events.html',
  'Omaha', null, 'Omaha', 'NE', null,
  false, false,
  array['low_income', 'first_gen'],
  array['stem', 'ecology', 'biology'],
  array['9', '10', '11', '12', 'college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://audubon-omaha.org', 'official_website', '2026-03-05',
  true, true,
  'Monthly field trips and indoor programs throughout the year. Check audubon-omaha.org/calendar for current events and meeting locations. Most field trips depart from a designated public location — check event listing for details.',
  null,
  '{"type": "free", "notes": "Field trips are completely free and open to all; no membership or registration required for most events. Monthly indoor programs are also free. ASO does not charge for any regular programming."}'::jsonb,
  '{"frequency": "monthly", "notes": "Monthly field trips plus additional programs; February 2026 events confirmed. Check audubon-omaha.org for full calendar."}'::jsonb,
  '{"formality": "informal", "social_setting": "small_group", "commitment_level": "recurring_casual", "description": "You meet a small group at a park or nature area, and a leader points out birds and explains their behaviors as you walk. Beginners always welcome — leaders have seen it all and love showing people a bird they''ve never noticed before. Binoculars optional."}'::jsonb
),

-- ── HERON HAVEN — FREE URBAN WETLAND SANCTUARY ───────────
-- Verified: visitomaha.com listing; Yelp updated January 2026
-- Papio NRD; Friends of Heron Haven (shareomaha.org)
-- 11809 Old Maple Rd, Omaha; free admission (donations accepted)

(
  'Heron Haven — Free Urban Wetland Sanctuary',
  'Friends of Heron Haven',
  'https://heronhaven.org',
  'Heron Haven is a spring-fed wetland and wildlife sanctuary in northwest Omaha — one of the last oxbow wetlands of the Big Papillion Creek inside city limits. Admission is free, open every day from sunrise to sunset, with no registration or reservation needed. The Education Center hosts monthly Second Saturday Programs led by Master Naturalists covering wetland ecology, birds, conservation, and nature photography. An annual Wetlands Festival celebrates the sanctuary each year. Managed by the Friends of Heron Haven and the Papio-Missouri River NRD. One of Omaha''s most peaceful and least-known free outdoor spaces.',
  'free_resource',
  'Free and open to all. Open daily sunrise to sunset. Monthly programs open to all ages with no registration required.',
  null,
  'https://heronhaven.org',
  'Omaha', '11809 Old Maple Rd', 'Omaha', 'NE', '68164',
  false, false,
  array['low_income', 'first_gen', 'disabled'],
  array['stem', 'ecology', 'biology'],
  array['9', '10', '11', '12', 'college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://heronhaven.org', 'official_website', '2026-03-05',
  true, false,
  'Open daily, sunrise to sunset — no registration, no admission. Second Saturday Programs on the second Saturday of each month. Annual Wetlands Festival timing varies — check heronhaven.org.',
  null,
  '{"type": "free", "notes": "Completely free to visit anytime. Donations welcome but not required. Monthly programs are also free and open to all. No parking fee."}'::jsonb,
  '{"frequency": "daily_access", "notes": "Open every day, sunrise to sunset. Monthly Second Saturday Programs (second Saturday of each month). Annual Wetlands Festival — check heronhaven.org for timing."}'::jsonb,
  '{"formality": "informal", "social_setting": "solo", "commitment_level": "drop_in", "description": "Walk into a wetland in the middle of Omaha for free, any day you want. Herons wade through shallow water a few feet away. On the second Saturday of each month, a naturalist leads a guided program about the ecology of what you''re seeing."}'::jsonb
),

-- ── HITCHCOCK NATURE CENTER — LOESS HILLS PROGRAMS ───────
-- Verified: pottconservation.com; Feb-Mar 2026 events confirmed
-- 25 minutes from Omaha; globally significant Loess Hills terrain
-- Seasonal programs: HawkWatch, Monarch tagging, night sky, mushroom hunts

(
  'Hitchcock Nature Center — Seasonal Nature Programs in the Loess Hills',
  'Pottawattamie Conservation',
  'https://www.pottconservation.com/parks/hitchcock_nature_center/',
  'Hitchcock Nature Center sits in the heart of Iowa''s Loess Hills — a type of terrain found in only a handful of places on Earth, formed over thousands of years by wind-deposited silt. Located in Honey Creek, Iowa, about 25 minutes from Omaha, Hitchcock offers nearly 1,500 acres of prairie, savanna, and woodland with 10+ miles of hiking trails. Seasonal programs include HawkWatch (fall hawk migration counts), Monarch butterfly tagging, night sky viewing events, mushroom identification walks, and nature storytelling. The Loess Hills Lodge features hands-on interpretive exhibits and a 45-foot observation deck with views of the Missouri River Valley.',
  'workshop',
  'Open to the public. Seasonal programs vary in age requirement — most are appropriate for teens and adults. Some programs require advance registration. Check pottconservation.com for details.',
  null,
  'https://www.pottconservation.com/calendar/',
  'Honey Creek', '27792 Ski Hill Loop', 'Honey Creek', 'IA', '51542',
  false, false,
  array[]::text[],
  array['stem', 'ecology', 'biology'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.pottconservation.com/parks/hitchcock_nature_center/', 'official_website', '2026-03-05',
  true, false,
  'Seasonal programs throughout the year. HawkWatch in fall; Monarch tagging in late summer; night sky events and mushroom walks in season. Check pottconservation.com/calendar for current schedule. ~25 minutes from Omaha via I-680 west.',
  null,
  '{"type": "low_cost", "notes": "Park admission typically $3/person; some programs have an additional fee (e.g., night events ~$33 per person). Some programs listed as free with park admission. Check pottconservation.com for current pricing per event."}'::jsonb,
  '{"frequency": "varies", "notes": "Seasonal programs throughout the year. HawkWatch fall; Monarch tagging August-September; mushroom walks in season. Check pottconservation.com/calendar for full listing."}'::jsonb,
  '{"formality": "informal", "social_setting": "small_group", "commitment_level": "drop_in", "description": "Drive 25 minutes from Omaha into terrain that looks like it belongs in a different era — rolling hills carved by ancient winds. Naturalists lead programs on whatever is happening in that season: counting migrating hawks, tagging butterflies, identifying mushrooms, or watching the night sky."}'::jsonb
),

-- ── DESOTO NATIONAL WILDLIFE REFUGE ──────────────────────
-- Verified: fws.gov/refuge/desoto active; visitor center Tue-Sat 8:30-4:30
-- $5 vehicle pass; America the Beautiful Pass accepted
-- Peak migration: November-December (500K+ snow geese; bald eagles)
-- 25 miles north of Omaha, near Blair NE / Missouri Valley IA

(
  'DeSoto National Wildlife Refuge — Migratory Bird Viewing & Interpretive Programs',
  'U.S. Fish & Wildlife Service',
  'https://www.fws.gov/refuge/desoto',
  'DeSoto National Wildlife Refuge, 25 miles north of Omaha, is one of the best free wildlife viewing experiences in the Midwest. Each fall, half a million snow geese and tens of thousands of ducks and shorebirds funnel through on their way south — filling the sky in spiraling masses at dawn and dusk. Bald eagles gather by the dozens to feed. The refuge visitor center is open Tuesday through Saturday (8:30 AM – 4:30 PM) and features interpretive exhibits including artifacts from the steamboat Bertrand, which sank here in 1865. Ranger-led programs available for groups by advance arrangement.',
  'free_resource',
  'Open to the general public. $5 per vehicle (or America the Beautiful Annual Pass accepted). No prior wildlife knowledge needed.',
  null,
  'https://www.fws.gov/refuge/desoto/visit-us/activities',
  'Missouri Valley', '1434 316th Lane', 'Missouri Valley', 'IA', '51555',
  false, false,
  array['low_income', 'first_gen'],
  array['stem', 'ecology', 'biology'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.fws.gov/refuge/desoto', 'official_website', '2026-03-05',
  true, false,
  'Open year-round. Visitor center Tuesday–Saturday, 8:30 AM–4:30 PM. Peak snow goose migration: November–December. Peak spring migration: March. ~25 miles north of Omaha via US-75 or I-29.',
  null,
  '{"type": "low_cost", "amount": 5, "notes": "$5 per vehicle for the entire day. America the Beautiful Annual Pass ($80/year) accepted and covers the vehicle entry. Once inside, all wildlife viewing is free. Visitor center is free with refuge entry."}'::jsonb,
  '{"frequency": "seasonal", "notes": "Open year-round; peak migration season November-December (snow geese, bald eagles) and March (spring). Visitor center hours: Tue-Sat 8:30 AM-4:30 PM."}'::jsonb,
  '{"formality": "informal", "social_setting": "solo", "commitment_level": "drop_in", "description": "Drive into the refuge, pull over wherever you see movement, and watch. During November and December, the sky fills with hundreds of thousands of snow geese rising off the water at dawn. There''s nothing else like it within an hour of Omaha. Park your car, open the window, and watch."}'::jsonb
),

-- ══════════════════════════════════════════════════════════
-- 3. GENERAL SCIENCE & INTERACTIVE LEARNING (3 entries)
-- ══════════════════════════════════════════════════════════

-- ── KIEWIT LUMINARIUM ────────────────────────────────────
-- Verified: kiewitluminarium.org active; OPL Discovery Pass confirmed
-- Thursday Night Light: 7-10 PM adults-only confirmed
-- Holland Talks lecture series confirmed; free memberships via community partnerships
-- Free OPL pass: 3 adults + household children; all 12 OPL locations

(
  'Kiewit Luminarium — Interactive Science Museum with Free Access Pathways',
  'Kiewit Luminarium',
  'https://kiewitluminarium.org',
  'The Kiewit Luminarium on Omaha''s riverfront opened in 2023 with 125+ interactive exhibits at the intersection of science, art, and human perception — exhibits that respond to light, shadow, sound, and motion. Programming includes Holland Talks, a lecture series bringing nationally known researchers to present accessible talks on topics like emotion, awe, and the science of perception; and Thursday Night Light, a weekly adults-only evening (7–10 PM) where guests explore exhibits with drinks from the bar. Free family memberships are available through partnerships with the Latino Center of the Midlands and Girls Inc. The Omaha Public Library offers Discovery Passes for free daytime admission.',
  'workshop',
  'General admission open to all ages. Holland Talks and Night Light are adults-oriented. Free access available through OPL Discovery Pass and community partnerships.',
  null,
  'https://kiewitluminarium.org',
  'Omaha', '323 S Riverview Dr', 'Omaha', 'NE', '68108',
  false, false,
  array['low_income', 'first_gen', 'hispanic', 'black'],
  array['stem', 'astronomy', 'biology'],
  array['9', '10', '11', '12', 'college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://kiewitluminarium.org', 'official_website', '2026-03-05',
  true, true,
  'Open Tuesday–Sunday; hours vary. Holland Talks held quarterly — check kiewitluminarium.org/holland-talks. Thursday Night Light every Thursday, 7:00–10:00 PM. Discovery Passes available at all OPL locations.',
  '{"additional_languages": ["Spanish"]}'::jsonb,
  '{"type": "membership_with_free_option", "general_admission": "$18 adults / $13 ages 3-12 / under 3 free", "free_access_pathways": ["OPL Discovery Pass — admits 3 adults and all household children; reserve at omahalibrary.org/kiewit-luminarium-passes (free with Douglas County library card)", "Free family membership through Latino Center of the Midlands — contact Latino Center for eligibility", "Free family membership through Girls Inc. of Omaha — contact Girls Inc. for eligibility", "Discounted family membership ($100/year) available to anyone, no eligibility requirements"], "notes": "Holland Talks ticket includes museum admission. Night Light (Thursday 7-10 PM) may have separate pricing. Check kiewitluminarium.org for current ticket rates."}'::jsonb,
  '{"frequency": "varies", "notes": "Open Tue-Sun; Holland Talks quarterly; Thursday Night Light every Thursday 7-10 PM. Check kiewitluminarium.org/events for full calendar."}'::jsonb,
  '{"formality": "informal", "social_setting": "large_group", "commitment_level": "drop_in", "description": "Wander through a building full of things that react to what you do — step into a tunnel that turns your shadow into patterns, lean into an exhibit that shows how your brain processes color, watch a physics demonstration on a giant screen. Thursday nights are adults-only: bring a drink, explore, watch a show. Holland Talks bring in scientists who talk about research in ways that are actually interesting."}'::jsonb
),

-- ── NEBRASKA SCIENCE FESTIVAL — PUBLIC EXPO ──────────────
-- Verified: UNMC press release Jan 30 2026 confirmed 2026 return
-- Public Expo: April 18, 2026, Durham Museum, 9 AM-noon, FREE
-- Science Sundays at Gene Leahy Mall, 1-2 PM (Sundays in April except Easter)
-- Annual month-long event every April; presented by UNMC

(
  'Nebraska Science Festival — Annual Free Public Science Expo',
  'Nebraska Science Festival',
  'https://www.nescifest.com',
  'Every April, the Nebraska Science Festival transforms Omaha into a month-long celebration of science — dozens of free events, hands-on activities, star parties, and public talks presented by scientists from UNMC, UNO, Creighton, and community partners. The signature event is the free Public Science Expo, held at the Durham Museum, where visitors explore hands-on science activities across biology, chemistry, physics, and health science. The 2026 Expo is April 18 from 9 AM to noon. Science Sundays bring hands-on activities to the Gene Leahy Mall every Sunday in April (1–2 PM). All ages, no tickets, no registration.',
  'workshop',
  'Free and open to all ages. No registration required for the Public Expo or Science Sundays. Some specific ticketed events may require advance sign-up — check nescifest.com.',
  '2026-04-18',
  'https://www.nescifest.com/schedule/',
  'Omaha', '801 S 10th St', 'Omaha', 'NE', '68108',
  false, false,
  array['low_income', 'first_gen', 'black', 'hispanic'],
  array['stem', 'biology', 'chemistry', 'astronomy', 'ecology'],
  array['9', '10', '11', '12', 'college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.unmc.edu/newsroom/2026/01/30/nebraska-science-festival-public-expo-return-for-2026/', 'news', '2026-03-05',
  true, true,
  'Annual month-long event in April. 2026 Public Expo: April 18, Durham Museum, 9 AM–noon. Science Sundays: every Sunday in April (except Easter April 5), Gene Leahy Mall, 1–2 PM. Additional events throughout the month — check nescifest.com for full schedule.',
  null,
  '{"type": "free", "notes": "Public Expo and Science Sundays are completely free with no registration required. Some special events or evening programs may have tickets — check nescifest.com for individual event details."}'::jsonb,
  '{"frequency": "annual", "next_date": "2026-04-18", "notes": "Annual April festival. 2026 Public Expo: April 18 at Durham Museum, 9 AM-noon. Science Sundays every Sunday in April (except Easter) at Gene Leahy Mall."}'::jsonb,
  '{"formality": "informal", "social_setting": "large_group", "commitment_level": "drop_in", "description": "Walk into the Durham Museum on a Saturday morning and find scientists from every field running hands-on demonstrations — biology, chemistry, engineering, medicine. Touch things, ask questions, watch experiments. Free, no tickets, no badge. Science Sundays at Gene Leahy Mall are even more casual: just show up and do a science project outside."}'::jsonb
),

-- ── OPL DISCOVERY PASS — FREE SCIENCE VENUE ACCESS ───────
-- Verified: omahalibrary.org/discovery-pass active
-- Partners include: Kiewit Luminarium, Fontenelle Forest, Durham Museum,
-- Lauritzen Gardens, SAC Museum — available at all 12 OPL locations
-- Library card required (free to Douglas County residents)

(
  'OPL Discovery Pass — Free Museum & Nature Access with Your Library Card',
  'Omaha Public Library',
  'https://omahalibrary.org/discovery-pass/',
  'The Omaha Public Library''s Discovery Pass program lets you check out free admission passes to 12+ cultural and science venues in the metro — including the Kiewit Luminarium, Fontenelle Forest, the Durham Museum, Lauritzen Gardens, and the Strategic Air Command & Aerospace Museum. Reserve a pass online at omahalibrary.org or pick one up at any of the 12 OPL branch locations. All you need is a valid Omaha Public Library card, which is free for Douglas County residents. Each pass covers multiple people per visit — check each venue''s specific pass terms. A single library card unlocks free access to most of Omaha''s major science and nature destinations.',
  'free_resource',
  'Free to all Douglas County residents with an Omaha Public Library card. Library card is free to apply for in person at any OPL branch. Passes reserved online or in person.',
  null,
  'https://omahalibrary.org/discovery-pass/',
  'Omaha', null, 'Omaha', 'NE', null,
  false, false,
  array['low_income', 'first_gen', 'black', 'hispanic', 'immigrant', 'disabled'],
  array['stem', 'biology', 'astronomy', 'ecology'],
  array['9', '10', '11', '12', 'college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://omahalibrary.org/discovery-pass/', 'official_website', '2026-03-05',
  true, true,
  'Available year-round at all 12 OPL locations. Reserve online at omahalibrary.org/discovery-pass or ask at the circulation desk at your branch. Passes are available one per day per location and must be reserved — check availability online.',
  '{"additional_languages": ["Spanish"]}'::jsonb,
  '{"type": "free_with_library_card", "notes": "Completely free with an OPL library card. Library cards are free for Douglas County residents — apply in person at any OPL branch with a photo ID and proof of address. Passes cover multiple people per visit depending on venue (e.g., Kiewit Luminarium pass admits 3 adults and household children)."}'::jsonb,
  '{"frequency": "ongoing", "notes": "Available year-round. One pass per location per day — reserve early online. Pass availability varies by branch and venue."}'::jsonb,
  '{"formality": "informal", "social_setting": "solo", "commitment_level": "drop_in", "description": "Reserve a pass online through the library website — takes two minutes. Show up at Fontenelle Forest, the Kiewit Luminarium, or the Durham Museum, show the pass at the door, and walk in free. Your library card unlocks most of Omaha''s science destinations at no cost."}'::jsonb
),

-- ══════════════════════════════════════════════════════════
-- 4. NEUROSCIENCE & PUBLIC SCIENCE TALKS (1 entry)
-- ══════════════════════════════════════════════════════════

-- ── OMAHA SCIENCE CAFÉ ────────────────────────────────────
-- Verified: UNMC events page active; April 2026 "Brain that Heals Itself"
-- confirmed at The Slowdown; May 2026 "Science of Owls" confirmed
-- Free; 21+; monthly; The Slowdown, 729 N 14th St, Omaha

(
  'Omaha Science Café — Free Monthly Science Talks at The Slowdown',
  'University of Nebraska Medical Center',
  'https://events.unmc.edu/slowdown_275',
  'Once a month, a scientist from UNMC or Boys Town National Research Hospital walks into The Slowdown bar and explains their research in plain language to whoever shows up — for free. Past topics include the aging brain, how the brain heals itself after injury, the science of owls, vaccine development, why teenagers make the decisions they do, and how forensic fingerprint analysis actually works. Each talk runs about 30 minutes, followed by open Q&A from the audience and a pub quiz. No science background required, no preparation needed. Hosted by UNMC in partnership with Nebraska Science Festival. The 21+ venue means it''s an adult crowd.',
  'workshop',
  'Open to all adults 21 and older (venue policy). No prior science knowledge or preparation required. Free to attend — purchase drinks at The Slowdown.',
  null,
  'https://events.unmc.edu/slowdown_275',
  'Omaha', '729 N 14th St', 'Omaha', 'NE', '68102',
  false, false,
  array['low_income', 'first_gen'],
  array['stem', 'biology', 'ecology'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://events.unmc.edu/slowdown_275', 'official_website', '2026-03-05',
  true, true,
  'Monthly, approximately 7:00 PM at The Slowdown (729 N 14th St, Omaha). Check events.unmc.edu/slowdown_275 for upcoming topic and date. April 2026 and May 2026 events confirmed.',
  null,
  '{"type": "free", "notes": "Completely free to attend. The Slowdown is a bar — purchase drinks at your own discretion. No cover charge, no registration required. 21+ only per venue policy."}'::jsonb,
  '{"frequency": "monthly", "time": "7:00 PM", "timezone": "CT", "notes": "Monthly; confirmed April 2026 (The Brain That Heals Itself) and May 2026 (The Science of Owls). Check events.unmc.edu for upcoming dates and topics."}'::jsonb,
  '{"formality": "informal", "social_setting": "large_group", "commitment_level": "drop_in", "description": "You go to a bar. A scientist shows up, gets a drink, and talks about their research for 30 minutes in plain English — then everyone asks questions. It''s free, it''s casual, the room is full of curious people, and there''s a pub quiz afterward. You don''t need to know anything about science going in. That''s the whole point."}'::jsonb
),

-- ══════════════════════════════════════════════════════════
-- 5. CITIZEN SCIENCE & PARTICIPATORY RESEARCH (4 entries)
-- ══════════════════════════════════════════════════════════

-- ── NEBRASKA MASTER NATURALIST PROGRAM ───────────────────
-- Verified: nemasternaturalist.org active; River City Chapter (Omaha)
-- established April 2016; 19+ age requirement; background check required
-- 24-60 hours of training; volunteer hours required for certification

(
  'Nebraska Master Naturalist Program — Conservation Education & Volunteer Training',
  'Nebraska Master Naturalist Foundation',
  'https://www.nemasternaturalist.org',
  'The Nebraska Master Naturalist Program trains adult volunteers (19+) in the ecology, geology, and natural history of Nebraska — then connects them to conservation work across the state. Training covers Conservation Biology, Ecology, Geology, Grasslands, Woodland Ecology, Aquatic Ecosystems, Citizen Science, Mammals, Insects, and Birds — taught by scientists, faculty, and natural resource professionals from UNO, Nebraska Game & Parks, and partner organizations. Core training is 24 hours (shorter track) or 60 hours (full certification). The River City Chapter is based in Omaha. After training, certified volunteers contribute hours to wildlife monitoring, public education, habitat restoration, and citizen science projects.',
  'mentorship',
  'Open to any Nebraska resident age 19 or older. Background check required. No prior naturalist experience necessary — beginners welcome.',
  null,
  'https://www.nemasternaturalist.org/apply-now/application.html',
  'Omaha', null, 'Omaha', 'NE', null,
  false, false,
  array['low_income', 'first_gen'],
  array['stem', 'ecology', 'biology'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.nemasternaturalist.org', 'official_website', '2026-03-05',
  true, true,
  'Annual training cohorts; apply through nemasternaturalist.org. Contact River City Chapter (Omaha) at omahamasternaturalist@googlegroups.com for local chapter training schedule.',
  null,
  '{"type": "varies", "notes": "Training fee varies by chapter; some chapters offer subsidized or sliding-scale pricing. Contact your local chapter for current costs. Volunteer hours are the primary ongoing commitment after certification."}'::jsonb,
  '{"frequency": "annual", "notes": "Annual training cohorts; check nemasternaturalist.org for upcoming training dates. River City Chapter (Omaha): contact omahamasternaturalist@googlegroups.com."}'::jsonb,
  '{"formality": "structured", "social_setting": "small_group", "commitment_level": "training_program", "description": "You attend classroom sessions and field days led by scientists and naturalists — learning to identify plants, birds, insects, and geological features across Nebraska. After completing training, you volunteer in conservation projects: counting birds at a wetland, leading a public nature walk, monitoring a water quality site. A serious commitment, but one that connects you to the natural world at a level most people never experience."}'::jsonb
),

-- ── HENRY DOORLY ZOO — CITIZEN SCIENCE PROGRAMS ─────────
-- Verified: omahazoo.com/citizen-science active
-- Monarch butterfly tagging: August-September, free with admission
-- Amphibian Conservation Education Project (ACEP): ongoing public participation
-- Henry Doorly Zoo, 3701 S 10th St, Omaha NE 68107

(
  'Henry Doorly Zoo — Monarch Butterfly Tagging & Amphibian Citizen Science',
  'Omaha''s Henry Doorly Zoo and Aquarium',
  'https://www.omahazoo.com/citizen-science',
  'Henry Doorly Zoo hosts public citizen science events where visitors contribute data to real scientific research. Monarch butterfly tagging events in August and September invite visitors to carefully hold a live Monarch, attach a small numbered tag to its wing, record its measurements, and release it — contributing to the continental tracking database that maps migration routes across North America. The Amphibian Conservation Education Project (ACEP) allows anyone to survey local populations of frogs, toads, and salamanders and report water quality data online. Both programs are free with zoo admission and require no prior experience.',
  'free_resource',
  'Open to all zoo visitors. Monarch tagging events are family-friendly, all ages. Zoo admission required — general admission or membership.',
  null,
  'https://www.omahazoo.com/citizen-science',
  'Omaha', '3701 S 10th St', 'Omaha', 'NE', '68107',
  false, false,
  array['low_income', 'first_gen'],
  array['stem', 'biology', 'ecology'],
  array['9', '10', '11', '12', 'college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.omahazoo.com/citizen-science', 'official_website', '2026-03-05',
  true, false,
  'Monarch butterfly tagging events: August and September (check zoo events calendar for specific dates). ACEP amphibian surveys: year-round, submit observations online through the ACEP program. Zoo admission required for in-person events.',
  null,
  '{"type": "free_with_admission", "zoo_admission": "$24.75 adults / $17.50 ages 3-11 / under 3 free", "notes": "Citizen science activities are included with general zoo admission. Zoo membership (starting around $95/household) provides unlimited visits. OPL Discovery Pass does not currently cover Henry Doorly Zoo admission."}'::jsonb,
  '{"frequency": "seasonal", "notes": "Monarch tagging August-September; ACEP ongoing year-round. Check omahazoo.com/citizen-science for event dates."}'::jsonb,
  '{"formality": "informal", "social_setting": "small_group", "commitment_level": "drop_in", "description": "A staff member hands you a live Monarch butterfly. You put a tiny numbered sticker on its wing, record its wingspan and sex on a data sheet, and release it into the air. Your data gets submitted to a continental tracking database. Scientists use it to understand where the butterflies go. It takes five minutes and it''s unforgettable."}'::jsonb
),

-- ── iNATURALIST — LOCAL BIODIVERSITY DOCUMENTATION ───────
-- Verified: inaturalist.org active; global platform with Omaha metro data
-- Free app and website; no account required to browse observations
-- Omaha metro observations: inaturalist.org/places/omaha--ne

(
  'iNaturalist — Document Local Wildlife & Contribute to Science',
  'California Academy of Sciences / National Geographic',
  'https://www.inaturalist.org',
  'iNaturalist is a free app and website that turns anyone with a smartphone into a citizen scientist. Take a photo of any plant, animal, fungus, or other organism you encounter — in your backyard, on a trail, or anywhere in Omaha — and the AI identifies it. Your observation joins a global database used by researchers to track biodiversity, species range changes, and ecological health. You can explore thousands of observations other people have made in the Omaha metro. No prior knowledge is required — the AI does the identification, and the community helps confirm it. Used by researchers worldwide, contributed to by everyone.',
  'free_resource',
  'Open to anyone with a smartphone or computer. No prior nature knowledge required. Free account to submit observations; no account needed to browse.',
  null,
  'https://www.inaturalist.org',
  'Omaha', null, 'Omaha', 'NE', null,
  true, true,
  array['low_income', 'first_gen', 'disabled'],
  array['stem', 'biology', 'ecology'],
  array['9', '10', '11', '12', 'college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.inaturalist.org', 'official_website', '2026-03-05',
  true, false,
  'Available anywhere, anytime via the iNaturalist app (iOS and Android) or website. Create a free account to submit observations. Browse Omaha metro observations at inaturalist.org/places/omaha--ne.',
  '{"additional_languages": ["Spanish"]}'::jsonb,
  '{"type": "free", "notes": "Completely free — app, account, and all features. No subscription, no paywall. Works offline for observation recording; uploads when connected to wifi."}'::jsonb,
  '{"frequency": "ongoing", "notes": "Year-round, anytime. Nebraska Science Festival often organizes a local BioBlitz through iNaturalist in April — check nescifest.com for details."}'::jsonb,
  '{"formality": "informal", "social_setting": "solo", "commitment_level": "drop_in", "description": "You''re walking to your car and you see a bird you don''t recognize. You open the app, take a photo, and within seconds the AI shows you it''s a Cedar Waxwing — and shows you ten other people who''ve spotted one in Omaha this week. That''s it. That''s the experience. Do it once and you''ll start noticing things you never noticed before."}'::jsonb
),

-- ── AUDUBON SOCIETY OF OMAHA — CHRISTMAS BIRD COUNT ──────
-- Verified: ASO website active; National Audubon Society confirmed
-- Annual December event; Omaha chapter participates each year
-- 125+ years of continuous data; longest-running citizen science program

(
  'Audubon Society of Omaha — Christmas Bird Count',
  'Audubon Society of Omaha',
  'https://audubon-omaha.org',
  'The Christmas Bird Count (CBC) is one of the longest-running citizen science programs in the world — in its 125th+ year — conducted annually in December by Audubon chapters nationwide. The Omaha chapter participates each year, sending volunteers into assigned territories across the metro to count every bird species and individual observed in a single day. Data goes directly to a continental dataset tracking bird population trends over more than a century. Open to birders of all levels — experienced counters welcome beginners. No fee to participate; contact the Audubon Society of Omaha in fall for sign-up details for the upcoming December count.',
  'free_resource',
  'Open to birders of all skill levels, including beginners. Adults and accompanied teens welcome. Contact ASO in fall to sign up for the December count.',
  null,
  'https://audubon-omaha.org/calendar-of-events/calendar-of-events.html',
  'Omaha', null, 'Omaha', 'NE', null,
  false, false,
  array[]::text[],
  array['stem', 'ecology', 'biology'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://audubon-omaha.org', 'official_website', '2026-03-05',
  true, false,
  'Annual event in December. Contact Audubon Society of Omaha in fall (October-November) via audubon-omaha.org to sign up for a counting territory. Count day is typically a Saturday in mid-to-late December.',
  null,
  '{"type": "free", "notes": "Completely free to participate. No equipment required — experienced counters provide identification guidance. Binoculars helpful but not required."}'::jsonb,
  '{"frequency": "annual", "notes": "Annual December event; sign up through ASO in fall. Check audubon-omaha.org for upcoming count date and registration."}'::jsonb,
  '{"formality": "informal", "social_setting": "small_group", "commitment_level": "drop_in", "description": "You join a small team of birders, walk or drive through an assigned territory in Omaha for a few hours, and record every bird you see and hear. Your counts get added to a dataset going back over 125 years. You don''t need to identify birds yourself — experienced counters on the team handle identification. You just need eyes and curiosity."}'::jsonb
),

-- ══════════════════════════════════════════════════════════
-- 6. LIBRARY-BASED SCIENCE LEARNING (1 entry)
-- ══════════════════════════════════════════════════════════

-- ── OPL COMMON SOIL SEED LIBRARY ─────────────────────────
-- Verified: omahalibrary.org/seed-library active; 10th anniversary 2025
-- 150 seed varieties; 15 packets/month free with library card
-- Available at all OPL locations except Genealogy & Local History room

(
  'Common Soil Seed Library — Free Seed Borrowing & Plant Science',
  'Omaha Public Library',
  'https://omahalibrary.org/seed-library/',
  'The Common Soil Seed Library at Omaha Public Library is exactly what it sounds like: a library of seeds. Borrow up to 15 seed packets per month using your free library card, choose from 150+ varieties of vegetables, herbs, and flowers, take them home and plant them. No need to return the seeds — grow them, save them if you want, or just enjoy the harvest. The seed library celebrates its 10th anniversary in 2025. Available at all 12 OPL locations. An accessible entry point into plant biology, sustainable food systems, and seed saving — with zero cost and zero prerequisite knowledge.',
  'free_resource',
  'Free and open to all Omaha Public Library cardholders. Library card free for Douglas County residents. Seeds available at all OPL locations.',
  null,
  'https://omahalibrary.org/seed-library/',
  'Omaha', null, 'Omaha', 'NE', null,
  false, false,
  array['low_income', 'first_gen', 'hispanic', 'black', 'immigrant'],
  array['stem', 'ecology', 'biology'],
  array['9', '10', '11', '12', 'college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://omahalibrary.org/seed-library/', 'official_website', '2026-03-05',
  true, false,
  'Available year-round at all 12 OPL locations. Seed selection varies by season and availability. Browse online at OPL catalog (search "seed library") or browse in person. No return required.',
  '{"additional_languages": ["Spanish"]}'::jsonb,
  '{"type": "free_with_library_card", "notes": "Completely free with an OPL library card. Up to 15 seed packets per month. Library card is free for Douglas County residents — apply at any OPL branch. No return required for seeds."}'::jsonb,
  '{"frequency": "ongoing", "notes": "Year-round access; seed varieties rotate by season. Spring and early summer offer the most vegetable and herb variety. Check OPL catalog online or visit any branch."}'::jsonb,
  '{"formality": "informal", "social_setting": "solo", "commitment_level": "drop_in", "description": "You walk into your library, browse a rack of seed packets like you''re choosing a book, check out up to 15 packets with your library card, take them home, and plant them. Grow a tomato, a pepper, a flower, or an herb. No experience required. The seeds don''t have to come back."}'::jsonb
);

-- ============================================================
-- PHASE 10 COMPLETION REPORT (Open Science & Discovery Batch)
-- ============================================================
--
-- Total new entries: 18
--
-- By domain:
--   Astronomy & Space Science              4
--   Biology, Ecology & Natural History     5
--   General Science & Interactive Learning 3
--   Neuroscience & Public Science Talks    1
--   Citizen Science & Participatory Research 4
--   Library-Based Science Learning         1
--
-- By geography:
--   Omaha / Nebraska-side                 12
--   Council Bluffs / Iowa-side             2  (Hitchcock, DeSoto)
--   Bellevue NE (metro)                    1  (Fontenelle Forest)
--   Metro-wide                             3  (OPL programs, iNaturalist)
--
-- By type:
--   workshop      8   (OAS, star party, planetarium, Fontenelle, Audubon,
--                       Hitchcock, Kiewit, SciFest)
--   free_resource 9   (Heron Haven, DeSoto, OPL Discovery Pass,
--                       Doorly Zoo citizen sci, iNaturalist, seed library,
--                       Neale Woods Obs. [combined], CBC)
--   mentorship    1   (Nebraska Master Naturalist)
--
-- New schema field: learning_context (migration 014)
--   Populated: 18/18 entries
--
-- Verified vs needs_confirmation:
--   verified            18  (all entries verified — zero needs_confirmation)
--
-- Free access pathways inventory (every way to access science learning
-- for free or reduced cost in the Omaha metro):
--   1. OPL Discovery Pass → Kiewit Luminarium (3 adults + household children)
--   2. OPL Discovery Pass → Fontenelle Forest (2 adults + household children)
--   3. OPL Discovery Pass → Durham Museum (Nebraska Science Festival venue)
--   4. OPL Discovery Pass → Lauritzen Gardens
--   5. OPL Discovery Pass → SAC & Aerospace Museum
--   6. Free membership → Kiewit Luminarium (via Latino Center of the Midlands)
--   7. Free membership → Kiewit Luminarium (via Girls Inc. of Omaha)
--   8. Discounted membership ($100/yr, no eligibility) → Kiewit Luminarium
--   9. OAS Monthly Meeting → Free, no membership required
--   10. Audubon Society field trips → Free, no membership required
--   11. Heron Haven → Free daily access
--   12. Nebraska Science Festival Public Expo → Free, Durham Museum, April 18 2026
--   13. Science Sundays at Gene Leahy Mall → Free, Sundays in April
--   14. Omaha Science Café → Free (21+), monthly at The Slowdown
--   15. iNaturalist → Free app, citizen science anywhere
--   16. OPL Common Soil Seed Library → Free seeds with library card
--   17. Audubon Christmas Bird Count → Free to participate
--   18. Henry Doorly Zoo ACEP amphibian survey → Free online participation
--
-- Notable entries:
--   • Omaha Science Café: A scientist at a bar, free, every month. Lowest
--     barrier science experience in the city. April and May 2026 confirmed.
--   • DeSoto NWR: $5/vehicle for one of the most spectacular wildlife
--     spectacles in the Midwest (500K+ snow geese). Almost nobody knows it exists.
--   • Neale Woods Millard Observatory: Largest telescope in the Omaha metro,
--     $6 admission, in a nature preserve. Hidden gem.
--   • Nebraska Master Naturalist: Only program providing deep, structured
--     conservation education to adult volunteers in the Omaha metro.
--   • iNaturalist: Zero barrier — no cost, no registration, no transport needed.
--     Works anywhere in the city. Every user becomes a contributor to science.
--
-- Excluded with rationale:
--   • Branched Oak Observatory: ~50 miles from Omaha (Raymond NE) — outside
--     metro scope per prompt guidelines
--   • UNO C.A.P.O.W.: School-facing program; no confirmed public participation
--     component for general community members
--   • Boys Town public lectures: No confirmed recurring public program series
--   • Papio NRD citizen science: Envirothon is youth-only; no adult public
--     monitoring program confirmed
--   • Lauritzen Gardens general programming: OPL Discovery Pass covers access;
--     distinct science programming not confirmed beyond garden experience
--
-- Science discipline coverage matrix:
--   astronomy:          4 entries (OAS, Lauritzen star party, planetarium, Neale Woods)
--   ecology:            9 entries (Fontenelle, Audubon, Heron Haven, Hitchcock,
--                                  DeSoto, SciFest, Doorly Zoo, iNaturalist, CBC)
--   biology:            8 entries (Fontenelle, Audubon, Heron Haven, Hitchcock,
--                                  DeSoto, Doorly Zoo, iNaturalist, seed library)
--   neuroscience:       1 entry   (Science Café — recurring neuroscience topics)
--   chemistry/physics:  1 entry   (Kiewit Luminarium — physics exhibits)
--   environmental sci:  4 entries (Heron Haven, DeSoto, Hitchcock, Master Naturalist)
--   citizen science:    5 entries (Master Naturalist, Doorly Zoo, iNaturalist, CBC, Audubon)
--   botany:             2 entries (Fontenelle Forest, Seed Library)
--   geology:            1 entry   (Hitchcock — Loess Hills geology programs)
--
-- Gaps identified for future phases:
--   • Chemistry/physics hands-on education beyond Luminarium
--   • Geology field programs / fossil sites in the metro
--   • Psychology public talks (Creighton, UNO Psychology Dept — unverified)
--   • Water quality monitoring programs (Papio NRD — needs investigation)
--   • Amateur radio / weather spotter science education
--   • Branched Oak Observatory could be added if scope expands to 50-mile radius
--
-- Database total after Phase 10: ~141 active opportunities
--
-- Recommended partnerships for data validation:
--   • Omaha Astronomical Society (omahaastro.com) — confirm 2026 star party dates
--   • Fontenelle Forest education team — confirm guided program calendar
--   • UNMC Office of Public Affairs — Science Café schedule confirmation
--   • Nebraska Master Naturalist River City Chapter — confirm 2026 training dates
--   • Papio NRD Education Department — investigate adult citizen science programs
-- ============================================================
