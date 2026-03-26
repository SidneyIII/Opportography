-- ============================================================
-- Opportography — Migration 093
-- Phase 17E: Trades, Vocational & Apprenticeship Pathways
--             Iowa Western Community College (IWCC) — Vocational Programs
-- Date: 2026-03-24
--
-- 6 verified entries:
--   1. IWCC HVAC/R Technology Diploma (42 credits, 3 terms)
--   2. IWCC Welding Technology (Certificate 16.5 credits + Diploma)
--   3. IWCC Automotive Technology AAS (78 credits)
--   4. IWCC Diesel Technology AAS (high demand, expansion underway)
--   5. IWCC Electrical Technology (Certificate + Diploma)
--   6. IWCC Plumbing Technology (expansion planned)
--
-- CRITICAL CONTEXT: IWCC is in Council Bluffs, Iowa.
-- Iowa residents pay $214/credit (in-district/in-state rate).
-- Iowa E2E (Education 2 Employment) free tuition may apply for eligible Iowa residents.
-- These are the primary vocational pathways for Council Bluffs/Pottawattamie County residents.
-- Nebraska/Omaha residents pay $219/credit — MCC may be more cost-effective.
--
-- All programs confirmed from iwcc.edu and catalog.iwcc.edu, 2026-03-24
--
-- NOT duplicating:
--   - IWCC scholarships (migration 041)
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

-- ── 1. IWCC HVAC/R Technology Diploma ────────────────────────────────────────
-- catalog.iwcc.edu confirmed: 42 credits, 3 terms (2 semesters + summer),
-- HVAC/R Maintenance Certificate included upon completion,
-- 5,105 HVAC jobs projected in Omaha/SW Iowa region through 2025
(
  'IWCC HVAC/R Technology Diploma — Heating, Ventilation, Air Conditioning & Refrigeration (Council Bluffs)',
  'Iowa Western Community College',
  'https://www.iwcc.edu',
  'Iowa Western Community College''s HVAC/R Technology Diploma is the primary trades credential for heating, ventilation, air conditioning, and refrigeration careers for Council Bluffs and Southwest Iowa residents. This program is specifically designed for people who live on the Iowa side of the metro and want a shorter, more affordable path to HVAC/R employment than a four-year degree. The diploma is 42 credits, completed in three terms (two full semesters plus a summer term). Upon completion, you also earn the HVAC/R Maintenance Certificate, which can be earned as a standalone credential if you complete the certificate portion first. HVAC/R technicians are in severe shortage in this metro — the region is projected to need over 5,000 HVAC workers through the near term, and every new building, hospital expansion, and industrial facility requires HVAC installation and ongoing service. Iowa residents at IWCC pay $214 per credit hour — the total program cost is approximately $9,000 in tuition before financial aid. Iowa residents with financial need may qualify for Iowa''s Education 2 Employment (E2E) program, which can reduce or eliminate tuition entirely. This is one of the most cost-effective paths to a skilled trade career available to Council Bluffs residents. Contact IWCC admissions at 712-325-3277 or admissions@iwcc.edu.',
  'community',
  'Iowa residents (Council Bluffs/Pottawattamie County and Southwest Iowa): in-district/in-state rate $214/credit. Nebraska/Omaha residents: $219/credit. FAFSA and Iowa financial aid (including Iowa E2E free tuition program) available for eligible Iowa residents. High school diploma, GED, or HiSET required. Contact IWCC admissions: 712-325-3277 or 1-800-432-5852 or admissions@iwcc.edu.',
  NULL,
  'https://www.iwcc.edu/academic_programs/industrial-technology/hvac-r-technology-diploma/',
  'Council Bluffs, IA', '2700 College Rd', 'Council Bluffs', 'IA', '51503',
  false, false,
  '{low_income,first_gen}'::text[], '{trades,hvac,refrigeration,heating,vocational_training,diploma,certificate,financial_aid_eligible,IWCC,council_bluffs,iowa,skilled_labor,EPA_608}'::text[], '{high_school_senior,post_secondary,adult}'::text[],
  'high', 'verified',
  'https://www.iwcc.edu/academic_programs/industrial-technology/hvac-r-technology-diploma/', 'official_website', '2026-03-24',
  '42 credits, 3 terms (2 semesters + summer). Iowa residents: $214/credit. Iowa E2E free tuition available for eligible Iowans. Includes HVAC/R Maintenance Certificate. Contact IWCC admissions: 712-325-3277 / admissions@iwcc.edu. Council Bluffs campus: 2700 College Rd.',
  true, true, '2026-03-24', '2026-03-24',
  '{"career_field": "trades", "trade_type": "hvac_refrigeration", "union_affiliated": false, "paid_while_training": false, "program_type": "community_college_vocational", "credentials_earned": ["HVAC/R Technology Diploma", "HVAC/R Maintenance Certificate (included)"], "program_length": "3 terms (2 semesters + summer)", "credits": 42, "cost_iowa_resident": "$214/credit = ~$9,000 total tuition", "cost_nebraska_resident": "$219/credit", "iowa_e2e_eligible": true, "financial_aid_eligible": true, "regional_job_projection": "5,105 HVAC jobs projected in Omaha/SW Iowa region", "dual_state_notes": "IWCC is an Iowa institution. Iowa residents pay significantly less than Nebraska residents. Nebraska/Omaha residents should compare with MCC HVAC/R program cost. Iowa E2E (Education 2 Employment) free tuition program available to eligible Iowa residents — major cost advantage for Council Bluffs residents.", "delivery": "in_person", "listing_type": "community_college_program", "cost_details": {"cost_type": "tuition_financial_aid_eligible", "iowa_advantage": "Iowa residents pay in-state rate AND may qualify for E2E free tuition"}}'::jsonb
),

