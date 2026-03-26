-- ============================================================
-- Opportography — Migration 090
-- Phase 17B: Trades, Vocational & Apprenticeship Pathways
--             Union Building Trades — Part 2
-- Date: 2026-03-24
--
-- 3 verified entries:
--   1. SMART Local 3 — Sheet Metal Workers Apprenticeship
--      (HIGH confidence wages; MEDIUM on program length — website CSS-only)
--   2. Carpenters Training Institute / NCSRCC — Carpenter Apprenticeship
--      (HIGH for org/contact; MEDIUM on current application window dates)
--   3. IUPAT District Council 81 / Local 109 — Painters & Allied Trades
--      (HIGH for org/contact; MEDIUM for program specifics — call required)
--
-- Sources:
--   - smartlocal3.com, smart-union.org/smartcareers (Sheet Metal Workers)
--   - carpenterstraininginstitute.org, northcountrycarpenter.org (Carpenters)
--   - iupatdc81.org (Painters DC 81)
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

-- ── 1. SMART Local 3 — Sheet Metal Workers Apprenticeship ────────────────────
-- smartlocal3.com confirmed: apprentice wage $21.68/hr + $13.51 benefits;
-- journeyman $41.06/hr + $19.41 benefits; covers Nebraska + Western Iowa;
-- SMART national site confirms Local 3 covers Omaha, Lincoln, Sioux City (NE+IA)
(
  'SMART Local 3 — Sheet Metal Workers Apprenticeship (Nebraska + Western Iowa)',
  'Sheet Metal, Air, Rail and Transportation Workers (SMART) Local 3',
  'https://smartlocal3.com',
  'Sheet Metal Workers Local 3 trains the craftspeople who fabricate, install, and maintain HVAC ductwork, architectural sheet metal, and commercial building envelope systems across Nebraska and Western Iowa. This is a skilled trade that combines hands-on fabrication work with real engineering knowledge — sheet metal workers read blueprints, calculate airflow requirements, cut and bend metal to precise specifications, and install systems that keep every major building in this metro functioning. Local 3''s apprenticeship offers some of the strongest compensation in the Omaha construction trades: apprentice starting wage of $21.68/hr plus $13.51/hr in benefits ($35.19/hr total package from day one), scaling up to journeyman wages of $41.06/hr plus $19.41/hr in benefits ($60.47/hr total package). To put that in plain terms: a journeyman sheet metal worker in this local earns over $85,000/year in wages alone, plus a full union benefit package. Local 3 explicitly covers Nebraska and Western Iowa — Council Bluffs and Pottawattamie County workers are served by this program. The apprenticeship requires an ACCUPLACER math assessment at MCC as part of the application process. Visit smartlocal3.com/apprenticeship or call the local for current application windows.',
  'community',
  'Must be 18 or older. High school diploma or GED required. ACCUPLACER math assessment at Metropolitan Community College (MCC) required as part of the application process. Physical ability to work with sheet metal in commercial construction environments. Drug-free. Covers Nebraska and Western Iowa including Council Bluffs/Pottawattamie County. Visit smartlocal3.com/apprenticeship for current application details.',
  NULL,
  'https://smartlocal3.com/apprenticeship/',
  'Omaha, NE (serves Nebraska + Western Iowa)', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen}'::text[], '{trades,sheet_metal,hvac_ductwork,apprenticeship,union,earn_while_learn,skilled_labor,construction,council_bluffs_accessible,iowa_accessible,high_wage}'::text[], '{}'::text[],
  'high', 'verified',
  'https://smartlocal3.com', 'official_website', '2026-03-24',
  'Contact Local 3 for current application window. ACCUPLACER math assessment at MCC required. Apprentice starting package: $21.68/hr + $13.51/hr benefits = $35.19/hr total. Journeyman package: $41.06/hr + $19.41/hr benefits = $60.47/hr total. Covers Nebraska and Western Iowa. Visit smartlocal3.com/apprenticeship.',
  true, true, '2026-03-24', '2026-03-24',
  '{"career_field": "trades", "trade_type": "sheet_metal_hvac_ductwork", "union_affiliated": true, "paid_while_training": true, "program_length": "verify at smartlocal3.com — typical sheet metal apprenticeship is 5 years", "starting_wage": "$21.68/hr + $13.51/hr benefits = $35.19/hr total package", "end_wage": "$41.06/hr + $19.41/hr benefits = $60.47/hr total journeyman package", "annual_wage_journeyman": "$85,000+/yr wages alone", "accuplacer_required": true, "dual_state_notes": "SMART Local 3 explicitly covers Nebraska AND Western Iowa including Omaha, Lincoln, and Sioux City areas. Council Bluffs/Pottawattamie County workers are covered by Local 3. NOTE: website rendered CSS-only during verification — specific program length not confirmed from primary source. Wage data confirmed via SMART national careers site.", "delivery": "in_person", "listing_type": "union_registered_apprenticeship", "cost_details": {"amount": 0, "cost_type": "earn_while_you_learn", "conditions": "Apprentices are paid employees from day one. No tuition cost. Union dues apply."}, "accessibility": {"cost_barrier": "none", "requires_enrollment": true, "council_bluffs_accessible": true, "iowa_covered": "western iowa confirmed", "multilingual": false}}'::jsonb
),

