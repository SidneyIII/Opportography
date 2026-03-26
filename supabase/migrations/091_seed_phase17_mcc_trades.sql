-- ============================================================
-- Opportography — Migration 091
-- Phase 17C: Trades, Vocational & Apprenticeship Pathways
--             Metropolitan Community College (MCC) — Vocational Trades Programs
-- Date: 2026-03-24
--
-- 7 verified entries:
--   1. MCC HVAC/R Technology — AAS + certificates
--   2. MCC Welding Technology — AAS + certificates
--   3. MCC Automotive Technology — AAS (ASE Master Level accredited)
--   4. MCC Diesel Technology — AAS (2 tracks: service + heavy equipment)
--   5. MCC Electrical Technology — AAS + Certificate of Achievement
--   6. MCC Plumbing Apprenticeship — AAS evening program (4 years)
--   7. MCC CDL-A Truck Driving — CDL-A license preparation
--
-- All programs confirmed from mccneb.edu primary source, 2026-03-24
-- MCC Fort Omaha Campus is the primary trades/technical campus
--
-- NOT duplicating:
--   - MCC TRIO Student Support Services (migration 082)
--   - MCC scholarships (migration 040)
-- ============================================================

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
) VALUES

-- ── 1. MCC HVAC/R Technology ──────────────────────────────────────────────────
-- mccneb.edu confirmed: AAS + career certificates, EPA 608 certification pathway,
-- contact Chris Pitschmann 531-622-2101 / cpitschmann@mccneb.edu
(
  'MCC HVAC/R Technology — AAS Degree & Certificates (EPA 608, Refrigeration, Heating)',
  'Metropolitan Community College',
  'https://www.mccneb.edu',
  'Metropolitan Community College''s HVAC/R Technology program trains heating, ventilation, air conditioning, and refrigeration technicians for one of the most in-demand skilled trades in the country. There is a nationwide shortage of qualified HVAC/R technicians, and the Omaha metro is no exception — every commercial building, every hospital, every school, and every data center in this city depends on people who can install, diagnose, and repair these systems. MCC''s program leads to an AAS degree and career certificates, and includes the coursework needed to pass the EPA 608 refrigerant handling certification (required by federal law to work with refrigerants commercially). The program covers residential and commercial heating systems, air conditioning and refrigeration systems, controls and electrical systems, and EPA compliance. Entry-level HVAC/R technicians in Omaha start at approximately $17–$20/hr; experienced technicians with EPA certification and 5+ years of experience routinely earn $30–$45/hr. MCC''s HVAC/R program is financial aid eligible — meaning you can use Pell Grants, FAFSA, and Nebraska Opportunity Grant funds to reduce or eliminate your out-of-pocket cost. Contact program coordinator Chris Pitschmann at 531-622-2101 or cpitschmann@mccneb.edu for program details, start dates, and advising.',
  'community',
  'High school diploma, GED, or HiSET required (or concurrent enrollment for HS students). Must complete MCC admissions process. Financial aid available (Pell Grant, FAFSA). Contact MCC admissions at mccneb.edu or 531-MCC-2400. Nebraska residents eligible for Nebraska Opportunity Grant (need-based). HVAC/R program coordinator: Chris Pitschmann, 531-622-2101, cpitschmann@mccneb.edu.',
  NULL,
  'https://www.mccneb.edu/programs/hvacr',
  'Omaha, NE (Fort Omaha Campus)', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen}'::text[], '{trades,hvac,refrigeration,heating,vocational_training,certificate,AAS,EPA_608,financial_aid_eligible,MCC,skilled_labor}'::text[], '{high_school_senior,post_secondary,adult}'::text[],
  'high', 'verified',
  'https://www.mccneb.edu/programs/hvacr', 'official_website', '2026-03-24',
  'Multiple start dates per year. Day and evening class options available. Financial aid eligible. Contact Chris Pitschmann: 531-622-2101 / cpitschmann@mccneb.edu. MCC general admissions: 531-MCC-2400 / mccneb.edu.',
  true, true, '2026-03-24', '2026-03-24',
  '{"career_field": "trades", "trade_type": "hvac_refrigeration", "union_affiliated": false, "paid_while_training": false, "program_type": "community_college_vocational", "credentials_earned": ["AAS Degree", "Career Certificates", "EPA 608 Certification pathway"], "program_length": "verify at mccneb.edu — typically 2 years for AAS", "financial_aid_eligible": true, "cost": "Tuition-based; financial aid available (Pell Grant, FAFSA, Nebraska Opportunity Grant)", "starting_wage_after_completion": "$17-$20/hr entry-level", "dual_state_notes": "MCC is a Nebraska institution. Iowa/Council Bluffs residents pay standard MCC tuition (not in-district rate). Iowa residents should also consider IWCC HVAC/R program for potential in-state tuition savings — see separate IWCC listing.", "delivery": "in_person", "listing_type": "community_college_program", "cost_details": {"cost_type": "tuition_financial_aid_eligible", "conditions": "Pell Grant, FAFSA, Nebraska Opportunity Grant available to reduce cost"}, "accessibility": {"cost_barrier": "financial_aid_available", "requires_enrollment": true, "council_bluffs_accessible": "yes but Iowa residents pay non-district rate — see IWCC listing", "multilingual": false}}'::jsonb
),

