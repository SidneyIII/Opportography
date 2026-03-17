-- ============================================================
-- Opportography — Migration 030
-- Phase 11: Transportation, Logistics & Warehousing Jobs
-- Research: March 12, 2026
--
-- Union Pacific Railroad is headquartered in Omaha. Werner
-- Enterprises is headquartered in Omaha. The metro's central
-- US location makes it a natural distribution hub. Amazon,
-- FedEx, UPS, and BNSF all have significant operations here.
-- Werner's CDL training program is one of the most accessible
-- pathways into a $50-75k/year driving career.
--
-- Key confirmed facts:
--   Werner: CDL training program active, $6,000 tuition
--     reimbursement, headquarters in Omaha, $50-75k avg pay
--   Union Pacific: careers at up.jobs, Omaha HQ, multiple
--     entry-level roles including freight car repair and
--     material handler
--   Amazon: fulfillment center in Omaha, rolls hiring
--
-- Listings in this file:
--   1. Werner Enterprises — CDL-A Driver (Training Program)
--   2. Werner Enterprises — Operations/Logistics Trainee
--   3. Union Pacific Railroad — Material Handler / General Laborer
--   4. Union Pacific Railroad — Freight Car Repair Technician
--   5. Amazon — Warehouse Associate (Omaha FC)
--   6. BNSF Railway — Entry-Level Career Portal
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

-- ── 1. Werner Enterprises — CDL-A Driver Training Program ───────────────────
(
  'CDL-A Truck Driver (Paid Training Program)',
  'Werner Enterprises',
  'https://www.werner.com',
  'https://www.werner.com/cdl-training/',
  'Werner Enterprises is one of the largest trucking companies in North America, headquartered right in Omaha. They run a CDL training pathway through Roadmaster Drivers School (which Werner owns) with 23 locations nationwide. Werner will reimburse up to $6,000 of your CDL training costs when you drive for them after graduating — covering most or all of the cost. After getting your CDL-A (takes 4-6 weeks), solo drivers average $50,000–$75,000 per year. No college degree, no prior driving experience required. This is one of the clearest pathways to a $60k+ career accessible to anyone who can pass a DOT physical. Werner''s headquarters in Omaha means local career support from day one.',
  'job',
  'transportation_logistics',
  'High school diploma or GED required. Must be 18+ (21+ to drive interstate). Must pass DOT physical and drug screen. Valid driver license. No CDL required to enter the training program — Werner provides the path to getting it. No prior truck driving experience required.',
  'https://www.werner.com/cdl-training/',
  'Omaha, NE (Werner HQ) and regional routes',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'no_experience', 'paid_training', 'benefits', 'career_ladder', 'full_time', 'omaha', 'transportation', 'cdl'],
  'paid',
  '$50,000–$75,000/year average after CDL',
  'annual',
  '{"minimum": "high_school_diploma", "preferred": "Clean driving record preferred", "certifications": ["CDL-A — Werner provides training pathway and up to $6,000 tuition reimbursement"], "notes": "Must be 21+ to drive interstate routes. 18+ for intrastate. DOT physical and drug screen required. No CDL needed to apply — training program provides it."}',
  '{"advancement": "Solo Driver → Dedicated Routes → Team Driver → Owner-Operator. Experienced Werner drivers can also move into dispatch, driver training, or management roles at Werner HQ in Omaha.", "employer_training": "Werner reimburses up to $6,000 CDL training costs. Partners with Roadmaster Drivers School (23 locations). Full orientation and mentoring after CDL. Health insurance, 401(k), and paid time off.", "typical_next_roles": ["Dedicated Route Driver", "Team Driver", "Owner-Operator", "Driver Trainer", "Dispatcher"], "tuition_reimbursement": true, "apprenticeship": false}',
  'confirmed_active',
  'high',
  'verified',
  'https://www.werner.com/cdl-training/',
  'official_website',
  '2026-03-12',
  true, true
),

-- ── 2. Werner Enterprises — Management Trainee / Logistics ──────────────────
(
  'Operations / Logistics Management Trainee',
  'Werner Enterprises',
  'https://www.werner.com',
  'https://www.werner.com/careers/',
  'Werner Enterprises offers entry-level management and operations positions at their Omaha headquarters for candidates with degrees in logistics, supply chain, business, or related fields. These roles support Werner''s logistics network — coordinating loads, managing carrier relationships, analyzing operations data. Werner has graduate opportunity programs specifically targeting recent college grads looking to build a logistics career at a Fortune 500-level company. Their Omaha HQ is the operational center, meaning real proximity to leadership and decision-making.',
  'job',
  'transportation_logistics',
  'Bachelor degree in logistics, supply chain management, business administration, or related field preferred. Strong analytical and communication skills. Entry-level — no prior industry experience required.',
  'https://www.werner.com/careers/graduate-opportunities/',
  'Omaha, NE',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'bachelors_degree', 'benefits', 'career_ladder', 'full_time', 'omaha', 'transportation'],
  'paid',
  'Competitive salary (check current posting)',
  'annual',
  '{"minimum": "bachelor", "preferred": "Bachelor degree in logistics, supply chain, or business", "certifications": [], "notes": "New graduate program available. Some roles may consider associate degree plus experience."}',
  '{"advancement": "Management Trainee → Operations Manager → Director of Operations is the standard track. Werner is large enough to have many internal advancement paths.", "employer_training": "Graduate training program with mentorship. Full benefits. Exposure to Werner''s full logistics operation.", "typical_next_roles": ["Operations Manager", "Logistics Analyst", "Account Manager", "Director of Operations"], "tuition_reimbursement": false, "apprenticeship": false}',
  'likely_active',
  'medium',
  'needs_confirmation',
  'https://www.werner.com/careers/graduate-opportunities/',
  'official_website',
  '2026-03-12',
  true, false
),

