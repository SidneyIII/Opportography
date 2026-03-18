-- ============================================================
-- Opportography — Migration 066
-- Phase 15D: Career Pathways — Law & Legal Careers
-- Date: 2026-03-18
--
-- 2 verified entries:
--   1. Creighton Law — Pre-Law Faculty Info Sessions
--   2. CASA for Douglas County — Volunteer Advocate Training
--
-- Dead ends researched and excluded:
--   - Nebraska Hispanic Bar Association: organization referenced
--     online but no active website or confirmed public events found
--   - Heartland Black Lawyers / Midlands Bar Association:
--     no verified active organization with public events found
--   - Nebraska State Bar VLP Self-Help Center: a legal AID SERVICE
--     for low-income clients, not a career exploration pathway
--   - Iowa State Bar: no confirmed free public events for
--     non-attorneys / Pottawattamie County
--   - Omaha Bar Association: could not confirm existence as
--     separate entity from Nebraska State Bar; skipped
-- ============================================================

-- 1. Creighton University School of Law — Pre-Law Faculty Info Sessions
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
  'Creighton University School of Law — Free Pre-Law Info Sessions',
  'Creighton University School of Law',
  'https://choose.creighton.edu/portal/pre-law-info-session',
  'Creighton Law offers free pre-law faculty information sessions on select Tuesdays at 3:00 PM at its campus in Omaha. Attendees can meet faculty and current law students, take a tour of the law school, sit in on a class, and speak one-on-one with admissions staff about the path to law school — including application requirements, LSAT prep, and financial aid. Open to anyone considering law school; you do not need to be a Creighton undergraduate to attend. Creighton School of Law is one of only two ABA-accredited law schools in Nebraska and a primary feeder to the regional legal market in Omaha and Council Bluffs.',
  'workshop',
  'Free. Open to anyone considering law school — no Creighton enrollment required. Register at choose.creighton.edu/portal/pre-law-info-session. Contact lawadmissions@creighton.edu or call 402.280.2703 with questions.',
  NULL,
  'https://choose.creighton.edu/portal/pre-law-info-session',
  'Omaha, NE', '2500 California Plaza', 'Omaha', 'NE', '68178',
  false, false,
  '{low_income,first_gen}', '{law,pre_law,law_school,legal_career,LSAT,career_exploration}', '{}',
  'high', 'verified',
  'https://choose.creighton.edu/portal/pre-law-info-session', 'official_website', '2026-03-18',
  'Select Tuesdays at 3:00 PM. Register online to confirm date and availability.',
  true, true, '2026-03-18', '2026-03-18',
  '{"career_field": "law", "subcategory": "pre_law_pipeline", "opportunity_type": "info_session", "cost_details": {"amount": 0, "cost_type": "free", "conditions": null, "waiver_available": false, "waiver_details": null}, "delivery": "in_person", "listing_type": "academic_program", "accessibility": {"cost_barrier": "free", "requires_enrollment": false, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
);

-- 2. CASA for Douglas County — Volunteer Court Advocate Training
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
  'CASA for Douglas County — Volunteer Court Advocate Training (Free, 30 Hours)',
  'CASA for Douglas County',
  'https://casaomaha.org/volunteer',
  'CASA (Court Appointed Special Advocates) for Douglas County trains community volunteers to speak on behalf of abused and neglected children in court proceedings. The free 30-hour training spans five weeks and covers child welfare law, the court system, trauma-informed care, and effective advocacy. CASA volunteers gain direct exposure to family court, child welfare, social work, and law — making this one of the most meaningful free career exploration programs at the intersection of legal and social services. Requires a 21+ age minimum and a 2-year commitment of 10–12 hours per month. CASA is located at 2412 St. Mary''s Ave, Omaha.',
  'workshop',
  'Free. Must be 21 or older. Requires 2-year commitment of 10–12 hours/month. Apply and view training calendar at casaomaha.org/volunteer or call (402) 932-5683.',
  NULL,
  'https://casaomaha.org/volunteer',
  'Omaha, NE', '2412 St. Mary''s Ave', 'Omaha', 'NE', '68105',
  false, false,
  '{low_income,first_gen}', '{law,social_work,child_welfare,volunteer,legal_career,court,career_exploration}', '{}',
  'high', 'verified',
  'https://casaomaha.org/', 'official_website', '2026-03-18',
  'Training cohorts offered throughout the year. Visit casaomaha.org/volunteer for current training calendar.',
  true, true, '2026-03-18', '2026-03-18',
  '{"career_field": "law", "subcategory": "legal_advocacy", "opportunity_type": "volunteer", "cost_details": {"amount": 0, "cost_type": "free", "conditions": null, "waiver_available": false, "waiver_details": null}, "delivery": "in_person", "listing_type": "volunteer_program", "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
);