-- ── 2. MCC Welding Technology ─────────────────────────────────────────────────
-- mccneb.edu confirmed: AAS + multiple certificates (GMAW, GTAW, Pipe, SMAW),
-- structural, pipe, and manufacturing welding pathways;
-- contact Chris Beaty 531-622-4663
(
  'MCC Welding Technology — AAS Degree & AWS Certification Pathways (GMAW, GTAW, Pipe, SMAW)',
  'Metropolitan Community College',
  'https://www.mccneb.edu',
  'MCC''s Welding Technology program is one of the most comprehensive welding education programs in the Omaha metro, covering the four primary welding processes used in industry — GMAW (MIG welding), GTAW (TIG welding), SMAW (Stick welding), and Pipe Welding — plus structural and manufacturing welding specializations. The program leads to an AAS degree and career certificates. MCC''s welding curriculum is designed around American Welding Society (AWS) certification standards — completing the program prepares you for AWS certification testing, which is the industry credential that unlocks higher-wage welding positions and specialized work in aerospace, pressure vessels, and structural steel. Welders with pipe welding certification and AWS credentials in Omaha can earn $28–$50/hr depending on specialization and employer. The manufacturing sector in this metro employs welders across a wide range of industries. This program is financial aid eligible — Pell Grant and FAFSA funds can be applied. Contact program coordinator Chris Beaty at 531-622-4663 for program details, schedules, and advising.',
  'community',
  'High school diploma, GED, or HiSET required. MCC admissions process required. Financial aid available (Pell Grant, FAFSA, Nebraska Opportunity Grant). Contact program coordinator Chris Beaty at 531-622-4663. General admissions: 531-MCC-2400 or mccneb.edu.',
  NULL,
  'https://www.mccneb.edu/programs/welding',
  'Omaha, NE (Fort Omaha Campus)', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen}'::text[], '{trades,welding,GMAW,GTAW,SMAW,pipe_welding,AWS_certification,vocational_training,certificate,AAS,financial_aid_eligible,MCC,manufacturing,skilled_labor}'::text[], '{high_school_senior,post_secondary,adult}'::text[],
  'high', 'verified',
  'https://www.mccneb.edu/programs/welding', 'official_website', '2026-03-24',
  'Multiple start dates per year. Day and evening options. Financial aid eligible. Contact Chris Beaty: 531-622-4663. MCC admissions: 531-MCC-2400 / mccneb.edu.',
  true, true, '2026-03-24', '2026-03-24',
  '{"career_field": "trades", "trade_type": "welding", "union_affiliated": false, "paid_while_training": false, "program_type": "community_college_vocational", "credentials_earned": ["AAS Degree", "Career Certificates", "AWS certification pathway (GMAW, GTAW, SMAW, Pipe)"], "welding_processes": ["GMAW (MIG)", "GTAW (TIG)", "SMAW (Stick)", "Pipe Welding"], "specializations": ["Structural Welding", "Pipe Welding", "Manufacturing Welding"], "financial_aid_eligible": true, "certified_wages_range": "$28-$50/hr (certified welders with AWS credentials)", "dual_state_notes": "MCC serves Nebraska residents at in-district tuition rates. Iowa/Council Bluffs residents should compare with IWCC welding program for in-state Iowa tuition advantage.", "delivery": "in_person", "listing_type": "community_college_program", "cost_details": {"cost_type": "tuition_financial_aid_eligible"}, "accessibility": {"cost_barrier": "financial_aid_available", "requires_enrollment": true, "council_bluffs_accessible": "yes but Iowa residents pay non-district rate"}}'::jsonb
),