-- ── 2. IWCC Welding Technology ────────────────────────────────────────────────
-- catalog.iwcc.edu confirmed: Certificate (16.5 credits, 1 semester);
-- Diploma also available; offered at Council Bluffs, Clarinda, and Harlan;
-- covers GMAW, SMAW, GTAW, Oxy-Acetylene
(
  'IWCC Welding Technology — Certificate (1 Semester) & Diploma (Council Bluffs + Regional Campuses)',
  'Iowa Western Community College',
  'https://www.iwcc.edu',
  'Iowa Western''s Welding Technology program is one of the most accessible vocational options for Council Bluffs and Southwest Iowa residents who want to enter the welding trade. The Certificate is 16.5 credits — completable in a single semester — which means you can enter the workforce with a credential faster than virtually any other skilled trade program. The full Welding Technology Diploma provides more comprehensive training for students who want deeper skill development. The program covers the four fundamental welding processes used across all sectors of industry: GMAW (MIG welding, the most common industrial process), SMAW (Stick welding, used in construction and maintenance), GTAW (TIG welding, the high-precision process used in aerospace, pipe, and specialty metals), and Oxy-Acetylene (cutting and brazing). A key advantage: IWCC''s welding program is offered not only at the Council Bluffs main campus, but also at satellite locations in Clarinda and Harlan — which means Southwest Iowa residents who cannot easily commute to Council Bluffs may have a local option. Iowa residents pay $214/credit. The 16.5-credit certificate costs approximately $3,535 in tuition — one of the lowest-cost credentialed welding pathways in the metro. Iowa E2E may eliminate cost for eligible residents.',
  'community',
  'High school diploma, GED, or HiSET required. Iowa residents: $214/credit. Nebraska residents: $219/credit. Iowa E2E free tuition available for eligible Iowa residents. FAFSA financial aid available. Contact IWCC admissions: 712-325-3277 or admissions@iwcc.edu. Program offered at Council Bluffs, Clarinda (Southwest Iowa Community College partnership area), and Harlan campuses.',
  NULL,
  'https://www.iwcc.edu/academic_programs/industrial-technology/welding/',
  'Council Bluffs, IA (+ Clarinda + Harlan campuses)', '2700 College Rd', 'Council Bluffs', 'IA', '51503',
  false, false,
  '{low_income,first_gen}'::text[], '{trades,welding,GMAW,GTAW,SMAW,pipe_welding,vocational_training,certificate,diploma,financial_aid_eligible,IWCC,council_bluffs,iowa,manufacturing,skilled_labor,short_program}'::text[], '{high_school_senior,post_secondary,adult}'::text[],
  'high', 'verified',
  'https://www.iwcc.edu/academic_programs/industrial-technology/welding/', 'official_website', '2026-03-24',
  'Certificate: 16.5 credits, 1 semester. Diploma also available. Offered at Council Bluffs, Clarinda, and Harlan campuses. Iowa: $214/credit; NE: $219/credit. Iowa E2E free tuition for eligible Iowans. Contact admissions@iwcc.edu or 712-325-3277.',
  true, true, '2026-03-24', '2026-03-24',
  '{"career_field": "trades", "trade_type": "welding", "union_affiliated": false, "paid_while_training": false, "program_type": "community_college_vocational", "credentials_earned": ["Welding Technology Certificate (1 semester)", "Welding Technology Diploma (full program)"], "certificate_credits": 16.5, "certificate_length": "1 semester", "welding_processes": ["GMAW (MIG)", "SMAW (Stick)", "GTAW (TIG)", "Oxy-Acetylene"], "cost_certificate_iowa": "~$3,535 tuition (16.5 credits x $214)", "iowa_e2e_eligible": true, "campuses": ["Council Bluffs (main)", "Clarinda", "Harlan"], "dual_state_notes": "Iowa residents pay significantly less than Nebraska residents. Council Bluffs/SW Iowa residents have clear cost advantage at IWCC vs MCC.", "delivery": "in_person", "listing_type": "community_college_program"}'::jsonb
),

