-- ============================================================
-- Opportography — Migration 032
-- Phase 11: Food Processing & Agriculture Jobs
-- Research: March 12, 2026
--
-- Omaha's food processing heritage is deep: JBS, ConAgra,
-- Tyson, Omaha Steaks, Greater Omaha Packing all operate
-- here. JBS Prepared Foods (formerly Plumrose USA) in
-- Council Bluffs is confirmed actively hiring production
-- and maintenance staff.
--
-- Key confirmed facts:
--   JBS CB: 12 current openings in CB, production maintenance
--     starting at $26.75–$30.75/hr, perfect attendance bonus
--   ConAgra: Omaha is their largest office, Supply Chain
--     Development Associate 2026 confirmed posted
--
-- Listings in this file:
--   1. JBS Prepared Foods — Production Maintenance (Council Bluffs)
--   2. JBS Prepared Foods — Production Line Worker (Council Bluffs)
--   3. ConAgra Brands — Supply Chain Development Associate
--   4. Omaha Steaks — Production/Fulfillment Associate
--   5. Greater Omaha Packing — Production Worker
-- ============================================================

INSERT INTO public.opportunities (
  title, organization, organization_website, employer_careers_url,
  description, type, sector, eligibility, link,
  location, city, state, is_remote, is_hybrid,
  identity_tags, category_tags,
  compensation_type, compensation_amount, compensation_frequency,
  education_requirement, career_pathway, hiring_status,
  data_confidence, verification_status,
  source_url, source_type, source_retrieved_date,
  is_active, is_featured
) VALUES

-- ── 1. JBS Prepared Foods — Production Maintenance (Council Bluffs) ─────────
(
  'Production Maintenance Technician',
  'JBS Prepared Foods (Council Bluffs)',
  'https://jobs.jbsfoodsgroup.com',
  'https://jobs.jbsfoodsgroup.com/search/jobs/in/council-bluffs',
  'JBS Prepared Foods — formerly Plumrose USA, one of the largest prepared meats facilities in the region — operates a major plant in Council Bluffs and is actively hiring Production Maintenance Technicians. Maintenance techs keep plant equipment running: you diagnose mechanical and electrical issues, perform preventive maintenance, and repair production line machinery. Starting pay is $26.75–$30.75/hr — substantially above average for the region — with an additional $1.00/hr perfect attendance bonus. 12 current open positions in Council Bluffs. Council Bluffs residents: this is high-paying industrial work five minutes from home.',
  'job',
  'food_agriculture',
  'High school diploma or GED required. Experience with industrial machinery maintenance, electrical systems, or mechanical repair preferred. Technical or vocational training in mechanics, electrical, or industrial maintenance is a plus. Some positions offer on-the-job training for candidates with strong mechanical aptitude. Must pass background check and drug screen.',
  'https://jobs.jbsfoodsgroup.com/search/jobs/in/council-bluffs',
  'Council Bluffs, IA',
  'Council Bluffs', 'IA', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'benefits', 'career_ladder', 'full_time', 'shift_work', 'council_bluffs', 'food_processing'],
  'paid',
  '$26.75–$30.75/hr + $1.00/hr perfect attendance bonus',
  'hourly',
  '{"minimum": "high_school_diploma", "preferred": "Vocational or technical training in industrial maintenance, electrical, or mechanics preferred", "certifications": [], "notes": "Starting wage of $26.75/hr is confirmed from job posting. Perfect attendance bonus of $1.00/hr additional. Lead positions up to $37.60/hr."}',
  '{"advancement": "Production Maintenance Tech → Production Maintenance Lead ($31.60–$37.60/hr) → Maintenance Supervisor. JBS is a large global company with internal promotion pathways in plant operations and management.", "employer_training": "On-the-job training provided. Full benefits package. JBS is one of the highest-paying industrial employers in the Council Bluffs area.", "typical_next_roles": ["Production Maintenance Lead", "Maintenance Supervisor", "Plant Engineer", "Operations Supervisor"], "tuition_reimbursement": false, "apprenticeship": false}',
  'confirmed_active',
  'high',
  'verified',
  'https://jobs.jbsfoodsgroup.com/search/jobs/in/council-bluffs',
  'official_website',
  '2026-03-12',
  true, true
),

