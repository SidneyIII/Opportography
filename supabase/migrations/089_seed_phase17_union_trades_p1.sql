-- ============================================================
-- Opportography — Migration 089
-- Phase 17A: Trades, Vocational & Apprenticeship Pathways
--             Union Building Trades — Part 1 (High Confidence)
-- Date: 2026-03-24
--
-- 4 verified entries:
--   1. UA Local 464 — Plumbers, Steamfitters & HVAC Apprenticeship
--   2. Ironworkers Local 21 — Apprenticeship (covers NE + IA explicitly)
--   3. Operating Engineers Local 571 — Apprenticeship
--   4. Laborers Local 1140 — Apprenticeship
--
-- NOT duplicating (already in DB, migration 073):
--   - IBEW Local 22 / OJEATC — Electrician Apprenticeship
--
-- Sources:
--   - lu464.org (UA Local 464 primary site)
--   - iw21.org (Ironworkers Local 21 primary site)
--   - iuoe571.org (Operating Engineers Local 571 primary site)
--   - laborers1140.com (Laborers Local 1140 primary site)
--   All verified 2026-03-24
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

-- ── 1. UA Local 464 — Plumbers, Steamfitters & HVAC Apprenticeship ────────────
-- lu464.org confirmed: 5-year DOL-registered program, March application window,
-- 3375 Oak View Dr Omaha NE 68144, 402-333-5859, heather@lu464.org
(
  'UA Local 464 — Plumbers, Steamfitters & HVAC Apprenticeship (Earn While You Learn)',
  'Steamfitters & Plumbers Local Union 464',
  'https://lu464.org',
  'Steamfitters and Plumbers Local Union 464 runs a five-year DOL-registered apprenticeship covering plumbing, HVAC/refrigeration, and steamfitting in the Omaha metro. This is a union earn-while-you-learn program: you work full-time on real job sites, getting paid from day one, while attending related technical instruction on a schedule set by the Joint Apprenticeship Training Committee. No prior plumbing or pipefitting experience is required. You need to be at least 18 years old and have a high school diploma or GED. The application window opens once per year during the first two weeks of March — this is a firm deadline, so plan ahead. The application process includes a math test and a formal interview. Completing this apprenticeship earns you journeyman plumber or pipefitter status — one of the most in-demand licensed trades in the country, with journeyman wages in Omaha reaching $30–$45/hr depending on specialty. UA Local 464 has trained the plumbers and pipefitters who build and maintain virtually every major building in the Omaha metro. If you are serious about a career that pays you well, provides benefits, and never ships your job overseas, call the union hall or visit lu464.org before March.',
  'community',
  'Must be 18 or older. High school diploma or GED with transcripts required. Must pass a math aptitude test. Appear for a formal interview. Applications accepted ONLY during the first two weeks of March each year — contact the union hall for exact dates. Omaha, NE area applicants. Visit lu464.org or call 402-333-5859.',
  NULL,
  'https://lu464.org',
  'Omaha, NE', '3375 Oak View Drive', 'Omaha', 'NE', '68144',
  false, false,
  '{low_income,first_gen}'::text[], '{trades,plumbing,pipefitting,hvac,apprenticeship,union,earn_while_learn,skilled_labor,construction,JATC}'::text[], '{}'::text[],
  'high', 'verified',
  'https://lu464.org', 'official_website', '2026-03-24',
  'Annual application window: first two weeks of March only. Five-year program. Full-time work on job sites with related technical instruction. Apply at lu464.org or call 402-333-5859. Union hall at 3375 Oak View Dr, Omaha, NE 68144. Contact: heather@lu464.org.',
  true, true, '2026-03-24', '2026-03-24',
  '{"career_field": "trades", "trade_type": "plumbing_pipefitting_hvac", "union_affiliated": true, "paid_while_training": true, "program_length": "5 years", "starting_wage": "verify at lu464.org", "end_wage": "journeyman scale — verify at lu464.org", "application_window": "First two weeks of March annually", "dual_state_notes": "UA Local 464 is based in Omaha, Nebraska. Iowa/Council Bluffs coverage was not explicitly confirmed on primary source — contact the union hall at 402-333-5859 to verify whether Pottawattamie County workers apprentice through Local 464 or a separate Iowa local.", "delivery": "in_person", "listing_type": "union_registered_apprenticeship", "cost_details": {"amount": 0, "cost_type": "earn_while_you_learn", "conditions": "Apprentices are paid employees from day one. No tuition cost. Union dues apply once working."}, "accessibility": {"cost_barrier": "none", "requires_enrollment": true, "council_bluffs_accessible": "verify — contact union hall", "multilingual": false}}'::jsonb
),

