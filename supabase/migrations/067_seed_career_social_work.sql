-- ============================================================
-- Opportography — Migration 067
-- Phase 15E: Career Pathways — Social Work & Human Services
-- Date: 2026-03-18
--
-- 3 verified entries:
--   1. United Way of the Midlands — Emerging Leaders Program
--   2. Nonprofit Association of the Midlands — Events & Workshops
--   3. Project Harmony — Volunteer Program
--
-- Dead ends researched and excluded:
--   - NASW Nebraska Annual Conference 2025: confirmed active
--     (keynote: Lutze Segu MSW) but conference registration
--     cost exceeds $20 threshold; no confirmed free public events
--     for non-members; skip pending verification of chapter meetings
--   - Nebraska Appleseed: organization confirmed active
--     (nebraskaappleseed.org) but specific free volunteer
--     events for career exploration could not be confirmed
--   - Iowa DHS child welfare career events: no confirmed events
--     in Council Bluffs/Pottawattamie County found
-- ============================================================

-- 1. United Way of the Midlands — Emerging Leaders Program
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
  'United Way of the Midlands — Emerging Leaders (Volunteer & Nonprofit Career Pathway)',
  'United Way of the Midlands',
  'https://unitedwaymidlands.org/leaders-in-giving/emerging-leaders/',
  'Emerging Leaders is a free program for professionals under 40 in the Omaha metro who want to give back through volunteerism, advocacy, and community engagement. The 600+ member network volunteers with JAG Nebraska (mentoring high school students on career readiness), participates in Day of Caring and Shine Bright volunteer events, and receives invitations to professional development programming and special events. For anyone exploring nonprofit careers, social impact work, community organizing, or philanthropic careers, Emerging Leaders provides direct exposure to the sector and relationships with established nonprofit professionals.',
  'community',
  'Free. Open to professionals under 40 in the Omaha metro. Visit unitedwaymidlands.org/leaders-in-giving/emerging-leaders/ to learn more and get involved.',
  NULL,
  'https://unitedwaymidlands.org/leaders-in-giving/emerging-leaders/',
  'Omaha, NE (metro-wide)', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen}', '{social_work,nonprofit,community_organizing,volunteering,career_exploration,professional_development}', '{}',
  'high', 'verified',
  'https://unitedwaymidlands.org/leaders-in-giving/emerging-leaders/', 'official_website', '2026-03-18',
  'Year-round program. Volunteer events include Day of Caring, Shine Bright, and JAG Nebraska mentoring sessions.',
  true, false, '2026-03-18', '2026-03-18',
  '{"career_field": "social_work", "subcategory": "nonprofit_careers", "opportunity_type": "volunteer", "cost_details": {"amount": 0, "cost_type": "free", "conditions": null, "waiver_available": false, "waiver_details": null}, "delivery": "in_person", "listing_type": "professional_association", "accessibility": {"cost_barrier": "free", "requires_enrollment": false, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
);

-- 2. Nonprofit Association of the Midlands — Career Events & Workshops
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
  'Nonprofit Association of the Midlands — Free Workshops & Career Events',
  'Nonprofit Association of the Midlands',
  'https://www.nonprofitam.org/events/',
  'The Nonprofit Association of the Midlands (NAM) is the premier nonprofit sector organization in the Omaha metro, hosting dozens of workshops, trainings, and networking events year-round. Many events are free or low-cost — the annual Nonprofit Summit of the Midlands brings together 300+ nonprofit leaders. NAM''s public events include governance workshops, fundraising training, advocacy sessions, and community events open to the public at no charge. The October Battle of the Bands community event is free and family-friendly. For anyone exploring careers in nonprofit management, fundraising, advocacy, or community development, NAM''s event calendar is the single best resource in the metro.',
  'networking',
  'Free or low-cost (events vary; many free, workshops typically under $20 for non-members). Open to the public. See full event calendar at nonprofitam.org/events.',
  NULL,
  'https://www.nonprofitam.org/events/',
  'Omaha, NE (various venues)', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen}', '{social_work,nonprofit,career_exploration,professional_development,community_organizing,fundraising}', '{}',
  'high', 'verified',
  'https://www.nonprofitam.org/events/', 'official_website', '2026-03-18',
  'Year-round events. Annual Nonprofit Summit in November. Battle of the Bands community event in October (free). Check nonprofitam.org/events for current calendar.',
  true, true, '2026-03-18', '2026-03-18',
  '{"career_field": "social_work", "subcategory": "nonprofit_careers", "opportunity_type": "professional_association", "cost_details": {"amount": 0, "cost_type": "free_with_conditions", "conditions": "Many events are free; some workshops have low registration fees (typically under $20 for public). Check individual event listings.", "waiver_available": false, "waiver_details": null}, "delivery": "in_person", "listing_type": "professional_association", "accessibility": {"cost_barrier": "free", "requires_enrollment": false, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
);

-- 3. Project Harmony Child Advocacy Center — Volunteer Program
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
  'Project Harmony — Child Advocacy Center Volunteer Program',
  'Project Harmony',
  'https://projectharmony.com/get-involved/volunteer/',
  'Project Harmony is the Omaha metro''s child advocacy center, providing response, treatment, and prevention services for children impacted by abuse and neglect. Volunteers support the organization''s multidisciplinary work and gain exposure to child welfare case management, forensic interviewing, trauma-informed services, and the coordination between law enforcement, child protective services, medical staff, and mental health professionals. Project Harmony also hosts 400+ professional trainings per year for educators, medical staff, law enforcement, and social workers — some of which are open to community members. Meaningful career exposure for social work, counseling, law, and child welfare fields.',
  'community',
  'Free. Open to community volunteers. Apply at projectharmony.com/volunteer-inquiry-form or email ghogan@projectharmony.com for information about current volunteer opportunities.',
  NULL,
  'https://projectharmony.com/get-involved/volunteer/',
  'Omaha, NE', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen}', '{social_work,child_welfare,counseling,law,volunteer,career_exploration,trauma_informed}', '{}',
  'high', 'verified',
  'https://projectharmony.com/get-involved/volunteer/', 'official_website', '2026-03-18',
  'Year-round volunteer program. Contact ghogan@projectharmony.com or projectharmony.com/volunteer-inquiry-form.',
  true, false, '2026-03-18', '2026-03-18',
  '{"career_field": "social_work", "subcategory": "child_welfare", "opportunity_type": "volunteer", "cost_details": {"amount": 0, "cost_type": "free", "conditions": null, "waiver_available": false, "waiver_details": null}, "delivery": "in_person", "listing_type": "volunteer_program", "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
);
