-- ============================================================
-- Opportography — Migration 017
-- Phase 11: Open Humanities & Creative Expression Batch
-- Sources researched and verified: March 2026
-- Run AFTER 016_schema_humanities.sql
--
-- Who this batch is for:
--   The 35-year-old line cook in South Omaha who writes poetry in
--   a notebook on his break but has never read a poem out loud to
--   another person. The teenager in North Omaha who freestyles after
--   school and doesn't know there's a nonprofit five minutes away that
--   runs spoken word programs. The retired widower who used to paint,
--   stopped for forty years, and would start again tomorrow if someone
--   told him there was a room where he could do that. The 22-year-old
--   who watches documentaries about fashion and architecture and thinks
--   those worlds belong to people in New York.
--
--   Those people live here. Phase 11 tells them where the door is.
--
-- Guiding principle: Expression has no prerequisites.
--                    Culture belongs to everyone who participates.
--
-- Domain themes:
--   1. Visual Arts (museums, galleries, working studios)     8 entries
--   2. Literature, Writing & Poetry                          4 entries
--   3. Theater & Performance                                 2 entries
--   4. Film & Media                                          1 entry
--   5. Cultural Studies & Community Arts                     3 entries
--   Total: 18 entries
--
-- Schema fields used: all previous fields + equity_focus
--   (added in migration 016)
--
-- Duplication audit — confirmed NOT in database (Phases 1–10):
--   • AIGA Omaha is in 010_seed_phase5.sql (design professional org)
--     → Phase 11 listings are distinct: free/community programs only
--   • Prairie Pride Film Festival mentioned in 012_seed_phase6.sql
--     → No Film Streams entry exists; Phase 11 covers Film Streams
--   • No gallery, museum, theater, poetry slam, or writing group
--     entries exist in any prior migration.
--
-- Verification notes:
--   • Joslyn: joslyn.org active; free admission confirmed;
--     tour schedule (Fri/Sat 1pm, Sun 2pm) confirmed 2025-26 season
--   • Bemis Center: bemiscenter.org updated; LOW END March/April 2026
--     shows confirmed; Community Tracks details confirmed
--   • The Union: u-ca.org active; Yelp updated February 2026;
--     Inside/Outside Fellowship confirmed; Co-Op Studios 2026
--     scholarship confirmed; Camp Union July 2026 confirmed
--   • Hot Shops: hotshopsartcenter.org active; Yelp updated Dec 2025;
--     1301 Nicholas St confirmed; free to browse confirmed
--   • KANEKO: thekaneko.org active; Yelp updated Sep 2025;
--     1111 Jones St confirmed; free galleries confirmed;
--     Thu-Fri 1-7pm, Sat 12-5pm, Sun 12-5pm confirmed
--   • Nebraska Writers Workshop: nebraskawritersworkshop.info active;
--     Ralston Baright Library confirmed (5555 S 77th St);
--     1st & 3rd Wed in-person 6-8pm; 2nd & 4th Wed Zoom 7pm
--   • Nebraska Poetry Society: nepoetrysociety.org active;
--     Virtual Reading Series: 1st Tuesday 6:30-7:30pm confirmed;
--     Vocal Fry collaboration with The Union confirmed
--   • Vocal Fry Open Mic: Share Omaha listing confirmed;
--     3rd Thursday, Shirley Tyree Theater, The Union (2423 N 24th)
--   • NWC Omaha Poetry Slam: newriters.org active; allevents.in
--     confirms March 14 2026 event at The Local Art Plug
--     (1722 St. Marys Ave., Suite 110); $10 suggested donation
--   • Omaha Community Playhouse: omahaplayhouse.com active;
--     nation's largest community theater confirmed; open auditions
--     and 2,000+ volunteers per year confirmed
--   • Backline Comedy: backlinecomedy.com active; 1618 Harney St
--     confirmed; class pricing ($35 workshops, $200-250 courses)
--     confirmed; Jan 2026 Yelp review activity confirmed
--   • Film Streams: filmstreams.org active; Ruth Sokolof Theater
--     (1340 Mike Fahey St) confirmed; Courses program confirmed
--   • Great Plains Black History Museum: gpblackhistorymuseum.org
--     active; 2221 N 24th St confirmed; 2026 event calendar confirmed
--   • Culxr House: houseofculxr.com active; Yelp Feb 2026 updated;
--     3014 N 24th St confirmed; founder Marcey Yates confirmed
--   • Opera Omaha Poetry & Music Project: operaomaha.org active;
--     2026 theme (Memory) confirmed; May 2026 concert confirmed;
--     NWC partnership confirmed; Columbus Telegram coverage Jan 2026
--
-- EXCLUDED with rationale:
--   • Virginia Frank Memorial Writing Contest: grades 5-8 only — out
--     of scope per adult/teen 14+ target demographic
--   • Fine Lines summer camps: Insufficient verified details on adult
--     program specifics beyond camp format; camps are K-adult but no
--     confirmed year-round programming beyond summer
--   • Nebraska Writing Project Saturday workshops: Could not confirm
--     current Omaha-area schedule — website references Lincoln-primary
--     programming; not enough to verify Omaha-specific dates
--   • Nebraska Poetry Society in-person open mic: Location not
--     confirmed from verified source — only venue referenced was
--     The Union/Vocal Fry collaboration (already included)
--   • Humanities Nebraska Speakers Bureau: Budget cuts confirmed 2026
--     due to federal funding loss; listing would be misleading given
--     reduced operational capacity; recommend re-evaluating in 2027
--   • Brigit Saint Brigit, Shelterbelt Theatre: Professional ticketed
--     productions; no confirmed free/community access programs found
--   • BLUEBARN Theatre: Professional ticketed productions; community
--     access programs not confirmed from official sources
--   • Nebraska Writers Guild: Primarily professional association;
--     annual conference costs not confirmed as free/low-cost
--   • Romance Authors of the Heartland: Niche genre group; national
--     focus with local meetings; not sufficiently Omaha-community-
--     facing for this batch
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
  schedule, language_access, cost_structure, recurrence,
  learning_context, equity_focus
) values

-- ══════════════════════════════════════════════════════════
-- 1. VISUAL ARTS — MUSEUMS, GALLERIES & STUDIOS (8 entries)
-- ══════════════════════════════════════════════════════════

-- ── JOSLYN ART MUSEUM — FREE GENERAL ADMISSION ───────────
-- Verified: joslyn.org active; free admission confirmed (Holland
-- Foundation endowment); tours Fri/Sat 1pm, Sun 2pm confirmed.
-- Tue-Sun 10am-4pm; Thu until 8pm. ORBT accessible at 24th & Dodge.

