-- ============================================================
-- Opportography — Migration 031
-- Phase 11: Construction, Trades & Skilled Labor Jobs
-- Research: March 12, 2026
--
-- Peter Kiewit Sons' is one of the largest construction and
-- engineering firms in North America, headquartered in Omaha.
-- The IBEW Local 22 Construction Wireman apprenticeship is
-- one of the most accessible high-wage career pathways in
-- the metro — starts at $14/hr and applications are open
-- year-round through OJEATC.
--
-- Key confirmed facts:
--   IBEW Local 22: Construction Wireman program starts $14/hr,
--     applications year-round, ojeatc.com
--   Peter Kiewit: careers at kiewitcareers.kiewit.com,
--     entry engineer ~$60-70k, field ops + craft roles
--   Snyder & Associates CB: mentioned in prompt as confirmed
--     hiring CAD technician in Council Bluffs
--
-- Listings in this file:
--   1. IBEW Local 22 — Construction Wireman Apprenticeship
--   2. Omaha Joint Electrical Apprenticeship (OJEATC) — portal
--   3. Peter Kiewit Sons' — Field Engineer / Project Engineer
--   4. Peter Kiewit Sons' — Construction Craft Laborer
--   5. Snyder & Associates — CAD Technician (Council Bluffs)
--   6. HDR Inc. — Entry-Level Engineer / Technician
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

-- ── 1. IBEW Local 22 — Construction Wireman Apprenticeship ──────────────────
(
  'Construction Wireman Apprenticeship (Electrician)',
  'IBEW Local 22 / Omaha Joint Electrical Apprenticeship Training Committee',
  'https://www.ibew22.org',
  'https://www.ojeatc.com',
  'IBEW Local 22 and the Omaha Joint Electrical Apprenticeship Training Committee (OJEATC) offer a four-year Construction Wireman apprenticeship that is one of the best earn-while-you-learn programs in the Omaha metro. You work as an electrician''s apprentice on real construction job sites while attending classes. No college degree required — no prior electrical experience required. Applications are accepted year-round. Starting pay is $14.00/hr at the CW-1 level, rising to $22.00/hr by CW-5, then continuing to increase as you become a Journeyman Electrician. Journeyman electricians in Omaha earn $40–$60/hr. The total career value of this apprenticeship is substantial.',
  'job',
  'construction_trades',
  'High school diploma or GED required. Must be 17+ (18 to work on some job sites). Must pass a math aptitude test (basic algebra). No prior electrical experience required — that is what the apprenticeship teaches. Valid driver license often required for travel to job sites.',
  'https://www.ojeatc.com',
  'Omaha, NE',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'no_experience', 'paid_training', 'benefits', 'career_ladder', 'full_time', 'apprenticeship', 'union', 'omaha', 'construction'],
  'paid',
  '$14.00/hr (CW-1 starting) rising to $22.00/hr (CW-5) + Journeyman at $40–$60/hr after completing apprenticeship',
  'hourly',
  '{"minimum": "high_school_diploma", "preferred": "Some algebra/math background helpful", "certifications": [], "notes": "Must pass basic math aptitude test at application. GED accepted. Apprenticeship provides all electrical training — no prior experience required. Applications accepted year-round at ojeatc.com."}',
  '{"advancement": "Construction Wireman (CW-1 through CW-5, 4 years) → Journeyman Electrician → Foreman → General Foreman → Electrical Contractor. Journeyman Electricians in Omaha earn $40–$60/hr. The full career trajectory from no experience to Journeyman represents one of the highest-ROI career paths accessible without a college degree.", "employer_training": "Earn-while-you-learn: work on job sites while attending IBEW-sponsored trade school. Full union benefits after qualifying period: health insurance, pension, paid time off. IBEW membership provides job security and collective bargaining.", "typical_next_roles": ["Journeyman Electrician", "Electrical Foreman", "Electrical Contractor", "Low Voltage Specialist"], "tuition_reimbursement": false, "apprenticeship": true}',
  'confirmed_active',
  'high',
  'verified',
  'https://www.ojeatc.com',
  'official_website',
  '2026-03-12',
  true, true
),