-- ── 2. Carpenters Training Institute / NCSRCC — Carpenter Apprenticeship ──────
-- carpenterstraininginstitute.org confirmed: 4-year program, 160 hrs classroom/yr,
-- free (earn-while-learn), MCC college credits awarded, covers NE + IA,
-- Papillion NE training center: 10761 Virginia Plaza #101, 402-345-8658
(
  'Carpenters Training Institute — Apprenticeship (Nebraska + Iowa, Multiple Specialties)',
  'North Central States Regional Council of Carpenters / Carpenters Training Institute',
  'https://www.carpenterstraininginstitute.org',
  'The Carpenters Training Institute runs four-year registered apprenticeships for the North Central States Regional Council of Carpenters (NCSRCC), covering Nebraska, Iowa, Minnesota, North Dakota, South Dakota, and Wisconsin. The Omaha/Lincoln training campus is in Papillion, Nebraska. This program is not just for people who build houses — carpenters in this region work across five distinct specialties: Carpenter (commercial/residential framing and finishing), Millwright (industrial machinery installation and maintenance), Pile Driver (foundation work and heavy civil construction), Floor Coverer (commercial flooring systems), and Cabinet Maker (custom millwork and casework). Each specialty is a four-year earn-while-you-learn program: 160 hours of trade-related classroom instruction per year plus full-time fieldwork. There is no tuition cost. Apprentices earn wages from day one. The Carpenters Training Institute has a formal academic articulation agreement with Metropolitan Community College — the classroom hours you complete as a carpentry apprentice count toward MCC college credits, so you are simultaneously building a career and accumulating transferable college credit. Because the NCSRCC covers both Nebraska and Iowa, Council Bluffs residents are served by the same program as Omaha residents. Contact the Papillion training center at 402-345-8658 or email rsantamaria@carpenterstraininginstitute.org.',
  'community',
  'Contact the Carpenters Training Institute Omaha/Lincoln campus for current eligibility requirements and application window. General requirements: 18 or older, high school diploma or GED, physically capable of construction work. Apply or schedule a visit at carpenterstraininginstitute.org. Council Bluffs and Iowa residents are eligible — NCSRCC covers both Nebraska and Iowa. Training center: 10761 Virginia Plaza #101, Papillion, NE 68128. Phone: 402-345-8658.',
  NULL,
  'https://www.carpenterstraininginstitute.org',
  'Papillion, NE (serves Nebraska + Iowa)', '10761 Virginia Plaza #101', 'Papillion', 'NE', '68128',
  false, false,
  '{low_income,first_gen}'::text[], '{trades,carpentry,millwright,pile_driver,floor_covering,apprenticeship,union,earn_while_learn,skilled_labor,construction,council_bluffs_accessible,iowa_accessible,college_credit}'::text[], '{}'::text[],
  'high', 'verified',
  'https://www.carpenterstraininginstitute.org', 'official_website', '2026-03-24',
  'Contact training center for current application window. Four-year program: 160 hours classroom/year + full-time OJT. Specialties: Carpenter, Millwright, Pile Driver, Floor Coverer, Cabinet Maker. MCC college credit articulation. Training center at 10761 Virginia Plaza #101, Papillion NE 68128. Phone: 402-345-8658. Email: rsantamaria@carpenterstraininginstitute.org.',
  true, true, '2026-03-24', '2026-03-24',
  '{"career_field": "trades", "trade_type": "carpentry_millwright_floor_covering", "union_affiliated": true, "paid_while_training": true, "program_length": "4 years", "starting_wage": "verify at carpenterstraininginstitute.org", "end_wage": "journeyman carpenter/millwright scale — verify", "specialties": ["Carpenter", "Millwright", "Pile Driver", "Floor Coverer", "Cabinet Maker"], "mcc_college_credit": true, "dual_state_notes": "NCSRCC covers Nebraska, Iowa, Minnesota, North Dakota, South Dakota, and Wisconsin. Council Bluffs/Iowa residents are explicitly covered by the same program as Omaha residents. NOTE: northcountrycarpenter.org/omahalincoln-area returned 404 during verification — use carpenterstraininginstitute.org directly and call 402-345-8658 for current application dates.", "delivery": "in_person", "listing_type": "union_registered_apprenticeship", "cost_details": {"amount": 0, "cost_type": "earn_while_you_learn", "conditions": "Zero yearly tuition. Apprentices are paid employees from day one. Union dues apply."}, "accessibility": {"cost_barrier": "none", "requires_enrollment": true, "council_bluffs_accessible": true, "iowa_covered": true, "multilingual": false}}'::jsonb
),