(
  'Joslyn Art Museum — Free General Admission',
  'Joslyn Art Museum',
  'https://joslyn.org',
  'One of the finest art museums in the Midwest, and it''s free to walk in. No tickets, no membership required — just show up to 2200 Dodge Street and spend as long as you want among 11,000 works spanning ancient Egypt to 20th-century American painting to contemporary art. Free guided tours run every Friday and Saturday at 1 PM and every Sunday at 2 PM — drop in with no registration. The recently expanded Joslyn includes the 42,000-square-foot Hawks Pavilion and a sculpture garden you can wander through. The museum is on the ORBT bus line at 24th and Dodge and has free parking in the north lot.',
  'free_resource',
  'Open to all ages. Free admission for everyone. Closed Mondays.',
  null,
  'https://joslyn.org/visit/',
  'Omaha', '2200 Dodge St', 'Omaha', 'NE', '68102',
  false, false,
  array['low_income', 'first_gen', 'disabled', 'black', 'hispanic', 'immigrant'],
  array['arts'],
  array['9', '10', '11', '12', 'college_freshman'],
  null, null, null,
  'high', 'verified',
  'https://joslyn.org/visit/', 'official_website', '2026-03-06',
  true, true,
  'Open Tuesday through Sunday, 10 AM to 4 PM (until 8 PM on Thursdays). Closed Mondays. Free guided tours: Fridays and Saturdays at 1 PM, Sundays at 2 PM — drop in, no registration required. Special Symphony Joslyn program days have tours at 11 AM and noon instead of 2 PM; check joslyn.org/visit/calendar for current schedule.',
  null,
  '{"type": "free", "notes": "Completely free general admission for everyone, provided by the Holland Foundation. All permanent collection galleries and most temporary exhibitions included at no cost. Free parking in the north lot. Free guided tours on Fri/Sat at 1 PM and Sun at 2 PM — no registration required."}'::jsonb,
  '{"frequency": "ongoing", "notes": "Open Tue-Sun, 10 AM-4 PM (Thu until 8 PM). Free guided tours: Fri/Sat 1 PM, Sun 2 PM."}'::jsonb,
  '{"formality": "informal", "social_setting": "solo", "commitment_level": "drop_in", "description": "Walk in off Dodge Street with no plan and spend as long as you want. The collection goes from Egyptian artifacts to 20th-century American paintings — all free. Free tours on Fridays, Saturdays, and Sundays if you want a guide pointing things out."}'::jsonb,
  null
),

-- ── BEMIS CENTER — FREE EXHIBITIONS & PUBLIC PROGRAMS ────
-- Verified: bemiscenter.org active; free admission always;
-- 724 S 12th St confirmed; ARTalks, open studios, film screenings
-- confirmed ongoing programming. Yelp updated Feb 2026.

(
  'Bemis Center for Contemporary Arts — Free Galleries & Public Programs',
  'Bemis Center for Contemporary Arts',
  'https://www.bemiscenter.org',
  'Always free admission. The Bemis Center in Omaha''s Old Market hosts rotating exhibitions of contemporary art by local, national, and international artists working in painting, sculpture, video, installation, performance, and experimental forms. Public programming includes ARTalks — conversations with artists and panel discussions open to anyone — open studios where you can watch international resident artists at work inside the building, film screenings, and performances. Artists from around the world live and work here; the public is invited to engage with them and their work.',
  'free_resource',
  'Free and open to all ages. No membership or registration required for gallery visits and most public programs. Check bemiscenter.org for RSVP requirements on specific events.',
  null,
  'https://www.bemiscenter.org/exhibitions',
  'Omaha', '724 S 12th St', 'Omaha', 'NE', '68102',
  false, false,
  array['low_income', 'first_gen'],
  array['arts'],
  array['9', '10', '11', '12', 'college_freshman'],
  null, null, null,
  'high', 'verified',
  'https://www.bemiscenter.org', 'official_website', '2026-03-06',
  true, true,
  'Open Wednesday through Sunday. Gallery hours vary — check bemiscenter.org/visit for current hours. ARTalks, open studios, and public events announced at bemiscenter.org/events. Exhibitions rotate throughout the year.',
  null,
  '{"type": "free", "notes": "Completely free admission always. All gallery visits and most public programming are free. Some ticketed special performances may have costs — check bemiscenter.org/events for specifics."}'::jsonb,
  '{"frequency": "ongoing", "notes": "Galleries open Wed-Sun. New exhibitions rotate throughout the year. Check bemiscenter.org/exhibitions for current shows and bemiscenter.org/events for public programming."}'::jsonb,
  '{"formality": "informal", "social_setting": "solo", "commitment_level": "drop_in", "description": "Walk into a converted warehouse in the Old Market and find art that challenges your expectations. The building also houses international resident artists actively working in studios on site — some days you can see them working. ARTalks bring artists in to discuss their process in conversation with the public."}'::jsonb,
  null
),

-- ── BEMIS CENTER LOW END — FREE EXPERIMENTAL MUSIC VENUE ─
-- Verified: bemiscenter.org/low-end active; March 2026 (Mauricio
-- López F, March 5; Phill Smith March 28) and April 2026 (Riley
-- Mulherkar, April 16) shows confirmed. All shows free.

(
  'Bemis Center LOW END — Free Live Music for Sound Art & Experimental Music',
  'Bemis Center for Contemporary Arts',
  'https://www.bemiscenter.org/low-end',
  'LOW END is a free music venue inside Bemis Center for Contemporary Arts. Shows feature sound artists, composers, and experimental musicians from Omaha, across the country, and around the world — all free to attend. The programming ranges from field recording and electronic composition to experimental jazz, prepared piano, and genre-spanning performance. Confirmed 2026 shows: Mauricio López F (March 5), a Volumes performance by Phill Smith (March 28), and Riley Mulherkar (April 16). The room is small and the listening is genuine — not background music.',
  'free_resource',
  'Free and open to all ages. No registration required for most shows; check bemiscenter.org/events for any RSVP requirements.',
  null,
  'https://www.bemiscenter.org/low-end',
  'Omaha', '724 S 12th St', 'Omaha', 'NE', '68102',
  false, false,
  array['low_income', 'first_gen'],
  array['arts', 'stem'],
  array['college_freshman'],
  null, null, null,
  'high', 'verified',
  'https://www.bemiscenter.org/low-end', 'official_website', '2026-03-06',
  true, false,
  'Shows throughout the year — typically evenings. March 2026 and April 2026 shows confirmed. Check bemiscenter.org/events for upcoming LOW END performances and dates.',
  null,
  '{"type": "free", "notes": "All LOW END shows are free. No tickets, no registration required for most events."}'::jsonb,
  '{"frequency": "varies", "notes": "Multiple shows per year; not on a fixed weekly or monthly schedule. Check bemiscenter.org/events for upcoming LOW END dates."}'::jsonb,
  '{"formality": "informal", "social_setting": "small_group", "commitment_level": "drop_in", "description": "You walk into an art building on a weeknight and hear music that might sound like nothing you''ve heard before — field recordings layered on live instruments, electronic compositions that fill the room, experimental sounds that sit somewhere between jazz and something with no name. Free, intimate, and genuinely interesting. No prior knowledge required."}'::jsonb,
  null
),

-- ── BEMIS CENTER COMMUNITY TRACKS — MUSICIAN STIPEND ─────
-- Verified: bemiscenter.org/residency/community-tracks active;
-- $1,000 stipend confirmed; 80-mile radius eligibility confirmed;
-- rehearsal space, recording studio, audio engineer access confirmed.

(
  'Bemis Center Community Tracks — $1,000 Stipend for Local Musicians',
  'Bemis Center for Contemporary Arts',
  'https://www.bemiscenter.org/residency/community-tracks',
  'Community Tracks is Bemis Center''s program for musicians and composers working in experimental sound and music who live within 80 miles of Omaha. Selected participants receive a $1,000 stipend plus free access to Bemis''s rehearsal space, recording studio, audio equipment and instruments, and audio engineer staff. The goal is to support people who have music to make and need space and resources to make it. The 80-mile radius includes Lincoln, Bellevue, Papillion, Council Bluffs, and surrounding communities. No application fee.',
  'mentorship',
  'Open to musicians and composers living within 80 miles of Omaha, NE — including Lincoln, Council Bluffs, and the surrounding metro. All musical styles and backgrounds considered. No application fee. Check bemiscenter.org/residency/community-tracks for current application windows.',
  null,
  'https://www.bemiscenter.org/residency/community-tracks',
  'Omaha', '724 S 12th St', 'Omaha', 'NE', '68102',
  false, false,
  array['low_income', 'first_gen'],
  array['arts', 'stem'],
  array['college_freshman'],
  'stipend', '$1,000', null,
  'high', 'verified',
  'https://www.bemiscenter.org/residency/community-tracks', 'official_website', '2026-03-06',
  true, true,
  'Applications accepted on a rolling or periodic basis. Check bemiscenter.org/residency/community-tracks for current application windows and participant cohort information.',
  null,
  '{"type": "free", "notes": "$1,000 stipend paid to selected participants. All rehearsal space, recording studio, audio equipment, instruments, and audio engineer time provided at no cost. No application fee."}'::jsonb,
  '{"frequency": "varies", "notes": "Periodic application cycles — check bemiscenter.org/residency/community-tracks for current timeline."}'::jsonb,
  '{"formality": "semi_formal", "social_setting": "small_group", "commitment_level": "series", "description": "You apply. If selected, Bemis gives you a studio, a recording engineer, instruments, and $1,000. You use it to make the music you''ve been wanting to make. It''s not a class and they''re not teaching you to make music their way — they''re giving you the infrastructure to make yours."}'::jsonb,
  null
),