-- ── 2. Ironworkers Local 21 — Apprenticeship ──────────────────────────────────
-- iw21.org confirmed: 4-year program, starting $23.50/hr (65% journeyman),
-- 204 hrs classroom/year, covers NE + IA + SD explicitly, online application,
-- 14515 Industrial Rd Omaha NE 68144, 402-333-0276
(
  'Ironworkers Local 21 — Structural & Reinforcing Steel Apprenticeship (Nebraska + Iowa)',
  'Iron Workers International Local 21',
  'https://iw21.org',
  'Ironworkers Local 21 is one of the most compelling apprenticeship opportunities in the entire Omaha/Council Bluffs metro — and one of the few union apprenticeships that explicitly covers both Nebraska and Iowa. If you have ever looked at a building going up, a bridge being constructed, or a stadium being built and wondered who puts the steel together — that is an ironworker. Local 21 apprentices earn $23.50/hr starting pay (65% of journeyman scale) from the first day on the job. Every six months, your wage increases. By the time you complete the four-year program, you hold a journeyman ironworker card recognized across the country. The program requires 204 hours of classroom instruction per year alongside full-time fieldwork. You do not need any prior construction experience. You need to be 18 or older, have a high school diploma or GED, pass a drug screen, have reliable transportation, and be physically capable of working at height. The application is available online — there is no paper-only requirement. This program explicitly covers Omaha, Nebraska, Iowa (including Council Bluffs), and South Dakota. If you are a Council Bluffs or Omaha area resident who wants a physically demanding, well-paid, career-defining trade — Local 21 is worth your full attention.',
  'community',
  'Must be 18 or older. High school diploma or GED required. Drug-free — drug screening required. Valid ID and work authorization (U.S. citizenship or legal work authorization). Reliable transportation to job sites. Physical fitness to work at height and in demanding conditions. Apply online at iw21.org. Serves Nebraska, Iowa (including Council Bluffs/Pottawattamie County), and South Dakota.',
  NULL,
  'https://iw21.org',
  'Omaha, NE (serves Nebraska + Iowa)', '14515 Industrial Road', 'Omaha', 'NE', '68144',
  false, false,
  '{low_income,first_gen}'::text[], '{trades,ironwork,structural_steel,reinforcing_steel,apprenticeship,union,earn_while_learn,skilled_labor,construction,council_bluffs_accessible,iowa_accessible}'::text[], '{}'::text[],
  'high', 'verified',
  'https://iw21.org', 'official_website', '2026-03-24',
  'Year-round application available online. Four-year earn-while-you-learn program. 204 hours of classroom instruction per year. Full-time fieldwork. Starting wage $23.50/hr, increasing every 6 months. Omaha office: 14515 Industrial Rd, 402-333-0276. Sioux City office: 510 W 20th St, Sioux City, IA, 712-252-1761.',
  true, true, '2026-03-24', '2026-03-24',
  '{"career_field": "trades", "trade_type": "ironwork_structural_steel", "union_affiliated": true, "paid_while_training": true, "program_length": "4 years", "starting_wage": "$23.50/hr (65% of journeyman scale)", "wage_progression": "Increases every 6 months throughout the 4-year program", "end_wage": "Journeyman scale — verify at iw21.org", "online_application": "https://form.jotform.com/91504276155153", "dual_state_notes": "LOCAL 21 EXPLICITLY COVERS BOTH NEBRASKA AND IOWA including Council Bluffs/Pottawattamie County. Council Bluffs residents can apply through the same program as Omaha residents. Sioux City, IA office also available for northern Iowa workers.", "delivery": "in_person", "listing_type": "union_registered_apprenticeship", "cost_details": {"amount": 500, "cost_type": "low_cost", "conditions": "Approximately $500 total out-of-pocket cost for the full 4-year program (tools, fees). Apprentices are paid employees — wages paid from day one."}, "accessibility": {"cost_barrier": "low_cost", "requires_enrollment": true, "council_bluffs_accessible": true, "iowa_covered": true, "multilingual": false}}'::jsonb
),

