-- ============================================================
-- Opportography — Migration 079
-- Phase 15Q: Scholarship Deep Dive — Military ROTC Scholarships
-- Date: 2026-03-20
--
-- 3 verified entries:
--   1. Army ROTC 4-Year Scholarship
--   2. Navy/Marine ROTC 4-Year Scholarship (NROTC)
--   3. Air Force ROTC 4-Year Scholarship
--
-- Note: ROTC scholarships are among the most valuable and least-known
-- free college financing options available to any student regardless
-- of military family background. They cover full tuition, housing,
-- books, and provide a monthly stipend. In exchange, students commit
-- to military service after graduation.
--
-- Omaha-area ROTC programs:
--   Army ROTC: UNO (hosted by UNO), Creighton University
--   Navy/Marine ROTC: UNO (cross-enrollment from Creighton),
--     Creighton University
--   Air Force ROTC: Offutt AFB / UNO area
--
-- These are legitimate scholarship programs operated by the U.S.
-- Department of Defense, not recruiting propaganda. Students should
-- understand both the benefits (full tuition + stipend) and
-- obligations (military service commitment after graduation).
-- ============================================================

insert into public.opportunities (
  title, organization, organization_website, description, type,
  eligibility, deadline, link, location, address, city, state, zip,
  is_remote, is_hybrid,
  identity_tags, category_tags, grade_levels,
  compensation_type, compensation_amount, compensation_frequency,
  data_confidence, verification_status,
  source_url, source_type, source_retrieved_date,
  is_active, is_featured,
  schedule, language_access, cost_structure, recurrence,
  learning_context, equity_focus,
  cb_eligibility, scholarship_metadata
) values

-- ── 1. Army ROTC 4-Year Scholarship ─────────────────────────────────────────
-- Full tuition + housing + books + $420/month stipend (senior year).
-- Service commitment: 8 years (4 active + 4 reserve, or 8 reserve).
-- Applications open June 1 and rolling through November–January.
(
  'Army ROTC 4-Year Scholarship — Full Tuition + Stipend (UNO / Creighton)',
  'U.S. Army ROTC / Cadet Command',
  'https://www.goarmy.com/rotc/high-school-students/four-year-scholarship.html',
  'The Army ROTC 4-Year Scholarship is one of the most comprehensive college financing packages available — it covers full tuition, mandatory fees, a housing allowance, books, and a monthly living stipend (up to $420/month for seniors, $150–$350 for earlier years). In exchange, scholarship recipients commit to 8 years of service after graduation (typically 4 years active duty + 4 years reserve, though all-reserve options exist). This is not a traditional scholarship — it is a commitment to military service — but for students interested in a military career or who want to serve before starting their civilian career, it is an extraordinarily valuable package. There is no upfront cost or obligation during the application process. ROTC programs are embedded at Omaha-area universities: Army ROTC is available at UNO and at Creighton University. Council Bluffs students attending either institution can participate. Scholarships are awarded on a competitive basis — applicants are evaluated on academic record, physical fitness, and leadership potential. Applications open June 1 for the following academic year. The scholarship does not restrict field of study — you can major in anything and still receive the full scholarship while completing the ROTC curriculum.',
  'scholarship',
  'High school senior or college student (4-year and 3-year options available). U.S. citizen. At least 17 years old by the start of college. Minimum 2.5 GPA (higher is competitive). ACT 19+ or SAT 940+ recommended. Physically fit (must pass Army fitness standards). Complete online application at goarmy.com/rotc. Applications open June 1 for the following academic year with rolling deadlines through January. All majors accepted. Service obligation: 8 years after graduation (active + reserve options).',
  '2027-01-15',
  'https://www.goarmy.com/rotc/high-school-students/four-year-scholarship.html',
  'Omaha, NE (UNO / Creighton)',
  null, 'Omaha', 'NE', null,
  false, false,
  array[]::text[],
  array['scholarship', 'college_access', 'military', 'ROTC', 'leadership'],
  array['high_school_senior'],
  'scholarship', null, 'annual',
  'high', 'verified',
  'https://www.goarmy.com/rotc/high-school-students/four-year-scholarship.html', 'official_website', '2026-03-20',
  true, true,
  'Applications open June 1 annually. Rolling deadline — apply early for best consideration; final deadline typically January. Verify current deadlines at goarmy.com/rotc.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "Army ROTC programs at UNO and Creighton University are accessible to Council Bluffs students attending either institution. Students attending other Omaha-area schools can cross-enroll in ROTC at UNO or Creighton.", "source": "https://www.goarmy.com/rotc"}'::jsonb,
  '{"scholarship_type": "military_service", "application_method": "online_application", "service_obligation": {"years": 8, "details": "4 years active duty + 4 years reserve (or 8 years reserve-only option)"}, "covers": ["full_tuition", "mandatory_fees", "housing_allowance", "books", "monthly_stipend"], "stipend_amounts": {"freshman": "$150/month", "sophomore": "$175/month", "junior": "$350/month", "senior": "$420/month"}, "notes": "This is a service-for-education commitment. Students should understand the 8-year service obligation before applying."}'::jsonb
),

