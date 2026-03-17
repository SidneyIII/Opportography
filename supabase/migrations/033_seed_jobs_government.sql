-- ============================================================
-- Opportography — Migration 033
-- Phase 11: Government, Public Service & Education Jobs
-- Research: March 12, 2026
--
-- OPPD is the most time-sensitive listing: deadline 3/19/2026
-- (one week away). City of Omaha has 27 current openings.
-- Pottawattamie County confirmed Truck Driver/Laborer open.
-- Nebraska DMV confirmed hiring Motor Vehicle Examiner in
-- Omaha at 17007 Burt St with paid training.
-- OPS confirmed hiring paraprofessionals at $17.50–$19/hr.
--
-- URGENT: OPPD Customer Care Representative — apply by 3/19/2026
--
-- Listings in this file:
--   1. OPPD — Customer Care Representative (URGENT 3/19/2026)
--   2. City of Omaha — General Career Portal (27 current openings)
--   3. Pottawattamie County — Truck Driver / Laborer (Secondary Roads)
--   4. Nebraska DMV — Motor Vehicle Examiner (Omaha)
--   5. Omaha Public Schools — Paraprofessional / Educational Aide
--   6. Nebraska State Jobs — General Portal
--   7. Iowa State Jobs — General Portal
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

-- ── 1. OPPD — Customer Care Representative (URGENT) ─────────────────────────
(
  'Customer Care Representative — APPLY BY 3/19/2026',
  'Omaha Public Power District (OPPD)',
  'https://www.oppd.com',
  'https://www.oppd.com/about/careers/',
  'OPPD (Omaha Public Power District) is the public electric utility serving the Omaha metro — a stable, well-compensated public employer. They are hiring Customer Care Representatives with an application deadline of March 19, 2026 — one week from now. Customer Care Reps handle residential and business customer inquiries across phone and digital channels: billing questions, service requests, outage reports, account changes. OPPD offers paid parental leave, flexible work schedules, and tuition reimbursement. Apply at oppd.com on or before 3/19/2026 — do not wait.',
  'job',
  'government_public_service',
  'High school diploma or GED required. Strong customer service and communication skills. Comfortable working with multiple communication channels (phone, digital). Prior customer service or utility industry experience helpful but not required. Training provided.',
  'https://www.oppd.com/about/careers/',
  'Omaha, NE',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'no_experience', 'paid_training', 'benefits', 'tuition_reimbursement', 'career_ladder', 'full_time', 'omaha', 'government', 'utility'],
  'paid',
  'Competitive salary — OPPD is a public utility with government-comparable pay and benefits (check oppd.com for current rate)',
  'annual',
  '{"minimum": "high_school_diploma", "preferred": "Customer service experience preferred", "certifications": [], "notes": "APPLICATION DEADLINE: 3/19/2026. Apply at oppd.com now. Training provided on utility systems."}',
  '{"advancement": "Customer Care Rep → Senior Rep → Team Lead → Supervisor. OPPD is a large public employer with stable employment, pension-comparable retirement benefits, and many internal career paths in customer service, IT, engineering support, and operations.", "employer_training": "Full paid training on OPPD systems and policies. Tuition reimbursement available. Paid parental leave. Flexible scheduling. Public employee benefits.", "typical_next_roles": ["Senior Customer Care Representative", "Customer Service Team Lead", "Account Specialist", "Operations Support Coordinator"], "tuition_reimbursement": true, "apprenticeship": false}',
  'confirmed_active',
  'high',
  'verified',
  'https://www.oppd.com/about/careers/employment/',
  'official_website',
  '2026-03-12',
  true, true
),