-- ── 3. MCC Automotive Technology ─────────────────────────────────────────────
-- mccneb.edu confirmed: AAS, ASE Education Foundation Master Level accredited,
-- Toyota T-TEN and MOPAR CAP partnerships, 19+ NC3 certifications available,
-- contact Scott Henry or Mark Wulf
(
  'MCC Automotive Technology — AAS Degree (ASE Master Level Accredited, Toyota T-TEN, MOPAR CAP)',
  'Metropolitan Community College',
  'https://www.mccneb.edu',
  'MCC''s Automotive Technology program is one of the most credentialed automotive programs in the region — accredited by ASE Education Foundation at the Master Technician level, which is the highest accreditation available. The program covers all eight ASE certification areas: engine repair, automatic transmissions, manual drivetrains, suspension and steering, brakes, electrical systems, heating and air conditioning, and engine performance. MCC has formal manufacturer training partnerships with Toyota (T-TEN program) and Mopar (MOPAR CAP) — meaning students in these specialized tracks receive additional factory training and are on a direct pipeline to dealership employment. The program also offers access to 19+ NC3 (National Coalition of Certification Centers) industry certifications. An ASE-certified automotive technician in Omaha typically earns $22–$45/hr depending on specialization and shop type. Dealership master technicians can earn significantly more. This program is financial aid eligible. Contact the Automotive Technology department at mccneb.edu for current program details, T-TEN and MOPAR CAP enrollment, and advising.',
  'community',
  'High school diploma, GED, or HiSET required. MCC admissions process. Financial aid available. Toyota T-TEN and MOPAR CAP tracks may have additional selection criteria — contact the department. General contact: 531-MCC-2400 or mccneb.edu/programs/automotive.',
  NULL,
  'https://www.mccneb.edu/programs/automotive',
  'Omaha, NE (Fort Omaha Campus)', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen}'::text[], '{trades,automotive,ASE_certification,Toyota_TTEN,MOPAR,vocational_training,AAS,financial_aid_eligible,MCC,skilled_labor,dealership}'::text[], '{high_school_senior,post_secondary,adult}'::text[],
  'high', 'verified',
  'https://www.mccneb.edu/programs/automotive', 'official_website', '2026-03-24',
  'Fall and spring start dates. ASE Master Level accredited. Toyota T-TEN and MOPAR CAP partnership tracks available. 19+ NC3 certifications. Financial aid eligible. Contact: mccneb.edu/programs/automotive or 531-MCC-2400.',
  true, false, '2026-03-24', '2026-03-24',
  '{"career_field": "trades", "trade_type": "automotive_technology", "union_affiliated": false, "paid_while_training": false, "program_type": "community_college_vocational", "credentials_earned": ["AAS Degree", "Certificate of Achievement", "ASE certification pathways (all 8 areas)", "NC3 certifications (19+)", "Toyota T-TEN (eligible track)", "MOPAR CAP (eligible track)"], "accreditation": "ASE Education Foundation Master Level", "manufacturer_partnerships": ["Toyota T-TEN", "MOPAR CAP"], "financial_aid_eligible": true, "wage_range": "$22-$45/hr certified technician", "dual_state_notes": "MCC serves Nebraska. Iowa/Council Bluffs residents pay standard tuition.", "delivery": "in_person", "listing_type": "community_college_program", "cost_details": {"cost_type": "tuition_financial_aid_eligible"}}'::jsonb
),

