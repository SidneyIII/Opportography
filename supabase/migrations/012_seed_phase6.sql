-- ============================================================
-- Opportography — Migration 012
-- Phase 6: Native American & LGBTQ+ Community Batch
-- Sources researched and verified: February 2026
-- Run AFTER 011_schema_phase6.sql
--
-- Target demographics:
--   Native American community members (urban and reservation-connected)
--     in the Omaha/Council Bluffs metro, regardless of tribal affiliation
--   LGBTQ+ individuals of all identities — with specific attention to
--     transgender people, LGBTQ+ youth, and LGBTQ+ people of color
--   People at the intersection of both communities
--
-- SECTION A: Native American Resources (6 new entries)
-- SECTION B: LGBTQ+ Resources (11 new entries)
-- SECTION C: Existing listing updates (1 update — OneWorld)
--
-- LEGAL LANDSCAPE — SEE MIGRATION 011 FOR FULL REFERENCE
-- Key constraints on this batch:
--   • Iowa removed gender identity from civil rights code (July 1, 2025)
--   • Iowa banned gender-affirming care on Medicaid (July 1, 2025)
--   • Iowa banned gender-affirming care for minors (2023)
--   • Nebraska banned gender-affirming surgery for minors; restricted
--     hormones/puberty blockers (LB 574, upheld July 2024)
--   • Nebraska birth certificate gender marker change requires surgery
--   • Tribal enrollment requirements documented exactly per tribal sources
--
-- AFFIRMING STATUS VERIFICATION:
--   Every "affirming" or "LGBTQ+-welcoming" label in this batch was
--   confirmed from the organization's own website or a recognized
--   directory (HRC Healthcare Equality Index, CenterLink, etc.).
--   Providers that do not mention LGBTQ+ care are not labeled affirming.
--
-- TRIBAL SOVEREIGNTY:
--   Tribal ceremonies, sacred practices, and culturally restricted events
--   are NOT listed. Cultural programs are described using the organization's
--   own language. Enrollment requirements are documented factually.
--
-- NOT LISTED / EXCLUDED:
--   • Winnebago Tribe of Nebraska Omaha-area programs: Could not verify
--     any current Omaha-area office or satellite services
--   • Nebraska Indian Community College Omaha extension: Not verified
--   • Little Priest Tribal College Omaha connections: Not verified
--   • Meskwaki Nation (Sac and Fox of Iowa) CB-area programs: Not verified
--   • Iowa Commission on Native American Affairs: Could not confirm
--     current active programming (verify before adding)
--   • BIA Great Plains Region — Omaha-area: Federal office in Aberdeen,
--     SD; no Omaha satellite confirmed
--   • White Bison / Wellbriety Omaha groups: Could not confirm any
--     currently active local group meeting within 180 days
--   • Two-Spirit specific local organizations: None found with verifiable
--     current Omaha/CB presence — documented as gap in completion report
--   • PFLAG Council Bluffs: No separate chapter confirmed; Omaha chapter
--     serves the full metro
--   • Nebraska Indian Legal Services: Could not verify current existence
--     or active operation
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
  schedule, language_access, cost_structure, recurrence, identity_focus
) values

-- ══════════════════════════════════════════════════════════
-- SECTION A: NATIVE AMERICAN COMMUNITY RESOURCES (6 entries)
-- ══════════════════════════════════════════════════════════

-- ── A1. FRED LEROY HEALTH AND WELLNESS CENTER ────────────
-- Ponca Tribe of Nebraska — primary urban Indian health facility in Omaha
-- Address verified: 2602 J Street, Omaha NE 68107
-- Eligibility: American Indians and others eligible for Indian Health Services
-- Active: Confirmed multiple sources including NE211 and NE District Court directories

(
  'Fred LeRoy Health and Wellness Center',
  'Ponca Tribe of Nebraska',
  'https://poncatribe-ne.gov/services/health-services/health-clinics/fred-leroy-health-and-wellness-center/',
  'Established in 1998 by the Ponca Tribe of Nebraska, the Fred LeRoy Health and Wellness Center is the primary urban Indian health facility in Omaha, serving American Indians and others eligible for Indian Health Services. Located in South Omaha, the center provides medical, dental, behavioral health, pharmacy, physical therapy, social services, substance abuse counseling, and youth services. The clinic team is trained in culturally sensitive, family-centered care and reflects the health needs and traditions of the Native communities it serves.',
  'free_resource',
  'Serves American Indians and others eligible for Indian Health Service (IHS). IHS eligibility generally extends to enrolled members and descendants of federally recognized tribes. Call (402) 733-3612 to confirm eligibility and schedule. Both Omaha and tribal community members are served.',
  null,
  'https://poncatribe-ne.gov/services/health-services/health-clinics/fred-leroy-health-and-wellness-center/',
  'Omaha', '2602 J Street', 'Omaha', 'NE', '68107',
  false, false,
  array['native_american', 'low_income'],
  array['health', 'community_service'],
  array[]::text[],
  'unpaid', null, null,
  'high', 'verified',
  'https://poncatribe-ne.gov/services/health-services/health-clinics/fred-leroy-health-and-wellness-center/', 'official_website', '2026-02-26',
  true, true,
  'Monday–Friday 8:00 AM – 4:30 PM. Call (402) 733-3612 for appointments.',
  null,
  '{"type": "free_with_eligibility", "accepts_medicaid": true, "accepts_insurance": true, "notes": "Services available to IHS-eligible individuals. Accepts IHS, Medicaid, Medicare, and private insurance. Call to confirm eligibility and cost before your first appointment."}'::jsonb,
  null,
  '{"primary_community": "native_american", "specific_identities": ["urban Native", "IHS-eligible individuals", "all tribal affiliations"], "open_to_allies": false, "notes": "Serves American Indians and others eligible for Indian Health Services regardless of which tribe they belong to. Urban Natives without current reservation residence are served."}'::jsonb
),

-- ── A2. PONCA TRIBE OF NEBRASKA — OMAHA BEHAVIORAL HEALTH ─
-- Social services and behavioral health at the Omaha satellite office
-- 5701 S. 85th Circle confirmed from official Ponca Tribe office locations page

