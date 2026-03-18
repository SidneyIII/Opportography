-- ============================================================
-- Opportography — Migration 070
-- Phase 15H: Career Pathways — Athletics, Physical Therapy &
--             Sports Science
-- Date: 2026-03-18
--
-- 2 verified entries:
--   1. Special Olympics Nebraska — Volunteer Coach Program
--   2. Clarkson College — Spring Open House (Healthcare/PT programs)
--
-- Dead ends researched and excluded:
--   - NSCA (National Strength and Conditioning Association):
--     NOTE — the prompt indicated NSCA is "headquartered in Omaha"
--     but NSCA is actually headquartered in Colorado Springs, CO.
--     No confirmed Omaha-area chapter or free local events found.
--     NSCA's annual conference is paid and out-of-state. Skip.
--   - Nebraska Physical Therapy Association: organization confirmed
--     active (npta.net) but could not verify free public events
--     for non-members/non-PTs
--   - UNO Sports Administration program events: no confirmed free
--     public career event for community members found
--   - NSAA officiating clinics: not confirmed as under $20;
--     officiating clinic costs vary and were not verified
-- ============================================================

-- 1. Special Olympics Nebraska — Volunteer Coach Program
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
  'Special Olympics Nebraska — Volunteer Coach Program (Free)',
  'Special Olympics Nebraska',
  'https://www.sone.org/get-involved/become-a-coach.html',
  'Special Olympics Nebraska trains and supports volunteer coaches who work with athletes with intellectual disabilities across 30+ sports including basketball, swimming, track and field, bowling, soccer, and more. No prior coaching experience is required — all training, certification materials, and support are provided free of charge. Coaches develop skills in adaptive sports instruction, athlete motivation, program management, and inclusive coaching. For anyone pursuing careers in coaching, athletic training, adapted physical education, therapeutic recreation, physical therapy, or sports administration, volunteering as a Special Olympics coach is one of the most meaningful and free career entry points in the Omaha metro. Special Olympics Nebraska headquarters is in Omaha.',
  'community',
  'Free. Open to all adults. No prior coaching experience required — all training provided. Volunteer registration opens 5–6 weeks before events. Visit sone.org/get-involved/become-a-coach.html to apply.',
  NULL,
  'https://www.sone.org/get-involved/become-a-coach.html',
  'Omaha, NE', '14216 Dayton Cir, Ste 1', 'Omaha', 'NE', '68137',
  false, false,
  '{low_income,first_gen,disability_ally}', '{athletics,coaching,adaptive_sports,sports_science,physical_therapy,volunteer,career_exploration}', '{}',
  'high', 'verified',
  'https://www.sone.org/get-involved/become-a-coach.html', 'official_website', '2026-03-18',
  'Seasonal, tied to sport seasons. Volunteer registration opens 5–6 weeks before each event. Year-round coaching opportunities available.',
  true, true, '2026-03-18', '2026-03-18',
  '{"career_field": "athletics", "subcategory": "coaching_sports_administration", "opportunity_type": "volunteer", "cost_details": {"amount": 0, "cost_type": "free", "conditions": null, "waiver_available": false, "waiver_details": null}, "delivery": "in_person", "listing_type": "volunteer_program", "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
);

-- 2. Clarkson College — Spring Open House (Healthcare & PT/Allied Health Programs)
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
  'Clarkson College — Spring Open House (PT, OT, Nursing & Allied Health Exploration)',
  'Clarkson College',
  'https://www.clarksoncollege.edu/',
  'Clarkson College hosts a free annual spring open house for prospective students and career explorers to discover healthcare programs including Physical Therapist Assistant, Nursing, Radiologic Technology, Respiratory Care, and Health Services Administration. Attendees can tour campus facilities, meet faculty and current students, and get detailed information about program-specific career pathways. Spring 2025 Open House is March 28. Clarkson College is a healthcare-focused institution embedded in the Nebraska Medicine health system — its graduates go directly into Omaha''s largest healthcare network. The annual event is one of the best free ways to explore PT, OT, and allied health careers in person.',
  'workshop',
  'Free. Open to anyone exploring healthcare or allied health careers. Spring 2025: March 28. Visit clarksoncollege.edu or contact admissions for future open house dates.',
  NULL,
  'https://www.clarksoncollege.edu/',
  'Omaha, NE', '101 S 42nd St', 'Omaha', 'NE', '68131',
  false, false,
  '{low_income,first_gen}', '{athletics,physical_therapy,occupational_therapy,healthcare,nursing,allied_health,career_exploration,open_house}', '{}',
  'high', 'verified',
  'https://www.clarksoncollege.edu/', 'official_website', '2026-03-18',
  'Annual spring open house. Spring 2025: March 28. Check clarksoncollege.edu for future dates.',
  true, false, '2026-03-18', '2026-03-18',
  '{"career_field": "athletics", "subcategory": "physical_therapy_ot", "opportunity_type": "open_house", "cost_details": {"amount": 0, "cost_type": "free", "conditions": null, "waiver_available": false, "waiver_details": null}, "delivery": "in_person", "listing_type": "academic_program", "accessibility": {"cost_barrier": "free", "requires_enrollment": false, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
);