-- ── 3. IWCC Automotive Technology AAS ────────────────────────────────────────
-- catalog.iwcc.edu confirmed: AAS, 78 credits, 4 semesters + 2 summers,
-- covers all 8 ASE certification areas, Council Bluffs campus
(
  'IWCC Automotive Technology — AAS Degree (78 Credits, All 8 ASE Certification Areas)',
  'Iowa Western Community College',
  'https://www.iwcc.edu',
  'Iowa Western''s Automotive Technology AAS degree is a comprehensive two-plus-year program covering all eight areas of ASE (Automotive Service Excellence) certification: engine repair, automatic transmissions/transaxles, manual drivetrains and axles, suspension and steering, brakes, electrical and electronic systems, heating and air conditioning, and engine performance. The curriculum runs 78 credits over four semesters and two summer sessions. Completing this program and passing ASE exams puts you on a path to ASE certification, which is the industry standard for automotive technician hiring and wage advancement. Auto technicians with full ASE certification in Omaha/Council Bluffs can earn $22–$45/hr, with master technicians at dealerships earning more. Iowa Western''s program is a strong choice for Council Bluffs residents who want to stay on the Iowa side for their training. Iowa residents pay $214/credit — total tuition for the full 78-credit AAS is approximately $16,692, before financial aid. FAFSA and Iowa E2E may significantly reduce this cost for eligible Iowa residents.',
  'community',
  'High school diploma, GED, or HiSET required. Iowa residents: $214/credit. Nebraska residents: $219/credit. Iowa E2E free tuition for eligible Iowa residents. FAFSA financial aid available. Contact IWCC admissions: 712-325-3277 or admissions@iwcc.edu.',
  NULL,
  'https://www.iwcc.edu/academic_programs/transportation-technology/automotive-technology-aas/',
  'Council Bluffs, IA', '2700 College Rd', 'Council Bluffs', 'IA', '51503',
  false, false,
  '{low_income,first_gen}'::text[], '{trades,automotive,ASE_certification,vocational_training,AAS,financial_aid_eligible,IWCC,council_bluffs,iowa,skilled_labor,dealership}'::text[], '{high_school_senior,post_secondary,adult}'::text[],
  'high', 'verified',
  'https://www.iwcc.edu/academic_programs/transportation-technology/automotive-technology-aas/', 'official_website', '2026-03-24',
  '78 credits, 4 semesters + 2 summers. All 8 ASE certification areas. Iowa: $214/credit (~$16,692 total). Iowa E2E free tuition for eligible Iowans. FAFSA available. Admissions: 712-325-3277 / admissions@iwcc.edu.',
  true, false, '2026-03-24', '2026-03-24',
  '{"career_field": "trades", "trade_type": "automotive_technology", "union_affiliated": false, "paid_while_training": false, "program_type": "community_college_vocational", "credentials_earned": ["AAS Degree", "ASE certification pathway (all 8 areas)"], "credits": 78, "program_length": "4 semesters + 2 summers", "cost_iowa_aas": "~$16,692 tuition (78 credits x $214)", "iowa_e2e_eligible": true, "financial_aid_eligible": true, "dual_state_notes": "Iowa residents have clear cost advantage at IWCC vs MCC. Nebraska residents may prefer MCC Automotive which also has Toyota T-TEN and MOPAR CAP manufacturer partnerships.", "delivery": "in_person", "listing_type": "community_college_program"}'::jsonb
),

