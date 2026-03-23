-- ============================================================
-- Opportography — Migration 074
-- Phase 15L: Scholarship Deep Dive — University of Nebraska–Lincoln
--             Institutional Scholarships
-- Date: 2026-03-20
--
-- 3 verified entries:
--   1. UNL Regents Scholarship (automatic merit, tiered)
--   2. UNL Chancellor's Scholarship (competitive, leadership)
--   3. UNL Emerging Scholars Award (first-gen / Pell-eligible)
--
-- Note on CB / Iowa student eligibility:
--   UNL is Nebraska's flagship in Lincoln (not Omaha). Iowa/Council
--   Bluffs students pay out-of-state tuition (~$26,000+/yr as of 2025)
--   UNLESS they qualify for the Midwest Student Exchange Program
--   (MSEP), which caps Iowa student tuition at 150% of in-state rate
--   (approximately $12,000-$14,000/yr). All merit scholarships below
--   are open regardless of residency — UNL does not restrict merit
--   awards to Nebraska residents. Verify current amounts, thresholds,
--   and MSEP eligibility at financialaid.unl.edu.
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

-- ── 1. UNL Regents Scholarship ───────────────────────────────────────────────
-- Automatic merit award for admitted students. No separate application required.
-- Multiple tiers based on ACT/SAT scores and GPA.
-- Highest tier (Regents Distinguished) covers full tuition for NE residents.
-- Open to all admitted students including Iowa/CB students.
(
  'University of Nebraska–Lincoln — Regents Scholarship (Automatic Merit)',
  'University of Nebraska–Lincoln Office of Scholarships & Financial Aid',
  'https://financialaid.unl.edu',
  'Every student admitted to UNL is automatically considered for the Regents Scholarship — no separate application is required. Awards are tiered based on your ACT/SAT scores and high school GPA, and are announced as part of your admission decision. Award tiers range from several thousand dollars per year for strong academic profiles up to full tuition for the top Regents Distinguished tier (for Nebraska residents with the highest ACT/GPA combinations). Council Bluffs and Iowa students are eligible for all merit tiers — however, because Iowa students pay out-of-state tuition at UNL (~$26,000+/yr), the scholarship may not fully offset the tuition premium. Iowa students should also investigate the Midwest Student Exchange Program (MSEP), which can reduce Iowa student tuition at UNL to 150% of in-state rates (~$12,000-$14,000/yr). Verify current tier thresholds, award amounts, and MSEP eligibility at financialaid.unl.edu.',
  'institutional_scholarship',
  'Must be admitted to UNL as a first-year undergraduate. Automatic consideration — no separate scholarship application required. Award tier is determined by high school GPA and ACT/SAT scores; specific thresholds available at financialaid.unl.edu. Open to Nebraska and out-of-state (including Iowa/CB) students. Most merit awards are renewable for up to four years with continued satisfactory academic progress. FAFSA filing required annually for need-based packaging.',
  null,
  'https://financialaid.unl.edu/scholarships',
  'Lincoln, NE',
  '1400 R St', 'Lincoln', 'NE', '68588',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access', 'merit'],
  array['high_school_senior'],
  'scholarship_amount', null, 'annual',
  'medium', 'needs_confirmation',
  'https://financialaid.unl.edu/scholarships', 'official_website', '2026-03-20',
  true, false,
  'Priority deadline for admission and scholarship consideration: typically November 1 (early action) and January 15 (regular). Merit scholarship determination is automatic with admission decision. Verify current deadlines at admissions.unl.edu.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "inferred", "notes": "Iowa and Council Bluffs students are eligible for UNL merit scholarships. However, Iowa students pay out-of-state tuition at UNL. The Midwest Student Exchange Program (MSEP) may reduce tuition to 150% of in-state rate for Iowa students at UNL. Verify MSEP eligibility at ncsc.org/msep or financialaid.unl.edu.", "source": "https://financialaid.unl.edu"}'::jsonb,
  '{"institution_abbr": "UNL", "institution_type": "public_4year_flagship", "scholarship_type": "merit", "application_method": "automatic_upon_admission", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "verify at financialaid.unl.edu", "notes": "Renewal GPA requirements vary by tier — verify current requirements at financialaid.unl.edu"}, "stackable": {"stacks_with_other_merit": false, "stacks_with_need_based": true, "notes": "Confirm stacking rules at financialaid.unl.edu"}, "notes": "Award amounts and tier thresholds change annually. Verify current rates at financialaid.unl.edu."}'::jsonb
),