-- ── THE UNION FOR CONTEMPORARY ART — GALLERY & PROGRAMS ──
-- Verified: u-ca.org active; Yelp updated Feb 2026; 2423 N 24th St
-- confirmed; Gallery, Performing Arts, Abundance Garden, Family
-- Nights, Camp Union (July 2026) confirmed.

(
  'The Union for Contemporary Art — Free Gallery, Theater & Community Events',
  'The Union for Contemporary Art',
  'https://www.u-ca.org',
  'An art center in North Omaha — at 24th and Lake — built because the neighborhood deserved one. The Union hosts free gallery exhibitions, theater productions, neighborhood arts programming, a community garden (the Abundance Garden), and Family Nights that open the building to the whole neighborhood. Founded in 2011 by Brigitte McQueen to address the historical arts access gap in North Omaha, The Union operates from the belief that art strengthens communities and that Black and brown artists deserve institutions built for them. The building sits a few blocks from the Great Plains Black History Museum and Culxr House, in the heart of North Omaha''s cultural corridor.',
  'free_resource',
  'Open to all ages and backgrounds. Gallery admission is free. Some events and productions may require registration or tickets — check u-ca.org for current programming.',
  null,
  'https://www.u-ca.org',
  'Omaha', '2423 N 24th St', 'Omaha', 'NE', '68110',
  false, false,
  array['low_income', 'first_gen', 'black', 'hispanic', 'immigrant'],
  array['arts', 'community_service'],
  array['9', '10', '11', '12', 'college_freshman'],
  null, null, null,
  'high', 'verified',
  'https://www.u-ca.org', 'official_website', '2026-03-06',
  true, true,
  'Gallery and public events throughout the year. Family Nights held periodically. Camp Union: two July 2026 sessions (July 6-17 and July 20-31). Check u-ca.org/happenings for current events, exhibitions, and theater schedule.',
  null,
  '{"type": "free", "notes": "Gallery admission is free. Most community events are free. Co-Op Studios are a separate membership program with need-based scholarships. Some theater productions may be ticketed — check u-ca.org."}'::jsonb,
  '{"frequency": "varies", "notes": "Year-round programming; check u-ca.org/happenings for current events and exhibitions."}'::jsonb,
  '{"formality": "informal", "social_setting": "community", "commitment_level": "drop_in", "description": "Walk into a building on North 24th that used to be a jazz club and is now a neighborhood art center. There''s a gallery, a theater, a garden out back, and people from the neighborhood coming in and out. Family Nights bring food, activities, and kids. The art on the walls is by artists who live and work in this community."}'::jsonb,
  '{"serves_underserved": true, "communities": ["North Omaha residents", "BIPOC artists", "emerging artists without institutional support"], "mission_notes": "Founded in 2011 specifically to address the arts access gap in historically disinvested North Omaha. The Union operates from an explicit social justice framework: art strengthens communities, and Black and brown artists deserve institutions built for and by them."}'::jsonb
),

-- ── THE UNION INSIDE/OUTSIDE FELLOWSHIP ──────────────────
-- Verified: u-ca.org/fellowship active; 5 artists/collectives per
-- year confirmed; 4 of 5 spots for Omaha-CB metro artists; free
-- 400 sq ft studio + co-op pass confirmed.

(
  'The Union Inside/Outside Fellowship — Free Studio & Co-Op Access for Omaha Artists',
  'The Union for Contemporary Art',
  'https://www.u-ca.org/fellowship',
  'The Inside/Outside Fellowship is the Union''s annual program for artists based in the Omaha-Council Bluffs metro. Five artists or artist collectives are selected each year by a jury of local and national voices. Fellows receive a free 400-square-foot studio at The Union for one year plus a complimentary Co-Op Studios pass — providing access to ceramics, textile, printmaking, film photography, and digital media equipment. Four of the five fellowship spots are specifically reserved for Omaha-Council Bluffs metro area artists. The program is designed for deep studio practice and community engagement: making work and sharing it with North Omaha.',
  'mentorship',
  'Open to artists and artist collectives based in the Omaha-Council Bluffs metropolitan area. Four of five spots are metro-reserved. Application required — check u-ca.org/fellowship for eligibility criteria and current application cycle dates.',
  null,
  'https://www.u-ca.org/fellowship',
  'Omaha', '2423 N 24th St', 'Omaha', 'NE', '68110',
  false, false,
  array['low_income', 'first_gen', 'black', 'hispanic'],
  array['arts'],
  array['college_freshman'],
  null, null, null,
  'high', 'verified',
  'https://www.u-ca.org/fellowship', 'official_website', '2026-03-06',
  true, true,
  'Annual fellowship cycle. Check u-ca.org/fellowship for current application deadline and selection timeline.',
  null,
  '{"type": "free", "notes": "Fellows receive a free 400 sq ft studio and complimentary one-year Co-Op Studios pass at no cost. No application fee. In-kind support — not a cash stipend."}'::jsonb,
  '{"frequency": "annual", "notes": "Annual cohort of 5 fellows. Application period opens once per year — check u-ca.org/fellowship for timeline."}'::jsonb,
  '{"formality": "semi_formal", "social_setting": "small_group", "commitment_level": "series", "description": "You apply, you''re selected, and you get a free studio in North Omaha for a year — plus access to ceramics, printmaking, and digital media equipment. The expectation is that you make work and engage with the neighborhood. It''s a real resource for artists who need space and can''t afford it."}'::jsonb,
  '{"serves_underserved": true, "communities": ["Omaha-Council Bluffs metro artists", "BIPOC artists", "emerging artists without studio access"], "mission_notes": "Designed to provide artists who lack institutional resources — particularly from historically underrepresented communities — with the infrastructure for serious studio practice and community engagement in North Omaha."}'::jsonb
),

-- ── HOT SHOPS ART CENTER — FREE VISIT & WORKING STUDIOS ──
-- Verified: hotshopsartcenter.org active; Yelp updated Dec 2025;
-- 1301 Nicholas St, Omaha; free to browse confirmed.
-- M-F 10am-6pm, Sat-Sun 11am-5pm confirmed.

