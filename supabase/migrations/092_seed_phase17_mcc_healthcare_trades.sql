-- ============================================================
-- Opportography — Migration 092
-- Phase 17D: Trades, Vocational & Apprenticeship Pathways
--             Metropolitan Community College (MCC) — Healthcare Support Trades
-- Date: 2026-03-24
--
-- 3 verified entries:
--   1. MCC CNA (Certified Nursing Assistant) — state-approved, HLTH 1200
--   2. MCC EMT — 110 didactic + 55 lab + 12 clinical hrs, NE State Board approved
--   3. MCC Phlebotomy Technician — 4 months, $2,250 + $117 exam, NHA certification
--
-- All programs confirmed from mccneb.edu primary source, 2026-03-24
--
-- NOT duplicating:
--   - Any healthcare career pathway entries from Phase 15 (migration 063)
--     which covered career exploration, not vocational training programs
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

-- ── 1. MCC CNA — Certified Nursing Assistant ──────────────────────────────────
-- mccneb.edu confirmed: state-approved (HLTH 1200), pass state competency eval,
-- $15-$20/hr entry, contact Susan Lund smlund8940@mccneb.edu
-- NOTE: Many Omaha-area nursing homes and assisted living facilities also offer
-- free employer-sponsored CNA training in exchange for work commitments —
-- this listing covers the MCC academic pathway
(
  'MCC Certified Nursing Assistant (CNA) Training — State-Approved (HLTH 1200)',
  'Metropolitan Community College',
  'https://www.mccneb.edu',
  'Becoming a Certified Nursing Assistant (CNA) is one of the fastest, most accessible entries into healthcare — and one of the most important healthcare roles in any community. CNAs provide direct patient care: helping residents with daily activities, monitoring vital signs, assisting nurses, and providing the human presence and dignity that makes long-term care work. MCC''s CNA program (HLTH 1200) is state-approved by Nebraska''s Health and Human Services Regulation and Licensure division. Completing the program and passing the Nebraska State Competency Evaluation earns you CNA certification — the entry credential for working in nursing homes, assisted living facilities, hospitals, and home health agencies. CNA positions in Omaha start at $15–$20/hr. The CNA credential is also a recognized stepping stone toward LPN, RN, and higher nursing roles — many working nurses in Omaha started as CNAs while attending nursing school. Important note: dozens of Omaha-area nursing facilities also offer FREE employer-sponsored CNA training in exchange for a work commitment — these programs pay you while you train and cover your certification exam fee. If you cannot afford MCC tuition, ask any long-term care facility in Omaha whether they offer employer-sponsored CNA training. Contact MCC CNA coordinator Susan Lund at smlund8940@mccneb.edu for program details and start dates.',
  'community',
  'High school diploma, GED, or HiSET typically required. MCC admissions process. Financial aid available. Background check required before clinical placement. Contact Susan Lund: smlund8940@mccneb.edu. General admissions: 531-MCC-2400 or mccneb.edu. NOTE: Free employer-sponsored CNA training is also available at many Omaha-area nursing homes — inquire directly with any long-term care facility.',
  NULL,
  'https://www.mccneb.edu/programs/cna',
  'Omaha, NE', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen}'::text[], '{healthcare,CNA,nursing_assistant,vocational_training,certificate,state_certification,financial_aid_eligible,MCC,healthcare_support,entry_level_healthcare}'::text[], '{high_school_senior,post_secondary,adult}'::text[],
  'high', 'verified',
  'https://www.mccneb.edu/programs/cna', 'official_website', '2026-03-24',
  'Multiple start dates. Short program (weeks, not years). State-approved. Must pass Nebraska State Competency Evaluation for CNA certification. Financial aid available. Background check required. Contact Susan Lund: smlund8940@mccneb.edu. Also: free employer-sponsored CNA training available at many Omaha nursing homes.',
  true, true, '2026-03-24', '2026-03-24',
  '{"career_field": "healthcare_trades", "trade_type": "certified_nursing_assistant", "union_affiliated": false, "paid_while_training": false, "program_type": "community_college_certification", "credentials_earned": ["Nebraska CNA Certification (via state competency evaluation)"], "state_approved": true, "program_course": "HLTH 1200", "financial_aid_eligible": true, "starting_wage": "$15-$20/hr entry-level", "career_ladder_note": "CNA is recognized stepping stone to LPN, RN, and higher nursing roles", "employer_sponsored_option": "Many Omaha nursing homes offer FREE employer-sponsored CNA training with work commitment — this is an alternative to MCC for cost-sensitive students", "dual_state_notes": "Nebraska and Iowa have separate CNA certification systems. Nebraska CNA certification requires passing Nebraska''s competency evaluation. Iowa residents working in Iowa facilities need Iowa CNA certification — different exam and registry. Iowa Western Community College (IWCC) may offer CNA or equivalent programs for Iowa residents.", "delivery": "in_person", "listing_type": "community_college_program", "cost_details": {"cost_type": "tuition_financial_aid_eligible", "employer_sponsored_alternative": true}}'::jsonb
),