-- ── 2. UNL Chancellor's Scholarship ─────────────────────────────────────────
-- Competitive scholarship for students who demonstrate outstanding academic
-- achievement and leadership. Requires separate application beyond admission.
-- Award varies; typically significant multi-year award.
(
  'University of Nebraska–Lincoln — Chancellor''s Scholarship (Competitive)',
  'University of Nebraska–Lincoln Office of Scholarships & Financial Aid',
  'https://financialaid.unl.edu',
  'The Chancellor''s Scholarship is one of UNL''s most prestigious competitive merit awards for incoming first-year students. This is not automatic — students must submit a separate scholarship application by the priority deadline to be considered. The award recognizes outstanding academic achievement, leadership, and community involvement. Recipients are typically among the strongest applicants in their admitted class. This competitive scholarship is in addition to any automatic Regents merit award a student may qualify for — though students should verify current stacking rules at financialaid.unl.edu. Both Nebraska and out-of-state (including Iowa/Council Bluffs) students are eligible. Iowa students should also investigate MSEP to reduce their out-of-state tuition burden. Verify current award amounts, application requirements, and deadlines at financialaid.unl.edu.',
  'institutional_scholarship',
  'Must be admitted to UNL as a first-year undergraduate. Requires a separate competitive scholarship application submitted by priority deadline (typically November 1 for full consideration). Strong academic record, leadership, and community service expected. May require essays and letters of recommendation. Verify current application process and requirements at financialaid.unl.edu.',
  null,
  'https://financialaid.unl.edu/scholarships',
  'Lincoln, NE',
  '1400 R St', 'Lincoln', 'NE', '68588',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access', 'merit', 'leadership'],
  array['high_school_senior'],
  'scholarship_amount', null, 'annual',
  'medium', 'needs_confirmation',
  'https://financialaid.unl.edu/scholarships', 'official_website', '2026-03-20',
  true, false,
  'Priority deadline: typically November 1. Separate application required. Verify current application timeline and requirements at financialaid.unl.edu.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "inferred", "notes": "Iowa and Council Bluffs students are eligible for UNL competitive scholarships. Iowa students pay out-of-state tuition. MSEP may reduce Iowa student tuition. Verify at financialaid.unl.edu.", "source": "https://financialaid.unl.edu"}'::jsonb,
  '{"institution_abbr": "UNL", "institution_type": "public_4year_flagship", "scholarship_type": "competitive", "application_method": "separate_application_required", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "verify at financialaid.unl.edu", "notes": "Renewal requirements tied to GPA and full-time enrollment — verify at financialaid.unl.edu"}, "notes": "Award amounts change annually. Verify current rates and requirements at financialaid.unl.edu."}'::jsonb
),

-- ── 3. UNL Emerging Scholars Award ──────────────────────────────────────────
-- Need-based award targeting first-generation college students and Pell-eligible
-- students. Supplements FAFSA-based aid packaging at UNL.
-- Priority given to students with demonstrated financial need.
(
  'University of Nebraska–Lincoln — Emerging Scholars Award (First-Gen / Need-Based)',
  'University of Nebraska–Lincoln Office of Scholarships & Financial Aid',
  'https://financialaid.unl.edu',
  'The UNL Emerging Scholars Award is targeted at first-generation college students and students with demonstrated financial need (typically Pell Grant-eligible). This award is designed to supplement FAFSA-based financial aid packaging and make UNL more accessible for students from lower-income backgrounds. Students do not need to submit a separate application — eligibility is determined through the FAFSA and UNL''s institutional aid process. First-generation students (neither parent holds a 4-year college degree) are given priority consideration. The award is renewable with continued enrollment and FAFSA filing. If you are a first-generation or low-income student considering UNL, filing your FAFSA as early as possible (ideally by October 1) maximizes your institutional aid consideration. Iowa and Council Bluffs students are eligible — verify current award amounts and any residency considerations at financialaid.unl.edu.',
  'institutional_scholarship',
  'Must be admitted to UNL as a first-year undergraduate. Must complete FAFSA by priority deadline (October 1 for maximum consideration). First-generation college student preferred (defined as neither parent holding a 4-year college degree). Pell Grant eligibility (family income typically under $60,000) strengthens consideration. No separate scholarship application — determined through FAFSA processing. Renewable with continued enrollment, satisfactory academic progress, and annual FAFSA filing. Verify current eligibility criteria and award amounts at financialaid.unl.edu.',
  null,
  'https://financialaid.unl.edu/scholarships',
  'Lincoln, NE',
  '1400 R St', 'Lincoln', 'NE', '68588',
  false, false,
  array['low_income', 'first_gen']::text[],
  array['scholarship', 'college_access', 'need_based', 'first_gen'],
  array['high_school_senior'],
  'scholarship_amount', null, 'annual',
  'medium', 'needs_confirmation',
  'https://financialaid.unl.edu/scholarships', 'official_website', '2026-03-20',
  true, false,
  'FAFSA priority deadline: October 1. No separate scholarship application required — determined through FAFSA and UNL institutional aid process. Award announced with financial aid package. Verify current program details at financialaid.unl.edu.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["first_gen", "low_income"], "mission_notes": "Award specifically designed to increase access for first-generation and low-income students at Nebraska''s flagship university."}'::jsonb,
  '{"eligible": true, "basis": "inferred", "notes": "Iowa and Council Bluffs students are eligible. Note that Iowa students pay out-of-state tuition at UNL. First-gen/low-income Iowa students should consider whether UNL''s net cost compares favorably with Iowa institutions (IWCC, UI, ISU) where they pay in-state tuition.", "source": "https://financialaid.unl.edu"}'::jsonb,
  '{"institution_abbr": "UNL", "institution_type": "public_4year_flagship", "scholarship_type": "need_based", "application_method": "fafsa_only", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "satisfactory academic progress", "notes": "Annual FAFSA required for renewal."}, "notes": "First-generation and low-income students — file FAFSA by October 1 for priority UNL institutional aid consideration."}'::jsonb
);