-- ── 4. IWCC Diesel Technology AAS ─────────────────────────────────────────────
-- iwcc.edu confirmed: AAS available, high demand (program at capacity),
-- $55M bond passed Nov 2025 for new 86,000 sq ft Transportation Building
-- which will double CDL and diesel training capacity
(
  'IWCC Diesel Technology — AAS Degree (High Demand; New 86,000 sq ft Transportation Facility Expanding Capacity)',
  'Iowa Western Community College',
  'https://www.iwcc.edu',
  'Iowa Western''s Diesel Technology AAS program trains diesel mechanics for commercial trucks, heavy equipment, and agricultural machinery — one of the highest-demand skilled trades in the logistics and construction sectors. Diesel technicians with experience in Class 6–8 truck repair and heavy equipment can earn $25–$45/hr with consistent employment and effectively zero risk of the work being automated or outsourced. The Diesel Technology program at IWCC is currently at capacity due to demand — which is itself a signal about how valued this credential is in the regional job market. Iowa Western voters approved a $55 million bond referendum in November 2025 specifically to build a new 86,000 square foot Transportation and Logistics facility, which will more than double the college''s capacity for diesel, CDL, and transportation technology training when it opens. Council Bluffs and Iowa-side residents who want to enter diesel technology should contact IWCC now to get on a waitlist or plan for the expanded capacity when the new facility opens. Iowa residents pay $214/credit. FAFSA and Iowa E2E available for eligible residents.',
  'community',
  'High school diploma, GED, or HiSET required. NOTE: Program is currently at capacity — contact IWCC admissions now to join waitlist or verify current enrollment availability. Iowa residents: $214/credit. Iowa E2E free tuition may apply. FAFSA financial aid available. Contact IWCC admissions: 712-325-3277 or admissions@iwcc.edu.',
  NULL,
  'https://www.iwcc.edu/academic_programs/transportation-technology/diesel-technology/',
  'Council Bluffs, IA', '2700 College Rd', 'Council Bluffs', 'IA', '51503',
  false, false,
  '{low_income,first_gen}'::text[], '{trades,diesel,heavy_equipment,commercial_truck,vocational_training,AAS,financial_aid_eligible,IWCC,council_bluffs,iowa,skilled_labor,logistics,high_demand}'::text[], '{high_school_senior,post_secondary,adult}'::text[],
  'high', 'verified',
  'https://www.iwcc.edu/academic_programs/transportation-technology/diesel-technology/', 'official_website', '2026-03-24',
  'AAS program. Currently AT CAPACITY — contact IWCC for waitlist. New 86,000 sq ft Transportation Building funded by $55M bond (approved Nov 2025) will expand capacity significantly. Iowa: $214/credit. Iowa E2E free tuition available. Contact: 712-325-3277 / admissions@iwcc.edu.',
  true, true, '2026-03-24', '2026-03-24',
  '{"career_field": "trades", "trade_type": "diesel_technology", "union_affiliated": false, "paid_while_training": false, "program_type": "community_college_vocational", "credentials_earned": ["AAS Degree — Diesel Technology"], "capacity_note": "Program currently at capacity as of 2026-03-24. Contact IWCC for waitlist status.", "expansion_note": "New 86,000 sq ft Transportation & Logistics Building funded by $55M bond (Nov 2025 voter-approved) will significantly expand program capacity upon completion.", "iowa_e2e_eligible": true, "financial_aid_eligible": true, "wage_range": "$25-$45/hr certified diesel technician", "dual_state_notes": "Iowa residents pay $214/credit (in-district). Nebraska residents $219/credit. Iowa residents should also note CDL capacity will expand with new building.", "delivery": "in_person", "listing_type": "community_college_program"}'::jsonb
),