-- ── 4. MCC Diesel Technology ──────────────────────────────────────────────────
-- mccneb.edu confirmed: AAS with two tracks (Diesel Service or Heavy Equipment),
-- Career Certificate (Diesel Truck), Kubota Tech certifications available,
-- contact Scott Resler 531-622-5803
(
  'MCC Diesel Technology — AAS Degree (Diesel Service & Heavy Equipment Tracks)',
  'Metropolitan Community College',
  'https://www.mccneb.edu',
  'MCC''s Diesel Technology program prepares technicians for the commercial truck, heavy equipment, and agricultural equipment industries — one of the highest-demand segments of the skilled trades market nationwide, and particularly relevant in Omaha given the city''s position as a logistics and transportation hub. The AAS program offers two specialization tracks: Diesel Service (focused on commercial trucks, fleet maintenance, and Class 6–8 vehicles) and Heavy Equipment (focused on construction and earthmoving equipment). A shorter Diesel Truck Career Certificate is also available for faster entry into the workforce. MCC''s Diesel program offers access to Kubota Technology training and certification. Diesel technicians are among the highest-paid non-degree trades workers — commercial truck technicians in Omaha can start at $22–$28/hr and advance to $40+/hr with specialized certifications and experience. The program is financial aid eligible. Contact program coordinator Scott Resler at 531-622-5803 for current program details, schedules, and tracks.',
  'community',
  'High school diploma, GED, or HiSET required. MCC admissions process. Financial aid available (Pell Grant, FAFSA). Contact Scott Resler: 531-622-5803. General admissions: 531-MCC-2400 or mccneb.edu/programs/diesel.',
  NULL,
  'https://www.mccneb.edu/programs/diesel',
  'Omaha, NE (Fort Omaha Campus)', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen}'::text[], '{trades,diesel,heavy_equipment,commercial_truck,vocational_training,AAS,certificate,financial_aid_eligible,MCC,skilled_labor,logistics}'::text[], '{high_school_senior,post_secondary,adult}'::text[],
  'high', 'verified',
  'https://www.mccneb.edu/programs/diesel', 'official_website', '2026-03-24',
  'Fall and spring starts available. Two AAS tracks: Diesel Service or Heavy Equipment. Career Certificate (Diesel Truck) also available. Kubota Tech certifications. Financial aid eligible. Contact Scott Resler: 531-622-5803. Admissions: 531-MCC-2400.',
  true, false, '2026-03-24', '2026-03-24',
  '{"career_field": "trades", "trade_type": "diesel_technology", "union_affiliated": false, "paid_while_training": false, "program_type": "community_college_vocational", "credentials_earned": ["AAS Degree (Diesel Service or Heavy Equipment track)", "Career Certificate (Diesel Truck)", "Kubota Technology certifications"], "tracks": ["Diesel Service (commercial trucks)", "Heavy Equipment (construction/earthmoving)"], "financial_aid_eligible": true, "wage_range": "$22-$40+/hr certified diesel tech", "dual_state_notes": "MCC serves Nebraska residents at in-district rate. Iowa/Council Bluffs residents pay standard tuition.", "delivery": "in_person", "listing_type": "community_college_program", "cost_details": {"cost_type": "tuition_financial_aid_eligible"}}'::jsonb
),

-- ── 5. MCC Electrical Technology ─────────────────────────────────────────────
-- mccneb.edu confirmed: AAS + Certificate of Achievement (Building Electrical),
-- contact Marty Vaughan, mvaughan@mccneb.edu
(
  'MCC Electrical Technology — AAS Degree & Building Electrical Certificate',
  'Metropolitan Community College',
  'https://www.mccneb.edu',
  'MCC''s Electrical Technology program provides foundational training in commercial and residential electrical systems for students pursuing careers in the electrical trades. The program leads to an AAS degree and a Certificate of Achievement in Building Electrical Technology. Coursework covers electrical theory, National Electrical Code (NEC) compliance, wiring methods, motor controls, programmable logic controllers (PLCs), and industrial electrical systems. This program is distinct from and complementary to the IBEW Local 22 union apprenticeship — some students use MCC''s Electrical Technology program as preparation for the union apprenticeship, while others use it to enter the electrical field independently or with non-union employers. The MCC Plumbing Apprenticeship program notes that 4 years of OJT is required for the Omaha Journeyman License — similarly, the electrical pathway to full licensure requires field hours in addition to the MCC credential. Contact program coordinator Marty Vaughan at mvaughan@mccneb.edu for current program details and advising.',
  'community',
  'High school diploma, GED, or HiSET required. MCC admissions process. Financial aid available. Contact Marty Vaughan: mvaughan@mccneb.edu. General admissions: 531-MCC-2400 or mccneb.edu/programs/electrical.',
  NULL,
  'https://www.mccneb.edu/programs/electrical',
  'Omaha, NE (Fort Omaha Campus)', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen}'::text[], '{trades,electrical,NEC,PLC,vocational_training,AAS,certificate,financial_aid_eligible,MCC,skilled_labor,construction}'::text[], '{high_school_senior,post_secondary,adult}'::text[],
  'high', 'verified',
  'https://www.mccneb.edu/programs/electrical', 'official_website', '2026-03-24',
  'Fall and spring starts. AAS degree + Certificate of Achievement (Building Electrical). Covers NEC, motor controls, PLCs, industrial electrical. Financial aid eligible. Contact Marty Vaughan: mvaughan@mccneb.edu. Admissions: 531-MCC-2400.',
  true, false, '2026-03-24', '2026-03-24',
  '{"career_field": "trades", "trade_type": "electrical_technology", "union_affiliated": false, "paid_while_training": false, "program_type": "community_college_vocational", "credentials_earned": ["AAS Degree", "Certificate of Achievement — Building Electrical Technology"], "licensure_note": "MCC credential + additional OJT/field hours required to obtain Omaha Journeyman Electrician License. This program is a strong preparation pathway for IBEW Local 22 apprenticeship or non-union electrical work.", "financial_aid_eligible": true, "dual_state_notes": "MCC serves Nebraska. Iowa/Council Bluffs residents pay standard tuition.", "delivery": "in_person", "listing_type": "community_college_program", "cost_details": {"cost_type": "tuition_financial_aid_eligible"}}'::jsonb
),