-- ── 2. MCC EMT — Emergency Medical Technician ────────────────────────────────
-- mccneb.edu confirmed: Certificate of Achievement, 110 didactic + 55 lab + 12 clinical hrs,
-- Nebraska State Board of EMS approved, contact Craig Jacobus 531-622-3004
(
  'MCC Emergency Medical Technician (EMT) — Certificate of Achievement (Nebraska EMS Board Approved)',
  'Metropolitan Community College',
  'https://www.mccneb.edu',
  'MCC''s EMT program prepares students for certification as Emergency Medical Technicians — the trained first responders who staff ambulances, fire department EMS units, and emergency departments across the Omaha metro. This is the base credential for emergency medical services careers, a demanding field that requires genuine competence under pressure and the satisfaction of knowing that your work directly saves lives. The MCC program is approved by the Nebraska State Board of Emergency Medical Services. The curriculum covers: 110 hours of didactic (classroom) instruction, 55 hours of hands-on lab skills, and 12 hours of clinical experience in actual emergency settings. Completing the program qualifies you to sit for the National Registry of Emergency Medical Technicians (NREMT) exam, which is the national certification required for EMT employment. EMT certification is also the prerequisite for Paramedic training — MCC offers a separate Paramedicine program for students who want to advance beyond EMT. Starting wages for EMTs in Omaha are approximately $16–$22/hr depending on employer. Omaha Fire Department, American Medical Response (AMR), and numerous hospital-based EMS systems hire EMTs in this metro. This program is financial aid eligible. Contact Craig Jacobus at 531-622-3004 for current schedule and enrollment.',
  'community',
  'High school diploma, GED, or HiSET required. MCC admissions process. Must pass NREMT exam after completion for certification. Background check and physical health requirements for clinical placement. Financial aid available. Contact Craig Jacobus: 531-622-3004. Admissions: 531-MCC-2400 or mccneb.edu/programs/ems.',
  NULL,
  'https://www.mccneb.edu/programs/ems',
  'Omaha, NE', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen}'::text[], '{healthcare,EMT,emergency_medical,EMS,vocational_training,certificate,state_certification,NREMT,financial_aid_eligible,MCC,healthcare_support,first_responder}'::text[], '{high_school_senior,post_secondary,adult}'::text[],
  'high', 'verified',
  'https://www.mccneb.edu/programs/ems', 'official_website', '2026-03-24',
  'Nebraska State Board of EMS approved. Curriculum: 110 hrs didactic + 55 hrs lab + 12 hrs clinical. Must pass NREMT exam for national certification. Financial aid eligible. Contact Craig Jacobus: 531-622-3004. MCC admissions: 531-MCC-2400. Separate Paramedicine AAS also available at MCC for advancement.',
  true, true, '2026-03-24', '2026-03-24',
  '{"career_field": "healthcare_trades", "trade_type": "emergency_medical_technician", "union_affiliated": false, "paid_while_training": false, "program_type": "community_college_certification", "credentials_earned": ["Certificate of Achievement", "Eligible for NREMT National Certification Exam"], "curriculum_hours": {"didactic": 110, "lab": 55, "clinical": 12, "total": 177}, "state_approved": "Nebraska State Board of Emergency Medical Services", "national_exam": "NREMT (National Registry of Emergency Medical Technicians)", "advancement_pathway": "EMT -> Paramedic (separate MCC Paramedicine AAS program)", "financial_aid_eligible": true, "starting_wage": "$16-$22/hr entry-level EMT", "dual_state_notes": "Nebraska EMS certifications and Iowa EMS certifications are separate systems. Iowa residents working on Iowa EMS agencies need Iowa EMS certification. NREMT national certification is recognized in both states. Verify state reciprocity before employment.", "delivery": "in_person", "listing_type": "community_college_program", "cost_details": {"cost_type": "tuition_financial_aid_eligible"}}'::jsonb
),