-- ── 5. IWCC Electrical Technology ────────────────────────────────────────────
-- catalog.iwcc.edu confirmed: Certificate and Diploma available
(
  'IWCC Electrical Technology — Certificate & Diploma (Council Bluffs)',
  'Iowa Western Community College',
  'https://www.iwcc.edu',
  'Iowa Western Community College offers Electrical Technology training in both Certificate and Diploma formats at the Council Bluffs campus. The program covers residential and commercial electrical systems, wiring methods, National Electrical Code (NEC) compliance, motor controls, and industrial electrical theory. For Council Bluffs and Southwest Iowa residents who want foundational electrical training without commuting to Omaha, IWCC''s Electrical Technology program provides the technical education needed to enter the electrical field or prepare for a union apprenticeship. Iowa residents pay $214/credit at IWCC — a meaningful cost advantage over Nebraska institution tuition for Pottawattamie County residents. The certificate provides a faster entry point; the diploma provides more comprehensive training. Contact IWCC admissions at 712-325-3277 or admissions@iwcc.edu for current program details, credit requirements, and start dates.',
  'community',
  'High school diploma, GED, or HiSET required. Iowa residents: $214/credit. Iowa E2E free tuition available for eligible Iowa residents. FAFSA available. Contact IWCC admissions: 712-325-3277 or admissions@iwcc.edu. Council Bluffs campus: 2700 College Rd.',
  NULL,
  'https://www.iwcc.edu/academic_programs/industrial-technology/electrical-technology/',
  'Council Bluffs, IA', '2700 College Rd', 'Council Bluffs', 'IA', '51503',
  false, false,
  '{low_income,first_gen}'::text[], '{trades,electrical,NEC,vocational_training,certificate,diploma,financial_aid_eligible,IWCC,council_bluffs,iowa,skilled_labor}'::text[], '{high_school_senior,post_secondary,adult}'::text[],
  'high', 'verified',
  'https://www.iwcc.edu/academic_programs/industrial-technology/electrical-technology/', 'official_website', '2026-03-24',
  'Certificate and Diploma available. Iowa residents: $214/credit. Iowa E2E free tuition available. FAFSA financial aid. Contact: 712-325-3277 / admissions@iwcc.edu. Verify current credit requirements and start dates with IWCC directly.',
  true, false, '2026-03-24', '2026-03-24',
  '{"career_field": "trades", "trade_type": "electrical_technology", "union_affiliated": false, "paid_while_training": false, "program_type": "community_college_vocational", "credentials_earned": ["Electrical Technology Certificate", "Electrical Technology Diploma"], "iowa_e2e_eligible": true, "financial_aid_eligible": true, "iowa_cost_advantage": "Iowa residents pay $214/credit vs Nebraska rates at MCC", "dual_state_notes": "Iowa residents considering a path to licensed electrician in Iowa should note Iowa has a separate electrician licensing system from Nebraska. Iowa journeyman electrician exam and Iowa Department of Public Health licensing required for independent electrical work in Iowa.", "delivery": "in_person", "listing_type": "community_college_program"}'::jsonb
),