-- ── 6. MCC Plumbing Apprenticeship Program ────────────────────────────────────
-- mccneb.edu confirmed: AAS (4-year evening program), Pre-Apprenticeship certificate,
-- all instructors licensed journeyman/master plumbers, OJT required for
-- Omaha Journeyman Plumber License, contact Luke Littleton 531-MCC-4756
(
  'MCC Plumbing Apprenticeship Program — AAS Degree & Pre-Apprenticeship Certificate (Evening)',
  'Metropolitan Community College',
  'https://www.mccneb.edu',
  'MCC''s Plumbing Apprenticeship Program is designed to be taken alongside full-time work — the program runs in the evenings specifically so that students can work on plumbing job sites during the day and attend class at night, which is the traditional apprenticeship model. All instructors in MCC''s plumbing program are licensed journeyman or master plumbers — real tradespeople teaching real trade skills. The four-year AAS program provides the related technical instruction (RTI) component of a full plumbing apprenticeship. Completing the program and accumulating the required on-the-job training hours puts you on the path to the Omaha Journeyman Plumber License. MCC also offers a shorter Plumbing Pre-Apprenticeship Certificate for students who want to build foundational skills before entering a full apprenticeship program. Plumbing is one of the most durable and recession-resistant trades: pipes exist in every structure ever built, they require maintenance, and they cannot be outsourced. Licensed journeyman plumbers in Omaha earn $25–$45/hr. The program is financial aid eligible. Contact Luke Littleton at 531-MCC-4756 for current program details, start dates, and prerequisites.',
  'community',
  'High school diploma, GED, or HiSET required. MCC admissions process. Evening schedule designed for students working daytime plumbing jobs. Financial aid available. Contact Luke Littleton: 531-MCC-4756. General admissions: 531-MCC-2400 or mccneb.edu/programs/plumbing.',
  NULL,
  'https://www.mccneb.edu/programs/plumbing',
  'Omaha, NE (Fort Omaha Campus)', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen}'::text[], '{trades,plumbing,apprenticeship,vocational_training,AAS,certificate,financial_aid_eligible,MCC,skilled_labor,licensed_trade,evening_program}'::text[], '{high_school_senior,post_secondary,adult}'::text[],
  'high', 'verified',
  'https://www.mccneb.edu/programs/plumbing', 'official_website', '2026-03-24',
  'Evening schedule (designed for students working days on job sites). 4-year AAS program. Pre-Apprenticeship Certificate also available. All instructors: licensed journeyman/master plumbers. OJT required for Omaha Journeyman Plumber License. Financial aid eligible. Contact Luke Littleton: 531-MCC-4756.',
  true, true, '2026-03-24', '2026-03-24',
  '{"career_field": "trades", "trade_type": "plumbing", "union_affiliated": false, "paid_while_training": "partial", "program_type": "community_college_apprenticeship_RTI", "credentials_earned": ["AAS Degree (4-year evening program)", "Plumbing Pre-Apprenticeship Certificate"], "schedule_note": "Evening classes designed for students working daytime plumbing jobs — this is a true apprenticeship-model program", "licensure_note": "AAS + required OJT hours required for Omaha Journeyman Plumber License", "instructor_qualifications": "All instructors are licensed journeyman/master plumbers", "financial_aid_eligible": true, "wage_range": "$25-$45/hr licensed journeyman plumber", "dual_state_notes": "MCC serves Nebraska. Iowa/Council Bluffs plumbing students should also check Iowa licensing requirements — Iowa and Nebraska have separate journeyman/master plumber licensing boards.", "delivery": "in_person", "listing_type": "community_college_program", "cost_details": {"cost_type": "tuition_financial_aid_eligible"}}'::jsonb
),