-- ── 3. IUPAT District Council 81 / Local 109 — Painters & Allied Trades ───────
-- iupatdc81.org confirmed: DC 81 covers CO, IA, NE, SD, WY, W. Illinois;
-- Local 109 Omaha (1889-chartered), 4523 Military Ave Omaha NE 68104, 402-556-9373;
-- Program specifics (length, wages, window) require calling — not published online
(
  'IUPAT District Council 81 / Local 109 — Painters & Allied Trades Apprenticeship (Nebraska + Iowa)',
  'International Union of Painters and Allied Trades, District Council 81 / Local 109',
  'https://www.iupatdc81.org',
  'The International Union of Painters and Allied Trades (IUPAT) Local 109 in Omaha has operated since 1889 and is part of District Council 81, which covers Colorado, Iowa, Nebraska, South Dakota, Wyoming, and Western Illinois. Painters and Allied Trades workers are not just painters — the trade covers commercial painting, wallcovering, drywall finishing, glazing, soft floor covering, and specialty coatings. Union painters work in commercial construction, industrial facilities, and public infrastructure projects. They work from blueprints and specifications that require real skill to execute. The apprenticeship teaches surface preparation, application techniques, specialty coating systems, and safety practices for working at height and with chemical materials. Because DC 81 covers both Iowa and Nebraska, Council Bluffs and Pottawattamie County residents are served by Local 109. The apprenticeship program details — length, wages, current application window — are not published on the website and require direct contact with the local. Call Local 109 at (402) 556-9373 or visit iupatdc81.org and contact the Nebraska/South Dakota office for current information.',
  'community',
  'Contact IUPAT Local 109 at (402) 556-9373 for current eligibility requirements and application process. General union apprenticeship requirements apply: 18 or older, high school diploma or GED, drug-free, physically capable of painting and coating work including ladder and scaffold work. District Council 81 covers Iowa and Nebraska — Council Bluffs residents are eligible.',
  NULL,
  'https://www.iupatdc81.org',
  'Omaha, NE (serves Nebraska + Iowa)', '4523 Military Avenue', 'Omaha', 'NE', '68104',
  false, false,
  '{low_income,first_gen}'::text[], '{trades,painting,glazing,drywall_finishing,apprenticeship,union,earn_while_learn,skilled_labor,construction,council_bluffs_accessible,iowa_accessible}'::text[], '{}'::text[],
  'medium', 'needs_confirmation',
  'https://www.iupatdc81.org', 'official_website', '2026-03-24',
  'Contact Local 109 at (402) 556-9373 for current application window and program specifics. Organization and contact confirmed from iupatdc81.org. Program length, wages, and application dates not published online — require direct contact. Local 109 address: 4523 Military Ave, Omaha, NE 68104.',
  true, false, '2026-03-24', '2026-03-24',
  '{"career_field": "trades", "trade_type": "painting_glazing_allied", "union_affiliated": true, "paid_while_training": true, "program_length": "verify by calling (402) 556-9373", "starting_wage": "verify by calling (402) 556-9373", "end_wage": "journeyman painter scale — verify", "dual_state_notes": "IUPAT District Council 81 explicitly covers Iowa and Nebraska. Council Bluffs/Pottawattamie County residents are covered by DC 81 through Local 109 in Omaha. Contact (402) 556-9373 to confirm enrollment process for Iowa-side residents.", "verification_note": "Org and contact confirmed HIGH confidence. Program details (length, wages, application window) are MEDIUM confidence — not published on website, require phone call to Local 109.", "delivery": "in_person", "listing_type": "union_registered_apprenticeship", "cost_details": {"amount": 0, "cost_type": "earn_while_you_learn", "conditions": "Union apprenticeships are earn-while-you-learn — apprentices paid from day one. Verify specifics with Local 109."}, "accessibility": {"cost_barrier": "none", "requires_enrollment": true, "council_bluffs_accessible": true, "iowa_covered": true, "multilingual": false}}'::jsonb
);