-- ── 3. Union Pacific — Material Handler / General Laborer ───────────────────
(
  'Material Handler / Warehouse Laborer',
  'Union Pacific Railroad',
  'https://www.up.com',
  'https://up.jobs',
  'Union Pacific is headquartered in Omaha and is the largest railroad in North America. Material Handler roles at Union Pacific involve receiving, storing, and distributing parts and materials in railroad maintenance facilities and supply warehouses. Physical work — lifting, forklift operation, inventory management. Union Pacific offers strong pay, full benefits, and a pension-style retirement. This is entry-level access to a company where long-tenure careers are the norm. Apply at up.jobs.',
  'job',
  'transportation_logistics',
  'High school diploma or GED required. Forklift certification helpful but training often provided. Physical requirements: ability to lift 50+ lbs, work in outdoor and indoor environments. Must pass background check and drug screen. 18+ required.',
  'https://up.jobs',
  'Omaha, NE',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'no_experience', 'paid_training', 'benefits', 'career_ladder', 'full_time', 'shift_work', 'union', 'omaha', 'transportation'],
  'paid',
  'Competitive hourly rate (check current posting)',
  'hourly',
  '{"minimum": "high_school_diploma", "preferred": "Warehouse or forklift experience preferred", "certifications": ["Forklift certification helpful — training may be provided"], "notes": "GED accepted. Drug screen and background check required. Physical role."}',
  '{"advancement": "Material Handler → Warehouse Supervisor → Supply Chain Coordinator. Union Pacific also has internal pathways into operations, safety, and engineering roles for employees who pursue further training.", "employer_training": "Union Pacific provides safety training and on-the-job training. Strong benefits: health insurance, pension, paid time off. Union representation in many roles.", "typical_next_roles": ["Warehouse Supervisor", "Inventory Control Specialist", "Supply Chain Coordinator", "Locomotive/Car Inspector trainee"], "tuition_reimbursement": false, "apprenticeship": false}',
  'likely_active',
  'high',
  'verified',
  'https://up.jobs',
  'official_website',
  '2026-03-12',
  true, false
),

-- ── 4. Union Pacific — Freight Car Repair Technician ────────────────────────
(
  'Freight Car Repair Technician (Entry Level)',
  'Union Pacific Railroad',
  'https://www.up.com',
  'https://up.jobs',
  'Union Pacific hires Freight Car Repair Technicians to inspect, maintain, and repair railroad freight cars in their Omaha-area mechanical facilities. This is skilled mechanical work — inspecting car components, performing repairs to wheels, brakes, and structural elements, and ensuring cars meet federal safety standards. Union Pacific provides training. This role offers above-average pay for entry-level mechanical work, full benefits, and long-term career stability at a company that has operated continuously since 1862.',
  'job',
  'transportation_logistics',
  'High school diploma or GED required. Mechanical aptitude required. Experience with hand and power tools preferred. Physical requirements: standing, kneeling, working in outdoor environments in all weather. Drug screen and background check required. 18+ required.',
  'https://up.jobs',
  'Omaha, NE',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'no_experience', 'paid_training', 'benefits', 'career_ladder', 'full_time', 'shift_work', 'omaha', 'transportation'],
  'paid',
  'Competitive hourly rate (check current posting)',
  'hourly',
  '{"minimum": "high_school_diploma", "preferred": "Mechanical experience preferred", "certifications": [], "notes": "Union Pacific provides training on their specific equipment and safety procedures. Mechanical aptitude is key — prior experience with tools and equipment valued."}',
  '{"advancement": "Freight Car Repair Tech → Lead Tech → Car Foreman → Mechanical Superintendent. Union Pacific mechanics can also train into Locomotive repair tracks. Strong pay growth with tenure and certifications.", "employer_training": "Full paid training on UP mechanical standards. Federal Railroad Administration (FRA) certification training provided. Health insurance, pension, paid time off.", "typical_next_roles": ["Car Foreman", "Locomotive Technician", "Mechanical Supervisor", "Safety Inspector"], "tuition_reimbursement": false, "apprenticeship": false}',
  'likely_active',
  'high',
  'verified',
  'https://up.jobs',
  'official_website',
  '2026-03-12',
  true, false
),