(
  'Ponca Tribe of Nebraska — Omaha Behavioral Health & Social Services',
  'Ponca Tribe of Nebraska',
  'https://poncatribe-ne.gov/services/',
  'The Ponca Tribe of Nebraska operates a social services and behavioral health office in Omaha, providing drug and alcohol counseling, individual and family counseling, and youth prevention services. The Ponca Department of Social Services focuses on improving the lives of tribal members and their families, with special emphasis on children, youth, and elders. Behavioral health services are available in Omaha, Lincoln, Norfolk, Niobrara, and Sioux City (IA).',
  'free_resource',
  'Priority services for enrolled members of the Ponca Tribe of Nebraska and their families. Call (402) 315-2760 (Omaha office) to discuss eligibility for specific services. Monday–Friday 8:00 AM–4:30 PM.',
  null,
  'https://poncatribe-ne.gov/services/health-services/behavioral-health/',
  'Omaha', '5701 S 85th Circle', 'Omaha', 'NE', '68127',
  false, false,
  array['native_american', 'low_income'],
  array['health', 'community_service'],
  array[]::text[],
  'unpaid', null, null,
  'high', 'verified',
  'https://poncatribe-ne.gov/services/', 'official_website', '2026-02-26',
  true, false,
  'Monday–Friday 8:00 AM – 4:30 PM. Call (402) 315-2760 for appointments.',
  null,
  '{"type": "free_with_eligibility", "notes": "Priority services for enrolled Ponca tribal members and families. Contact office to discuss eligibility."}'::jsonb,
  null,
  '{"primary_community": "native_american", "specific_identities": ["Ponca Tribe enrolled members", "Ponca Tribe families"], "open_to_allies": false, "notes": "Tribal member priority. Eligibility for specific services varies — call to confirm."}'::jsonb
),

-- ── A3. OMAHA TRIBE HIGHER EDUCATION PROGRAM ─────────────
-- Tribal scholarship for enrolled Omaha Tribe members and 1/4-blood descendants
-- Application by July 31 (fall) or Nov 15 (spring). First come, first served.
-- Phone: (402) 837-5391 Ext. 445-446 (Macy, NE tribal headquarters)

(
  'Omaha Tribe Higher Education Scholarship Program',
  'Omaha Tribe of Nebraska',
  'https://www.omahatribe.com/tribe-departments/omaha-tribe-higher-education-program/',
  'The Omaha Tribe of Nebraska administers the Higher Education Program to provide financial assistance to eligible Omaha Indian students pursuing a degree or eligible certificate. Funding is awarded on a first-come, first-served basis for full-time students, covering tuition, fees, and books based on unmet financial need. Part-time students may receive funding for books, tuition, and fees only. Additional TC Energy scholarships ($2,500–$5,000) are available for trades, Indigenous legacy, and STEM fields. Applications must be submitted with a complete financial aid package — contact the Higher Ed Office for current requirements.',
  'scholarship',
  'Must be an enrolled member of the Omaha Tribe of Nebraska OR a descendant with at least one-fourth degree Omaha Indian blood. Must be enrolled at least half-time (6+ credit hours) in a program leading to a degree or eligible certificate at an accredited institution. Minimum 2.0 GPA for current students. Contact the office at (402) 837-5391 Ext. 445–446 for full requirements.',
  null,
  'https://www.omahatribe.com/scholarship-opportunities/',
  'Nebraska', null, 'Macy', 'NE', '68039',
  true, false,
  array['native_american'],
  array['community_service'],
  array['9', '10', '11', '12', 'college_freshman'],
  'scholarship_amount', 'Varies based on unmet financial need', null,
  'high', 'verified',
  'https://www.omahatribe.com/tribe-departments/omaha-tribe-higher-education-program/', 'official_website', '2026-02-26',
  true, false,
  'Apply by July 31 for fall semester; November 15 for spring semester. First come, first served.',
  null,
  '{"type": "free", "notes": "Scholarship funding — no cost to recipient. Funded through federal tribal higher education programs."}'::jsonb,
  null,
  '{"primary_community": "native_american", "specific_identities": ["Omaha Tribe enrolled members", "Omaha Tribe descendants (1/4 blood quantum minimum)"], "open_to_allies": false, "notes": "Eligibility requires tribal enrollment OR documented one-fourth Omaha Indian blood quantum. Contact Omaha Tribe Higher Ed office at (402) 837-5391 Ext. 445–446 to verify eligibility before applying."}'::jsonb
),

-- ── A4. AMERICAN INDIAN COLLEGE FUND ─────────────────────
-- Largest provider of Native American college scholarships ($20M+ annually)
-- 300+ scholarships. Open to any tribal enrollment/descendancy.
-- Applications open Feb 1 each year, priority deadline May 31.

(
  'American Indian College Fund — College Scholarships',
  'American Indian College Fund',
  'https://collegefund.org',
  'The American Indian College Fund is the largest provider of Native American college scholarships in the nation, awarding more than $20 million annually. Over 300 scholarship opportunities are available for high school seniors, undergraduates, and graduate students in all fields of study, with special awards for STEM, education, business, health sciences, and more. Average scholarship awards range from $2,000 to $3,000. Applications open February 1 each year, with a priority deadline of May 31. The College Fund provides one-on-one scholarship support — contact scholarships@collegefund.org or 800-987-3863.',
  'scholarship',
  'Any enrolled member or descendant of an enrolled member of a federally or state-recognized American Indian or Alaska Native tribe. Minimum 2.0 GPA. Must plan to enroll as a full-time student at an accredited nonprofit college or university. Proof of tribal affiliation required at application.',
  null,
  'https://collegefund.org/students/scholarships/',
  'Nebraska', null, 'Omaha', 'NE', null,
  true, false,
  array['native_american'],
  array['community_service'],
  array['11', '12', 'college_freshman'],
  'scholarship_amount', '$2,000–$3,000 average (varies by award)', null,
  'high', 'verified',
  'https://collegefund.org/students/scholarships/', 'official_website', '2026-02-26',
  true, true,
  'Applications open February 1 each year. Priority deadline: May 31.',
  null,
  '{"type": "free", "notes": "Scholarship award — no cost to recipient."}'::jsonb,
  '{"frequency": "annual", "notes": "Applications open February 1 each year; priority deadline May 31. Award decisions made for the following academic year."}'::jsonb,
  '{"primary_community": "native_american", "specific_identities": ["any enrolled tribal member or descendant", "high school seniors", "college students", "graduate students"], "open_to_allies": false, "notes": "Open to enrolled members or documented descendants of any federally or state-recognized tribe. Omaha Tribe, Ponca Tribe, Winnebago Tribe, Meskwaki Nation, and all other federally recognized tribal citizens are eligible."}'::jsonb
),