-- ── 2. City of Omaha — General Career Portal ────────────────────────────────
(
  'City of Omaha Jobs — Multiple Entry-Level Positions',
  'City of Omaha',
  'https://www.cityofomaha.org',
  'https://hr.cityofomaha.org/current-openings/',
  'The City of Omaha is one of the largest employers in the metro with 27 current job openings. Positions span a wide range: administrative assistants, parks and recreation aides, public works, police and fire (with separate testing processes), building inspectors, library staff, and summer seasonal positions. City government jobs offer stable employment, defined-benefit pension eligibility, health insurance, and paid time off. Pool Cashier for Summer 2026 is confirmed at $15/hr. Administrative Assistant II is confirmed at $23.33/hr. Applications submitted online only at hr.cityofomaha.org — positions are only posted when a vacancy exists, so check regularly.',
  'job',
  'government_public_service',
  'Requirements vary by position. Administrative and office support roles typically require a high school diploma and computer skills. Parks and recreation, public works, and maintenance roles may have no education requirement. Police and fire have separate competitive processes with physical fitness standards.',
  'https://hr.cityofomaha.org/current-openings/',
  'Omaha, NE',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'no_education_required', 'benefits', 'career_ladder', 'full_time', 'part_time', 'seasonal', 'omaha', 'government'],
  'paid',
  'Varies by position: $15/hr (Pool Cashier) to $23.33/hr (Administrative Assistant II) and beyond',
  'hourly',
  '{"minimum": "none_specified", "preferred": "Varies by position — high school diploma or GED for most administrative roles", "certifications": [], "notes": "27 current openings as of March 2026. Online applications only at hr.cityofomaha.org. New postings appear regularly — check often."}',
  '{"advancement": "City employees have access to defined-benefit pension after qualifying service, internal promotion processes, and civil service protections. Career paths in public administration, parks, utilities, and public safety.", "employer_training": "Position-specific training provided. Public employee benefits: pension eligibility, health insurance, paid time off, paid holidays.", "typical_next_roles": ["Varies by department — Administrative Specialist, Parks Coordinator, Building Inspector, Police Officer, Firefighter"], "tuition_reimbursement": false, "apprenticeship": false}',
  'confirmed_active',
  'high',
  'verified',
  'https://hr.cityofomaha.org/current-openings/',
  'official_website',
  '2026-03-12',
  true, false
),

-- ── 3. Pottawattamie County — Truck Driver / Laborer ────────────────────────
(
  'Truck Driver / Laborer — Secondary Roads Department',
  'Pottawattamie County Government',
  'https://www.pottcounty-ia.gov',
  'https://www.pottcounty-ia.gov/jobs/',
  'Pottawattamie County (Council Bluffs, Iowa) is confirmed hiring full-time Truck Driver/Laborer positions in their Secondary Roads Department. This role maintains county roads: operating dump trucks and other equipment, performing road maintenance and repairs, applying materials for snow and ice control, and doing physical roadwork labor. County government employment comes with Iowa Public Employees'' Retirement System (IPERS) benefits — a genuine pension — plus health insurance and paid leave. Stable, long-term employment with the county that manages Council Bluffs and surrounding Pottawattamie County roads. Apply at pottcounty-ia.gov/jobs/',
  'job',
  'government_public_service',
  'High school diploma or GED preferred. Valid CDL Class B (or willingness to obtain) often required for truck driving roles — county may provide training support. Physical requirements: ability to work outdoors in all weather, perform heavy labor. Iowa driver''s license required.',
  'https://www.pottcounty-ia.gov/jobs/',
  'Council Bluffs, IA',
  'Council Bluffs', 'IA', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'benefits', 'career_ladder', 'full_time', 'council_bluffs', 'government'],
  'paid',
  'Competitive county wage (check current posting)',
  'hourly',
  '{"minimum": "high_school_diploma", "preferred": "CDL Class B helpful or required for truck operation", "certifications": ["CDL Class B may be required — check specific posting"], "notes": "Iowa IPERS pension. Confirmed open as of March 2026 per governmentjobs.com posting. Apply at pottcounty-ia.gov/jobs."}',
  '{"advancement": "Truck Driver/Laborer → Equipment Operator → Road Crew Lead → Secondary Roads Supervisor. Pottawattamie County is a stable employer with civil service protections and long-tenure staff.", "employer_training": "On-the-job training. Iowa IPERS retirement system. Health insurance. Paid holidays and leave.", "typical_next_roles": ["Senior Equipment Operator", "Road Crew Lead", "Maintenance Supervisor"], "tuition_reimbursement": false, "apprenticeship": false}',
  'confirmed_active',
  'high',
  'verified',
  'https://www.pottcounty-ia.gov/jobs/',
  'official_website',
  '2026-03-12',
  true, true
),

