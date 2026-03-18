-- ============================================================
-- Opportography — Migration 065
-- Phase 15C: Career Pathways — Science (Biology, Environmental,
--             Conservation)
-- Date: 2026-03-18
--
-- 2 verified entries:
--   1. Henry Doorly Zoo Adult Volunteer & Docent Program
--   2. Nebraska Game & Parks Volunteer-In-Parks (VIP) Program
--
-- Dead ends researched and excluded:
--   - Nebraska Academy of Sciences: organization exists
--     (nebraskaacademy.org) but annual meeting cost ($35–$50
--     range) exceeds the $20 threshold; no confirmed free
--     public events found
--   - American Chemical Society Nebraska section: chapter exists
--     but local public meeting calendar was not accessible;
--     skip pending verification
--   - Sigma Xi UNO chapter: could not confirm active public events
--   - Lauritzen Gardens volunteer program: website found
--     (lauritzengardens.org) but specific volunteer training
--     info/dates could not be confirmed for 2025-2026
--   - Papio-Missouri River NRD: confirmed active organization
--     but no specific free volunteer conservation program page
--     with current 2025 dates found; skip pending verification
-- ============================================================

-- 1. Omaha's Henry Doorly Zoo — Adult Volunteer & Docent Program
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
  'Henry Doorly Zoo & Aquarium — Adult Volunteer & Docent Program',
  'Omaha''s Henry Doorly Zoo & Aquarium',
  'https://www.omahazoo.com/volunteer',
  'One of the world''s premier zoos trains adult volunteer docents to facilitate educational experiences for guests — including biofact presentations, exhibit interpretation, guided tours, and support at special events. Volunteers receive in-depth training in conservation science, wildlife biology, and environmental education. Quarterly information sessions are held for prospective volunteers. Requires a 2-year commitment and minimum annual hours. This is one of the strongest free pathways into conservation biology, zoology, environmental education, and science communication careers in the Omaha metro. Email volunteers@omahazoo.com to learn about upcoming info sessions.',
  'community',
  'Free. Must be 18 or older. Requires 2-year volunteer commitment and minimum annual hours. Application, interview, and orientation required. Email volunteers@omahazoo.com for information on quarterly info sessions.',
  NULL,
  'https://www.omahazoo.com/volunteer',
  'Omaha, NE', '3701 S 10th St', 'Omaha', 'NE', '68107',
  false, false,
  '{low_income,first_gen}', '{science,conservation,zoology,biology,environmental_science,volunteer,career_exploration,stem}', '{}',
  'high', 'verified',
  'https://www.omahazoo.com/volunteer', 'official_website', '2026-03-18',
  'Quarterly information sessions for new volunteers. Year-round commitment once enrolled.',
  true, true, '2026-03-18', '2026-03-18',
  '{"career_field": "science", "subcategory": "conservation_zoology", "opportunity_type": "volunteer", "cost_details": {"amount": 0, "cost_type": "free", "conditions": null, "waiver_available": false, "waiver_details": null}, "delivery": "in_person", "listing_type": "volunteer_program", "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
);

-- 2. Nebraska Game & Parks Commission — Volunteer-In-Parks (VIP) Program
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
  'Nebraska Game & Parks Commission — Volunteer-In-Parks (VIP) Program',
  'Nebraska Game & Parks Commission',
  'https://outdoornebraska.gov/about/give-back/help-in-a-park/',
  'Nebraska Game and Parks Commission''s Volunteer-In-Parks (VIP) program engages volunteers in habitat restoration, trail building and maintenance, invasive species removal, pollinator garden enhancement, and environmental education at state parks and wildlife areas accessible from the Omaha metro. No prior experience is required — all work is supervised and skill development is part of the program. VIP volunteers gain hands-on experience in conservation biology, natural resources management, and environmental stewardship. The Nebraska Master Naturalist Program (nemasternaturalist.org) offers complementary 60-hour training for deeper engagement.',
  'community',
  'Free. Open to all ages (minors need parental supervision for some activities). No prior experience required. Visit outdoornebraska.gov/volunteer or contact Nebraska Game & Parks to learn about volunteer opportunities at parks near Omaha.',
  NULL,
  'https://outdoornebraska.gov/about/give-back/help-in-a-park/',
  'Nebraska state parks near Omaha metro', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen}', '{science,conservation,environmental_science,ecology,natural_resources,volunteer,career_exploration,outdoors}', '{}',
  'high', 'verified',
  'https://outdoornebraska.gov/about/give-back/help-in-a-park/', 'official_website', '2026-03-18',
  'Seasonal volunteer opportunities throughout the year. Contact Nebraska Game & Parks for current project calendar.',
  true, false, '2026-03-18', '2026-03-18',
  '{"career_field": "science", "subcategory": "environmental_science", "opportunity_type": "volunteer", "cost_details": {"amount": 0, "cost_type": "free", "conditions": null, "waiver_available": false, "waiver_details": null}, "delivery": "in_person", "listing_type": "volunteer_program", "accessibility": {"cost_barrier": "free", "requires_enrollment": false, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
);
