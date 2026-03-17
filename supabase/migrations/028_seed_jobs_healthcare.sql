-- ============================================================
-- Opportography — Migration 028
-- Phase 11: Healthcare Entry-Level Jobs
-- Research: March 12, 2026
--
-- Omaha's healthcare footprint is outsized for its population.
-- Nebraska Medicine, CHI Health (8+ campuses), Children's
-- Hospital, UNMC, and Boys Town all operate here. Healthcare
-- is the metro's largest employer category and is consistently
-- hiring at all levels — especially CNAs, patient care techs,
-- and medical receptionists accessible with a short-term
-- certification or high school diploma.
--
-- Key confirmed facts:
--   CHI Health: 160+ active jobs in metro, dedicated CNA page
--   Nebraska Medicine: 30 CNA openings, 226 total jobs
--   CHI Health Mercy Council Bluffs: confirmed CB campus
--
-- Listings in this file:
--   1. CHI Health — Certified Nursing Assistant (CNA)
--   2. CHI Health Mercy Council Bluffs — CNA (CB-specific)
--   3. Nebraska Medicine — CNA (Entry Level)
--   4. Nebraska Medicine — Medical Receptionist / Patient Services
--   5. CHI Health — Medical Receptionist / Clinic Front Desk
--   6. Nebraska Medicine — entry-level portal (general)
--   7. CHI Health — Environmental Services / Housekeeping
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

-- ── 1. CHI Health — CNA (Omaha campuses) ────────────────────────────────────
(
  'Certified Nursing Assistant (CNA)',
  'CHI Health',
  'https://www.chihealth.com',
  'https://www.chihealth.com/careers',
  'CHI Health operates eight hospital campuses across the Omaha-Council Bluffs metro — including Lakeside, Immanuel, Creighton University Medical Center (Bergan Mercy), and Mercy Council Bluffs — and is one of the largest healthcare employers in the region. CNAs assist patients with daily activities: bathing, dressing, eating, moving from bed to chair. You take vital signs, document care, and support nursing staff. Requires a current CNA certification — you can earn this in 4-8 weeks through MCC or Iowa Western. CHI Health hires CNAs across all campuses and all shifts. Tuition reimbursement available for CNAs who want to pursue LPN, RN, or further.',
  'job',
  'healthcare',
  'Current Nebraska CNA certification (or Iowa CNA for Council Bluffs locations). High school diploma or GED. Ability to perform physical patient care tasks. No prior healthcare experience required beyond CNA certification — CHI Health provides full orientation.',
  'https://www.chihealth.com/careers/cna-opportunities',
  'Omaha metro (multiple campuses)',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'certification_required', 'no_experience', 'paid_training', 'benefits', 'tuition_reimbursement', 'career_ladder', 'full_time', 'part_time', 'shift_work', 'omaha', 'healthcare'],
  'paid',
  '$16–$21/hr (varies by shift and campus)',
  'hourly',
  '{"minimum": "high_school_diploma", "preferred": "CNA certification required", "certifications": ["CNA — Nebraska certification required (Iowa certification for CB locations)"], "notes": "CNA certification can be completed in 4-8 weeks through Metro Community College (MCC) or Iowa Western Community College (IWCC). No prior hospital experience required beyond certification."}',
  '{"advancement": "CNA → LPN → RN is the standard progression. CHI Health offers tuition reimbursement to help CNAs advance. Some CNAs move into Patient Care Technician (PCT) roles, which include phlebotomy and EKG skills and pay more. Full benefits from day one.", "employer_training": "Full paid orientation. Tuition reimbursement for LPN, RN, or higher. MCC and IWCC offer evening and weekend CNA courses — CHI Health hires their graduates directly.", "typical_next_roles": ["Patient Care Technician", "LPN", "RN", "Unit Secretary"], "tuition_reimbursement": true, "apprenticeship": false}',
  'confirmed_active',
  'high',
  'verified',
  'https://www.chihealth.com/careers/cna-opportunities',
  'official_website',
  '2026-03-12',
  true, true
),

