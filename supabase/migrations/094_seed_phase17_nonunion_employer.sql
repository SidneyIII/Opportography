-- ============================================================
-- Opportography — Migration 094
-- Phase 17F: Trades, Vocational & Apprenticeship Pathways
--             Non-Union & Employer-Sponsored Programs
-- Date: 2026-03-24
--
-- 2 verified entries:
--   1. ABC Nebraska South Dakota — NCCER Craft Training (11 trades, Omaha center)
--   2. Werner Enterprises CDL Training — Student Driver / Tuition Reimbursement Program
--
-- Sources:
--   - abcnesd.org (ABC Nebraska primary source)
--   - werner.com/cdl-training/ (Werner Enterprises CDL program)
--   Both verified 2026-03-24
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

-- ── 1. ABC Nebraska South Dakota — NCCER Craft Training ──────────────────────
-- abcnesd.org confirmed: 10640 Burt Circle Omaha NE 68114, 402-344-4258,
-- 11 trades (Carpentry, Drywall, Electrical, HVAC, Electronic Systems,
-- Heavy Equipment Operator, Masonry, Pipefitting, Plumbing, Sheet Metal, Welding),
-- NCCER credentials, 144 hrs classroom/year, earn-while-learn,
-- applicants enter ranked pool and are hired by ABC member companies
(
  'ABC Nebraska — NCCER Craft Apprenticeship Training (11 Trades, Non-Union, Omaha Training Center)',
  'Associated Builders and Contractors, Nebraska South Dakota Chapter',
  'https://www.abcnesd.org',
  'Associated Builders and Contractors (ABC) is the national association for merit-shop (non-union) construction employers. ABC Nebraska South Dakota runs a full apprenticeship and craft training program through its Omaha Training Center using NCCER (National Center for Construction Education and Research) curriculum — the most widely recognized construction training standard in the country. If you are interested in a construction career but prefer to enter the non-union pathway, ABC Nebraska is your primary resource. Eleven trades are available through the ABC Nebraska training program: Carpentry, Drywall, Electrical, HVAC, Electronic Systems Technology, Heavy Equipment Operator, Masonry, Pipefitting, Plumbing, Sheet Metal, and Welding. That breadth of options in one program is nearly unique in this metro. The NCCER National Training Registry credential is recognized across the United States — if you build skills through ABC Nebraska in Omaha, those credentials are portable if you ever move. The program delivers 144 hours of classroom instruction per year (the NCCER Related Technical Instruction requirement). Apprentices work full-time for ABC member companies while attending classroom training — earn-while-you-learn, same model as union apprenticeships. The application process scores applicants on education, work history, and demonstrated construction training, and qualified applicants enter a ranked pool from which ABC member companies hire. Note: being added to the pool does not guarantee employment — companies hire from the pool directly. If your initial application is not competitive, ABC offers free re-evaluation pathways through completing OSHA courses, their Construction Academy, and First Aid/CPR. The Omaha Training Center is at 10640 Burt Circle, Omaha, NE 68114. Call 402-344-4258 or email training@abcnesd.org.',
  'community',
  'Score-based application: education history, work history, and demonstrated construction training are evaluated. Applicants enter a ranked pool; ABC member companies hire from that pool. If not selected initially, re-evaluation available by completing OSHA courses, Construction Academy, and First Aid/CPR (no additional charge). Contact ABC Nebraska at 402-344-4258 or training@abcnesd.org. Omaha Training Center: 10640 Burt Circle, Omaha, NE 68114.',
  NULL,
  'https://www.abcnesd.org',
  'Omaha, NE', '10640 Burt Circle', 'Omaha', 'NE', '68114',
  false, false,
  '{low_income,first_gen}'::text[], '{trades,apprenticeship,non_union,NCCER,electrical,plumbing,hvac,welding,carpentry,masonry,sheet_metal,heavy_equipment,earn_while_learn,construction,skilled_labor}'::text[], '{}'::text[],
  'high', 'verified',
  'https://www.abcnesd.org', 'official_website', '2026-03-24',
  'Ongoing applications. 11 trades: Carpentry, Drywall, Electrical, HVAC, Electronic Systems, Heavy Equipment, Masonry, Pipefitting, Plumbing, Sheet Metal, Welding. 144 hrs classroom/year. NCCER credentials. Applicants enter ranked pool; hired by ABC member companies. Re-evaluation pathway available. Omaha Training Center: 10640 Burt Circle, 402-344-4258, training@abcnesd.org. Lincoln center also at 830 Westgate Blvd, Lincoln NE 68528.',
  true, true, '2026-03-24', '2026-03-24',
  '{"career_field": "trades", "trade_type": "multiple_construction_trades", "union_affiliated": false, "paid_while_training": true, "program_type": "non_union_craft_apprenticeship", "credentials_earned": ["NCCER National Training Registry credentials (11 trades available)"], "trades_available": ["Carpentry", "Drywall", "Electrical", "HVAC", "Electronic Systems Technology", "Heavy Equipment Operator", "Masonry", "Pipefitting", "Plumbing", "Sheet Metal", "Welding"], "classroom_hours_per_year": 144, "program_length": "verify with ABC — typically 4-year NCCER apprenticeship", "selection_process": "Scored application (education + work history + construction training) -> ranked pool -> companies hire from pool", "re_evaluation_pathway": "OSHA courses + Construction Academy + First Aid/CPR (no additional cost)", "dual_state_notes": "ABC NE SD covers Nebraska and South Dakota. Council Bluffs/Iowa residents can use the Omaha Training Center but should note they would need Iowa-specific licensing for some trades (electrical, plumbing, HVAC) if working on Iowa job sites.", "delivery": "in_person", "listing_type": "non_union_apprenticeship", "cost_details": {"amount": 0, "cost_type": "earn_while_you_learn", "conditions": "Apprentices are paid employees of ABC member companies. No tuition for classroom instruction."}, "training_centers": [{"location": "Omaha", "address": "10640 Burt Circle, Omaha NE 68114", "phone": "402-344-4258"}, {"location": "Lincoln", "address": "830 Westgate Blvd, Lincoln NE 68528", "phone": "402-477-4451"}]}'::jsonb
),