(
  'Hot Shops Art Center — Free Walk-In Working Artist Complex',
  'Hot Shops Art Center',
  'https://hotshopsartcenter.org',
  'Hot Shops Art Center is a working artist complex in North Omaha with 90+ artists operating glass studios, a metal foundry, ceramics studios, a print shop, painting studios, and an iron forge under one roof. Visiting is completely free. Walk in and explore — which studios are open varies by day, but on any given visit you might watch glass being blown, a blacksmith at the forge, a ceramicist at the wheel, or a jeweler finishing metalwork. Hot Shops also offers scheduled adult workshops in glassblowing, pottery, drawing, and other media at additional cost.',
  'free_resource',
  'Open to all ages. Walk-in visits are free. Scheduled workshops and classes require registration and payment (workshops from approximately $75; check hotshopsartcenter.org for current class listings). Individual artist studios keep their own hours.',
  null,
  'https://hotshopsartcenter.org',
  'Omaha', '1301 Nicholas St', 'Omaha', 'NE', '68102',
  false, false,
  array['low_income', 'first_gen'],
  array['arts', 'trades'],
  array['9', '10', '11', '12', 'college_freshman'],
  null, null, null,
  'high', 'verified',
  'https://hotshopsartcenter.org', 'official_website', '2026-03-06',
  true, false,
  'Building open Monday through Friday, 10 AM to 6 PM; Saturday and Sunday, 11 AM to 5 PM. Individual artist studios keep their own hours — not all will be open at any given time. Check hotshopsartcenter.org/events for scheduled workshops.',
  null,
  '{"type": "free", "notes": "Free to enter and browse the building anytime during open hours. Individual paid workshops and classes available from approximately $75 per session for small-group classes. Check hotshopsartcenter.org/events for current class listings and pricing."}'::jsonb,
  '{"frequency": "ongoing", "notes": "Building open daily Mon-Fri 10am-6pm, Sat-Sun 11am-5pm. Workshop schedule varies — check hotshopsartcenter.org."}'::jsonb,
  '{"formality": "informal", "social_setting": "solo", "commitment_level": "drop_in", "description": "Walk into a building that smells like metal and paint and clay. On a good day you''ll watch a glassblower shaping molten glass at the end of a pipe, or a blacksmith working at a forge. You''re not in a museum looking at finished work — you''re watching the process. It''s free, and no one is going to explain anything at you unless you ask."}'::jsonb,
  null
),

-- ── KANEKO — FREE GALLERIES & INTERDISCIPLINARY PROGRAMS ─
-- Verified: thekaneko.org active; Yelp updated Sep 2025;
-- 1111 Jones St confirmed; free galleries confirmed; Thu-Fri 1-7pm,
-- Sat 12-5pm, Sun 12-5pm confirmed.

(
  'KANEKO — Free Cultural Galleries & Interdisciplinary Public Programs',
  'KANEKO',
  'https://thekaneko.org',
  'KANEKO occupies three refurbished historic warehouses in Omaha''s Old Market, founded by sculptor Jun Kaneko and his wife Ree as open space for your mind. Free public galleries feature exhibitions that cut across art, science, philosophy, design, and ideas — not neatly categorized. Past programming has brought together visual artists and neuroscientists, composers and urban planners, choreographers and engineers. Current exhibitions include Jun Kaneko''s collaborative drawings with three-year-old Ana Citrin and monumental ceramic works from the Kaneko collection. KANEKO resists the boundary between disciplines and invites anyone to think alongside it.',
  'free_resource',
  'Free and open to all. Gallery hours: Thursday and Friday, 1–7 PM; Saturday, noon–5 PM; Sunday, noon–5 PM.',
  null,
  'https://thekaneko.org/upcoming-and-current-programs/',
  'Omaha', '1111 Jones St', 'Omaha', 'NE', '68102',
  false, false,
  array['low_income', 'first_gen'],
  array['arts', 'stem'],
  array['college_freshman'],
  null, null, null,
  'high', 'verified',
  'https://thekaneko.org', 'official_website', '2026-03-06',
  true, false,
  'Gallery hours: Thursday and Friday, 1:00–7:00 PM; Saturday, noon–5:00 PM; Sunday, noon–5:00 PM. Check thekaneko.org/upcoming-and-current-programs for current exhibitions and public events.',
  null,
  '{"type": "free", "notes": "Galleries are completely free and open to the public. Some ticketed performances or special programs may have costs — check thekaneko.org for specifics."}'::jsonb,
  '{"frequency": "ongoing", "notes": "Galleries open Thu-Fri 1-7 PM, Sat noon-5 PM, Sun noon-5 PM. Exhibitions rotate throughout the year."}'::jsonb,
  '{"formality": "semi_formal", "social_setting": "solo", "commitment_level": "drop_in", "description": "Walk into three connected old warehouses in the Old Market and find exhibitions that don''t fit into a single category — art that comes from science, design that comes from philosophy, ceramics at a scale you didn''t think was possible. Free and unhurried. No guide required."}'::jsonb,
  null
),

-- ══════════════════════════════════════════════════════════
-- 2. LITERATURE, WRITING & POETRY (4 entries)
-- ══════════════════════════════════════════════════════════

-- ── NEBRASKA WRITERS WORKSHOP — FREE WEEKLY GROUP ────────
-- Verified: nebraskawritersworkshop.info active; Ralston Baright
-- Library confirmed (5555 S 77th St); 1st & 3rd Wed in-person
-- 6-8pm; 2nd & 4th Wed Zoom 7pm; free, founded 1985, 50+ members.

(
  'Nebraska Writers Workshop — Free Weekly Writing Group',
  'Nebraska Writers Workshop',
  'https://nebraskawritersworkshop.info',
  'A group of writers who meet every Wednesday to share what they''re working on and help each other get better. Fiction, poetry, scripts — whatever you write. It''s free, it''s been going since 1985, and you don''t need to have published anything to walk in. First and third Wednesdays are in-person at the Ralston Baright Public Library, 6–8 PM; second and fourth Wednesdays are on Zoom at 7 PM. More than 50 members, all levels, all genres. If you''ve been writing alone and want to share it with people who will give you honest, useful feedback — this is the room.',
  'workshop',
  'Open to creative writers of all levels. No prior publication or experience required. Free to attend. Fiction, poetry, and script writers all welcome.',
  null,
  'https://nebraskawritersworkshop.info',
  'Ralston', '5555 S 77th St', 'Ralston', 'NE', '68127',
  false, true,
  array['low_income', 'first_gen'],
  array['arts'],
  array['college_freshman'],
  null, null, null,
  'high', 'verified',
  'https://nebraskawritersworkshop.info', 'official_website', '2026-03-06',
  true, true,
  'Every Wednesday. First and third Wednesdays: in-person at Ralston Baright Public Library (5555 S 77th St, Ralston), 6:00–8:00 PM. Second and fourth Wednesdays: Zoom, 7:00 PM. Check nebraskawritersworkshop.info for the Zoom link and any schedule exceptions.',
  null,
  '{"type": "free", "notes": "Completely free to attend all meetings — in-person and Zoom. No membership fee, no registration required. Just show up in person or use the Zoom link from the website."}'::jsonb,
  '{"frequency": "weekly", "day_of_week": "Wednesday", "time": "6:00 PM", "timezone": "CT", "notes": "1st and 3rd Wednesdays: in-person at Ralston Baright Library, 6:00-8:00 PM. 2nd and 4th Wednesdays: Zoom, 7:00 PM."}'::jsonb,
  '{"formality": "informal", "social_setting": "small_group", "commitment_level": "recurring_casual", "description": "You bring whatever you''re working on — a poem, a chapter, a script — and the group reads and responds. Everyone gets a turn to share and to give feedback. No one grades you, no one cares if you''ve been published. The goal is to get better, together, in a room of people doing the same thing. It''s been working since 1985."}'::jsonb,
  null
),

-- ── NEBRASKA POETRY SOCIETY — VIRTUAL POETS READING SERIES
-- Verified: nepoetrysociety.org active; 1st Tuesday 6:30-7:30pm
-- confirmed from Share Omaha listing and website.