-- ── 5. Amazon — Warehouse Associate ─────────────────────────────────────────
(
  'Fulfillment Associate / Warehouse Associate',
  'Amazon',
  'https://www.amazon.com',
  'https://hiring.amazon.com',
  'Amazon operates fulfillment center operations in the Omaha metro area. Warehouse Associates receive, sort, pick, pack, and ship customer orders. Physical work on your feet for your full shift. Amazon typically starts above minimum wage with weekly or biweekly pay, same-day/next-day pay options, and immediate benefits eligibility including health insurance and 401(k) matching from day one. Amazon also offers Career Choice — a pre-paid tuition program that covers 95% of tuition and fees for associates pursuing certificates or degrees in in-demand fields, with no requirement to stay at Amazon after graduating.',
  'job',
  'transportation_logistics',
  'No education requirement — no high school diploma required for warehouse associate roles. Must be 18+. Ability to lift up to 49 lbs. Ability to stand/walk for full shift. Basic reading and math skills. Drug screen required.',
  'https://hiring.amazon.com',
  'Omaha, NE',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'no_education_required', 'no_experience', 'benefits', 'tuition_reimbursement', 'full_time', 'part_time', 'shift_work', 'day_shift', 'omaha', 'transportation'],
  'paid',
  '$18–$22/hr (varies by shift and location — check current posting)',
  'hourly',
  '{"minimum": "none_specified", "preferred": "No education requirement", "certifications": [], "notes": "No high school diploma required. Must be 18+. One of the most accessible entry-level jobs in the metro — no education barrier."}',
  '{"advancement": "Amazon promotes heavily from within. Associate → Area Manager Trainee (through Amazon''s internal promotion programs) or Technical roles through Career Choice tuition program. Amazon Career Choice covers 95% of tuition for certificate/degree programs.", "employer_training": "Full paid training. Career Choice: Amazon pre-pays up to 95% of tuition and fees for associates pursuing in-demand certifications or degrees in fields like nursing, IT, or skilled trades — with no obligation to stay at Amazon.", "typical_next_roles": ["Senior Associate", "Team Lead", "Area Manager", "or transition to trained field via Career Choice"], "tuition_reimbursement": true, "apprenticeship": false}',
  'likely_active',
  'high',
  'verified',
  'https://hiring.amazon.com',
  'official_website',
  '2026-03-12',
  true, false
),

-- ── 6. BNSF Railway — Entry-Level Career Portal ──────────────────────────────
(
  'Entry-Level Positions — BNSF Railway',
  'BNSF Railway',
  'https://www.bnsf.com',
  'https://www.bnsf.com/careers/',
  'BNSF Railway is one of the two largest freight railroads in North America (along with Union Pacific) and has significant operations in the Omaha-Council Bluffs metro. BNSF hires for mechanical, transportation (conductor/engineer trainee), and maintenance-of-way roles. Entry-level railroad jobs offer strong pay, full benefits, and long career tenure. Conductor trainee roles require a high school diploma and no prior railroad experience — BNSF provides full training. These are physically demanding jobs with irregular hours and outdoor work, but the pay and career stability are among the best available without a college degree.',
  'job',
  'transportation_logistics',
  'High school diploma or GED required for most entry-level roles. Conductor trainee and mechanical apprentice roles require passing a physical exam, drug screen, and background check. Must be 18+. Good driving record often required.',
  'https://www.bnsf.com/careers/',
  'Omaha metro / Council Bluffs area',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'no_experience', 'paid_training', 'benefits', 'career_ladder', 'full_time', 'shift_work', 'omaha', 'council_bluffs', 'transportation'],
  'paid',
  'Competitive hourly rate — conductor trainees typically start $23–$28/hr (check current posting)',
  'hourly',
  '{"minimum": "high_school_diploma", "preferred": "Mechanical experience helpful for mechanical roles", "certifications": [], "notes": "Railroad conductor certification training provided by BNSF. Irregular hours including nights, weekends, and holidays are standard in transportation operations."}',
  '{"advancement": "Conductor Trainee → Conductor → Locomotive Engineer is the standard transportation track. Mechanical roles progress to Lead Mechanic → Supervisor. BNSF is one of the most stable long-term employers in the region.", "employer_training": "BNSF provides full conductor and mechanical training. Strong benefits: health insurance, pension, paid time off. Union representation through BLET and other railroad unions.", "typical_next_roles": ["Conductor", "Locomotive Engineer", "Mechanical Lead", "Yardmaster"], "tuition_reimbursement": false, "apprenticeship": false}',
  'check_careers_page',
  'medium',
  'needs_confirmation',
  'https://www.bnsf.com/careers/',
  'official_website',
  '2026-03-12',
  true, false
);