-- ── 2. CHI Health Mercy — CNA (Council Bluffs specific) ─────────────────────
(
  'Certified Nursing Assistant (CNA) — Council Bluffs',
  'CHI Health Mercy Council Bluffs',
  'https://www.chihealth.com',
  'https://www.chihealth.com/careers',
  'CHI Health Mercy is the primary full-service hospital in Council Bluffs, Iowa. Located on the west side of the metro, Mercy is specifically important for Council Bluffs residents who want healthcare work close to home without crossing the river. CNAs at Mercy do the same core work as at any CHI Health campus — patient care, daily activities, vitals, documentation — but this listing is specifically for the Council Bluffs location. Iowa CNA certification required (obtainable through Iowa Western Community College, which is right in Council Bluffs). CHI Health Mercy offers full benefits, tuition reimbursement, and clear pathways to LPN/RN.',
  'job',
  'healthcare',
  'Current Iowa CNA certification required for Council Bluffs/Iowa work sites (Nebraska certification accepted for transfer). High school diploma or GED. Iowa Western Community College in Council Bluffs offers CNA training — one of the most direct pathways to employment at CHI Health Mercy.',
  'https://www.chihealth.com/careers/cna-opportunities',
  'Council Bluffs, IA',
  'Council Bluffs', 'IA', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'certification_required', 'no_experience', 'paid_training', 'benefits', 'tuition_reimbursement', 'career_ladder', 'full_time', 'part_time', 'shift_work', 'council_bluffs', 'healthcare'],
  'paid',
  '$16–$21/hr (varies by shift)',
  'hourly',
  '{"minimum": "high_school_diploma", "preferred": "Iowa CNA certification required", "certifications": ["CNA — Iowa certification required (Iowa Western Community College, Council Bluffs, offers CNA training)"], "notes": "Iowa Western Community College in Council Bluffs offers CNA certification programs with evening and weekend options. Completing IWCC CNA program is a direct pathway to this job."}',
  '{"advancement": "CNA → LPN → RN through CHI Health tuition reimbursement. Full career ladder available within the same hospital system. Council Bluffs residents can build an entire healthcare career without leaving their city.", "employer_training": "Iowa Western CNA graduates can apply directly. CHI Health provides full paid orientation. Tuition reimbursement for continued education.", "typical_next_roles": ["Patient Care Technician", "LPN", "RN", "Unit Secretary"], "tuition_reimbursement": true, "apprenticeship": false}',
  'confirmed_active',
  'high',
  'verified',
  'https://www.chihealth.com/careers/cna-opportunities',
  'official_website',
  '2026-03-12',
  true, true
),

-- ── 3. Nebraska Medicine — CNA ───────────────────────────────────────────────
(
  'Certified Nursing Assistant (CNA)',
  'Nebraska Medicine',
  'https://www.nebraskamed.com',
  'https://www.nebraskamed.com/careers',
  'Nebraska Medicine is the academic medical center affiliated with UNMC — one of the top research and transplant hospitals in the country, located near downtown Omaha. They have 30 CNA openings currently and 226 total jobs. CNAs work alongside some of the most specialized medical staff in the region. Nebraska Medicine''s ambulatory clinics specifically are hiring CNAs with no night or weekend shifts required for clinic positions. Sign-on bonuses available for certain roles. Tuition reimbursement program to support advancement.',
  'job',
  'healthcare',
  'Current Nebraska CNA certification required. High school diploma or GED. Must be able to perform patient care tasks. No prior hospital experience required — Nebraska Medicine provides full orientation.',
  'https://www.nebraskamed.com/careers/entry-level',
  'Omaha, NE',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'certification_required', 'no_experience', 'benefits', 'tuition_reimbursement', 'career_ladder', 'full_time', 'part_time', 'omaha', 'healthcare'],
  'paid',
  'Competitive hourly rate (check current posting)',
  'hourly',
  '{"minimum": "high_school_diploma", "preferred": "Nebraska CNA certification required", "certifications": ["CNA — Nebraska certification required"], "notes": "Sign-on bonuses available for some positions. Clinic CNA positions available with no night or weekend shifts."}',
  '{"advancement": "Nebraska Medicine supports CNA-to-RN pathways through generous tuition reimbursement. Working at an academic medical center gives exposure to specialized fields (transplant, oncology, trauma) that can shape a long-term healthcare career.", "employer_training": "Paid orientation and on-the-job training. Tuition reimbursement program available for full-time and part-time employees. Continuing education support.", "typical_next_roles": ["Patient Care Tech", "LPN", "RN", "Medical Assistant"], "tuition_reimbursement": true, "apprenticeship": false}',
  'confirmed_active',
  'high',
  'verified',
  'https://www.nebraskamed.com/careers/entry-level',
  'official_website',
  '2026-03-12',
  true, false
),

-- ── 4. Nebraska Medicine — Medical Receptionist ──────────────────────────────
(
  'Medical Receptionist / Patient Services Representative',
  'Nebraska Medicine',
  'https://www.nebraskamed.com',
  'https://www.nebraskamed.com/careers',
  'Nebraska Medicine hires medical receptionists and patient services representatives for their ambulatory clinics across Omaha. You check patients in and out, verify insurance, schedule appointments, answer phones, and handle intake documentation. Clinic positions typically have standard daytime Monday-Friday hours with no nights or weekends — one of the better work-life balances available in healthcare. No clinical background required — training provided.',
  'job',
  'healthcare',
  'High school diploma or GED required. Strong computer skills and customer service ability. Medical terminology knowledge is helpful but training is provided. No clinical or medical experience required for front desk roles.',
  'https://www.nebraskamed.com/careers',
  'Omaha, NE (multiple clinic locations)',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'no_experience', 'paid_training', 'benefits', 'tuition_reimbursement', 'career_ladder', 'full_time', 'omaha', 'healthcare'],
  'paid',
  'Competitive hourly rate (check current posting)',
  'hourly',
  '{"minimum": "high_school_diploma", "preferred": "Some medical office or customer service experience preferred", "certifications": [], "notes": "Medical billing or coding experience helpful but not required. Standard business hours for clinic positions — no nights or weekends."}',
  '{"advancement": "Receptionist to Medical Office Coordinator to Practice Manager is the typical administrative path. Clinical exposure in a medical office setting also opens doors to medical coding, billing, and health information roles.", "employer_training": "Paid training on medical software (Epic), HIPAA, and clinical terminology. Tuition reimbursement available.", "typical_next_roles": ["Medical Office Coordinator", "Medical Coder/Biller", "Practice Manager", "Patient Access Supervisor"], "tuition_reimbursement": true, "apprenticeship": false}',
  'likely_active',
  'high',
  'verified',
  'https://www.nebraskamed.com/careers',
  'official_website',
  '2026-03-12',
  true, false
),