-- ── 2. JBS Prepared Foods — Production Line Worker (Council Bluffs) ─────────
(
  'Production Line Worker / Food Processing Associate',
  'JBS Prepared Foods (Council Bluffs)',
  'https://jobs.jbsfoodsgroup.com',
  'https://jobs.jbsfoodsgroup.com/search/jobs/in/council-bluffs',
  'JBS Prepared Foods in Council Bluffs hires Production Line Workers to operate and monitor equipment on the prepared meats production floor. This is physical, repetitive work in a cold plant environment — processing, packaging, and quality-checking food products on a moving line. No prior food processing experience required — training provided. Pay starts above minimum wage and includes full benefits. JBS is one of the most accessible high-wage employers accessible without a college degree in the Council Bluffs metro.',
  'job',
  'food_agriculture',
  'No specific education requirement — high school diploma or GED preferred. Must be able to stand for full shift (8–10 hrs), work in a cold/refrigerated environment, and perform repetitive physical tasks. Must be 18+. Drug screen and background check required.',
  'https://jobs.jbsfoodsgroup.com/search/jobs/in/council-bluffs',
  'Council Bluffs, IA',
  'Council Bluffs', 'IA', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'no_experience', 'paid_training', 'benefits', 'full_time', 'shift_work', 'council_bluffs', 'food_processing'],
  'paid',
  'Competitive hourly rate with shift differentials (check current posting)',
  'hourly',
  '{"minimum": "none_specified", "preferred": "High school diploma or GED preferred", "certifications": [], "notes": "Cold plant environment. Physical repetitive work. No education barrier. Food safety training provided."}',
  '{"advancement": "Production Worker → Line Lead → Production Supervisor. Workers who demonstrate reliability and skill move into lead and supervisory roles. Maintenance track available for those interested in technical skills.", "employer_training": "Food safety training provided. Full benefits. JBS is a large employer with internal advancement.", "typical_next_roles": ["Line Lead", "Quality Control Inspector", "Production Supervisor", "Maintenance Trainee"], "tuition_reimbursement": false, "apprenticeship": false}',
  'confirmed_active',
  'high',
  'verified',
  'https://jobs.jbsfoodsgroup.com/search/jobs/in/council-bluffs',
  'official_website',
  '2026-03-12',
  true, false
),

-- ── 3. ConAgra Brands — Supply Chain Development Associate ───────────────────
(
  'Supply Chain Development Associate (2026)',
  'ConAgra Brands',
  'https://www.conagrabrands.com',
  'https://careers.conagrabrands.com/us/en/omaha',
  'ConAgra Brands — one of the largest packaged food companies in North America (Slim Jim, Reddi-wip, Orville Redenbacher, Birds Eye) — is headquartered in Omaha, and their Omaha campus is their largest workforce location. The Supply Chain Development Associate 2026 program is a confirmed open entry-level position for new graduates. ConAgra''s Omaha HQ houses their entire R&D, IT, HR, Global Business Services, and Supply Chain teams. The campus offers free parking, a subsidized cafeteria, and gym access. Pay ranges from $20–$28/hr for summer programs; full-time associate roles are competitive. This is a Fortune 500 headquarters job in Omaha.',
  'job',
  'food_agriculture',
  'Bachelor degree in supply chain management, logistics, business, or a related field required for the Supply Chain Development Associate program. Strong analytical skills. GPA 3.0+ preferred.',
  'https://careers.conagrabrands.com/us/en/omaha',
  'Omaha, NE',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'bachelors_degree', 'benefits', 'career_ladder', 'full_time', 'omaha', 'food_processing', 'supply_chain'],
  'paid',
  'Competitive salary (see current posting; summer program: $20–$28/hr)',
  'annual',
  '{"minimum": "bachelor", "preferred": "Bachelor degree in supply chain, logistics, business, or engineering", "certifications": [], "notes": "2026 program confirmed as active posting. Full-time and internship tracks available. Omaha HQ location."}',
  '{"advancement": "Supply Chain Associate → Supply Chain Analyst → Supply Chain Manager → Director of Supply Chain. ConAgra is a large Fortune 500 company with many internal career tracks across supply chain, operations, R&D, marketing, and IT.", "employer_training": "Structured development program. Mentorship from senior supply chain leaders. Full benefits. Free gym, parking, and subsidized cafeteria at Omaha HQ.", "typical_next_roles": ["Supply Chain Analyst", "Demand Planner", "Operations Manager", "Category Manager"], "tuition_reimbursement": false, "apprenticeship": false}',
  'confirmed_active',
  'high',
  'verified',
  'https://careers.conagrabrands.com/us/en/omaha',
  'official_website',
  '2026-03-12',
  true, false
),