-- ── 2. Werner Enterprises CDL Training — Student Driver Program ──────────────
-- werner.com confirmed: Werner partners with ~800 approved CDL schools;
-- students attend partner school (160+ hrs), then Werner paid orientation
-- (Dallas or Omaha HQ: 14507 Frontier Rd, Omaha NE 68138),
-- $650+/week during training, tuition reimbursement up to $15,000 at $250/month,
-- first-year earnings $45,000+
(
  'Werner Enterprises CDL Training — Student Driver Program (Paid Training + Tuition Reimbursement, Omaha HQ)',
  'Werner Enterprises',
  'https://www.werner.com/cdl-training/',
  'Werner Enterprises is one of the largest trucking companies in the United States, and they are headquartered right here in Omaha. They run one of the most structured CDL training-to-employment pipelines in the industry, and it is worth knowing about whether you want to drive long-haul or just want the CDL. Here is how it works: You first attend an approved CDL-A school (Werner partners with about 800 schools across the country, including options near Omaha) to earn your CDL-A license — the school portion requires at least 160 hours of classroom and range training. After you graduate, you enroll in Werner''s paid orientation and over-the-road (OTR) training program, which is based out of either their Omaha, Nebraska headquarters at 14507 Frontier Road or their Dallas, Texas facility. During this OTR training period, Werner pays you at least $650/week. After you are fully onboarded and running loads, Werner reimburses up to $15,000 of your CDL school tuition — paid out at $250/month while you are employed at Werner. First-year earning potential for Werner drivers is $45,000 or more. The trade-off: CDL school is not free upfront (Werner pays you back over time), and you are expected to stay with Werner for a period of time to receive the full reimbursement. This is a genuine earn-while-you-train pathway to a commercial driving career anchored by one of the most stable employers in the Omaha metro. Apply at werner.com/cdl-training or call 402-382-9557.',
  'community',
  'Must obtain CDL-A license from an approved CDL school (Werner partners with ~800 schools). Must complete Werner orientation in Omaha or Dallas. Must be 18+ for in-state driving; 21+ for interstate commerce. DOT physical and drug screen required for CDL. Call Werner at 402-382-9557 or apply at werner.com/cdl-training.',
  NULL,
  'https://www.werner.com/cdl-training/',
  'Omaha, NE (Werner HQ for orientation)', '14507 Frontier Road', 'Omaha', 'NE', '68138',
  false, false,
  '{low_income,first_gen}'::text[], '{trades,CDL,truck_driving,commercial_driver,transportation,earn_while_learn,tuition_reimbursement,logistics,werner,omaha_employer,skilled_labor}'::text[], '{post_secondary,adult}'::text[],
  'high', 'verified',
  'https://www.werner.com/cdl-training/', 'official_website', '2026-03-24',
  'Ongoing applications year-round. Step 1: Attend approved CDL-A school (160+ hrs). Step 2: Werner paid orientation and OTR training in Omaha or Dallas ($650+/week paid). Step 3: Drive for Werner; receive tuition reimbursement up to $15,000 at $250/month. First-year earnings $45,000+. Call 402-382-9557 or apply at werner.com/cdl-training.',
  true, true, '2026-03-24', '2026-03-24',
  '{"career_field": "trades", "trade_type": "cdl_commercial_driving", "union_affiliated": false, "paid_while_training": true, "program_type": "employer_sponsored_cdl_pipeline", "credentials_earned": ["CDL-A Commercial Driver''s License"], "program_structure": ["Attend approved CDL school (160+ hrs, separate cost)", "Werner paid orientation/OTR training ($650+/week)", "Full-time driving employment", "Tuition reimbursement $250/month up to $15,000"], "tuition_reimbursement": {"amount": 15000, "monthly": 250, "requires_employment_duration": true}, "training_wage": "$650+/week during OTR training", "first_year_earnings": "$45,000+", "omaha_orientation": "14507 Frontier Rd, Omaha NE 68138", "cdl_school_note": "Werner does NOT operate its own CDL school. Attend any of ~800 approved partner schools to earn CDL-A first. Werner then reimburses tuition.", "dual_state_notes": "Werner is a national carrier. CDL-A licensing requirements are federally uniform (FMCSA). Iowa and Nebraska residents go through the same Werner program. Iowa residents must obtain CDL through Iowa DOT; Nebraska residents through Nebraska DMV.", "delivery": "in_person", "listing_type": "employer_sponsored_program", "cost_details": {"cost_type": "paid_reimbursement", "upfront_cost": "CDL school tuition (reimbursed up to $15,000 over employment period)", "training_pay": "$650+/week during OTR training period"}}'::jsonb
);