-- ── A5. NATIVE FORWARD SCHOLARS FUND ──────────────────────
-- 30+ scholarships & fellowships, $100–$30,000, undergrad through professional
-- Requires Tribal Eligibility Certificate (TEC) or equivalent documentation

(
  'Native Forward Scholars Fund — Scholarships & Fellowships',
  'Native Forward Scholars Fund',
  'https://www.nativeforward.org',
  'Native Forward Scholars Fund offers 30+ scholarships and fellowships for Native students at every level — undergraduate through professional and doctoral degrees. Award amounts range from $100 to $30,000, with specialized awards for STEM, law, medicine, business, and other graduate fields. Native Forward also offers Student Access Funding to help cover graduate or professional exam costs (LSAT, MCAT, GRE, GMAT, etc.) and related preparatory expenses. A Tribal Eligibility Certificate (TEC) or equivalent tribal documentation is required.',
  'scholarship',
  'Enrolled member or descendant of a U.S. federally recognized or state-recognized American Indian Tribe or Alaska Native group. Must provide proof of tribal affiliation (Tribal Eligibility Certificate, Certificate of Degree of Indian Blood, tribal enrollment card, or descendancy letter from tribal enrollment office). Must be enrolled full-time at an accredited U.S. institution.',
  null,
  'https://www.nativeforward.org/scholarships/',
  'Nebraska', null, 'Omaha', 'NE', null,
  true, false,
  array['native_american'],
  array['community_service'],
  array['11', '12', 'college_freshman'],
  'scholarship_amount', '$100–$30,000 (varies by award)', null,
  'high', 'verified',
  'https://www.nativeforward.org/scholarships/', 'official_website', '2026-02-26',
  true, false,
  'Scholarship deadlines vary by award. Check nativeforward.org for current application windows.',
  null,
  '{"type": "free", "notes": "Scholarship award — no cost to recipient."}'::jsonb,
  '{"frequency": "annual", "notes": "Application cycles vary by award; check nativeforward.org for deadlines"}'::jsonb,
  '{"primary_community": "native_american", "specific_identities": ["any enrolled tribal member or descendant", "college students", "graduate students", "professional students"], "open_to_allies": false, "notes": "Requires Tribal Eligibility Certificate (TEC) or equivalent documentation. Available to students at any accredited U.S. institution."}'::jsonb
),

-- ── A6. NEBRASKA COMMISSION ON INDIAN AFFAIRS ────────────
-- State liaison for Nebraska tribal nations and off-reservation Indians
-- Address: State Capitol, Lincoln (statewide reach includes Omaha metro)

(
  'Nebraska Commission on Indian Affairs',
  'Nebraska Commission on Indian Affairs',
  'https://indianaffairs.state.ne.us',
  'The Nebraska Commission on Indian Affairs (NCIA) is the official state liaison between Nebraska''s tribal nations and state government. The Commission works to identify and eliminate barriers for Nebraska tribes and Native citizens in housing, employment, education, healthcare, economic development, and civil rights. NCIA serves off-reservation Native communities across Nebraska — including the significant urban Native population in the Omaha metro — and can provide referrals to tribal services, state programs, and advocacy resources. Contact the Commission at (402) 471-3475 for referrals and assistance.',
  'free_resource',
  'Open to enrolled members of Nebraska tribal nations (Omaha, Ponca, Santee Sioux, Winnebago) and Native American citizens living in Nebraska, including urban and off-reservation residents.',
  null,
  'https://indianaffairs.state.ne.us',
  'Nebraska', 'State Capitol Building, Room 1302', 'Lincoln', 'NE', '68509',
  true, false,
  array['native_american'],
  array['community_service'],
  array[]::text[],
  'unpaid', null, null,
  'high', 'verified',
  'https://indianaffairs.state.ne.us/what-we-do/', 'official_website', '2026-02-26',
  true, false,
  'Monday–Friday during state business hours. Call (402) 471-3475 or visit indianaffairs.state.ne.us.',
  null,
  '{"type": "free", "notes": "Free state government service — referrals, advocacy, and coordination are all no-cost to the individual."}'::jsonb,
  null,
  '{"primary_community": "native_american", "specific_identities": ["Nebraska tribal nations", "urban Native Nebraskans", "off-reservation Native residents"], "open_to_allies": false, "notes": "Serves enrolled members of Nebraska''s four headquarter tribes (Omaha, Ponca, Santee Sioux, Winnebago) and off-reservation Indian communities statewide, including Omaha metro."}'::jsonb
),

-- ══════════════════════════════════════════════════════════
-- SECTION B: LGBTQ+ COMMUNITY RESOURCES (11 entries)
-- ══════════════════════════════════════════════════════════

-- ── B1. OMAHA FORUS COMMUNITY CENTER ─────────────────────
-- Dedicated LGBTQ+ community center — verified on CenterLink national directory
-- Programs: Proud Horizons youth group, mental health group, Pride Pantry,
-- STI testing, case management, Glam workshops, Florecer Latine group
-- Address: 3337 N 107th St, Omaha, NE | Phone: (531) 466-1839
-- Verified ACTIVE February 2026