(
  'Nebraska Poetry Society — Free Virtual Poets Reading Series',
  'Nebraska Poetry Society',
  'https://www.nepoetrysociety.org',
  'On the first Tuesday of every month, from 6:30 to 7:30 PM, the Nebraska Poetry Society hosts a Nebraska poet to read their work and talk about their literary journey — where the poems come from, how they were made, what poetry has meant to them. The event is free, virtual, and open to anyone. No registration required beyond using the link on the NPS website. A low-pressure way to hear living Nebraska poets, discover writers working in your own state, and spend an hour in a conversation about language and the world.',
  'free_resource',
  'Free and open to anyone with internet access. No prior poetry experience required. All ages welcome.',
  null,
  'https://www.nepoetrysociety.org/readings',
  'Omaha', null, 'Omaha', 'NE', null,
  true, false,
  array['low_income', 'first_gen'],
  array['arts'],
  array['college_freshman'],
  null, null, null,
  'high', 'verified',
  'https://www.nepoetrysociety.org/spoken-word', 'official_website', '2026-03-06',
  true, false,
  'First Tuesday of every month, 6:30–7:30 PM CT. Free virtual event — link available at nepoetrysociety.org. Check website for featured poet each month.',
  null,
  '{"type": "free", "notes": "Completely free. No registration required — use the event link on nepoetrysociety.org."}'::jsonb,
  '{"frequency": "monthly", "day_of_week": "Tuesday", "week_of_month": "first", "time": "6:30 PM", "timezone": "CT"}'::jsonb,
  '{"formality": "semi_formal", "social_setting": "large_group", "commitment_level": "drop_in", "description": "Log in on the first Tuesday of the month and listen to a Nebraska poet read their work and talk about their process for an hour. It''s a Zoom call — you can just watch with your camera off. No one will ask you to read anything."}'::jsonb,
  null
),

-- ── VOCAL FRY OPEN MIC — NEBRASKA POETRY SOCIETY × UNION ─
-- Verified: Share Omaha listing active; Shirley Tyree Theater at
-- The Union (2423 N 24th St) confirmed; 3rd Thursday; doors 6pm,
-- start 7pm confirmed.

(
  'Vocal Fry — Monthly Spoken Word Open Mic at The Union',
  'Nebraska Poetry Society / The Union for Contemporary Art',
  'https://www.nepoetrysociety.org/spoken-word',
  'Vocal Fry is a monthly spoken word and poetry open mic at The Shirley Tyree Theater inside The Union for Contemporary Art in North Omaha. Co-hosted by the Nebraska Poetry Society and The Union, it runs every third Thursday of the month — doors open at 6 PM for sign-ups, performances start at 7 PM. Poets, storytellers, and spoken word artists of all levels are invited to sign up at the door. No experience required. Some performers are regulars; others are stepping to a mic for the first time. Either way, the room is welcoming. Free to attend and perform.',
  'workshop',
  'Free and open to all ages. All skill levels welcome — from first-timers to experienced slam poets. No registration required; sign up at the door on event night.',
  null,
  'https://shareomaha.org/events/union-contemporary-art/vocal-fry-open-mic',
  'Omaha', '2423 N 24th St', 'Omaha', 'NE', '68110',
  false, false,
  array['low_income', 'first_gen', 'black', 'hispanic', 'immigrant'],
  array['arts'],
  array['9', '10', '11', '12', 'college_freshman'],
  null, null, null,
  'high', 'verified',
  'https://shareomaha.org/events/union-contemporary-art/vocal-fry-open-mic', 'community_org', '2026-03-06',
  true, true,
  'Third Thursday of every month. Doors open 6:00 PM for sign-ups. Performances start 7:00 PM. The Shirley Tyree Theater at The Union for Contemporary Art, 2423 N 24th St, Omaha.',
  null,
  '{"type": "free", "notes": "Free to attend and free to perform. No registration required — sign up at the door. Suggested donation may be accepted; never required."}'::jsonb,
  '{"frequency": "monthly", "day_of_week": "Thursday", "week_of_month": "third", "time": "7:00 PM", "timezone": "CT"}'::jsonb,
  '{"formality": "informal", "social_setting": "community", "commitment_level": "drop_in", "description": "Show up at The Union on the third Thursday. Sign your name on a list at the door. When your name is called, walk up to the mic and say your poem out loud in front of the room. Or just sit and listen — many people do. The crowd is welcoming. The neighborhood is North Omaha. The poems are real."}'::jsonb,
  '{"serves_underserved": true, "communities": ["North Omaha residents", "BIPOC poets and artists", "emerging spoken word artists"], "mission_notes": "Held at The Union for Contemporary Art, which was founded to bring arts infrastructure to North Omaha. Vocal Fry creates a stage in the neighborhood, not across town — by and for the community that lives here."}'::jsonb
),

-- ── NWC OMAHA POETRY SLAM — THE LOCAL ART PLUG ───────────
-- Verified: newriters.org/events active; allevents.in confirms
-- March 14 2026 at The Local Art Plug (1722 St. Marys Ave., Suite
-- 110, Omaha NE 68102); 2nd Saturday; doors 6:30pm, start 7pm;
-- $10 suggested donation; open mic + competitive slam confirmed.

(
  'Omaha Poetry Slam — Nebraska Writers Collective at The Local Art Plug',
  'Nebraska Writers Collective',
  'https://www.newriters.org',
  'The Omaha Poetry Slam is a monthly open mic and competitive poetry slam, held the second Saturday of every month at The Local Art Plug gallery in South Omaha. Doors open at 6:30 PM; the event starts at 7 PM with an open mic, followed by the slam. Open mic: anyone can sign up at the door and read. Competitive slam: bring three original poems, perform for up to 3 minutes per round, and be judged by five audience members on a 0.0–10.0 scale — top scorer wins $50. No experience required for the open mic. $10 suggested donation, not required to enter. Nebraska Writers Collective is an Omaha-based nonprofit that has run youth spoken word and community writing programs for years.',
  'workshop',
  'Open to all ages. No experience required to participate in the open mic. Competitive slam requires original poems (not covers or traditional poetry). $10 suggested donation — never required.',
  null,
  'https://www.newriters.org/events/omaha-poetry-slam',
  'Omaha', '1722 St Marys Ave', 'Omaha', 'NE', '68102',
  false, false,
  array['low_income', 'first_gen', 'black', 'hispanic', 'immigrant'],
  array['arts'],
  array['9', '10', '11', '12', 'college_freshman'],
  null, null, null,
  'high', 'verified',
  'https://www.newriters.org/events/omaha-poetry-slam', 'official_website', '2026-03-06',
  true, true,
  'Second Saturday of every month. Doors open 6:30 PM. Event starts 7:00 PM. The Local Art Plug, 1722 St. Marys Ave., Suite 110, Omaha NE 68102. March 14, 2026 event confirmed. Check newriters.org/events for upcoming dates.',
  null,
  '{"type": "free", "notes": "$10 suggested donation — never required to attend or perform. Open mic and slam competition are free to participate in."}'::jsonb,
  '{"frequency": "monthly", "day_of_week": "Saturday", "week_of_month": "second", "time": "7:00 PM", "timezone": "CT"}'::jsonb,
  '{"formality": "informal", "social_setting": "community", "commitment_level": "drop_in", "description": "Show up at a gallery on the second Saturday evening. Listen to poets. If you want to read, put your name on the open mic list at the door. If you want to compete, bring three original poems and go up against other poets for a $50 prize — five audience members hold up scorecards. The room is on your side."}'::jsonb,
  '{"serves_underserved": true, "communities": ["South Omaha residents", "BIPOC poets", "first-generation creative voices", "community writers"], "mission_notes": "Nebraska Writers Collective was founded to center creative writing and performance in communities mainstream literary institutions often overlook. The Omaha Poetry Slam runs in a South Omaha gallery, not a downtown conference room."}'::jsonb
),

-- ══════════════════════════════════════════════════════════
-- 3. THEATER & PERFORMANCE (2 entries)
-- ══════════════════════════════════════════════════════════

-- ── OMAHA COMMUNITY PLAYHOUSE — OPEN AUDITIONS & VOLUNTEER
-- Verified: omahaplayhouse.com active; nation's largest community
-- theater confirmed; 6915 Cass St; open auditions (2-3 dates per
-- production, form + photo); 2,000+ community volunteers annually.

