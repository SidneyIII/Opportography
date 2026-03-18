-- ============================================================
-- Opportography — Migration 064
-- Phase 15B: Career Pathways — Education & Teaching
-- Date: 2026-03-18
--
-- 1 verified entry:
--   1. Big Brothers Big Sisters of the Midlands — Mentor Info Sessions
--
-- Dead ends researched and excluded:
--   - Teach For America Omaha: no Omaha-specific location confirmed;
--     TFA operates nationally and the Omaha "corps" placement could
--     not be verified as a distinct local site with physical presence
--   - OPS Substitute Teacher info sessions: OPS does hire substitutes
--     but no confirmed recurring public career info session format found
--   - UNO College of Education public events: general department page
--     found, but no specific free public career event verified for 2025
--   - NSEA/ISEA public events: membership-based organizations with
--     no confirmed free public events for non-members
--
-- Note: Education field is under-represented. Flag for Phase 16.
-- ============================================================

-- 1. Big Brothers Big Sisters of the Midlands — Mentor Info Sessions
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
  'Big Brothers Big Sisters of the Midlands — Mentor Info Sessions (Omaha & Council Bluffs)',
  'Big Brothers Big Sisters of the Midlands',
  'https://bbbsmidlands.org/be-a-mentor/overview.html',
  'Big Brothers Big Sisters of the Midlands holds free quarterly mentor info sessions in Omaha and Council Bluffs, where prospective mentors learn about the program, hear from current mentors and staff, and begin the enrollment process. BBBS matches youth ages 6–18 with adult mentors through community-based and school-based programs. Serving as a Big Brother or Big Sister is valuable career experience for anyone interested in education, school counseling, social work, youth development, or nonprofit work — and BBBS specifically serves the Council Bluffs and metro Omaha area on both sides of the river.',
  'mentorship',
  'Free. Open to adults 18+. Volunteers complete an info session, volunteer application, and mentor training. Contact enroll@bbbsomaha.org or visit bbbsmidlands.org to learn about upcoming sessions.',
  NULL,
  'https://bbbsmidlands.org/be-a-mentor/overview.html',
  'Omaha, NE / Council Bluffs, IA (metro-wide)', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen}', '{education,mentorship,youth_development,social_work,career_exploration,council_bluffs}', '{}',
  'high', 'verified',
  'https://bbbsmidlands.org/be-a-mentor/overview.html', 'official_website', '2026-03-18',
  'Quarterly mentor info sessions. Rolling volunteer applications accepted year-round.',
  true, true, '2026-03-18', '2026-03-18',
  '{"career_field": "education", "subcategory": "youth_development", "opportunity_type": "mentorship", "cost_details": {"amount": 0, "cost_type": "free", "conditions": null, "waiver_available": false, "waiver_details": null}, "delivery": "in_person", "listing_type": "volunteer_program", "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": true, "multilingual": false}}'::jsonb
);
