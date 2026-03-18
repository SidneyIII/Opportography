-- ============================================================
-- Opportography — Migration 063
-- Phase 15A: Career Pathways — Healthcare & Medicine
-- Date: 2026-03-18
--
-- 3 verified entries:
--   1. Nebraska Medicine Volunteer Program
--   2. CHI Health Volunteer Program
--   3. NAMI Omaha Program Leader Training
--
-- All entries use type='community' or type='workshop'
-- (no new type needed — career_field stored in community_metadata)
--
-- Dead ends researched and excluded:
--   - UNMC Mini-Med School: only found version for elementary
--     school groups, not a general public adult program
--   - Iowa Western CNA open houses: no confirmed 2025/2026 dates
--   - MCC Nursing open house: could not confirm specific event dates
-- ============================================================

-- 1. Nebraska Medicine Volunteer Program
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
  'Nebraska Medicine — Hospital Volunteer Program',
  'Nebraska Medicine',
  'https://www.nebraskamed.com/giving/volunteer-services',
  'Nebraska Medicine offers volunteer roles at Nebraska Medical Center, Bellevue Medical Center, and Village Pointe Health Center. Volunteers welcome patients and guests, assist with wayfinding, visit newly admitted patients, support the Child Life team with pediatric activities, and staff information desks. All training is provided free of charge. The application and orientation process takes approximately four weeks. This is one of the most direct free pathways into clinical healthcare exposure in the Omaha metro — widely used by pre-med, pre-nursing, and allied health students as meaningful career preparation.',
  'community',
  'Free. Must be 18 or older. Application and screening process takes approximately 4 weeks. Contact Volunteer Services at 402.559.4197 or volunteering@nebraskamed.com. Visit nebraskamed.com/giving/become-a-volunteer to start.',
  NULL,
  'https://www.nebraskamed.com/giving/become-a-volunteer',
  'Omaha (Nebraska Medical Center and satellite locations)', '4350 Dewey Ave', 'Omaha', 'NE', '68198',
  false, false,
  '{low_income,first_gen}', '{healthcare,volunteer,pre_med,nursing,clinical,career_exploration,hospital}', '{}',
  'high', 'verified',
  'https://www.nebraskamed.com/giving/become-a-volunteer', 'official_website', '2026-03-18',
  'Year-round applications. Commitment and availability requirements vary by role.',
  true, true, '2026-03-18', '2026-03-18',
  '{"career_field": "healthcare", "subcategory": "nursing_allied_health", "opportunity_type": "volunteer", "cost_details": {"amount": 0, "cost_type": "free", "conditions": null, "waiver_available": false, "waiver_details": null}, "delivery": "in_person", "listing_type": "volunteer_program", "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
);

-- 2. CHI Health Volunteer Program
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
  'CHI Health — Hospital & Hospice Volunteer Program',
  'CHI Health / CommonSpirit',
  'https://www.chihealth.com/patients-visitors/volunteer-services',
  'CHI Health operates multiple hospitals and health facilities across the Omaha metro area, offering free volunteer opportunities for ages 14 and up. Teen volunteers gain skills and leadership experience in a hospital environment. Adult volunteers provide hospitality, patient support, and wayfinding assistance. The hospice volunteer program through CHI Health at Home provides profound exposure to end-of-life care — valuable for anyone considering nursing, social work, chaplaincy, or counseling careers. All volunteers receive complete training. Contact CHI Health Creighton University Medical Center - Bergan Mercy at (402) 398-6199 to get started.',
  'community',
  'Free. Ages 14+. Complete training provided. Teen volunteers have a structured program that develops leadership skills. Adult and hospice volunteer applications available through chihealth.com.',
  NULL,
  'https://www.chihealth.com/patients-visitors/volunteer-services',
  'Omaha metro (multiple CHI Health locations)', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen}', '{healthcare,volunteer,nursing,hospice,clinical,career_exploration,hospital}', '{}',
  'high', 'verified',
  'https://www.chihealth.com/patients-visitors/volunteer-services', 'official_website', '2026-03-18',
  'Year-round. Contact individual CHI Health facilities for current volunteer openings.',
  true, false, '2026-03-18', '2026-03-18',
  '{"career_field": "healthcare", "subcategory": "nursing_allied_health", "opportunity_type": "volunteer", "cost_details": {"amount": 0, "cost_type": "free", "conditions": null, "waiver_available": false, "waiver_details": null}, "delivery": "in_person", "listing_type": "volunteer_program", "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
);

-- 3. NAMI Omaha Program Leader (Volunteer Facilitator) Training
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
  'NAMI Omaha — Mental Health Program Leader Volunteer Training',
  'NAMI Omaha',
  'https://www.namiomaha.org/programs',
  'NAMI Omaha trains volunteer facilitators to lead peer support groups and community mental health education presentations. Two key pathways: (1) Recovery Support Group Facilitator Training — for people with lived mental health experience who want to lead peer support groups, and (2) Ending the Silence Presenter Training — equips volunteers to deliver mental health awareness presentations in schools and community settings. All training is free and all educational materials are provided. Requires lived experience with mental health as a person with a condition or as a family member of someone with a condition. Contact NAMI Omaha at namiomaha@gmail.com to learn about upcoming training dates.',
  'workshop',
  'Free. Must have lived experience with mental health (personal or family member). Training is periodic — contact namiomaha@gmail.com or visit namiomaha.org for current schedule.',
  NULL,
  'https://www.namiomaha.org/programs',
  'Omaha, NE', NULL, 'Omaha', 'NE', NULL,
  false, true,
  '{low_income,first_gen,mental_health}', '{mental_health,volunteer,counseling,social_work,healthcare,peer_support,career_exploration}', '{}',
  'high', 'verified',
  'https://www.namiomaha.org/programs', 'official_website', '2026-03-18',
  'Training offered periodically throughout the year. Contact namiomaha@gmail.com for current schedule.',
  true, false, '2026-03-18', '2026-03-18',
  '{"career_field": "healthcare", "subcategory": "mental_health_counseling", "opportunity_type": "volunteer", "cost_details": {"amount": 0, "cost_type": "free_with_conditions", "conditions": "Requires lived experience with mental health (personal or as family member)", "waiver_available": false, "waiver_details": null}, "delivery": "hybrid", "listing_type": "volunteer_program", "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
);