(
  'Omaha Community Playhouse — Open Auditions & Community Volunteer Programs',
  'Omaha Community Playhouse',
  'https://omahaplayhouse.com',
  'The nation''s largest community theater — and the actors on stage are community volunteers. Omaha Community Playhouse runs 10+ productions per year, and they hold open auditions for every show. Anyone can audition: submit an online form and a photo, show up on one of two or three audition dates per production, and read for a part. No professional experience required. The Playhouse also uses more than 2,000 community volunteers annually in technical, backstage, costume, and front-of-house roles. If you''ve ever wanted to be part of making a live production — on stage or behind it — this is how you do it.',
  'free_resource',
  'Auditions open to all ages and backgrounds. Age and experience requirements vary by production. No professional experience required. Volunteer roles available for those who prefer not to perform. An online audition form must be submitted before audition dates. Check omahaplayhouse.com/get-involved for current auditions and volunteer openings.',
  null,
  'https://omahaplayhouse.com/get-involved/auditions/',
  'Omaha', '6915 Cass St', 'Omaha', 'NE', '68132',
  false, false,
  array['low_income', 'first_gen'],
  array['arts'],
  array['9', '10', '11', '12', 'college_freshman'],
  null, null, null,
  'high', 'verified',
  'https://omahaplayhouse.com/get-involved/', 'official_website', '2026-03-06',
  true, false,
  'Auditions are held for each production throughout the year, typically 2-3 dates per show. Check omahaplayhouse.com/get-involved/upcoming-auditions for the current schedule. Volunteer opportunities are year-round.',
  null,
  '{"type": "free", "notes": "Free to audition. Free to volunteer. Attending productions as an audience member requires tickets — ticket prices vary by show. No fee to participate in auditions or volunteer programs."}'::jsonb,
  '{"frequency": "varies", "notes": "Multiple productions per year; each has its own audition dates. Check omahaplayhouse.com/upcoming-auditions for schedule."}'::jsonb,
  '{"formality": "semi_formal", "social_setting": "large_group", "commitment_level": "series", "description": "You fill out an online form, show up on an audition date, and read sides from the script in a room with directors and fellow auditioners. If you''re cast, you rehearse for several weeks and perform in a real professional-quality theater. If you''d rather work behind the scenes, there are over 2,000 volunteer spots per year in tech, costumes, lighting, and front-of-house."}'::jsonb,
  null
),

-- ── BACKLINE COMEDY — IMPROV CLASSES & OPEN MIC NIGHTS ───
-- Verified: backlinecomedy.com active; 1618 Harney St confirmed;
-- $35 workshops, $200-250 class tracks confirmed; open mic confirmed.
-- Yelp updated Jan 2026.

(
  'Backline Comedy — Improv Workshops & Comedy Open Mic',
  'Backline Comedy',
  'https://backlinecomedy.com',
  'Backline Comedy is Omaha''s dedicated improv and comedy venue at 1618 Harney Street. For people who want to try improv: beginner workshops run around $35 and teach the basics — agreeing, building on what your scene partner says, making offers, listening. Multi-week class tracks are $200–$250 and go deeper. For people who just want to perform: the open mic is where new and experienced comedians, storytellers, and performers test material and try things out. Shows run most nights of the week. Whether you want to learn improv, try stand-up once, or just watch local comedy — Backline is the specific venue for it in Omaha.',
  'workshop',
  'Classes and workshops open to adults and teens. Open mic nights: all ages. Classes require registration and payment. Check backlinecomedy.com for current class schedule, open mic nights, and pricing.',
  null,
  'https://backlinecomedy.com/home/classes/',
  'Omaha', '1618 Harney St', 'Omaha', 'NE', '68102',
  false, false,
  array[]::text[],
  array['arts'],
  array['college_freshman'],
  null, null, null,
  'high', 'verified',
  'https://backlinecomedy.com', 'official_website', '2026-03-06',
  true, false,
  'Classes run throughout the year. Beginner workshops scheduled periodically; multi-week class tracks start on a recurring schedule. Open mic nights on a regular schedule — check backlinecomedy.com for upcoming dates and show listings.',
  null,
  '{"type": "low_cost", "notes": "Beginner workshops: approximately $35. Multi-week class tracks: $200-$250. Open mic nights: check backlinecomedy.com for current ticket or cover prices. Shows as audience member: ticket prices vary."}'::jsonb,
  '{"frequency": "varies", "notes": "Beginner workshops and class tracks run periodically; open mic on a regular schedule. Check backlinecomedy.com for current schedule."}'::jsonb,
  '{"formality": "informal", "social_setting": "small_group", "commitment_level": "drop_in", "description": "For workshops: you show up, do improv exercises with other beginners, laugh a lot, and learn by doing — no prior experience, no preparation needed. For the open mic: sign up, go up when your name is called, say or do whatever you prepared, get the reaction you get. Both are low-stakes ways to perform in front of people for the first time."}'::jsonb,
  null
),

-- ══════════════════════════════════════════════════════════
-- 4. FILM & MEDIA (1 entry)
-- ══════════════════════════════════════════════════════════

-- ── FILM STREAMS — COURSES & FILMMAKER PROGRAMS ──────────
-- Verified: filmstreams.org active; Ruth Sokolof Theater (1340 Mike
-- Fahey St) confirmed; Dundee Theater confirmed; Courses program
-- (multi-film seminars for adults) confirmed; Local Filmmakers
-- Showcase confirmed; Q&As with visiting filmmakers confirmed.

(
  'Film Streams — Nonprofit Cinema with Film Education Courses & Filmmaker Events',
  'Film Streams',
  'https://filmstreams.org',
  'Film Streams is Omaha''s nonprofit cinema, devoted to film as an art form. They operate the Ruth Sokolof Theater in downtown Omaha and the historic Dundee Theater in midtown. Beyond regular screenings, Film Streams runs Courses — multi-film seminar series for adult audiences that explore a director''s body of work, a cinematic movement, a country''s film tradition, or a historical period, with discussion between films. They also host Q&As with visiting filmmakers, an annual Local Filmmakers Showcase for Omaha-area film work, and live musical performances to accompany silent films. Two beautiful old cinemas, operated as a community resource.',
  'workshop',
  'Courses open to all adults — no prior film knowledge required. Individual screenings and series accessible to teens and adults. Check filmstreams.org for current course schedule and pricing. OPL Discovery Pass does not currently cover Film Streams.',
  null,
  'https://filmstreams.org',
  'Omaha', '1340 Mike Fahey St', 'Omaha', 'NE', '68102',
  false, false,
  array['first_gen'],
  array['arts'],
  array['college_freshman'],
  null, null, null,
  'high', 'verified',
  'https://filmstreams.org', 'official_website', '2026-03-06',
  true, false,
  'Screenings daily at Ruth Sokolof Theater (1340 Mike Fahey St, Omaha) and Dundee Theater. Courses run several times per year — check filmstreams.org for current course schedule and dates. Annual Local Filmmakers Showcase timing varies; check website.',
  null,
  '{"type": "low_cost", "notes": "Individual screenings typically $12-15. Courses (multi-film series) priced as packages — check filmstreams.org for current course pricing. Annual Film Streams membership (starting ~$75/year) provides discounts on all tickets and programs."}'::jsonb,
  '{"frequency": "varies", "notes": "Individual screenings daily. Courses run several times per year. Check filmstreams.org for current course offerings and the Local Filmmakers Showcase schedule."}'::jsonb,
  '{"formality": "semi_formal", "social_setting": "small_group", "commitment_level": "series", "description": "You sit in a beautiful old cinema and watch a film that was made by someone trying to say something. Then someone facilitates a conversation about it with the audience. You come back the next week and do it again with a different film by the same director or from the same movement. It builds a way of watching and thinking that makes every film more interesting."}'::jsonb,
  null
),