(
  'Omaha ForUs — LGBTQ+ Community Center',
  'Omaha ForUs',
  'https://www.omahaforus.org',
  'Omaha ForUs is the dedicated LGBTQ+ community center for the Omaha metro, listed in the CenterLink national network of LGBTQ+ centers. The center provides safe space, community programs, and direct services for LGBTQ+ individuals of all identities. Programs include: Proud Horizons (peer support group for LGBTQ+ youth ages 13–23, every other Saturday); a Mental Health Support Group (2nd and 4th Wednesdays, 6–7:30 PM, for adults navigating mental health and LGBTQ+ identity); the Pride Pantry (food assistance for food-insecure LGBTQ+ individuals); no-cost STI testing (partnership with Nebraska AIDS Project, Planned Parenthood, and Douglas County Health); on-site social work case management; monthly Glam Workshops (sewing, costume design, hair, makeup); and Florecer, a social group specifically for Latine and Chicane LGBTQ+ people in Omaha.',
  'free_resource',
  'Open to all LGBTQ+ individuals. Most services are free. Proud Horizons is for ages 13–23. Mental health group is for adults. Call (531) 466-1839 or visit omahaforus.org for current program schedules and hours.',
  null,
  'https://www.omahaforus.org',
  'Omaha', '3337 N 107th St', 'Omaha', 'NE', null,
  false, false,
  array['lgbtq', 'low_income'],
  array['health', 'community_service'],
  array['9', '10', '11', '12', 'college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.lgbtqcenters.org/LGBTCenters/Center/8479/Omaha-ForUs-Community-Center', 'official_website', '2026-02-26',
  true, true,
  'Proud Horizons: every other Saturday. Mental health group: 2nd and 4th Wednesdays, 6–7:30 PM. STI testing: select Thursdays. Check omahaforus.org for current schedule.',
  null,
  '{"type": "free", "notes": "Most programs and services are free. Pride Pantry provides food assistance. STI testing is no-cost through partner organizations."}'::jsonb,
  '{"frequency": "varies", "notes": "Proud Horizons: every other Saturday; Mental health group: 2nd and 4th Wednesdays 6–7:30 PM; Glam Workshops: monthly; check omahaforus.org for full calendar"}'::jsonb,
  '{"primary_community": "lgbtq", "specific_identities": ["LGBTQ+ youth 13-23", "LGBTQ+ adults", "Latine LGBTQ+"], "open_to_allies": true, "notes": "All LGBTQ+ identities welcome. Florecer group specifically centers Latine and Chicane LGBTQ+ people. Allies welcome at community events."}'::jsonb
),

-- ── B2. PFLAG OMAHA ──────────────────────────────────────
-- Verified active: pflag-omaha.org, meets 2nd Thursday at Countryside Community Church
-- Also offers Spanish-English meeting 4th Thursday monthly
-- Phone: (402) 939-8700

(
  'PFLAG Omaha — Support for LGBTQ+ People & Their Families',
  'PFLAG Omaha',
  'https://pflag-omaha.org',
  'PFLAG Omaha provides peer-to-peer support, education, and advocacy for LGBTQ+ individuals, their parents, families, and allies. Monthly meetings bring together people navigating coming out, family acceptance, identity, and belonging in a facilitated, confidential setting. Meetings are held on the second Thursday of every month at Countryside Community Church in Omaha (doors at 6:30 PM, meeting begins at 7:00 PM). A Spanish-English bilingual support meeting is offered on the fourth Thursday of every month — a rare and important resource for Spanish-speaking LGBTQ+ families. PFLAG Omaha serves the full Omaha/Council Bluffs metro area.',
  'workshop',
  'Open to LGBTQ+ individuals of all ages, and to their parents, families, and allies. All are welcome — no experience with PFLAG or any prior meetings required.',
  null,
  'https://pflag-omaha.org',
  'Omaha', null, 'Omaha', 'NE', null,
  false, false,
  array['lgbtq'],
  array['community_service', 'health'],
  array['9', '10', '11', '12', 'college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://pflag.org/chapter/omaha/', 'official_website', '2026-02-26',
  true, false,
  '2nd Thursday of each month: doors 6:30 PM, meeting 7:00 PM, at Countryside Community Church, Omaha. 4th Thursday: Spanish-English bilingual meeting (same location, same time).',
  '{"primary_language": "English", "additional_languages": ["Spanish"], "bilingual_staff": true, "notes": "Spanish-English bilingual meeting held on the 4th Thursday of each month"}'::jsonb,
  '{"type": "free", "notes": "Free to attend; no membership required. PFLAG national membership available separately."}'::jsonb,
  '{"frequency": "monthly", "day_of_week": "Thursday", "week_of_month": "second", "time": "7:00 PM", "timezone": "CT", "notes": "2nd Thursday (English); 4th Thursday (Spanish-English bilingual). Both at Countryside Community Church, Omaha."}'::jsonb,
  '{"primary_community": "lgbtq", "specific_identities": ["LGBTQ+ individuals", "parents of LGBTQ+", "families of LGBTQ+"], "open_to_allies": true, "notes": "Explicitly welcomes parents, families, and allies. Spanish-English bilingual meeting 4th Thursday serves Spanish-speaking LGBTQ+ families."}'::jsonb
),

-- ── B3. RIVER CITY GENDER ALLIANCE (RCGA) ────────────────
-- Founded 1986 — one of the oldest trans support orgs in the US
-- All-volunteer, monthly meetings + social outings
-- Midwest-wide membership: NE, IA, MO, SD, KS and beyond

(
  'River City Gender Alliance (RCGA) — Transgender Peer Support',
  'River City Gender Alliance',
  'https://www.rcga.co',
  'River City Gender Alliance (RCGA) is one of the oldest transgender support organizations in the United States, founded in Omaha in 1986 and incorporated as a Nebraska nonprofit in 2014. RCGA provides peer support, friendship, and understanding for transgender and gender non-conforming individuals and their families across the Midwest — drawing members from Nebraska, Iowa, Missouri, South Dakota, Kansas, and beyond. The organization hosts monthly meetings, social outings, and community activities, and conducts education and outreach to improve trans acceptance. RCGA was instrumental in the passage of Omaha''s LGBTQ+ anti-discrimination ordinance.',
  'workshop',
  'Open to transgender and gender non-conforming individuals and their families. No application required. All ages welcome. Check rcga.co for meeting schedule and location.',
  null,
  'https://www.rcga.co',
  'Omaha', null, 'Omaha', 'NE', null,
  false, false,
  array['lgbtq'],
  array['community_service'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://shareomaha.org/nonprofit/river-city-gender-alliance-rcga', 'community_org', '2026-02-26',
  true, false,
  'Monthly meetings and social outings. Check rcga.co for current schedule and meeting location.',
  null,
  '{"type": "free", "notes": "All-volunteer organization; meetings and events are free to attend."}'::jsonb,
  '{"frequency": "monthly", "notes": "Monthly meetings plus social outings; check rcga.co for schedule and location"}'::jsonb,
  '{"primary_community": "lgbtq", "specific_identities": ["transgender", "gender non-conforming", "non-binary"], "open_to_allies": true, "notes": "Open to trans and gender non-conforming individuals AND their families. Midwest-wide membership — accessible to Council Bluffs and metro area residents."}'::jsonb
),

-- ── B4. NEBRASKA AIDS PROJECT (NAP) ──────────────────────
-- Active June 2025 (Yelp updated). 250 S 77th St, Omaha.
-- Free HIV testing (13+), free PrEP, HOPWA housing, Ryan White, case management

(
  'Nebraska AIDS Project (NAP) — HIV Services, PrEP & Support',
  'Nebraska AIDS Project',
  'https://www.nap.org',
  'Founded in 1984, the Nebraska AIDS Project (NAP) leads Nebraska''s response to HIV/AIDS through free testing, prevention, housing, case management, and advocacy. NAP provides free, confidential or anonymous HIV testing with same-day results for anyone age 13 and older; a free PrEP (pre-exposure prophylaxis) program for those seeking daily HIV prevention medication; HOPWA (Housing Opportunities for Persons with AIDS) — NAP is the sole HOPWA provider in Nebraska; Ryan White Program services for people living with HIV; professional case management; mental health services and support groups; and bilingual (Spanish/English) HIV testing and education. NAP serves all 93 Nebraska counties.',
  'free_resource',
  'HIV testing is free and available to anyone age 13 and older — no referral or insurance required. PrEP program is free. Other services have eligibility criteria — contact NAP at nap.org or visit 250 S 77th St, Omaha.',
  null,
  'https://www.nap.org',
  'Omaha', '250 S 77th St', 'Omaha', 'NE', null,
  false, false,
  array['lgbtq', 'low_income'],
  array['health'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.nap.org/', 'official_website', '2026-02-26',
  true, true,
  'Call or visit nap.org for current testing hours and service schedules.',
  '{"primary_language": "English", "additional_languages": ["Spanish"], "bilingual_staff": true, "notes": "Bilingual Spanish/English HIV testing and education available"}'::jsonb,
  '{"type": "free", "notes": "HIV testing is free. PrEP program is free. Housing (HOPWA) and Ryan White services have eligibility criteria. No one turned away due to inability to pay for testing."}'::jsonb,
  null,
  '{"primary_community": "lgbtq", "specific_identities": ["people living with HIV/AIDS", "gay and bisexual men", "all LGBTQ+ identities"], "open_to_allies": true, "notes": "HIV testing open to all ages 13+. LGBTQ+ community is a primary population served, but NAP serves all Nebraskans regardless of identity."}'::jsonb
),

-- ── B5. PLANNED PARENTHOOD OMAHA — GENDER-AFFIRMING CARE ──
-- Address verified: 3105 N 93rd St, Omaha, NE 68134 (updated Feb 2026 on Yelp)
-- Phone: (877) 811-7526
-- Also offers telehealth option for hormone therapy
-- NOTE: Nebraska LB 574 restricts gender-affirming care for MINORS (under 19)

(
  'Planned Parenthood Omaha — Gender-Affirming Hormone Therapy',
  'Planned Parenthood North Central States',
  'https://www.plannedparenthood.org/planned-parenthood-north-central-states',
  'Planned Parenthood Omaha Health Center offers gender-affirming hormone therapy (HRT) for transgender and non-binary adults. Services include initiation and ongoing monitoring of masculinizing and feminizing hormone therapy, STI testing and treatment, PrEP access, and comprehensive reproductive and sexual health care. Telehealth appointments are available for hormone therapy through Nebraska Telehealth. Planned Parenthood North Central States has been recognized as an LGBTQ+ inclusive health care High Performer by the Human Rights Campaign. Financial assistance is available — call (877) 859-0589 to see if you qualify. Nebraska LB 574 restricts certain gender-affirming care for minors under 19; contact the clinic to understand what services are available for your specific situation.',
  'free_resource',
  'Open to adults seeking gender-affirming hormone therapy. Financial assistance is available. Nebraska LB 574 restricts gender-affirming surgery for under-19 and requires counseling + parental consent for hormones/puberty blockers for minors. Adults (19+) face no surgical restriction. Call (877) 811-7526 or visit plannedparenthood.org to schedule.',
  null,
  'https://www.plannedparenthood.org/health-center/nebraska/omaha/68134/omaha-health-center-2447-90720/gender-affirming-care',
  'Omaha', '3105 N 93rd St', 'Omaha', 'NE', '68134',
  false, true,
  array['lgbtq'],
  array['health'],
  array[]::text[],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.plannedparenthood.org/health-center/nebraska/omaha/68134/omaha-health-center-2447-90720/gender-affirming-care', 'official_website', '2026-02-26',
  true, false,
  'By appointment. Telehealth also available. Call (877) 811-7526 or book online.',
  null,
  '{"type": "sliding_scale", "accepts_insurance": true, "notes": "Sliding scale fees based on income. Financial assistance available — call (877) 859-0589. Accepts most insurance plans."}'::jsonb,
  null,
  '{"primary_community": "lgbtq", "specific_identities": ["transgender", "non-binary"], "open_to_allies": false, "notes": "Healthcare services for patients. NE LB 574: surgery banned for under-19; hormones/puberty blockers for minors require 40 hours counseling, 7-day wait, and parental consent. Adults (19+): no surgical restrictions."}'::jsonb
),

-- ── B6. NEBRASKA MEDICINE GENDER CARE CLINIC ─────────────
-- UNMC affiliate. Confirmed from nebraskamed.com/transgender-care
-- Adults 19+ ONLY. Services: hormone therapy, surgical options, referrals.
-- Note: for adult care only — NE LB 574 restricts minor care

(
  'Nebraska Medicine Gender Care Clinic',
  'Nebraska Medicine / UNMC',
  'https://www.nebraskamed.com/transgender-care',
  'Nebraska Medicine''s Gender Care Clinic provides comprehensive gender-affirming care for adults (age 19 and older). Services include initiation and monitoring of masculinizing and feminizing hormone therapy; gynecological care for transgender men; post-operative care for genital reconstruction; and referrals to transgender-affirming primary care providers. Surgical consultations are available for gender-affirming procedures including chest surgery, vaginoplasty, breast augmentation, facial feminization, and voice surgery — all for patients aged 19 or older. Nebraska Medicine also maintains a directory of transgender-affirming healthcare resources at nebraskamed.com/transgender-care/transgender-resources.',
  'free_resource',
  'Adults age 19 and older. Nebraska LB 574 restricts gender-affirming surgery and regulates hormones for minors (under 19) — Nebraska Medicine''s Gender Care Clinic serves adults only. Call (402) 559-4343 for appointments or referrals.',
  null,
  'https://www.nebraskamed.com/transgender-care',
  'Omaha', null, 'Omaha', 'NE', null,
  false, false,
  array['lgbtq'],
  array['health'],
  array[]::text[],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.nebraskamed.com/transgender-care', 'official_website', '2026-02-26',
  true, false,
  'By appointment. Call (402) 559-4343 or visit nebraskamed.com/transgender-care.',
  null,
  '{"type": "varies", "accepts_insurance": true, "accepts_medicaid": true, "notes": "Accepts insurance, Medicaid, and Medicare. Nebraska Medicaid covers gender-affirming care for adults. Contact (402) 559-4343 for billing questions."}'::jsonb,
  null,
  '{"primary_community": "lgbtq", "specific_identities": ["transgender", "non-binary", "adults 19+"], "open_to_allies": false, "notes": "Adults 19+ only. Nebraska LB 574 restricts gender-affirming surgery for under-19 — contact the clinic for information about minor care pathways."}'::jsonb
),

-- ── B7. OUTNEBRASKA ───────────────────────────────────────
-- Statewide LGBTQ+ advocacy org, verified active Feb 2026
-- Prairie Pride Film Festival, resource directory, workplace inclusion advocacy

(
  'OutNebraska — LGBTQ+ Advocacy & Community Resources',
  'OutNebraska',
  'https://outnebraska.org',
  'OutNebraska is Nebraska''s statewide LGBTQ+ advocacy and education organization, empowering, celebrating, and cultivating thriving LGBTQ+ communities across the state for over 14 years. OutNebraska maintains a comprehensive LGBTQ+ resource directory (including PFLAG, healthcare providers, affirming businesses, and legal resources), advocates for reform with state and local representatives, and hosts community events including the Prairie Pride Film Festival. The organization also supports LGBTQ+ workplace inclusion and school support initiatives, and connects residents with PFLAG and other community organizations.',
  'free_resource',
  'Open to all LGBTQ+ individuals and allies. Resources, events, and advocacy are free to access at outnebraska.org.',
  null,
  'https://outnebraska.org',
  'Nebraska', null, 'Omaha', 'NE', null,
  true, false,
  array['lgbtq'],
  array['community_service'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://outnebraska.org/', 'official_website', '2026-02-26',
  true, false,
  'Online resources available 24/7. Events throughout the year — check outnebraska.org for calendar.',
  null,
  '{"type": "free", "notes": "All resources and events are free to access."}'::jsonb,
  null,
  '{"primary_community": "lgbtq", "specific_identities": ["all LGBTQ+ identities"], "open_to_allies": true, "notes": "Statewide Nebraska resource. Resource directory, advocacy, Prairie Pride Film Festival, and PFLAG chapter listings."}'::jsonb
),

-- ── B8. HEARTLAND PRIDE ───────────────────────────────────
-- Annual parade & festival (July). Year-round programming.
-- 2025: July 12 parade + festival, July 11 Youth Pride & Family Night
-- 2026: Pride 5K confirmed. Maintains LGBTQ+ business/org directory.

(
  'Heartland Pride — Annual LGBTQ+ Festival & Year-Round Events',
  'Heartland Pride',
  'https://heartlandpride.org',
  'Heartland Pride celebrates and promotes the history, diversity, and future of the LGBTQ+ community of the Omaha/Council Bluffs metro year-round. The annual Heartland Pride Parade and Festival is one of the largest LGBTQ+ gatherings in the Midwest — the 2025 festival took place July 12 with a parade through downtown Omaha and a full-day festival featuring drag performances, music, food trucks, a family area, and an adults'' area. Heartland Youth Pride & Family Night (July 11, 2025, 5 PM) is a youth- and family-centered event. The annual Heartland Pride 5K Fun Run/Walk is scheduled for 2026. Heartland Pride also maintains a comprehensive LGBTQ+ community and business directory at heartlandpride.org/directory.',
  'workshop',
  'Open to all. Annual festival and events are family-friendly and free or low-cost to attend. Check heartlandpride.org for event tickets, vendor info, and year-round programming.',
  null,
  'https://heartlandpride.org',
  'Omaha', null, 'Omaha', 'NE', null,
  false, false,
  array['lgbtq'],
  array['community_service', 'arts'],
  array['9', '10', '11', '12', 'college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://heartlandpride.org/', 'official_website', '2026-02-26',
  true, true,
  'Annual Pride Parade & Festival in July. Youth Pride & Family Night July 11. Annual 5K. Year-round events — check heartlandpride.org.',
  null,
  '{"type": "free_with_eligibility", "notes": "Parade and public festival areas are free. Some ticketed events. Vendor booths and some activities may have costs. Check heartlandpride.org for specific event pricing."}'::jsonb,
  '{"frequency": "annual", "notes": "Annual Pride Parade & Festival (July); annual 5K; year-round events — check heartlandpride.org/events"}'::jsonb,
  '{"primary_community": "lgbtq", "specific_identities": ["all LGBTQ+ identities", "LGBTQ+ youth", "LGBTQ+ families"], "open_to_allies": true, "notes": "Explicitly welcoming to allies, families, and the broader Omaha community. Youth Pride & Family Night specifically centers younger attendees."}'::jsonb
),

-- ── B9. TRANS NEBRASKA (ACLU OF NEBRASKA) ────────────────
-- Dedicated resource site for trans Nebraskans — know your rights,
-- name change guides, legal resources, policy tracking

(
  'Trans Nebraska — Know Your Rights & Legal Resources',
  'ACLU of Nebraska',
  'https://transnebraska.org',
  'Trans Nebraska (transnebraska.org) is a dedicated resource website launched by the ACLU of Nebraska to empower transgender and gender non-conforming Nebraskans to understand their legal rights. The site provides step-by-step guides for Nebraska name changes (adult and minor processes), gender marker changes on driver''s licenses and birth certificates, rights in schools and employment, and policy tracking on legislation affecting trans Nebraskans. Key legal information: Adult name change costs approximately $160 (filing fee + newspaper publication) and requires 1 year of county residency. Driver''s license gender marker change requires a broad physician certification (not surgery-specific). Birth certificate gender marker change currently requires sex reassignment surgery in Nebraska.',
  'free_resource',
  'Free, publicly accessible legal information for transgender and gender non-conforming Nebraskans. For direct legal assistance with discrimination or complex cases, contact the ACLU of Nebraska at aclunebraska.org.',
  null,
  'https://transnebraska.org',
  'Nebraska', null, 'Omaha', 'NE', null,
  true, false,
  array['lgbtq'],
  array['community_service'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://transnebraska.org/', 'official_website', '2026-02-26',
  true, false,
  'Online resource available 24/7 at transnebraska.org.',
  null,
  '{"type": "free", "notes": "Completely free online legal information resource."}'::jsonb,
  null,
  '{"primary_community": "lgbtq", "specific_identities": ["transgender", "non-binary", "gender non-conforming"], "open_to_allies": false, "notes": "Nebraska-specific legal information. For Iowa-specific resources, see One Iowa (oneiowa.org). Iowa laws differ significantly from Nebraska — see migration 011 for details."}'::jsonb
),

-- ── B10. ONE IOWA — IOWA LGBTQ+ RESOURCES ────────────────
-- Statewide Iowa LGBTQ+ advocacy organization
-- Website updated with July 1, 2025 law change implementation guide
-- NOTE: Must prominently note Iowa legal restrictions (see migration 011)

(
  'One Iowa — Iowa LGBTQ+ Resources & Advocacy',
  'One Iowa',
  'https://oneiowa.org',
  'One Iowa is the primary statewide LGBTQ+ advocacy organization for Iowa, providing resources, community support, and policy advocacy for LGBTQ+ Iowans — including Council Bluffs and Pottawattamie County residents. One Iowa has published a detailed implementation guide for the significant legal changes that took effect July 1, 2025, when Iowa removed gender identity from the Iowa Civil Rights Act — the first state to do so. Current Iowa legal context: sexual orientation remains protected under state law; gender identity does not. Gender-affirming care for minors is banned; Medicaid coverage for gender-affirming care is banned (as of July 1, 2025). One Iowa provides direct support to LGBTQ+ Iowans seeking care, an LGBTQ+ resource directory, and provider training programs for healthcare professionals. Legal name change is still available in Iowa; courts cannot deny a name change solely because the person is transgender.',
  'free_resource',
  'Open to all LGBTQ+ Iowans and allies. Resources and advocacy services are free at oneiowa.org. Iowa residents (including Council Bluffs) are the primary served population. For the July 1 legal changes guide, visit oneiowa.org/july-1st-2025-implementation-guide.',
  null,
  'https://oneiowa.org',
  'Iowa', null, 'Council Bluffs', 'IA', null,
  true, false,
  array['lgbtq'],
  array['community_service'],
  array['college_freshman'],
  'unpaid', null, null,
  'high', 'verified',
  'https://oneiowa.org/july-1st-2025-implementation-guide/', 'official_website', '2026-02-26',
  true, false,
  'Online resources available 24/7. Events and programs throughout Iowa — check oneiowa.org.',
  null,
  '{"type": "free", "notes": "All resources and advocacy are free to access."}'::jsonb,
  null,
  '{"primary_community": "lgbtq", "specific_identities": ["all LGBTQ+ identities", "Iowa LGBTQ+ individuals"], "open_to_allies": true, "notes": "Iowa-specific resource. Critical: Iowa removed gender identity from its Civil Rights Act effective July 1, 2025. See oneiowa.org/july-1st-2025-implementation-guide for current rights and resources."}'::jsonb
),

-- ── B11. OMAHA HUMAN RIGHTS & RELATIONS DEPT (OHRRD) ─────
-- City of Omaha — files discrimination complaints under the 2012 ordinance
-- Omaha's municipal ordinance covers SO and GI in employment/housing/public accommodations

(
  'Omaha Human Rights & Relations Department — Discrimination Complaints',
  'City of Omaha',
  'https://www.cityofomaha.org/humanrights',
  'The Omaha Human Rights and Relations Department (OHRRD) investigates complaints of discrimination in Omaha under the City''s Human Rights Ordinance. The City of Omaha has prohibited discrimination based on sexual orientation AND gender identity in employment, housing, and public accommodations since 2012 — one of the most comprehensive municipal protections in Nebraska. If you have experienced discrimination in Omaha based on your sexual orientation or gender identity, OHRRD can investigate your complaint. These protections apply within Omaha city limits, supplementing (and in the case of gender identity, going beyond) Nebraska state law. Complaint filing is free.',
  'free_resource',
  'Available to anyone who experienced discrimination in employment, housing, or public accommodations within Omaha city limits based on sexual orientation or gender identity. Discrimination must have occurred within the City of Omaha. Council Bluffs residents: contact the Iowa Civil Rights Commission for Iowa-side complaints (note: gender identity is no longer a protected class under Iowa state law as of July 1, 2025).',
  null,
  'https://www.cityofomaha.org/humanrights',
  'Omaha', null, 'Omaha', 'NE', null,
  false, false,
  array['lgbtq'],
  array['community_service'],
  array[]::text[],
  'unpaid', null, null,
  'high', 'verified',
  'https://www.hrc.org/resources/municipalities/omaha-ne', 'official_website', '2026-02-26',
  true, false,
  'Monday–Friday during city business hours.',
  null,
  '{"type": "free", "notes": "Free government service. Filing a discrimination complaint costs nothing."}'::jsonb,
  null,
  '{"primary_community": "lgbtq", "specific_identities": ["all LGBTQ+ identities"], "open_to_allies": false, "notes": "Omaha city limits only. Covers sexual orientation AND gender identity under the 2012 ordinance. Iowa-side (CB): contact Iowa Civil Rights Commission for sexual orientation complaints; gender identity not protected under Iowa state law as of July 1, 2025."}'::jsonb
);

-- ══════════════════════════════════════════════════════════
-- SECTION C: UPDATE EXISTING LISTINGS
-- ══════════════════════════════════════════════════════════

-- ── UPDATE: OneWorld Community Health Centers (Phase 3) ───
-- OneWorld explicitly offers LGBTQ+ affirming care including hormone therapy,
-- PrEP, HIV/STI testing, and mental health — confirmed from their own website
-- and HRC Healthcare Equality recognition.
-- Adding: lgbtq identity tag, LGBTQ+ description update, identity_focus.

update public.opportunities
set
  identity_tags = array['low_income', 'immigrant', 'esl', 'hispanic', 'lgbtq'],
  description = 'Federally Qualified Health Center with multiple Omaha locations offering medical, dental, behavioral health, pharmacy, and support services on a sliding fee scale. OneWorld explicitly provides LGBTQ+ affirming care including gender-affirming hormone therapy, PrEP access, HIV and STI testing, and mental health services for LGBTQ+ patients. Accepts Medicaid, Medicare, and private insurance. Specializes in serving uninsured and underinsured patients regardless of ability to pay. Includes health insurance enrollment assistance, interpreter services, and school-based health centers.',
  identity_focus = '{"primary_community": "lgbtq", "specific_identities": ["all LGBTQ+ identities", "transgender", "non-binary"], "open_to_allies": true, "notes": "OneWorld explicitly welcomes LGBTQ+ patients. Verified LGBTQ+ inclusive healthcare provider per HRC Healthcare Equality Index. Offers hormone therapy, PrEP, and affirming mental health care alongside general community health services."}'::jsonb
where
  organization = 'OneWorld Community Health Centers'
  and title = 'OneWorld Community Health Centers';

-- ============================================================
-- PHASE 6 COMPLETION REPORT
-- ============================================================
--
-- Total new entries: 17
--   Section A (Native American): 6
--   Section B (LGBTQ+): 11
-- Existing listings updated with identity_focus: 1 (OneWorld)
--
-- By geography:
--   Omaha / Nebraska-side:   12 new entries
--   Iowa-side:                1 new entry (One Iowa)
--   Statewide / national:     4 new entries (scholarships, NCIA)
--
-- By type:
--   free_resource  11  (health, advocacy, legal, state resources)
--   scholarship     3  (Omaha Tribe Higher Ed, AICF, Native Forward)
--   workshop        3  (PFLAG, RCGA, Heartland Pride)
--
-- Native American breakdown:
--   Open to all Native Americans (IHS-eligible): 1 (Fred LeRoy)
--   Enrolled Ponca tribal member priority: 1 (Ponca Tribe Social Services)
--   Enrolled Omaha Tribe members only: 1 (Omaha Tribe Higher Ed)
--   Any tribal enrollment/descendancy: 2 (AICF, Native Forward)
--   Nebraska tribal nations + off-reservation: 1 (NCIA)
--
-- LGBTQ+ breakdown by sub-population:
--   General LGBTQ+ community hub: 2 (Omaha ForUs, Heartland Pride)
--   LGBTQ+ youth 13-23: 1 (Omaha ForUs Proud Horizons)
--   Trans/non-binary specific: 3 (RCGA, PP Omaha, NE Medicine Gender Care)
--   Trans/non-binary legal resources: 1 (Trans Nebraska)
--   Families and allies: 1 (PFLAG Omaha)
--   HIV/AIDS: 1 (Nebraska AIDS Project)
--   Iowa-specific: 1 (One Iowa)
--   Discrimination/legal: 1 (Omaha OHRRD)
--   General advocacy/resources: 1 (OutNebraska)
--
-- NOTABLE: PFLAG Omaha offers a Spanish-English bilingual meeting
--   (4th Thursday) — documented in language_access field.
--   This is a rare and important resource for Spanish-speaking LGBTQ+ families.
--
-- CONFIRMED VERIFIED: Omaha ForUs is a CenterLink-listed dedicated LGBTQ+
--   community center with active ongoing programming. This directly answers
--   the Phase 6 prompt question of whether Omaha has a dedicated LGBTQ+ center.
--   ANSWER: Yes — Omaha ForUs at 3337 N 107th St, (531) 466-1839.
--
-- LEGAL LANDSCAPE SUMMARY (documented in migration 011):
--   Omaha: Strongest local protections — 2012 ordinance covers SO + GI
--   Nebraska state: No explicit SO/GI nondiscrimination law; surgery/hormone
--     restrictions for minors under LB 574; birth certificate change requires surgery
--   Iowa: CRITICAL CHANGE July 1, 2025 — gender identity removed from Iowa
--     Civil Rights Act; gender-affirming care for minors banned; Medicaid
--     coverage for gender-affirming care banned. Sexual orientation still protected.
--
-- GAPS THAT REMAIN:
--   Two-Spirit specific organizations: None found with verifiable current
--     local Omaha/CB presence. This is a real gap — not a search failure.
--   Nebraska Indian Legal Services: Could not verify existence or active operation.
--   Winnebago Tribe of Nebraska Omaha-area programs: Not verified.
--   LGBTQ+ affirming faith communities: Countryside Community Church (PFLAG host)
--     likely affirming but not independently verified from their website.
--     Metropolitan Community Church Omaha status not confirmed.
--   Iowa-side LGBTQ+ organizations: Council Bluffs has no verified dedicated
--     LGBTQ+ organization — residents are served by Omaha metro orgs and One Iowa.
--   LGBTQ+ employment/professional networking: No local chapter of Out & Equal
--     or similar org verified in Omaha.
--   Native American legal aid specific to Indian law: Not verified locally.
--
-- RECOMMENDED PHASE 7 PRIORITIES:
--   1. Health & Wellness Access — mental health (no-cost), dental,
--      vision, reproductive health, uninsured navigation
--   2. Housing & Stability — rental assistance, eviction prevention,
--      homebuyer education, utility assistance
--   3. LGBTQ+ affirming faith communities — verify Countryside Community
--      Church, search for MCC Omaha, other openly affirming congregations
--   4. Native American cultural/community organizations — powwow committees,
--      cultural programs accessible to urban Native residents
--   5. Two-Spirit resources — monitor for any emerging local presence;
--      document national organizations offering remote programming
--   6. LGBTQ+ youth specifically — verify Project Harmony LGBTQ+ programming,
--      GSA network coordinator for Omaha metro schools
--   7. Latinx LGBTQ+ resources — Florecer (via Omaha ForUs) is a start;
--      verify other Spanish-speaking LGBTQ+ community spaces
--
-- DATABASE TOTALS AFTER PHASE 6:
--   Phase 1: 17 | Phase 2: 12 | Phase 3: 15 | Phase 4: 23
--   Phase 5: 18 | Phase 6: 17
--   Total active: ~102 verified opportunities
-- ============================================================