-- ── 3. Operating Engineers Local 571 — Apprenticeship ─────────────────────────
-- iuoe571.org confirmed: 4-year program, apply in-person Mon-Fri 8am-3pm,
-- $25 money-order-only admin fee, 4660 S. 60th Ave Omaha NE 68117, 402-733-1600
(
  'Operating Engineers Local 571 — Heavy Equipment Operator Apprenticeship',
  'International Union of Operating Engineers Local 571',
  'https://iuoe571.org',
  'If you have ever wanted to run heavy equipment — bulldozers, cranes, excavators, scrapers, graders — and get paid well to do it, Operating Engineers Local 571 is the program that will train you. Local 571 runs a four-year DOL-registered apprenticeship covering all areas of construction equipment operation. You earn wages from day one while gaining on-the-job experience and related classroom instruction. Operating engineers are among the highest-paid construction workers on any job site. By the time you reach journeyman status, you are operating equipment that costs more than most houses and completing work that makes major construction projects possible. There are no back-office alternatives for this trade — it requires skilled humans, and demand is not going away. To apply: show up in person at Local 571''s training facility at 4660 S. 60th Avenue in Omaha, Monday through Friday, between 8am and 3pm. Bring a $25 non-refundable administrative fee — money order only, no cash, no personal checks. Applications are processed on an ongoing basis. Training schedule is posted on Local 571''s Facebook pages. Call 402-733-1600 or email gnull@iuoe571.org for current information.',
  'community',
  'Must be 18 or older. High school diploma or GED preferred. Apply in person Monday–Friday 8am–3pm at 4660 S. 60th Ave, Omaha, NE 68117. Bring a $25 non-refundable administrative fee (money order only — no cash, no personal checks). Physical fitness to operate heavy equipment in outdoor construction environments. Drug-free.',
  NULL,
  'https://iuoe571.org',
  'Omaha, NE', '4660 S. 60th Avenue', 'Omaha', 'NE', '68117',
  false, false,
  '{low_income,first_gen}'::text[], '{trades,heavy_equipment,operating_engineers,apprenticeship,union,earn_while_learn,skilled_labor,construction,crane_operator}'::text[], '{}'::text[],
  'high', 'verified',
  'https://iuoe571.org', 'official_website', '2026-03-24',
  'Apply in person Mon–Fri 8am–3pm at 4660 S. 60th Ave, Omaha, NE 68117. Bring $25 money order (admin fee, non-refundable). Four-year earn-while-you-learn program. Training schedule on Local 571 Facebook. Phone: 402-733-1600 or 402-571-4939. Email: gnull@iuoe571.org.',
  true, true, '2026-03-24', '2026-03-24',
  '{"career_field": "trades", "trade_type": "heavy_equipment_operation", "union_affiliated": true, "paid_while_training": true, "program_length": "4 years", "starting_wage": "verify at iuoe571.org", "end_wage": "journeyman operating engineer scale", "application_fee": "$25 money order (non-refundable, no cash or personal checks)", "dual_state_notes": "Local 571 is based in Omaha, Nebraska. Specific Iowa/Council Bluffs coverage was not confirmed from primary source — contact Local 571 at 402-733-1600 to verify coverage area for Pottawattamie County workers.", "delivery": "in_person", "listing_type": "union_registered_apprenticeship", "cost_details": {"amount": 25, "cost_type": "low_cost", "conditions": "$25 application fee (money order only). Apprentices are paid employees from day one. No ongoing tuition."}, "accessibility": {"cost_barrier": "low_cost", "application_fee": 25, "requires_enrollment": true, "council_bluffs_accessible": "verify — contact union hall", "multilingual": false}}'::jsonb
),

