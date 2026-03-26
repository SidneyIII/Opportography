-- ============================================================
-- Opportography — Migration 097
-- Phase 17I: Trades, Vocational & Apprenticeship Pathways
--             Licensed Trades — Cosmetology & Barbering
-- Date: 2026-03-26
--
-- 2 verified entries:
--   1. Capitol Beauty School — NACCAS Accredited Cosmetology (Omaha)
--   2. Xenon Academy Omaha — NACCAS Accredited Cosmetology (Omaha)
--
-- NOT including:
--   - SOHO Hair Academy: NACCAS accreditation could not be confirmed from
--     primary source — excluded per accuracy policy. Verify at naccas.org
--     before considering for a future migration.
--
-- Sources:
--   - hairschoolomaha.com (Capitol Beauty School primary site)
--   - xenonacademy.net/omaha-nebraska/ (Xenon Academy primary site)
--   Both verified 2026-03-26
--
-- DUAL-STATE NOTE:
--   Nebraska cosmetology license requires 2,100 clock hours (cosmetology)
--   or 1,800 hours (esthetics) per Nebraska Department of Health and Human
--   Services Regulation and Licensure. Iowa requires 2,100 hours for
--   cosmetology. Both Capitol Beauty and Xenon offer 1,800-hour programs
--   designed for Nebraska licensure. Iowa residents completing a Nebraska
--   program may need additional hours or an Iowa endorsement exam to obtain
--   an Iowa cosmetology license — verify with Iowa Board of Cosmetology Arts
--   and Sciences before enrolling.
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

-- ── 1. Capitol Beauty School ──────────────────────────────────────────────────
-- hairschoolomaha.com confirmed: NACCAS accredited, founded 1923,
-- Cosmetology: 1,800 hrs at 35 hrs/week (approx 44 weeks, Mon-Fri 8:30am-4pm),
-- Tuition $20,500 + Kit $1,350 + Deposit $1,000 = ~$22,850 total;
-- 2026 start dates full/waitlisted; 2027 dates: Feb 8, Apr 19, Jun 28, Sep 7, Nov 15;
-- Also offers Esthetics program; 10803 John Galt Blvd Omaha NE, 402-333-3329
(
  'Capitol Beauty School — NACCAS-Accredited Cosmetology Program (Omaha, Founded 1923)',
  'Capitol Beauty School',
  'https://www.hairschoolomaha.com',
  'Cosmetology is a licensed trade. To work as a professional cosmetologist in Nebraska — to cut, color, style, and chemically treat hair in a salon — you need to complete an approved cosmetology program and pass the Nebraska State Board exam. Capitol Beauty School has been training licensed cosmetologists in Omaha since 1923. It is one of the oldest vocational training institutions in the metro and is accredited by NACCAS (National Accrediting Commission of Career Arts and Sciences), the recognized accreditor for cosmetology schools. That accreditation matters: it makes the program eligible for federal financial aid (Pell Grant, student loans), which can significantly reduce your out-of-pocket cost. The Cosmetology program is 1,800 clock hours, delivered at 35 hours per week Monday through Friday, 8:30am to 4pm — completing in approximately 44 weeks (roughly 10–11 months). Program cost is $20,500 in tuition plus a $1,350 kit, for a total of approximately $22,850 (including a $1,000 enrollment deposit). Capitol Beauty also offers an Esthetics (skin care) program as a separate track. As of early 2026, start dates for 2026 are full and waitlisted. 2027 start dates are available: February 8, April 19, June 28, September 7, and November 15. If you are planning ahead for a cosmetology career, book a 2027 date now. Financial aid is available to reduce the cost — contact Capitol Beauty at 402-333-3329 to discuss financial aid options.',
  'community',
  'High school diploma or GED required. Financial aid available (Pell Grant, federal student loans) — NACCAS accreditation makes program federal aid eligible. Tuition: $20,500 + Kit $1,350 + Enrollment deposit $1,000 = ~$22,850 total. 2026 start dates full/waitlisted — 2027 dates available. Contact: 402-333-3329 or hairschoolomaha.com. Nebraska cosmetology license requires completing 1,800-hour approved program + passing Nebraska State Board exam.',
  NULL,
  'https://www.hairschoolomaha.com',
  'Omaha, NE', '10803 John Galt Boulevard', 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen}'::text[], '{trades,cosmetology,licensed_trade,NACCAS_accredited,vocational_training,financial_aid_eligible,Nebraska_Board,salon,esthetics,skilled_trade}'::text[], '{high_school_senior,post_secondary,adult}'::text[],
  'high', 'verified',
  'https://www.hairschoolomaha.com', 'official_website', '2026-03-26',
  '1,800 clock hours at 35 hrs/week, Mon–Fri 8:30am–4pm (~44 weeks). Total cost ~$22,850 (tuition $20,500 + kit $1,350 + deposit $1,000). 2026 dates FULL/WAITLISTED. 2027 starts: Feb 8, Apr 19, Jun 28, Sep 7, Nov 15. Financial aid available. Contact: 402-333-3329 / hairschoolomaha.com. Esthetics program also offered.',
  true, false, '2026-03-26', '2026-03-26',
  '{"career_field": "licensed_trades", "trade_type": "cosmetology", "union_affiliated": false, "paid_while_training": false, "program_type": "vocational_school_licensed_trade", "credentials_earned": ["1,800-hour Nebraska-approved cosmetology program completion", "Eligible for Nebraska State Board of Cosmetology exam", "Nebraska Cosmetology License upon passing exam"], "accreditation": "NACCAS (National Accrediting Commission of Career Arts and Sciences)", "program_hours": 1800, "schedule": "Monday-Friday 8:30am-4pm, 35 hrs/week", "program_length": "approx. 44 weeks (~10-11 months)", "cost_breakdown": {"tuition": 20500, "kit": 1350, "enrollment_deposit": 1000, "total": 22850}, "financial_aid_eligible": true, "financial_aid_note": "NACCAS accreditation = eligible for Pell Grant and federal student loans. Contact school for financial aid package.", "enrollment_status_2026": "Full/waitlisted as of early 2026", "start_dates_2027": ["2027-02-08", "2027-04-19", "2027-06-28", "2027-09-07", "2027-11-15"], "additional_programs": ["Esthetics program also offered"], "dual_state_notes": "This program is designed for Nebraska cosmetology licensure (1,800 hours meets Nebraska requirement). Iowa requires 2,100 hours for cosmetology licensure — Council Bluffs/Iowa residents completing this program may need additional hours or an Iowa endorsement to obtain an Iowa license. Verify with Iowa Board of Cosmetology Arts and Sciences before enrolling.", "delivery": "in_person", "listing_type": "vocational_school_program", "cost_details": {"amount": 22850, "cost_type": "paid_financial_aid_eligible", "conditions": "Financial aid (Pell Grant, federal loans) available to reduce out-of-pocket cost"}}'::jsonb
),