-- ── 4. Nebraska DMV — Motor Vehicle Examiner ────────────────────────────────
(
  'Motor Vehicle Examiner (Nebraska DMV)',
  'State of Nebraska — Department of Motor Vehicles',
  'https://dmv.nebraska.gov',
  'https://statejobs.nebraska.gov',
  'The Nebraska DMV is hiring Motor Vehicle Examiners in Omaha at 17007 Burt Street (near NW Omaha/Benson area). Examiners process driver license and ID applications, administer written and driving tests, detect fraudulent documents, and provide customer service to the public. Full paid training provided — you learn Nebraska motor vehicle laws, fraud detection, and CDL federal requirements on the job. 40-hour work week, Monday-Friday, no nights or weekends. Nebraska state employment comes with 156% matching retirement contribution, 13 paid holidays, 12 days vacation, and 12 sick days per year. Apply at statejobs.nebraska.gov.',
  'job',
  'government_public_service',
  'High school diploma or GED required. Valid Nebraska driver''s license and clean driving record required. Strong customer service orientation. Ability to learn and apply motor vehicle laws and regulations. Must complete DMV training in Lincoln/Omaha area after hire.',
  'https://statejobs.nebraska.gov',
  'Omaha, NE (17007 Burt Street)',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'no_experience', 'paid_training', 'benefits', 'full_time', 'omaha', 'government'],
  'paid',
  'Competitive state salary (check statejobs.nebraska.gov for current rate)',
  'annual',
  '{"minimum": "high_school_diploma", "preferred": "Customer service experience preferred", "certifications": [], "notes": "Valid Nebraska driver''s license required. Clean driving record required. Full paid training on DMV systems and Nebraska motor vehicle law. M-F schedule, no nights/weekends. Location: 17007 Burt St, Omaha 68118."}',
  '{"advancement": "Motor Vehicle Examiner → Senior Examiner → Office Supervisor → District Manager. Nebraska state employment offers civil service protections, excellent retirement (156% employer match), and stable career progression.", "employer_training": "Full paid training in Lincoln/Omaha area covering motor vehicle laws, fraud detection, CDL federal requirements, and customer service. Nebraska state retirement: 156% employer retirement contribution.", "typical_next_roles": ["Senior Motor Vehicle Examiner", "Office Supervisor", "District Manager"], "tuition_reimbursement": false, "apprenticeship": false}',
  'confirmed_active',
  'high',
  'verified',
  'https://statejobs.nebraska.gov',
  'official_website',
  '2026-03-12',
  true, false
),

-- ── 5. Omaha Public Schools — Paraprofessional ──────────────────────────────
(
  'Educational Paraprofessional / Instructional Aide',
  'Omaha Public Schools (OPS)',
  'https://www.ops.org',
  'https://www.ops.org/careers',
  'Omaha Public Schools (OPS) — the largest school district in Nebraska — is actively hiring paraprofessionals for the 2025-2026 school year. Paraprofessionals (also called instructional aides or educational assistants) support teachers and students in classrooms. General instructional aides earn $17.50/hr. Special Education and Early Childhood paraprofessionals earn $19.00/hr. Both part-time and full-time positions are available. This role works school hours — summers off, school year schedule. For anyone interested in education, working as a para is one of the best ways to get classroom experience while earning a paycheck. OPS also offers tuition assistance for staff pursuing teaching licensure.',
  'job',
  'government_public_service',
  'High school diploma or GED required. Must obtain "Highly Qualified" paraprofessional status — this requires either 48 college credit hours, an associate degree, or passing the ParaPro Assessment test (available through ETS). No prior classroom experience required. Background check required.',
  'https://www.ops.org/careers',
  'Omaha, NE (multiple school locations)',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'no_experience', 'paid_training', 'benefits', 'career_ladder', 'full_time', 'part_time', 'omaha', 'government', 'education'],
  'paid',
  '$17.50/hr (general instructional) or $19.00/hr (Special Education / Early Childhood)',
  'hourly',
  '{"minimum": "high_school_diploma", "preferred": "48 college credit hours or associate degree, or pass ParaPro Assessment", "certifications": ["Highly Qualified Paraprofessional status required (ParaPro Assessment or 48 credit hours)"], "notes": "ParaPro Assessment test can satisfy the Highly Qualified requirement without a college degree. Test info at ets.org. Pay confirmed at $17.50/hr (general) and $19.00/hr (SPED/Early Childhood)."}',
  '{"advancement": "Paraprofessional → Lead Para → Teaching Assistant → Teacher (with licensure). OPS offers tuition assistance for staff pursuing teaching certification. Many teachers in Omaha started as paras.", "employer_training": "District-provided training on classroom management, IEP support, and student needs. Tuition assistance for education-related coursework. School-year schedule (summers off).", "typical_next_roles": ["Lead Paraprofessional", "Teacher''s Aide Specialist", "Licensed Teacher (with further education)"], "tuition_reimbursement": true, "apprenticeship": false}',
  'confirmed_active',
  'high',
  'verified',
  'https://www.ops.org/careers',
  'official_website',
  '2026-03-12',
  true, false
),