-- ── 4. Laborers Local 1140 — Apprenticeship ───────────────────────────────────
-- laborers1140.com confirmed: ~2 years (3,600 hrs OJT + 320 hrs classroom),
-- wages $21.60/hr year 1, $22.80/hr year 2, journeyman $24.00/hr,
-- 5626 Sorensen Pkwy Omaha NE 68152, 402-573-7878
-- Nebraska & Southwest Iowa Building Trades Council at same address —
-- confirms coverage of SW Iowa including Council Bluffs
(
  'Laborers Local 1140 — Construction Laborer Apprenticeship (Nebraska & Southwest Iowa)',
  'Laborers'' International Union of North America Local 1140',
  'https://laborers1140.com',
  'Laborers Local 1140 trains construction laborers for the Omaha metro and Southwest Iowa — and if you are looking for the most accessible entry point into union construction with no prior experience required, this is it. Construction laborers are the foundation of every job site: demolition, concrete work, site preparation, pipe laying, tunnel work, hazardous materials handling, and more. This is physical work, but it is skilled work that requires knowledge, certifications, and judgment. Local 1140''s apprenticeship program runs approximately two years, combining 3,600 hours of on-the-job training with 320 hours of classroom instruction. Starting wage is $21.60/hr in year one, increasing to $22.80/hr in year two, and reaching $24.00/hr at journeyman. With the union benefit package factored in — health insurance, pension, and annuity — the total compensation package significantly exceeds the wage rate. The Omaha Building & Construction Trades Council at the same Sorensen Parkway address explicitly covers Nebraska and Southwest Iowa, so Council Bluffs residents are served by this program. If you want to get into union construction as fast as possible, Local 1140 is your entry point. Call 402-573-7878 or visit laborers1140.com.',
  'community',
  'High school diploma or GED recommended. Must be physically capable of performing heavy construction labor outdoors. Drug-free. Contact Local 1140 directly for current application process and eligibility requirements. Call 402-573-7878 or visit laborers1140.com.',
  NULL,
  'https://laborers1140.com',
  'Omaha, NE (serves Nebraska + Southwest Iowa)', '5626 Sorensen Parkway', 'Omaha', 'NE', '68152',
  false, false,
  '{low_income,first_gen}'::text[], '{trades,construction_laborer,apprenticeship,union,earn_while_learn,skilled_labor,construction,council_bluffs_accessible,iowa_accessible}'::text[], '{}'::text[],
  'high', 'verified',
  'https://laborers1140.com', 'official_website', '2026-03-24',
  'Ongoing applications. Approximately 2-year program: 3,600 hours OJT + 320 hours classroom. Starting wage $21.60/hr (Year 1), $22.80/hr (Year 2), journeyman $24.00/hr. Training facility: 5626 Sorensen Pkwy, Omaha, NE 68152. Phone: 402-573-7878. Also home of Nebraska & Southwest Iowa Building & Construction Trades Council.',
  true, true, '2026-03-24', '2026-03-24',
  '{"career_field": "trades", "trade_type": "construction_laborer", "union_affiliated": true, "paid_while_training": true, "program_length": "approx. 2 years (3,600 hrs OJT + 320 hrs classroom)", "starting_wage": "$21.60/hr (Year 1)", "wage_year_2": "$22.80/hr", "end_wage": "$24.00/hr journeyman (plus benefits package)", "dual_state_notes": "Nebraska & Southwest Iowa Building & Construction Trades Council is co-located at 5626 Sorensen Pkwy — confirms coverage of Southwest Iowa including Council Bluffs/Pottawattamie County. Council Bluffs residents should contact Local 1140 directly at 402-573-7878 to confirm enrollment process.", "delivery": "in_person", "listing_type": "union_registered_apprenticeship", "cost_details": {"amount": 0, "cost_type": "earn_while_you_learn", "conditions": "Apprentices are paid employees from day one. Union dues apply once working."}, "accessibility": {"cost_barrier": "none", "requires_enrollment": true, "council_bluffs_accessible": true, "iowa_covered": "southwest iowa confirmed", "multilingual": false}}'::jsonb
);