-- ── 4. Omaha Steaks — Production / Fulfillment Associate ────────────────────
(
  'Production / Fulfillment Associate',
  'Omaha Steaks',
  'https://www.omahasteaks.com',
  'https://www.omahasteaks.com/store/cms/pages/careers',
  'Omaha Steaks is a family-owned food company that has operated in Omaha since 1917 — one of the most recognizable Omaha brands in the country. They hire production and fulfillment staff for their meat processing, packing, and distribution operations. This is physical food production work: cutting, packaging, order fulfillment, and quality control. Omaha Steaks also hires customer service staff for their mail-order and retail operations. Accessible with no prior experience — training provided.',
  'job',
  'food_agriculture',
  'High school diploma or GED preferred. No prior food processing or production experience required — training provided. Must be 18+. Physical role: ability to stand, lift up to 50 lbs. Cold environment for production roles.',
  'https://www.omahasteaks.com/store/cms/pages/careers',
  'Omaha, NE',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'no_experience', 'paid_training', 'benefits', 'full_time', 'part_time', 'omaha', 'food_processing'],
  'paid',
  'Competitive hourly rate (check current posting)',
  'hourly',
  '{"minimum": "none_specified", "preferred": "High school diploma or GED preferred", "certifications": [], "notes": "Production and customer service roles available. Cold environment for production. Training provided."}',
  '{"advancement": "Production Associate → Lead → Supervisor. Customer service staff can advance into team lead and management roles. Omaha Steaks is a family-owned company with long-tenure employees.", "employer_training": "On-the-job training. Employee discount on products. Full benefits for full-time staff.", "typical_next_roles": ["Production Lead", "Customer Service Specialist", "Shift Supervisor"], "tuition_reimbursement": false, "apprenticeship": false}',
  'check_careers_page',
  'medium',
  'needs_confirmation',
  'https://www.omahasteaks.com/store/cms/pages/careers',
  'official_website',
  '2026-03-12',
  true, false
),

-- ── 5. Greater Omaha Packing — Production Worker ────────────────────────────
(
  'Production Worker / Meat Processing Associate',
  'Greater Omaha Packing Company',
  'https://www.gop.com',
  'https://www.gop.com/careers/',
  'Greater Omaha Packing is a beef processing company based in Omaha — one of the original Omaha meatpacking companies still operating. They hire production workers for their processing operations. This is physically demanding shift work in a cold environment, but Greater Omaha Packing is a stable employer with competitive pay for entry-level production work. Accessible without a college degree or prior experience.',
  'job',
  'food_agriculture',
  'No specific education requirement. Must be 18+. Physical requirements: ability to stand for extended periods, work in cold environments, perform repetitive tasks. Drug screen required.',
  'https://www.gop.com/careers/',
  'Omaha, NE',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'no_education_required', 'no_experience', 'benefits', 'full_time', 'shift_work', 'omaha', 'food_processing'],
  'paid',
  'Competitive hourly rate (check current posting)',
  'hourly',
  '{"minimum": "none_specified", "preferred": "No education requirement", "certifications": [], "notes": "No education barrier. Cold production environment. Shift work. Physical demanding role."}',
  '{"advancement": "Production Worker → Lead Worker → Supervisor. Long-tenure employees move into quality control and supervision.", "employer_training": "Food safety training provided. On-the-job training.", "typical_next_roles": ["Lead Worker", "Quality Control Inspector", "Shift Supervisor"], "tuition_reimbursement": false, "apprenticeship": false}',
  'check_careers_page',
  'medium',
  'needs_confirmation',
  'https://www.gop.com/careers/',
  'official_website',
  '2026-03-12',
  true, false
);
