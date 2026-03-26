-- ============================================================
-- Opportography — Migration 095
-- Phase 17G: Trades, Vocational & Apprenticeship Pathways
--             OPPD — Utility Apprenticeship Programs
-- Date: 2026-03-24
--
-- 1 verified entry:
--   1. OPPD Apprenticeship Program — 10 registered trades
--      (governed by JATC with IBEW Local 763 and Local 31)
--
-- Source:
--   - oppdthewire.com/what-is-an-apprentice-program-utility-2020/
--   - oppd.com/about/careers/
--   Verified 2026-03-24
--
-- NOTE: OPPD positions are posted when openings arise (not standing open application).
-- Users must check jobsp.oppd.com directly for current openings.
-- This entry documents the program structure; application requires active job posting.
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

-- ── 1. OPPD Apprenticeship Programs ──────────────────────────────────────────
-- oppdthewire.com confirmed: OPPD operates 10 registered apprenticeship trades
-- via JATC partnership with IBEW Local 763 and Local 31;
-- 4-year earn-while-learn programs; avg lineman $102,264/yr;
-- Line Technician is the most visible; most hires are MCC graduates;
-- Apply through jobsp.oppd.com — positions posted when openings arise
(
  'OPPD Apprenticeship Program — 10 Utility Trades (Line Technician, Electrician, Machinist & More)',
  'Omaha Public Power District (OPPD)',
  'https://www.oppd.com/about/careers/',
  'Omaha Public Power District (OPPD) — the public utility that powers the Omaha metro — operates one of the most unique and well-compensated apprenticeship programs in the region. OPPD runs ten registered apprenticeship programs through a Joint Apprenticeship Training Committee (JATC) in partnership with IBEW Local 763 and IBEW Local 31. These are not entry-level jobs. They are four-year earn-while-you-learn registered apprenticeships that lead to highly specialized utility trade credentials and union wages. The ten OPPD apprenticeship trades are: Cable Splicer, Electrician, Instrumentation and Control Technician, Line Technician, Machinist, Meter Technician, Steamfitter Mechanic, Substation Electrician, System Protection Technician, and Transportation Mechanic (a planned eleventh trade — Combustion Turbine Technician — is also in development). The Line Technician apprenticeship is the most visible and most competitive of the ten. Line technicians install, maintain, and repair the transmission and distribution lines that deliver electricity to every home and business in the Omaha metro. It is physically demanding work that requires comfort with heights, working in all weather conditions, and operating specialized equipment. The average journeyman lineman salary at OPPD is $102,264 per year. Most OPPD Line Technician hires come from MCC''s Line Technician program or Northeast Community College (Norfolk, NE) — completing one of those programs before applying significantly improves your competitiveness. OPPD does not maintain a standing open application — positions are posted on their job portal (jobsp.oppd.com) when openings arise. Check the portal regularly, and contact OPPD Talent Acquisition at talentacquisition@oppd.com to express interest.',
  'community',
  'OPPD does not maintain a standing open application. Positions are posted at jobsp.oppd.com when openings are available. For Line Technician: completing MCC''s Line Technician program or an equivalent is strongly preferred. General utility trade requirements: physical fitness, ability to work outdoors in all conditions, pass background and drug screening, valid driver''s license. Check jobsp.oppd.com regularly. Contact: talentacquisition@oppd.com.',
  NULL,
  'https://jobsp.oppd.com',
  'Omaha, NE (OPPD service territory)', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{}'::text[], '{trades,utility,line_technician,electrician,machinist,apprenticeship,union,IBEW,earn_while_learn,skilled_labor,high_wage,OPPD,energy,infrastructure}'::text[], '{post_secondary,adult}'::text[],
  'high', 'verified',
  'https://oppdthewire.com/what-is-an-apprentice-program-utility-2020/', 'official_website', '2026-03-24',
  'No standing open application — positions posted at jobsp.oppd.com when openings arise. 10 registered trades: Cable Splicer, Electrician, Instrumentation & Control, Line Technician, Machinist, Meter Technician, Steamfitter Mechanic, Substation Electrician, System Protection, Transportation Mechanic. 4-year earn-while-learn programs. Avg lineman salary: $102,264/yr. IBEW Local 763 + Local 31. Contact: talentacquisition@oppd.com.',
  true, true, '2026-03-24', '2026-03-24',
  '{"career_field": "trades", "trade_type": "utility_multi_trade", "union_affiliated": true, "paid_while_training": true, "program_type": "employer_union_registered_apprenticeship", "credentials_earned": ["Registered Apprenticeship credential in specific OPPD trade", "IBEW union membership (Local 763 or Local 31)"], "trades_available": ["Cable Splicer", "Electrician", "Instrumentation & Control Technician", "Line Technician", "Machinist", "Meter Technician", "Steamfitter Mechanic", "Substation Electrician", "System Protection Technician", "Transportation Mechanic"], "program_length": "4 years per trade", "average_line_tech_salary": "$102,264/year (journeyman)", "hiring_pipeline_note": "Most OPPD Line Technician hires come from MCC Line Technician program or Northeast Community College (Norfolk, NE). Completing one of these programs before applying is a significant competitive advantage.", "application_note": "Positions posted at jobsp.oppd.com only when openings arise. No standing open application. Check portal regularly.", "dual_state_notes": "OPPD is a Nebraska public utility serving Nebraska service territory. Iowa-side (Council Bluffs) residents are not in OPPD''s service area — MidAmerican Energy serves Council Bluffs. Iowa residents interested in utility apprenticeships should research MidAmerican Energy apprenticeship programs separately.", "delivery": "in_person", "listing_type": "employer_registered_apprenticeship", "cost_details": {"amount": 0, "cost_type": "earn_while_you_learn", "conditions": "Paid employees from day one. Union wages and benefits. No tuition cost."}}'::jsonb
);