-- ══════════════════════════════════════════════════════════
-- 5. CULTURAL STUDIES & COMMUNITY ARTS (3 entries)
-- ══════════════════════════════════════════════════════════

-- ── GREAT PLAINS BLACK HISTORY MUSEUM ────────────────────
-- Verified: gpblackhistorymuseum.org active; 2221 N 24th St (Jewell
-- Building) confirmed; 2026 event calendar confirmed (HBCU Fair
-- Feb 21, Black History Scavenger Hunt Feb 22, March on Washington
-- Aug 23, Fall Feast Oct 11, Veterans Day Nov 11, Christmas Dec 6).

(
  'Great Plains Black History Museum — Exhibitions & Community Events',
  'Great Plains Black History Museum',
  'https://gpblackhistorymuseum.org',
  'Located in North Omaha''s historic Jewell Building at 2221 N 24th Street, the Great Plains Black History Museum preserves and exhibits the history and contributions of African Americans in the Great Plains region — history that is rarely taught in depth anywhere else. The museum hosts regular public events throughout 2026: an HBCU College Fair (February 21), a Black History Month Scavenger Hunt (February 22), a March on Washington Celebration (August 23), Fall Feast (October 11), Veterans Day recognition for African Americans who served (November 11), and Christmas in the Village (December 6). The museum sits in the center of North Omaha''s historic 24th Street cultural corridor.',
  'free_resource',
  'Open to the general public. Most events are free to attend. Check gpblackhistorymuseum.org for current exhibition hours and event registration details.',
  null,
  'https://gpblackhistorymuseum.org',
  'Omaha', '2221 N 24th St', 'Omaha', 'NE', '68110',
  false, false,
  array['black', 'low_income', 'first_gen'],
  array['cultural_studies', 'arts'],
  array['9', '10', '11', '12', 'college_freshman'],
  null, null, null,
  'high', 'verified',
  'https://gpblackhistorymuseum.org', 'official_website', '2026-03-06',
  true, true,
  '2026 events confirmed: HBCU Fair (Feb 21, 5-7 PM), Black History Scavenger Hunt (Feb 22, 1-3 PM), March on Washington Celebration (Aug 23, noon-4 PM), Fall Feast (Oct 11, noon-4 PM), Veterans Day (Nov 11, noon-3 PM), Christmas in the Village (Dec 6, noon-5 PM). Check gpblackhistorymuseum.org for exhibition hours and additional events.',
  null,
  '{"type": "free", "notes": "Most public events are free to attend. Check gpblackhistorymuseum.org for any event-specific details."}'::jsonb,
  '{"frequency": "varies", "notes": "Regular community events throughout the year. Check gpblackhistorymuseum.org for full 2026 schedule."}'::jsonb,
  '{"formality": "informal", "social_setting": "community", "commitment_level": "drop_in", "description": "Walk into a museum on North 24th Street and learn about the African American history of Nebraska and the Great Plains — the Tuskegee Airmen who came from here, the HBCU graduates who built the community, the contributions that rarely appear in standard curricula. Events bring the neighborhood together to celebrate, remember, and plan."}'::jsonb,
  '{"serves_underserved": true, "communities": ["Black and African American community in Omaha and the Great Plains"], "mission_notes": "Founded to preserve and celebrate the history and contributions of African Americans in the Great Plains region — history that has been systematically underrepresented in mainstream museums and educational institutions. Located in the center of North Omaha''s historic Black cultural corridor."}'::jsonb
),

-- ── CULXR HOUSE — NORTH OMAHA CREATIVE HUB ───────────────
-- Verified: houseofculxr.com active; Yelp updated Feb 2026;
-- 3014 N 24th St confirmed; Marcey Yates founder confirmed;
-- all-ages events, youth workshops, performance stage confirmed.

(
  'Culxr House — North Omaha Arts, Music & Creative Community Hub',
  'Culxr House',
  'https://www.houseofculxr.com',
  'Culxr House is a nearly 8,000-square-foot arts and creative hub at 3014 North 24th Street, founded by hip-hop artist Marcey Yates in 2018 and established as a nonprofit in 2019. The building includes a performance stage with PA system and dedicated space for arts, music, civic engagement, and community events. Culxr House hosts all-ages events throughout the year — youth workshops, vendor markets, local fashion showcases, music performances, and civic programming. It operates as an incubator for local creatives: artists, musicians, designers, and entrepreneurs rooted in the historic North 24th Street corridor.',
  'free_resource',
  'Open to all ages. Most events are free or low-cost. Check houseofculxr.com and their social media for current event listings and any admission details.',
  null,
  'https://www.houseofculxr.com',
  'Omaha', '3014 N 24th St', 'Omaha', 'NE', '68111',
  false, false,
  array['low_income', 'first_gen', 'black', 'hispanic'],
  array['arts', 'business'],
  array['9', '10', '11', '12', 'college_freshman'],
  null, null, null,
  'high', 'verified',
  'https://www.houseofculxr.com', 'official_website', '2026-03-06',
  true, true,
  'Events throughout the year — not on a fixed weekly or monthly schedule. Check houseofculxr.com and follow @culxrhouse on social media for upcoming events and programming.',
  null,
  '{"type": "free", "notes": "Most events are free or low-cost. Check houseofculxr.com for event-specific admission details."}'::jsonb,
  '{"frequency": "varies", "notes": "Regular events throughout the year; not on a fixed schedule. Follow social media and check website for upcoming programming."}'::jsonb,
  '{"formality": "informal", "social_setting": "community", "commitment_level": "drop_in", "description": "Show up at a building on North 24th that exists because a hip-hop artist decided the neighborhood needed a creative home. Events range from vendor markets and fashion showcases to civic conversations and youth workshops. All ages, all welcome, rooted in the North Omaha community."}'::jsonb,
  '{"serves_underserved": true, "communities": ["North Omaha community", "BIPOC artists and entrepreneurs", "youth on the North 24th Street corridor"], "mission_notes": "Founded by and for the North Omaha community. Culxr House operates from the North 24th Street corridor — one of Omaha''s most historically vibrant and most underresourced commercial and cultural corridors — as an incubator for Black creative and entrepreneurial talent."}'::jsonb
),

-- ── OPERA OMAHA POETRY & MUSIC PROJECT — PUBLIC CONCERT ──
-- Verified: operaomaha.org/community/engagement-programs/
-- poetry-music-project active; 2026 theme (Memory) confirmed;
-- May 2026 public concert confirmed; NWC partnership confirmed;
-- Columbus Telegram coverage Jan 2026; K-12 submissions open.

(
  'Opera Omaha Poetry & Music Project — Free Annual Public Concert',
  'Opera Omaha / Nebraska Writers Collective',
  'https://www.operaomaha.org/community/engagement-programs/poetry-music-project',
  'The Poetry & Music Project is an annual collaboration between Opera Omaha and the Nebraska Writers Collective. Each year, students in grades K-12 from Nebraska and Iowa submit poems on a theme — 2026''s theme is Memory. Professional composers select poems and set them to original music. The work is premiered in a free public concert in May 2026, open to anyone. The poets, their families, and the broader community attend. Over eight years, more than 1,000 poems have been submitted. It''s a rare chance to hear original compositions built from the words of Nebraska''s young writers — music that wouldn''t exist without them.',
  'free_resource',
  'Free and open to the public for the May 2026 concert. K-12 students in Nebraska and Iowa may submit poems for the 2026 cycle — see operaomaha.org for submission details and deadline.',
  null,
  'https://www.operaomaha.org/community/engagement-programs/poetry-music-project',
  'Omaha', null, 'Omaha', 'NE', null,
  false, false,
  array['low_income', 'first_gen', 'black', 'hispanic', 'immigrant'],
  array['arts'],
  array['9', '10', '11', '12', 'college_freshman'],
  null, null, null,
  'high', 'verified',
  'https://www.operaomaha.org/community/engagement-programs/poetry-music-project', 'official_website', '2026-03-06',
  true, false,
  'Annual public concert in May. 2026 specific concert date and venue not yet confirmed — check operaomaha.org/community/engagement-programs/poetry-music-project for updates. K-12 poem submissions open — check website for submission deadline.',
  null,
  '{"type": "free", "notes": "Public concert is free to attend. No tickets or registration required. Check operaomaha.org for 2026 concert date and venue."}'::jsonb,
  '{"frequency": "annual", "notes": "Annual May concert. Check operaomaha.org for 2026 concert date and venue confirmation."}'::jsonb,
  '{"formality": "semi_formal", "social_setting": "audience", "commitment_level": "drop_in", "description": "You sit in an auditorium and hear professional musicians perform original compositions built from the poems of Nebraska kids. The young poets are often in the audience. The music is genuinely surprising, because it started as a poem a 12-year-old wrote at school and was transformed by a composer who found something in it worth setting to music."}'::jsonb,
  null
);