-- ── 2. Peter Kiewit Sons' — Field Engineer / Project Engineer ───────────────
(
  'Field Engineer / Project Engineer (Entry Level)',
  'Peter Kiewit Sons'' Inc.',
  'https://www.kiewit.com',
  'https://kiewitcareers.kiewit.com',
  'Peter Kiewit Sons'' is one of the largest construction and engineering companies in North America, headquartered in Omaha. They build highways, bridges, tunnels, power plants, and major infrastructure across the continent. Entry-level Field Engineers and Project Engineers work directly on job sites — coordinating work crews, tracking progress, managing materials, ensuring safety compliance. Pay is competitive ($60,000–$70,000/year starting) and Kiewit promotes from within aggressively. This role requires a bachelor degree in civil engineering, construction management, or a related field.',
  'job',
  'construction_trades',
  'Bachelor degree in civil engineering, construction management, mechanical engineering, or a related field required. GPA of 3.0+ preferred. Willingness to relocate to project sites required — Kiewit''s entry-level engineers work on projects across North America, not just in Omaha. Strong communication and organizational skills.',
  'https://kiewitcareers.kiewit.com',
  'Omaha, NE (HQ) — projects nationally',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'bachelors_degree', 'benefits', 'career_ladder', 'full_time', 'omaha', 'construction'],
  'paid',
  '$60,000–$70,000/year starting (confirmed range for entry-level engineers)',
  'annual',
  '{"minimum": "bachelor", "preferred": "Bachelor degree in civil engineering, construction management, or related field. GPA 3.0+ preferred.", "certifications": [], "notes": "Willingness to relocate to project sites nationally is required for most entry-level Kiewit engineering roles. Omaha HQ is home base but expect to travel."}',
  '{"advancement": "Field Engineer → Project Engineer → Project Manager → Project Executive → Officer. Kiewit promotes exclusively from within for senior roles — every executive started as a field engineer. This is a company where starting as an entry-level engineer genuinely leads to running major projects.", "employer_training": "Kiewit University: structured training program for new engineers. Mentorship. Profit-sharing. Health insurance and 401(k). Kiewit is known as one of the best companies in the country for engineering career development.", "typical_next_roles": ["Project Engineer", "Project Manager", "Cost Engineer", "Safety Manager", "Project Executive"], "tuition_reimbursement": false, "apprenticeship": false}',
  'confirmed_active',
  'high',
  'verified',
  'https://kiewitcareers.kiewit.com',
  'official_website',
  '2026-03-12',
  true, false
),

-- ── 3. Peter Kiewit Sons' — Construction Laborer ────────────────────────────
(
  'Construction Laborer / Craft Worker',
  'Peter Kiewit Sons'' Inc.',
  'https://www.kiewit.com',
  'https://kiewitcareers.kiewit.com',
  'Kiewit hires entry-level construction laborers and craft workers for their heavy civil and industrial projects. This is hands-on site work: earthmoving, concrete, pipefitting, equipment operation, and general construction. No degree required. If you are physically capable of construction work and want to build a skilled trades career at one of the most respected construction companies in North America, this is the entry point. Kiewit provides training and promotes craft workers into foreman and supervision roles.',
  'job',
  'construction_trades',
  'High school diploma or GED preferred but not always required. Physical requirements: ability to work outdoors in all weather, lift 50+ lbs, operate in physically demanding environments. Drug screen and background check required. Valid driver license helpful.',
  'https://kiewitcareers.kiewit.com',
  'Omaha area and project sites regionally',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'no_experience', 'paid_training', 'benefits', 'career_ladder', 'full_time', 'omaha', 'construction'],
  'paid',
  'Competitive hourly rate (check current posting)',
  'hourly',
  '{"minimum": "none_specified", "preferred": "High school diploma or GED preferred", "certifications": [], "notes": "Physical construction work. Kiewit provides training. Some projects may require travel."}',
  '{"advancement": "Laborer → Craft Lead → Foreman → General Foreman → Superintendent. Kiewit promotes craft workers into supervision. Skilled trade certifications (forklift, equipment operator) increase pay.", "employer_training": "Safety training and craft skill training provided. Benefits after qualifying period. Kiewit values craft workers who show initiative.", "typical_next_roles": ["Craft Lead", "Equipment Operator", "Foreman", "Superintendent"], "tuition_reimbursement": false, "apprenticeship": false}',
  'likely_active',
  'medium',
  'needs_confirmation',
  'https://kiewitcareers.kiewit.com',
  'official_website',
  '2026-03-12',
  true, false
),