-- ── 2. Navy/Marine Corps ROTC 4-Year Scholarship (NROTC) ─────────────────────
-- Full tuition + fees + uniform + $250-$400/month stipend.
-- Service commitment: 5+ years active duty (Navy or Marine Corps).
-- Available at Creighton University. Cross-enrollment for UNO students.
(
  'Navy / Marine Corps ROTC (NROTC) — Full Tuition + Stipend (Creighton)',
  'Naval Service Training Command (NSTC)',
  'https://www.nrotc.navy.mil/',
  'The Navy/Marine Corps ROTC (NROTC) 4-Year Scholarship covers full tuition, mandatory fees, uniforms, and a monthly living stipend in exchange for a commitment to serve as a commissioned officer in the U.S. Navy or Marine Corps after graduation. The monthly stipend ranges from $250 (freshman) to $400 (senior) per month. NROTC scholars attend a 4-year university with an NROTC unit while completing Naval Science courses and summer training. Creighton University in Omaha hosts an NROTC unit — University of Nebraska Omaha students can cross-enroll in Creighton''s NROTC program. NROTC scholars may choose to commission as Naval officers or Marine Corps officers. Marine Option scholarships typically commit graduates to 4 years active duty; Naval Option may differ. This is a competitive scholarship — applicants are evaluated on academic record, physical fitness, leadership, and character. For students interested in maritime careers, aviation, engineering, nuclear power, or a Marine Corps career, NROTC is one of the best-funded pathways available. Applications open June 1 for the following academic year and close in January.',
  'scholarship',
  'High school senior. U.S. citizen. At least 17, not yet 23 years old at the time of college enrollment. Minimum 2.5 GPA (higher is competitive; Naval Nuclear program requires higher minimums). Strong SAT/ACT scores. Physical fitness and medical qualification required. Commit to serve as Navy or Marine Corps officer after graduation (4+ years active duty). Apply at nrotc.navy.mil. Applications open June 1 with deadline ~January.',
  '2027-01-15',
  'https://www.nrotc.navy.mil/',
  'Omaha, NE (Creighton University NROTC unit)',
  '2500 California Plaza', 'Omaha', 'NE', '68178',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access', 'military', 'ROTC', 'leadership', 'Navy', 'Marines'],
  array['high_school_senior'],
  'scholarship', null, 'annual',
  'high', 'verified',
  'https://www.nrotc.navy.mil/', 'official_website', '2026-03-20',
  true, false,
  'Applications open June 1 annually. Deadline: ~January. Verify current deadlines and Creighton NROTC unit contact at nrotc.navy.mil.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "Creighton University hosts an NROTC unit in Omaha. UNO students can cross-enroll in Creighton''s NROTC program. Council Bluffs students attending Creighton or UNO are eligible.", "source": "https://www.nrotc.navy.mil"}'::jsonb,
  '{"scholarship_type": "military_service", "application_method": "online_application_nrotc", "service_obligation": {"details": "Navy option: 5+ years active duty; Marine option: 4+ years active duty. Verify at nrotc.navy.mil"}, "covers": ["full_tuition", "mandatory_fees", "uniforms", "monthly_stipend"], "stipend_amounts": {"freshman": "$250/month", "sophomore": "$300/month", "junior": "$350/month", "senior": "$400/month"}, "local_unit": "Creighton University NROTC — cross-enrollment available for UNO students"}'::jsonb
),

