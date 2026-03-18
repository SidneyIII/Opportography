-- ============================================================
-- Opportography — Migration 073
-- Phase 15K: Career Pathways — Trades & Skilled Labor
-- Date: 2026-03-18
--
-- 2 verified entries:
--   1. IBEW Local 22 / OJEATC — Electrician Apprenticeship
--      (Year-Round Applications)
--   2. Habitat for Humanity of Omaha — Volunteer Build Days
--
-- Dead ends researched and excluded:
--   - UA Local 464 (Plumbers & Steamfitters): confirmed to exist
--     in Omaha but specific apprenticeship info session dates
--     or free public application events could not be confirmed
--   - Ironworkers Local 21: confirmed active but no specific
--     free public info session verified
--   - SkillsUSA Nebraska: K-12 organization primarily, not
--     community-accessible career exploration for adults
--   - YouthBuild Omaha: no confirmed YouthBuild site in Omaha,
--     Nebraska — YouthBuild operates nationally but Omaha site
--     could not be verified
--   - Home Builders Association Greater Omaha: confirmed active
--     (omahabuilders.com) but no specific free public career
--     event verified for 2025-2026
--   - MCC trade program open houses: MCC confirmed active trade
--     programs (welding, HVAC, automotive at Fort Omaha Campus)
--     but no specific open house event with confirmed dates found
-- ============================================================

-- 1. IBEW Local 22 / OJEATC — Electrician Apprenticeship (Year-Round Applications)
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
  'IBEW Local 22 / OJEATC — Electrician Apprenticeship (Free to Apply, Earn While You Learn)',
  'IBEW Local 22 / Omaha Joint Electrical Apprenticeship Training Committee',
  'https://www.ojeatc.com/',
  'IBEW Local 22 and the Omaha Joint Electrical Apprenticeship Training Committee (OJEATC) accept year-round applications for the Inside Electrician, Residential Electrician, and Construction Wireman apprenticeship programs. Apprenticeships are earn-while-you-learn — starting pay for entry-level (Construction Wireman) is $14/hour and increases with advancement through five pay tiers. Applications are free. Apprentices receive paid classroom and on-the-job training at no cost to them. Completing an IBEW apprenticeship leads to licensed journeyman electrician status and wages of $30–$40+/hour. This is one of the most accessible and financially rewarding free career pathways in the Omaha metro — no college degree required.',
  'community',
  'Free to apply and enroll (earn wages while training). No prior experience required for the Construction Wireman program. Must be 17+ (18+ for some programs). Apply at ojeatc.com or visit ibew22.org for more information.',
  NULL,
  'https://www.ojeatc.com/',
  'Omaha, NE', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen}', '{trades,electrician,apprenticeship,skilled_labor,career_exploration,construction,IBEW,earn_while_learn}', '{}',
  'high', 'verified',
  'https://www.ojeatc.com/', 'official_website', '2026-03-18',
  'Year-round applications. Training is ongoing once accepted into the apprenticeship program.',
  true, true, '2026-03-18', '2026-03-18',
  '{"career_field": "trades", "subcategory": "electrical", "opportunity_type": "apprenticeship_info", "cost_details": {"amount": 0, "cost_type": "free", "conditions": "Free to apply. Apprentices are paid employees — earn wages while training. No upfront cost to join.", "waiver_available": false, "waiver_details": null}, "delivery": "in_person", "listing_type": "apprenticeship_program", "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
);

-- 2. Habitat for Humanity of Omaha — Volunteer Build Days
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
  'Habitat for Humanity of Omaha — Free Volunteer Build Days (Year-Round)',
  'Habitat for Humanity of Omaha',
  'https://habitatomaha.org/volunteer/',
  'Habitat for Humanity of Omaha runs volunteer build days year-round at residential construction sites across the city, plus Rock the Block neighborhood revitalization events and Habitat ReStore operations. No construction experience or tools are required — on-site supervisors train every volunteer in the tasks of the day. Volunteers ages 16 and up are welcome. Build days provide real hands-on experience in carpentry, framing, roofing, insulation, drywall, and finishing work. For anyone exploring careers in construction, skilled trades, project management, civil engineering, architecture, or nonprofit housing development, Habitat builds are one of the best free entry points in the metro. Regular build days are Tuesday, Wednesday, and Thursday.',
  'community',
  'Free. Ages 16+. No experience or tools required — supervisors provide all training and tools. Sign up at habitatomaha.org/volunteer or call 531-335-2018. Rock the Block events are family-friendly.',
  NULL,
  'https://habitatomaha.org/volunteer/',
  'Omaha, NE', '1701 N 24th St', 'Omaha', 'NE', '68110',
  false, false,
  '{low_income,first_gen}', '{trades,construction,skilled_labor,volunteer,career_exploration,carpentry,framing,housing}', '{}',
  'high', 'verified',
  'https://habitatomaha.org/volunteer/', 'official_website', '2026-03-18',
  'Year-round build days. Regular schedule Tuesday, Wednesday, Thursday 8am–4pm. Rock the Block special events seasonally.',
  true, true, '2026-03-18', '2026-03-18',
  '{"career_field": "trades", "subcategory": "construction", "opportunity_type": "volunteer", "cost_details": {"amount": 0, "cost_type": "free", "conditions": null, "waiver_available": false, "waiver_details": null}, "delivery": "in_person", "listing_type": "volunteer_program", "accessibility": {"cost_barrier": "free", "requires_enrollment": false, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
);