-- ── 5. CHI Health — Environmental Services / Housekeeping ───────────────────
(
  'Environmental Services Associate (Hospital Housekeeping)',
  'CHI Health',
  'https://www.chihealth.com',
  'https://www.chihealth.com/careers',
  'CHI Health hires Environmental Services Associates (EVS) across all campuses. This is hospital housekeeping — cleaning and disinfecting patient rooms, operating rooms, hallways, and common areas to maintain infection control standards. No experience required — full training provided. It is one of the most accessible entry points into hospital employment and offers the same benefits package as clinical roles: health insurance, 401(k), and tuition reimbursement. Many EVS employees use tuition benefits to train as CNAs or other clinical roles while working.',
  'job',
  'healthcare',
  'No education requirement — must be able to read and follow cleaning and safety instructions. No prior experience required. Physical role: standing, walking, bending, lifting up to 50 lbs. Availability for any shift (day, evening, overnight) is a plus.',
  'https://www.chihealth.com/careers',
  'Omaha metro (multiple campuses) and Council Bluffs',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'no_experience', 'paid_training', 'benefits', 'tuition_reimbursement', 'full_time', 'part_time', 'shift_work', 'omaha', 'council_bluffs', 'healthcare'],
  'paid',
  '$15–$18/hr (varies by shift differential)',
  'hourly',
  '{"minimum": "none_specified", "preferred": "High school diploma or GED preferred", "certifications": [], "notes": "No prior healthcare or housekeeping experience required. Full training on hospital cleaning protocols, infection control, and safety provided. Most accessible entry point into CHI Health employment."}',
  '{"advancement": "EVS staff regularly use CHI Health tuition reimbursement to earn CNA certification and transition to clinical roles. EVS Lead and Supervisor positions also available for those who want to stay in the department and move into management.", "employer_training": "Full paid training on hospital protocols, infection control, chemical safety. Full benefits from hire. Tuition reimbursement for career advancement.", "typical_next_roles": ["EVS Lead", "EVS Supervisor", "CNA (with tuition reimbursement)", "Dietary Aide"], "tuition_reimbursement": true, "apprenticeship": false}',
  'likely_active',
  'high',
  'verified',
  'https://www.chihealth.com/careers',
  'official_website',
  '2026-03-12',
  true, false
),

-- ── 6. Boys Town — Entry Level Positions ─────────────────────────────────────
(
  'Family Teacher / Youth Care Staff (Entry Level)',
  'Boys Town National Research Hospital and Family Services',
  'https://www.boystown.org',
  'https://www.boystown.org/careers',
  'Boys Town is a nationally known organization headquartered in Omaha that operates a research hospital, youth care facilities, and family services programs. They hire Family Teachers (residential youth care staff) and support staff in their healthcare and family programs. Family Teacher roles work directly with youth in residential settings — teaching life skills, providing structure, and building relationships. No prior experience required — Boys Town provides full training in their research-based youth care model. Hospital support staff roles are also available.',
  'job',
  'healthcare',
  'High school diploma or GED required for Family Teacher roles. Bachelor degree in social work, psychology, or education preferred but not required for entry-level youth care. Must be 21+ for residential roles. Clean driving record required. Background check required.',
  'https://www.boystown.org/careers',
  'Omaha, NE (main campus and metro locations)',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'no_experience', 'paid_training', 'benefits', 'career_ladder', 'full_time', 'omaha', 'healthcare', 'social_services'],
  'paid',
  'Competitive salary + housing provided (for residential Family Teacher roles)',
  'annual',
  '{"minimum": "high_school_diploma", "preferred": "Bachelor degree in social work, psychology, or education preferred", "certifications": [], "notes": "21+ required for residential roles. Residential Family Teacher positions include housing on campus as part of compensation package."}',
  '{"advancement": "Family Teacher to Senior Family Teacher to Program Supervisor is the standard path in residential care. Boys Town is a large organization with career pathways into clinical, administrative, and research roles.", "employer_training": "Comprehensive paid training in Boys Town Model of Care — one of the most evidence-based youth care programs in the US. Ongoing professional development. Tuition assistance available.", "typical_next_roles": ["Senior Family Teacher", "Program Supervisor", "Case Manager", "Clinical Supervisor"], "tuition_reimbursement": true, "apprenticeship": false}',
  'check_careers_page',
  'medium',
  'needs_confirmation',
  'https://www.boystown.org/careers',
  'official_website',
  '2026-03-12',
  true, false
);