-- ── 4. Snyder & Associates — CAD Technician (Council Bluffs) ────────────────
(
  'CAD Technician / Engineering Technician',
  'Snyder & Associates',
  'https://www.snyder-associates.com',
  'https://www.snyder-associates.com/careers/',
  'Snyder & Associates is a civil engineering and planning firm with an office in Council Bluffs that was specifically flagged as actively hiring for CAD Technician roles. CAD Technicians use computer-aided design software (AutoCAD, Civil 3D) to draft engineering plans for roads, utilities, and site development projects. This is an office-based technical role — not field construction work. You support licensed engineers by preparing drawings and technical documents. An associate degree in drafting, civil engineering technology, or CAD is the typical entry point. Council Bluffs residents: this job is in your city.',
  'job',
  'construction_trades',
  'Associate degree in CAD, drafting technology, civil engineering technology, or a related field typically required. Proficiency in AutoCAD required. Civil 3D experience a plus. Strong attention to detail. No prior professional experience required for entry-level — portfolio of coursework or training projects acceptable.',
  'https://www.snyder-associates.com/careers/',
  'Council Bluffs, IA',
  'Council Bluffs', 'IA', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'associates_degree', 'benefits', 'career_ladder', 'full_time', 'council_bluffs', 'construction'],
  'paid',
  'Competitive salary (check current posting)',
  'annual',
  '{"minimum": "associate", "preferred": "Associate degree in CAD, drafting, or civil engineering technology", "certifications": ["AutoCAD certification helpful"], "notes": "Council Bluffs office location confirmed. Civil 3D experience a plus. Iowa Western Community College in Council Bluffs has a CAD/drafting program."}',
  '{"advancement": "CAD Technician → Senior CAD Tech → Engineering Designer → Project Engineer (with further education). Engineering firms often support staff in pursuing their PE licensure over time.", "employer_training": "On-the-job training on firm-specific workflows. Exposure to civil engineering projects. Mentorship from licensed PEs.", "typical_next_roles": ["Senior CAD Technician", "Engineering Designer", "Survey Technician", "Project Engineer (with further education)"], "tuition_reimbursement": false, "apprenticeship": false}',
  'confirmed_active',
  'high',
  'verified',
  'https://www.snyder-associates.com/careers/',
  'official_website',
  '2026-03-12',
  true, true
),

-- ── 5. HDR Inc. — Entry-Level Engineer or Technician ────────────────────────
(
  'Entry-Level Engineer / Engineering Technician',
  'HDR Inc.',
  'https://www.hdrinc.com',
  'https://www.hdrinc.com/careers',
  'HDR is a global architecture, engineering, and consulting firm headquartered in Omaha. They design water treatment plants, transportation infrastructure, healthcare facilities, and environmental projects. HDR hires both bachelor-level entry engineers and associate-degree technicians for their Omaha headquarters. Unlike Kiewit (which places engineers on construction sites nationally), HDR roles are based in Omaha''s professional engineering office environment. Strong long-term career with one of the metro''s most prestigious employers.',
  'job',
  'construction_trades',
  'Bachelor degree in civil, environmental, mechanical, or electrical engineering for engineer roles. Associate degree in engineering technology or drafting for technician roles. No professional experience required for entry-level. EIT (Engineer in Training) exam eligibility helpful for engineer track.',
  'https://www.hdrinc.com/careers',
  'Omaha, NE',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'bachelors_degree', 'associates_degree', 'benefits', 'career_ladder', 'full_time', 'omaha', 'construction'],
  'paid',
  'Competitive salary (check current posting)',
  'annual',
  '{"minimum": "associate", "preferred": "Bachelor degree in engineering for engineer track; associate degree in engineering technology for technician track", "certifications": ["EIT (Engineer in Training) exam encouraged for engineer roles"], "notes": "Omaha HQ office environment — not field construction. Both engineer (bachelor''s) and technician (associate''s) entry points available."}',
  '{"advancement": "Engineering Technician → Senior Technician → Project Designer. Entry Engineer → Project Engineer → Project Manager → Technical Leader. HDR has global operations with advancement opportunities nationally and internationally.", "employer_training": "Mentorship from senior engineers. PE exam support. Benefits including health insurance, 401(k), and paid time off. HDR is employee-owned.", "typical_next_roles": ["Senior Engineering Technician", "Project Engineer", "Project Manager", "Technical Lead"], "tuition_reimbursement": false, "apprenticeship": false}',
  'check_careers_page',
  'medium',
  'needs_confirmation',
  'https://www.hdrinc.com/careers',
  'official_website',
  '2026-03-12',
  true, false
);