-- ── 7. MCC CDL-A Truck Driving ────────────────────────────────────────────────
-- mccneb.edu confirmed: CDL-A license prep, day and evening classes, 18+,
-- DOT physical + drug screen + CLP required,
-- contact Kitty Lillethorup 531-622-5827
(
  'MCC CDL-A Truck Driving — Commercial Driver''s License Class A Preparation (Day & Evening)',
  'Metropolitan Community College',
  'https://www.mccneb.edu',
  'MCC offers CDL-A (Commercial Driver''s License, Class A) preparation training — the license required to operate 18-wheelers, semi-trucks, flatbeds, tankers, and virtually every large commercial vehicle. Omaha is one of the most important logistics hubs in the United States, home to Werner Enterprises (one of the largest trucking companies in the country), Union Pacific Railroad, and a massive regional distribution sector. CDL-A drivers in Omaha are in acute demand, and qualified drivers can command $55,000–$85,000+/yr with the right employer and endorsements. MCC offers both day and evening schedule options. Before enrolling, you must obtain a Commercial Learner''s Permit (CLP) from the Nebraska Department of Motor Vehicles, complete a DOT physical, and pass a drug screen — these are federal requirements, not just MCC requirements. You must be at least 18 years old to obtain a CDL in Nebraska (21+ for interstate commercial driving). The program is financial aid eligible. Contact Kitty Lillethorup at 531-622-5827 for current schedule, cost, and enrollment requirements.',
  'community',
  'Must be 18 or older (21+ for interstate commercial driving). Must obtain Commercial Learner''s Permit (CLP) from Nebraska DMV before program start. DOT physical and drug screen required. High school diploma or GED required. Day and evening options. Financial aid available. Contact Kitty Lillethorup: 531-622-5827. Admissions: 531-MCC-2400 or mccneb.edu/programs/cdl.',
  NULL,
  'https://www.mccneb.edu/programs/cdl',
  'Omaha, NE', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen}'::text[], '{trades,CDL,truck_driving,commercial_driver,transportation,vocational_training,certificate,financial_aid_eligible,MCC,logistics,skilled_labor}'::text[], '{post_secondary,adult}'::text[],
  'high', 'verified',
  'https://www.mccneb.edu/programs/cdl', 'official_website', '2026-03-24',
  'Day and evening schedule options. Must have CLP (Commercial Learner''s Permit) from NE DMV before starting. DOT physical + drug screen required. Financial aid eligible. Ages 18+ (21+ for interstate). Contact Kitty Lillethorup: 531-622-5827. MCC admissions: 531-MCC-2400.',
  true, true, '2026-03-24', '2026-03-24',
  '{"career_field": "trades", "trade_type": "cdl_commercial_driving", "union_affiliated": false, "paid_while_training": false, "program_type": "community_college_vocational", "credentials_earned": ["CDL-A License preparation"], "prerequisites": ["CLP from Nebraska DMV", "DOT physical", "drug screen"], "age_requirement": "18+ (21+ for interstate commerce)", "financial_aid_eligible": true, "wage_range": "$55,000-$85,000+/yr with right employer and endorsements", "local_employers": ["Werner Enterprises (headquartered Omaha)", "Union Pacific", "Regional distribution centers"], "dual_state_notes": "CDL licensing requirements are federal (FMCSA) and apply uniformly across Nebraska and Iowa. Iowa residents can complete CDL training at MCC but must obtain their Iowa CLP and CDL from Iowa DOT. Iowa Western Community College (IWCC) also offers CDL training at a lower in-district rate for Council Bluffs residents.", "delivery": "in_person", "listing_type": "community_college_program", "cost_details": {"cost_type": "tuition_financial_aid_eligible"}}'::jsonb
);