-- ── 2. Xenon Academy Omaha ────────────────────────────────────────────────────
-- xenonacademy.net/omaha-nebraska/ confirmed: NACCAS accredited,
-- Cosmetology: ~14 months, published tuition $18,750 (2024-25);
-- avg net price after aid ~$12,983 (2022 data);
-- enrollment dates: Jan, Mar, Jun, Aug, Oct; 402-718-9853
(
  'Xenon Academy — NACCAS-Accredited Cosmetology Program (Omaha, Multiple Enrollment Dates)',
  'Xenon Academy Omaha',
  'https://www.xenonacademy.net/omaha-nebraska/',
  'Xenon Academy is a NACCAS-accredited cosmetology school with a campus in Omaha, Nebraska. NACCAS accreditation means the program is federally recognized, which enables eligibility for Pell Grants and federal student loans — a significant cost-reduction pathway for lower-income students. Xenon''s Cosmetology program is approximately 14 months long. Tuition is $18,750 (2024–2025 published rate). Federal financial aid data from 2022 shows the average net price after aid at approximately $12,983 — meaning that for students who qualify for financial aid, the real out-of-pocket cost can be substantially lower than the sticker price. Enrollment dates at Xenon Academy Omaha run in January, March, June, August, and October — five enrollment windows per year, which is more flexible than Capitol Beauty School''s fewer annual starts. If you are exploring cosmetology as a licensed trade career in Omaha and want multiple options to compare, Xenon Academy and Capitol Beauty School are the two primary NACCAS-accredited programs in the metro. Cosmetology is a portable license — completing a Nebraska program and passing the Nebraska State Board exam earns you a credential that can transfer to other states through licensure endorsement. Contact Xenon Academy Omaha at 402-718-9853 or xenonacademy.net/omaha-nebraska/ for current tuition, financial aid, and enrollment dates.',
  'community',
  'High school diploma or GED required. Financial aid available (Pell Grant, federal student loans) — NACCAS accredited. Published tuition: $18,750 (2024–25). Average net price after aid: ~$12,983 (2022 data — verify current with school). Enrollment dates: January, March, June, August, October. Contact: 402-718-9853 or xenonacademy.net/omaha-nebraska/. Nebraska cosmetology license requires 1,800-hour approved program + state board exam.',
  NULL,
  'https://www.xenonacademy.net/omaha-nebraska/',
  'Omaha, NE', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen}'::text[], '{trades,cosmetology,licensed_trade,NACCAS_accredited,vocational_training,financial_aid_eligible,Nebraska_Board,salon,skilled_trade,multiple_start_dates}'::text[], '{high_school_senior,post_secondary,adult}'::text[],
  'high', 'verified',
  'https://www.xenonacademy.net/omaha-nebraska/', 'official_website', '2026-03-26',
  'Approx. 14 months. Tuition $18,750 (2024-25). Average net price after aid ~$12,983 (2022). Enrollment dates: January, March, June, August, October. Financial aid eligible (NACCAS accredited). Contact: 402-718-9853 / xenonacademy.net/omaha-nebraska/.',
  true, false, '2026-03-26', '2026-03-26',
  '{"career_field": "licensed_trades", "trade_type": "cosmetology", "union_affiliated": false, "paid_while_training": false, "program_type": "vocational_school_licensed_trade", "credentials_earned": ["Nebraska-approved cosmetology program completion", "Eligible for Nebraska State Board of Cosmetology exam", "Nebraska Cosmetology License upon passing exam"], "accreditation": "NACCAS (National Accrediting Commission of Career Arts and Sciences)", "program_length": "approx. 14 months", "published_tuition": 18750, "avg_net_price_after_aid": 12983, "avg_net_price_year": 2022, "financial_aid_eligible": true, "enrollment_windows": ["January", "March", "June", "August", "October"], "dual_state_notes": "This program is designed for Nebraska cosmetology licensure. Iowa requires 2,100 hours for cosmetology; this Nebraska program (1,800 hours) may require additional steps for Iowa licensure. Council Bluffs/Iowa residents: verify with Iowa Board of Cosmetology Arts and Sciences before enrolling.", "delivery": "in_person", "listing_type": "vocational_school_program", "cost_details": {"amount": 18750, "cost_type": "paid_financial_aid_eligible", "avg_after_aid": 12983, "conditions": "Financial aid (Pell Grant, federal loans) significantly reduces cost for eligible students"}}'::jsonb
);