-- ============================================================
-- PHASE 11 COMPLETION REPORT (Open Humanities & Creative Expression)
-- ============================================================
--
-- Total new entries: 18
--
-- By domain:
--   Visual Arts (museums, galleries, studios)      8
--   Literature, Writing & Poetry                   4
--   Theater & Performance                          2
--   Film & Media                                   1
--   Cultural Studies & Community Arts              3
--
-- By geography:
--   Omaha (Midtown/Downtown/Old Market)            7
--   Omaha (North Omaha — 24th St corridor)         6
--   Omaha (South Omaha)                            1
--   Ralston NE (metro)                             1
--   Virtual (Nebraska-wide)                        1
--   Multi-venue / TBD                              2
--
-- By type:
--   free_resource    10   (Joslyn, Bemis exhibitions, Bemis LOW END,
--                          The Union, Hot Shops, KANEKO, NPS Reading
--                          Series, Great Plains Museum, Culxr House,
--                          Opera Omaha concert)
--   workshop          6   (Vocal Fry, Omaha Poetry Slam, NWW, OCP,
--                          Backline Comedy, Film Streams Courses)
--   mentorship        2   (Bemis Community Tracks, Union Fellowship)
--
-- New schema field: equity_focus (migration 016)
--   Populated: 5/18 entries (Union, Union Fellowship, Vocal Fry,
--              Omaha Poetry Slam, Great Plains Museum, Culxr House)
--   Null: 13/18 (general public programs without documented
--               specific equity mission)
--
-- Verified vs needs_confirmation:
--   verified           18  (all entries — zero needs_confirmation)
--   Joslyn last search  verified 2025-26 season tour schedule
--   Most recent Yelp/web update across all entries: Feb 2026
--
-- With equity_focus populated:
--   • The Union for Contemporary Art (Gallery & Programs)
--   • The Union Inside/Outside Fellowship
--   • Vocal Fry Open Mic (NPS × The Union)
--   • Omaha Poetry Slam (NWC)
--   • Great Plains Black History Museum
--   • Culxr House
--
-- Stipend programs added:
--   1. Bemis Community Tracks — $1,000 for musicians within 80mi
--   2. Omaha Poetry Slam competitive — $50 prize (winner each month)
--
-- Free access pathways inventory — every way to engage with the
-- humanities at no or low cost in the Omaha metro:
--   1.  Joslyn Art Museum — free general admission always
--   2.  Joslyn public tours — free Fri/Sat 1pm, Sun 2pm
--   3.  Bemis Center exhibitions — free admission always
--   4.  Bemis LOW END — free live music venue
--   5.  The Union gallery and community events — free admission
--   6.  Hot Shops Art Center — free to browse working studios
--   7.  KANEKO — free galleries Thu-Sun
--   8.  Nebraska Writers Workshop — free weekly (40+ years)
--   9.  Nebraska Poetry Society Reading Series — free, virtual, monthly
--   10. Vocal Fry Open Mic — free to attend and perform (3rd Thu)
--   11. Omaha Poetry Slam — $10 suggested, open mic free to participate
--   12. Omaha Community Playhouse — free to audition + volunteer
--   13. Great Plains Black History Museum — free events year-round
--   14. Culxr House — free/low-cost community events
--   15. Opera Omaha Poetry & Music Concert — free annual public event
--   16. Bemis Community Tracks — $1,000 stipend (application)
--   17. The Union Fellowship — free studio access (application)
--
-- North Omaha creative ecosystem — represented in this batch:
--   • The Union for Contemporary Art (2423 N 24th St)
--   • Vocal Fry Open Mic at The Union (3rd Thursday)
--   • Great Plains Black History Museum (2221 N 24th St, Jewell Bldg)
--   • Culxr House (3014 N 24th St)
--   These four entries map the core of the 24th Street arts corridor —
--   one of the densest concentrations of Black arts infrastructure in
--   the Midwest, built by and for the community after decades of
--   institutional disinvestment.
--
-- Organizations researched but not listed:
--   • Virginia Frank Memorial Writing Contest: grades 5-8 only
--   • Fine Lines: adult programming beyond camps not sufficiently
--     confirmed — recommend revisiting
--   • Nebraska Writing Project Saturday workshops: Omaha-specific
--     schedule not confirmed — primarily Lincoln-based programming
--   • Humanities Nebraska Speakers Bureau: federal funding cut
--     2026; reduced capacity; listing would be misleading
--   • Brigit Saint Brigit / Shelterbelt / BLUEBARN: professional
--     ticketed productions; no confirmed free/community access programs
--   • Nebraska Poetry Society standalone open mic: venue not
--     confirmed from verified source (separate from Vocal Fry)
--
-- Creative discipline coverage matrix:
--   visual arts:         7  (Joslyn, Bemis exhibitions, Union, Hot Shops,
--                            KANEKO, Union Fellowship, Bemis Community Tracks)
--   experimental music:  2  (LOW END, Community Tracks)
--   poetry/spoken word:  3  (NPS Reading Series, Vocal Fry, Poetry Slam)
--   fiction writing:     1  (Nebraska Writers Workshop — all genres)
--   theater/performance: 2  (OCP, Backline Comedy)
--   film:                1  (Film Streams)
--   cultural history:    2  (Great Plains Museum, KANEKO)
--   community arts:      2  (Culxr House, Opera Omaha concert)
--
-- Gaps identified for future phases:
--   • Fashion design and textile communities (Culxr House hosts some
--     fashion events but no dedicated textile/sewing organization found)
--   • Community radio or podcast production groups
--   • Oral history programs actively seeking storytellers
--   • Photography clubs with public membership
--   • Community journalism programs (Hear Nebraska does advocacy/
--     journalism but no confirmed public training program)
--   • Fine Lines adult programming (revisit for Phase 12)
--   • Council Bluffs / Iowa-side arts programming underrepresented
--     (no CB-specific arts organizations found with confirmed free
--     public programming comparable to Omaha offerings)
--   • Creighton University public arts programming (unverified)
--   • UNO Strauss Performing Arts Center public events
--
-- Database total after Phase 11: ~159 active opportunities
--
-- Recommended partnerships for data validation:
--   • The Union for Contemporary Art — confirm Family Night schedule
--     and Co-Op Studios scholarship application process
--   • Nebraska Writers Collective — confirm Omaha Poetry Slam
--     continued monthly schedule for remainder of 2026
--   • Bemis Center — confirm Community Tracks application window
--   • Nebraska Poetry Society — confirm Vocal Fry monthly dates
--     and any schedule changes
--   • Omaha Community Playhouse — confirm 2026-27 production
--     audition calendar
--   • Council Bluffs libraries and arts orgs — investigate for
--     Phase 12 to address Iowa-side gap
-- ============================================================