-- ── 6. Nebraska State Jobs — General Portal ──────────────────────────────────
(
  'Nebraska State Government — Entry-Level Jobs Portal',
  'State of Nebraska',
  'https://www.nebraska.gov',
  'https://statejobs.nebraska.gov',
  'Nebraska state government employs thousands of workers across agencies in Omaha and the metro area. Entry-level state positions include administrative assistants, social services workers, corrections officers, probation officers, public health specialists, IT support, and highway maintenance. Nebraska state employment offers excellent retirement (156% employer retirement contribution), 13 paid holidays, generous leave, and health insurance. The statejobs.nebraska.gov portal lists all current openings. Job categories include State Patrol, DHHS, DMV, DOT, and many others. New postings appear regularly — bookmark the portal and check it weekly.',
  'job',
  'government_public_service',
  'Requirements vary by position. Most administrative and support roles require a high school diploma or GED. Law enforcement and social services roles may require specific degrees or certifications. Check individual postings at statejobs.nebraska.gov.',
  'https://statejobs.nebraska.gov',
  'Omaha, NE and statewide',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'bachelors_degree', 'benefits', 'career_ladder', 'full_time', 'omaha', 'government'],
  'paid',
  'Varies by position and classification (check statejobs.nebraska.gov)',
  'annual',
  '{"minimum": "high_school_diploma", "preferred": "Varies by role", "certifications": [], "notes": "Nebraska state employment offers 156% employer retirement match, 13 paid holidays, 12 vacation days, 12 sick days. Comprehensive benefits. Check statejobs.nebraska.gov for all current openings."}',
  '{"advancement": "Civil service protections and defined career ladders in each agency. Promotion through merit-based processes. Long-term stability and pension-equivalent retirement.", "employer_training": "Agency-specific training provided for each role. Excellent retirement and benefits from day one.", "typical_next_roles": ["Senior Specialist", "Supervisor", "Program Manager (varies by agency)"], "tuition_reimbursement": false, "apprenticeship": false}',
  'confirmed_active',
  'high',
  'verified',
  'https://statejobs.nebraska.gov',
  'official_website',
  '2026-03-12',
  true, false
),

-- ── 7. Iowa / Pottawattamie County State Jobs Portal ────────────────────────
(
  'Iowa State & Pottawattamie County Government Jobs Portal',
  'State of Iowa / Pottawattamie County',
  'https://www.iowa.gov',
  'https://www.pottcounty-ia.gov/jobs/',
  'Iowa state and Pottawattamie County government offer entry-level employment in Council Bluffs and surrounding areas. Iowa state agencies with Pottawattamie County offices include Iowa DOT, Iowa DHS, Iowa Department of Inspections, and the Iowa Workforce Development office in Council Bluffs. Entry-level roles include administrative support, road maintenance, social services, and public safety. Iowa state employment includes Iowa Public Employees'' Retirement System (IPERS) — a genuine defined-benefit pension. Pottawattamie County posts jobs at pottcounty-ia.gov/jobs/ and offers email alerts for new openings.',
  'job',
  'government_public_service',
  'Requirements vary by position. Administrative roles typically require a high school diploma or GED. Social services roles may require a bachelor degree. Maintenance and laborer roles often have no formal education requirement.',
  'https://www.pottcounty-ia.gov/jobs/',
  'Council Bluffs, IA',
  'Council Bluffs', 'IA', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'no_education_required', 'benefits', 'career_ladder', 'full_time', 'council_bluffs', 'government'],
  'paid',
  'Varies by position (check pottcounty-ia.gov/jobs for current rates)',
  'annual',
  '{"minimum": "none_specified", "preferred": "Varies by role", "certifications": [], "notes": "Iowa IPERS pension. Sign up for email alerts at pottcounty-ia.gov/jobs to be notified of new openings. Iowa state jobs also listed at iowa.gov/employment."}',
  '{"advancement": "Civil service protections. Iowa IPERS pension after qualifying service. Career paths in roads, social services, public safety, and administration.", "employer_training": "Position-specific training. Iowa IPERS pension. Health insurance and paid leave.", "typical_next_roles": ["Senior Road Worker", "Social Services Caseworker", "Administrative Specialist"], "tuition_reimbursement": false, "apprenticeship": false}',
  'confirmed_active',
  'high',
  'verified',
  'https://www.pottcounty-ia.gov/jobs/',
  'official_website',
  '2026-03-12',
  true, false
);