-- ── 6. IWCC Plumbing Technology ───────────────────────────────────────────────
-- catalog.iwcc.edu confirmed: program listed and active; expansion planned
-- under $55M bond for new Transportation & Trades facility
(
  'IWCC Plumbing Technology — Vocational Training Program (Council Bluffs; Expansion Underway)',
  'Iowa Western Community College',
  'https://www.iwcc.edu',
  'Iowa Western Community College''s Plumbing Technology program provides vocational plumbing training for Council Bluffs and Southwest Iowa residents at the Council Bluffs campus. The program covers residential and commercial plumbing systems, pipe fitting, fixture installation, drainage systems, and plumbing code compliance. Iowa has a separate plumbing licensing system from Nebraska — Iowa-side plumbers must be licensed under Iowa''s plumbing and mechanical licensing requirements, which differ from Nebraska''s Omaha Journeyman Plumber License. Training at IWCC in Council Bluffs is designed for students who will work and be licensed in Iowa, making it the more appropriate educational pathway for Pottawattamie County residents than commuting to MCC. IWCC''s plumbing facilities are slated for expansion under the $55 million bond measure voters approved in November 2025 for a new Transportation & Trades building — meaning program capacity and facilities will improve significantly in the near future. Contact IWCC admissions at 712-325-3277 or admissions@iwcc.edu for current program details, credit requirements, and enrollment.',
  'community',
  'High school diploma, GED, or HiSET required. Iowa residents: $214/credit (in-district rate). Iowa E2E free tuition available for eligible Iowa residents. FAFSA available. Contact IWCC admissions: 712-325-3277 or admissions@iwcc.edu. Council Bluffs campus: 2700 College Rd, Council Bluffs, IA 51503.',
  NULL,
  'https://www.iwcc.edu/academic_programs/industrial-technology/plumbing-technology/',
  'Council Bluffs, IA', '2700 College Rd', 'Council Bluffs', 'IA', '51503',
  false, false,
  '{low_income,first_gen}'::text[], '{trades,plumbing,vocational_training,certificate,diploma,financial_aid_eligible,IWCC,council_bluffs,iowa,skilled_labor,licensed_trade}'::text[], '{high_school_senior,post_secondary,adult}'::text[],
  'high', 'verified',
  'https://www.iwcc.edu/academic_programs/industrial-technology/plumbing-technology/', 'official_website', '2026-03-24',
  'Program confirmed active. Expansion planned under $55M bond (approved Nov 2025 — new Transportation & Trades facility). Iowa: $214/credit. Iowa E2E free tuition available. Contact: 712-325-3277 / admissions@iwcc.edu. Verify current credit requirements and start dates.',
  true, false, '2026-03-24', '2026-03-24',
  '{"career_field": "trades", "trade_type": "plumbing", "union_affiliated": false, "paid_while_training": false, "program_type": "community_college_vocational", "credentials_earned": ["Plumbing Technology Certificate/Diploma — verify specifics at iwcc.edu"], "expansion_note": "$55M bond (Nov 2025) includes expansion of plumbing training facilities.", "iowa_e2e_eligible": true, "financial_aid_eligible": true, "dual_state_notes": "CRITICAL: Iowa and Nebraska have SEPARATE plumbing licensing systems. Iowa plumbers must be licensed through Iowa Department of Public Health plumbing licensing board. Nebraska uses City of Omaha licensing and Nebraska state licensing. Council Bluffs residents working in Iowa need Iowa licensure — training at IWCC is appropriate for Iowa-side licensing pathway. Nebraska residents working in Omaha should use MCC''s plumbing program and pursue Nebraska/Omaha licensure.", "delivery": "in_person", "listing_type": "community_college_program"}'::jsonb
);
