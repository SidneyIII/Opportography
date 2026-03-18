-- ============================================================
-- Opportography — Migration 068
-- Phase 15F: Career Pathways — Law Enforcement, Criminal Justice
--             & Public Safety
-- Date: 2026-03-18
--
-- 3 verified entries:
--   1. Omaha Police Department Citizen Police Academy
--   2. Douglas County CERT Training (Free, 26 hours)
--   3. UNO School of Criminology True Crime Public Lecture Series
--
-- Dead ends researched and excluded:
--   - Nebraska Criminal Justice Association: could not confirm
--     active chapter with public events
--   - Iowa Department of Corrections career events: no confirmed
--     public events in Pottawattamie County area
--   - Pottawattamie County Sheriff Citizens Academy: could not
--     confirm 2025 program status or cost
-- ============================================================

-- 1. Omaha Police Department — Citizen Police Academy
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
  'Omaha Police Department — Citizen Police Academy (Free)',
  'Omaha Police Department',
  'https://police.cityofomaha.org/community-involvement/community-and-crime-prevention-programs/citizen-academy',
  'The Omaha Police Department Citizen Police Academy is a free multi-week program offered by each OPD precinct that gives community members an inside look at police operations. Topics include criminal investigations, domestic violence response, K-9 patrol, mounted patrol, firearms safety, legal issues, and arrest and control tactics. Participants are offered a Ride-Along with an Omaha police officer during routine patrol. Each precinct runs its own academy on a rolling schedule — contact your local precinct to find the next available session. An excellent career exploration tool for anyone interested in law enforcement, criminal justice, public safety, or community policing.',
  'workshop',
  'Free. Open to Omaha community members. Sessions offered by each OPD precinct — contact your local precinct or visit police.cityofomaha.org/community-involvement for current schedule.',
  NULL,
  'https://police.cityofomaha.org/community-involvement/community-and-crime-prevention-programs/citizen-academy',
  'Omaha, NE (by precinct)', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen}', '{law_enforcement,criminal_justice,public_safety,career_exploration,community_policing}', '{}',
  'high', 'verified',
  'https://police.cityofomaha.org/community-involvement/community-and-crime-prevention-programs/citizen-academy', 'official_website', '2026-03-18',
  'Rolling schedule by precinct. Contact your local OPD precinct for current session dates.',
  true, true, '2026-03-18', '2026-03-18',
  '{"career_field": "law_enforcement", "subcategory": "policing", "opportunity_type": "workshop", "cost_details": {"amount": 0, "cost_type": "free", "conditions": null, "waiver_available": false, "waiver_details": null}, "delivery": "in_person", "listing_type": "workshop", "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
);

-- 2. Douglas County CERT — Community Emergency Response Team Training
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
  'Douglas County CERT — Free Community Emergency Response Team Training',
  'Douglas County Office of Emergency Management / Tri-County Citizen Corps',
  'https://www.necitizencorps.org/cert',
  'The Community Emergency Response Team (CERT) program trains community members to safely assist professional emergency responders during disasters. The free 26-hour training — offered by the Tri-County Citizen Corps covering Douglas, Sarpy, Washington, and Dodge counties — covers emergency preparedness, fire safety, disaster medical operations, search and rescue basics, and disaster psychology. CERT graduates become certified community first responders. This training is one of the most direct free pathways into careers in emergency management, homeland security, fire service, EMS, and public health preparedness. Contact Tri-County CERT at (402) 339-4334 ext. 208 for current training dates.',
  'workshop',
  'Free. Open to all Omaha metro community members. 26-hour training across multiple sessions. Contact Tri-County CERT at (402) 339-4334 ext. 208 or visit necitizencorps.org/cert for training schedule.',
  NULL,
  'https://www.necitizencorps.org/cert',
  'Douglas County, NE (Omaha metro)', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen}', '{emergency_management,public_safety,law_enforcement,first_responder,volunteer,career_exploration}', '{}',
  'high', 'verified',
  'https://www.necitizencorps.org/cert', 'official_website', '2026-03-18',
  'Training cohorts offered periodically. 26 hours total over multiple sessions. Contact (402) 339-4334 ext. 208 for current dates.',
  true, true, '2026-03-18', '2026-03-18',
  '{"career_field": "law_enforcement", "subcategory": "emergency_management", "opportunity_type": "workshop", "cost_details": {"amount": 0, "cost_type": "free", "conditions": null, "waiver_available": false, "waiver_details": null}, "delivery": "in_person", "listing_type": "workshop", "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
);

-- 3. UNO School of Criminology — True Crime Public Lecture Series
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
  'UNO School of Criminology — True Crime Public Lecture Series (Free)',
  'University of Nebraska Omaha School of Criminology and Criminal Justice',
  'https://www.unomaha.edu/college-of-public-affairs-and-community-service/criminology-and-criminal-justice/index.php',
  'UNO''s nationally recognized School of Criminology and Criminal Justice — ranked among the top programs in the country — hosts a free public True Crime Lecture Series each semester. Spring 2025 features a presentation by criminologist Mark Langan on April 9, 4:00–5:00 PM, at the College of Public Affairs and Community Service (Room 132D). Everyone is welcome — no UNO enrollment required. The series covers real criminal cases through an academic lens, providing direct exposure to the fields of criminology, criminal justice, forensic science, and law. Career and internship fairs in the department are also open to community members interested in criminal justice careers.',
  'workshop',
  'Free. Open to everyone — no UNO enrollment required. Spring 2025: April 9, 4:00–5:00 PM, CPACS Room 132D. Check events.unomaha.edu for upcoming semester schedules.',
  NULL,
  'https://events.unomaha.edu/department/college-public-affairs-and-community-service',
  'Omaha, NE', '6001 Dodge St', 'Omaha', 'NE', '68182',
  false, false,
  '{low_income,first_gen}', '{criminal_justice,law_enforcement,criminology,career_exploration,public_lecture}', '{}',
  'high', 'verified',
  'https://events.unomaha.edu/event/uno-school-of-criminology-and-criminal-justice-spring-2025-true-crime-series-7492', 'official_website', '2026-03-18',
  'Each semester (Spring and Fall). Spring 2025: April 9, 4:00–5:00 PM, CPACS 132D.',
  true, false, '2026-03-18', '2026-03-18',
  '{"career_field": "law_enforcement", "subcategory": "criminology", "opportunity_type": "lecture_series", "cost_details": {"amount": 0, "cost_type": "free", "conditions": null, "waiver_available": false, "waiver_details": null}, "delivery": "in_person", "listing_type": "academic_program", "accessibility": {"cost_barrier": "free", "requires_enrollment": false, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
);