-- ── 3. Air Force ROTC 4-Year Scholarship ─────────────────────────────────────
-- Full tuition + fees + books + $300-$500/month stipend.
-- Service commitment: 4+ years active duty (Air Force or Space Force).
-- Available at UNO and Creighton through Detachment 465 (Offutt AFB area).
(
  'Air Force ROTC 4-Year Scholarship — Full Tuition + Stipend (UNO Area)',
  'U.S. Air Force ROTC',
  'https://www.afrotc.com/scholarships/',
  'The Air Force ROTC (AFROTC) 4-Year Scholarship covers full tuition, fees, books, and a monthly living stipend ($300–$500/month depending on year) in exchange for a commitment to serve as a commissioned officer in the U.S. Air Force or Space Force after graduation. Scholarship recipients attend a university with an AFROTC detachment while completing Aerospace Studies coursework and summer field training. The Omaha area is served by AFROTC Detachment 465 at the University of Nebraska Omaha, which is affiliated with Offutt Air Force Base (home of Strategic Command) in adjacent Bellevue, NE. Both UNO and Creighton students in the Omaha metro can participate. AFROTC scholarships are available in two types: Type 1 (full tuition, any school) and Type 2 (capped at a set amount). The Air Force and Space Force offer career paths in aviation (pilot, navigator), engineering, intelligence, cyber operations, logistics, and administration. Applications open June 1 for the following academic year with a December–January deadline. This is one of the most valuable scholarship packages available to any high school senior regardless of financial background.',
  'scholarship',
  'High school senior. U.S. citizen. Age 17–26 at time of commissioning (after graduation). Minimum 3.0 GPA for Type 1 scholarship (Type 2 may accept lower). SAT/ACT scores required. Physical fitness and medical qualification required. Must pass the AFOQT (Air Force Officer Qualifying Test) before commissioning. Apply at afrotc.com. Applications open June 1 with deadline typically December–January. 4+ year service commitment to Air Force or Space Force after graduation.',
  '2026-12-31',
  'https://www.afrotc.com/scholarships/',
  'Omaha, NE (UNO — Detachment 465)',
  null, 'Omaha', 'NE', null,
  false, false,
  array[]::text[],
  array['scholarship', 'college_access', 'military', 'ROTC', 'leadership', 'Air_Force', 'Space_Force'],
  array['high_school_senior'],
  'scholarship', null, 'annual',
  'high', 'verified',
  'https://www.afrotc.com/scholarships/', 'official_website', '2026-03-20',
  true, false,
  'Applications open June 1 annually. Deadline: ~December–January. Contact AFROTC Det 465 at UNO for local program details. Verify current scholarship deadlines at afrotc.com/scholarships.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "UNO hosts AFROTC Detachment 465, affiliated with Offutt AFB in Bellevue. Council Bluffs students attending UNO, Creighton, or other metro schools can participate through Det 465.", "source": "https://www.afrotc.com"}'::jsonb,
  '{"scholarship_type": "military_service", "application_method": "online_application_afrotc", "service_obligation": {"details": "4+ years active duty in U.S. Air Force or Space Force after graduation"}, "covers": ["full_tuition", "fees", "books", "monthly_stipend"], "stipend_amounts": {"year1": "$300/month", "year2": "$350/month", "year3": "$450/month", "year4": "$500/month"}, "local_unit": "AFROTC Detachment 465 at UNO, Omaha — affiliated with Offutt Air Force Base (Strategic Command, Bellevue, NE)", "scholarship_types": {"type_1": "full tuition at any school", "type_2": "capped annual amount"}}'::jsonb
);