-- ── 3. MCC Phlebotomy Technician ──────────────────────────────────────────────
-- mccneb.edu/workforce confirmed: 4 months, in-person, $2,250 (includes books/supplies)
-- + $117 NHA exam fee, NHA Certified Phlebotomy Technician (CPT) certification,
-- requires HS diploma. Program through MCC Workforce Education division.
(
  'MCC Phlebotomy Technician — NHA Certification (4 Months, $2,250 + Exam Fee)',
  'Metropolitan Community College — Workforce Education',
  'https://www.mccneb.edu',
  'Phlebotomists are healthcare workers trained to draw blood from patients for lab tests, transfusions, donations, and research — a skill required in every hospital, clinic, doctor''s office, and blood bank in the metro. MCC''s Phlebotomy Technician program through its Workforce Education division is one of the most direct, fastest certification pathways available: four months, fully in-person, leading to the NHA Certified Phlebotomy Technician (CPT) credential — the nationally recognized certification that employers in this field require. Total cost is $2,250, which includes books and supplies. The NHA certification exam is an additional $117. This is not a tuition-based AAS program — it is a short, focused certification course offered through MCC''s workforce division, which means financial aid eligibility may differ from credit-bearing programs. Verify current financial aid options directly with MCC Workforce Education. Phlebotomy is a meaningful entry point into the healthcare field: the work is skilled, the credential is recognized across the country, and the hospital and clinic systems of the Omaha metro (CHI Health, Methodist Health System, UNMC) consistently employ certified phlebotomists. Contact MCC Workforce Education at 531-MCC-2400 for current enrollment dates and financial options.',
  'community',
  'High school diploma or equivalent required. Ages 18+. Program is 4 months, fully in-person. Total cost: $2,250 (books and supplies included) + $117 NHA exam fee. Contact MCC Workforce Education: 531-MCC-2400 or mccneb.edu/community-business/workforce-education. Verify financial aid availability with MCC directly — this is a workforce (non-credit) program.',
  NULL,
  'https://www.mccneb.edu/community-business/workforce-education/programs-and-certifications/health-career-training/phlebotomy-technician',
  'Omaha, NE', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen}'::text[], '{healthcare,phlebotomy,blood_draw,vocational_training,certificate,NHA_certification,MCC,healthcare_support,short_program}'::text[], '{post_secondary,adult}'::text[],
  'high', 'verified',
  'https://www.mccneb.edu/community-business/workforce-education/programs-and-certifications/health-career-training/phlebotomy-technician', 'official_website', '2026-03-24',
  '4-month program, fully in-person. Total cost: $2,250 (books/supplies included) + $117 NHA exam fee. NHA Certified Phlebotomy Technician (CPT) credential upon passing exam. Offered through MCC Workforce Education. Contact: 531-MCC-2400. Verify financial aid options — workforce program may differ from credit-bearing aid.',
  true, true, '2026-03-24', '2026-03-24',
  '{"career_field": "healthcare_trades", "trade_type": "phlebotomy", "union_affiliated": false, "paid_while_training": false, "program_type": "community_college_workforce_certification", "credentials_earned": ["NHA Certified Phlebotomy Technician (CPT)"], "program_length": "4 months", "cost_breakdown": {"program_tuition": 2250, "includes": "books and supplies", "exam_fee": 117, "total_estimated": 2367}, "financial_aid_note": "This is a workforce (non-credit) program — standard FAFSA/Pell may have limited applicability. Contact MCC Workforce Education at 531-MCC-2400 to verify.", "dual_state_notes": "NHA CPT certification is nationally recognized and valid in both Nebraska and Iowa.", "delivery": "in_person", "listing_type": "community_college_workforce_program", "cost_details": {"cost_type": "low_cost", "amount": 2367, "conditions": "Verify financial aid options with MCC Workforce Education"}}'::jsonb
);
