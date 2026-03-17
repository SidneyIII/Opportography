-- ============================================================
-- Opportography — Migration 045
-- Phase 7H: Cross-Institutional State Programs
-- Date: 2026-03-16
--
-- This file covers financial aid programs that apply across multiple
-- institutions on the Phase 7 list. These are state-level and
-- multi-institution awards that help students understand the
-- broader funding landscape beyond individual school scholarships.
--
-- NOTE ON DUPLICATES:
-- Nebraska Promise was seeded individually at UNO (migration 039)
-- and at MCC (migration 040). This file adds the NU SYSTEM overview entry
-- that surfaces Nebraska Promise as a cross-school program.
-- Iowa state aid programs (FAFSA + IFAA, Iowa Last-Dollar, AIOS, Iowa Tuition Grant)
-- were seeded in migrations 021 and 023 and are NOT duplicated here.
--
-- Entries in this file:
--   1. Nebraska Promise — System Overview (NU system-wide)
--   2. Susan Thompson Buffett Foundation Scholarship (NE residents, NU system)
--   3. Nebraska Career Scholarship (high-demand fields, NE residents)
--   4. EducationQuest — Free College Planning Help for Nebraska Students
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

-- ── 1. Nebraska Promise — NU System Overview ─────────────────────────────────
-- Cross-school overview entry. Individual school entries exist at UNO (039) and MCC (040).
-- This overview helps Omaha students understand the program applies across NU schools.
-- CB students are NOT eligible (Iowa residents).
(
  'Nebraska Promise — Full Tuition at Any NU System School (Nebraska Residents, AGI ≤$60k)',
  'University of Nebraska System / Nebraska Department of Education',
  'https://www.nebraska.edu',
  'Nebraska Promise is the University of Nebraska system''s commitment to making college free for Nebraska families earning $60,000 or less per year in Adjusted Gross Income. If you are a Nebraska resident with a household AGI at or below $60,000, Nebraska Promise covers 100% of your tuition at any NU system institution: UNO (Omaha), UNL (Lincoln), UNK (Kearney), and UNMC (Medical Center), as well as participating state community colleges including Metropolitan Community College (MCC). File your FAFSA by April 1 — that is the only application required. Nebraska Promise is applied automatically based on your FAFSA data and NU system enrollment. Combined with the Pell Grant and other federal aid, many students eligible for Nebraska Promise pay little to nothing for their entire undergraduate education. For Omaha families earning under $60,000: check your eligibility now at nebraska.edu and file your FAFSA at studentaid.gov immediately. COUNCIL BLUFFS STUDENTS: Nebraska Promise requires Nebraska residency. Council Bluffs is in Iowa — CB students are NOT eligible for Nebraska Promise. CB students with income ≤$60,000 should instead explore: Iowa Last-Dollar Scholarship (IWCC, Iowa CCs — seeded in migration 023), All Iowa Opportunity Scholarship (AIOS — seeded in migration 021), and Iowa Grant programs through educate.iowa.gov.',
  'scholarship',
  'Nebraska RESIDENT required — Iowa residents NOT eligible. Household Adjusted Gross Income (AGI) of $60,000 or less as shown on FAFSA. Must enroll at a qualifying NU system institution (UNO, UNL, UNK, UNMC) or participating Nebraska community college (including MCC). File FAFSA by April 1 annually. No separate Nebraska Promise application — FAFSA triggers consideration. Must maintain satisfactory academic progress. Renewable annually with FAFSA filing and continued enrollment.',
  '2026-04-01',
  'https://www.nebraska.edu/nebraska-promise/',
  'Omaha, NE (NU System — Statewide)',
  null, 'Omaha', 'NE', null,
  true, false,
  array['low_income', 'first_gen'],
  array['scholarship', 'college_access'],
  array['high_school_senior', 'adult_learner'],
  'scholarship_amount', 9000, 'annual',
  'medium', 'needs_confirmation',
  'https://www.nebraska.edu/nebraska-promise/', 'official_website', '2026-03-16',
  true, true,
  'File FAFSA by April 1. Nebraska residency required. No separate application. Verify income threshold, participating institutions, and current tuition amounts at nebraska.edu/nebraska-promise/. Contact UNO Financial Aid at (402) 554-2327 or MCC Financial Aid at (402) 457-2400 for campus-specific details.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["low-income Nebraska residents", "first-generation Nebraska college students", "Omaha metro families earning under $60k"], "mission_notes": "Nebraska Promise represents a state-level commitment to removing tuition barriers for low-income Nebraska families. For an Omaha family earning $55,000 with a high school graduate, the NU system of universities and community colleges become effectively free for tuition — a life-changing financial opportunity that most eligible families don''t know about until it''s too late to apply."}'::jsonb,
  '{"eligible": false, "basis": "explicit", "notes": "Nebraska Promise requires Nebraska RESIDENCY. Council Bluffs students are Iowa residents and are NOT eligible. Iowa equivalent programs: Iowa Last-Dollar Scholarship (for Iowa CCs in high-demand fields), All Iowa Opportunity Scholarship (foster youth), Iowa Grant (FAFSA-based need at Iowa public schools). See migrations 021 and 023 for Iowa state aid programs. CB students with income ≤$60k should file FAFSA and Iowa IFAA at educate.iowa.gov by April 1.", "source": "https://www.nebraska.edu/nebraska-promise/"}'::jsonb,
  '{"institution_abbr": "NU System", "institution_type": "public_4year", "scholarship_type": "need-based", "application_method": "automatic_upon_admission", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "verify at nebraska.edu/nebraska-promise", "notes": "Annual FAFSA filing required; income eligibility recertified annually; academic progress required"}, "stackable": {"stacks_with_other_merit": true, "stacks_with_need_based": false, "notes": "Nebraska Promise stacks with NU system merit scholarships (UNO Presidential Scholars, etc.) and federal Pell Grant. Combined with merit and federal aid, net cost may be near zero for qualifying students."}}'::jsonb
),

-- ── 2. Susan Thompson Buffett Foundation Scholarship ─────────────────────────
-- Major need-based award for NE residents at NU system schools.
-- Highly competitive. One of the most significant NE scholarships in existence.
-- CB students NOT eligible (Iowa residents).
(
  'Susan Thompson Buffett Foundation Scholarship — Nebraska Residents, NU System',
  'Susan Thompson Buffett Foundation',
  'https://www.buffettscholarships.org',
  'The Susan Thompson Buffett Foundation Scholarship is one of the most significant private scholarship programs available to Nebraska residents — providing substantial financial support to students attending University of Nebraska system institutions (UNO, UNL, UNK, UNMC). The scholarship is need-based and highly competitive, designed to make NU system schools accessible to Nebraska students who face the greatest financial barriers. Award amounts are significant — verify the current award amount at buffettscholarships.org. This is a named scholarship administered in partnership with the NU system schools; application process and deadlines are coordinated through each campus''s financial aid office. If you are a Nebraska resident with significant financial need attending or planning to attend UNO or another NU system school, this scholarship is worth applying for through your campus financial aid office. COUNCIL BLUFFS STUDENTS: This scholarship requires Nebraska residency. As Iowa residents, CB students are NOT eligible for the Susan Thompson Buffett Foundation Scholarship. CB students at UNO (who pay in-state tuition through reciprocity) should contact UNO Financial Aid at (402) 554-2327 to explore what need-based institutional aid is available to reciprocity-zone students.',
  'scholarship',
  'Nebraska RESIDENT required — Iowa residents NOT eligible. Demonstrated significant financial need as shown by FAFSA. Must attend a qualifying University of Nebraska system institution (UNO, UNL, UNK, UNMC). Application coordinated through campus financial aid office — contact UNO Financial Aid at (402) 554-2327 or other NU campus financial aid for current application process and deadlines. Verify eligibility criteria and current award amount at buffettscholarships.org or through NU campus financial aid.',
  null,
  'https://www.buffettscholarships.org',
  'Omaha, NE (NU System — Statewide)',
  null, 'Omaha', 'NE', null,
  true, false,
  array['low_income', 'first_gen'],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship_amount', null, 'annual',
  'medium', 'needs_confirmation',
  'https://www.buffettscholarships.org', 'official_website', '2026-03-16',
  true, false,
  'Nebraska residency required. Contact campus financial aid office for application process and deadlines. Verify current award amount and eligibility at buffettscholarships.org or through NU campus financial aid.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["low-income Nebraska residents", "first-generation Nebraska college students", "students from financially challenged backgrounds"], "mission_notes": "The Buffett Foundation scholarship reflects a generational commitment by Warren Buffett''s family to making higher education accessible to Nebraska students. The scholarship specifically targets students who demonstrate that they would not otherwise be able to attend without significant financial help."}'::jsonb,
  '{"eligible": false, "basis": "explicit", "notes": "Nebraska residency required. CB students (Iowa residents) are NOT eligible even when attending UNO under Pottawattamie County tuition reciprocity. CB students with significant financial need at UNO should contact UNO Financial Aid at (402) 554-2327 to explore available need-based institutional aid options for reciprocity-zone students.", "source": "https://www.buffettscholarships.org"}'::jsonb,
  '{"institution_abbr": "NU System", "institution_type": "public_4year", "scholarship_type": "need-based", "application_method": "separate_application_required", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "verify at buffettscholarships.org", "notes": "Annual FAFSA filing required; continued enrollment and academic progress required"}, "stackable": {"stacks_with_other_merit": true, "stacks_with_need_based": false, "notes": "Verify stacking policy with campus financial aid and the Buffett Foundation."}}'::jsonb
),

-- ── 3. Nebraska Career Scholarship ────────────────────────────────────────────
-- Nebraska state scholarship for NE residents in high-demand career fields.
-- Up to $10,000/year at NU system and state college institutions.
-- CB students NOT eligible (Iowa residents).
(
  'Nebraska Career Scholarship — High-Demand Fields (Nebraska Residents, Up to $10,000/Year)',
  'Nebraska Department of Economic Development / Nebraska Legislature',
  'https://opportunity.nebraska.gov',
  'The Nebraska Career Scholarship is a state-funded scholarship for Nebraska residents pursuing degrees or credentials in high-demand career fields at qualifying Nebraska institutions. Awards can be up to $10,000 per year at NU system schools and Nebraska state colleges, making it one of the highest-value state scholarship programs in Nebraska. High-demand fields typically include healthcare, technology, skilled trades, engineering, and other workforce-priority areas. If you are a Nebraska resident from Omaha planning to attend UNO, UNL, or another qualifying Nebraska institution in a high-demand field, this scholarship represents a significant additional funding opportunity on top of federal aid and institution-specific merit awards. Contact the Nebraska Department of Economic Development or your institution''s financial aid office for current eligible fields, application process, and deadlines. COUNCIL BLUFFS STUDENTS: Nebraska Career Scholarship requires Nebraska residency. CB students (Iowa residents) are NOT eligible. Iowa equivalents: Iowa Last-Dollar Scholarship (for Iowa CCs in high-demand programs — seeded in migration 023) and Future Ready Iowa apprenticeship programs.',
  'scholarship',
  'Nebraska RESIDENT required — Iowa residents NOT eligible. Must be pursuing a degree or credential in a qualifying high-demand career field (verify current eligible fields at opportunity.nebraska.gov or with your institution''s financial aid office). Must attend a qualifying Nebraska institution (NU system schools, Nebraska state colleges — verify eligible institutions). Contact institution financial aid office for current application process and deadlines. FAFSA may be required depending on program terms.',
  null,
  'https://opportunity.nebraska.gov',
  'Omaha, NE (Nebraska Statewide)',
  null, 'Omaha', 'NE', null,
  true, false,
  array['low_income', 'first_gen'],
  array['scholarship', 'college_access'],
  array['high_school_senior', 'adult_learner'],
  'scholarship_amount', 10000, 'annual',
  'medium', 'needs_confirmation',
  'https://opportunity.nebraska.gov', 'official_website', '2026-03-16',
  true, false,
  'Nebraska residency required. Verify current eligible fields, qualifying institutions, award amounts, and application process at opportunity.nebraska.gov or with your institution''s financial aid office.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["Nebraska residents in high-demand career fields", "workforce-ready students", "career-changers seeking new credentials"], "mission_notes": "Nebraska''s Career Scholarship is a workforce development tool that directly connects financial aid to Nebraska''s most critical labor shortages. For Omaha students entering healthcare, technology, or trades programs, this scholarship can dramatically reduce the net cost of education while addressing the metro''s workforce needs."}'::jsonb,
  '{"eligible": false, "basis": "explicit", "notes": "Nebraska residency required. CB students (Iowa residents) are NOT eligible for the Nebraska Career Scholarship. Iowa equivalent: Iowa Last-Dollar Scholarship covers community college career programs in Iowa high-demand fields (IWCC eligible) — seeded in migration 023. Iowa State and other Iowa schools may have workforce scholarship programs as well — contact those institutions directly.", "source": "https://opportunity.nebraska.gov"}'::jsonb,
  '{"institution_abbr": "NU System", "institution_type": "public_4year", "scholarship_type": "merit-and-need", "application_method": "separate_application_required", "renewable": {"is_renewable": true, "max_years": 4, "renewal_gpa": "verify at opportunity.nebraska.gov", "notes": "Continued enrollment in qualifying field and academic progress required; verify renewal terms"}, "stackable": {"stacks_with_other_merit": true, "stacks_with_need_based": true, "notes": "Verify stacking with institution merit scholarships and Nebraska Promise at opportunity.nebraska.gov."}}'::jsonb
),

-- ── 4. EducationQuest — Free College Planning Help for Nebraska Students ───────
-- Not a scholarship — a resource. Nebraska equivalent of Iowa''s ICAN.
-- Serves Nebraska students and families navigating financial aid.
-- CB students are NOT the primary audience (that''s ICAN — migration 023).
-- Omaha students should know about this resource.
(
  'EducationQuest — Free College Planning and FAFSA Help for Nebraska Students',
  'EducationQuest Foundation',
  'https://www.educationquest.org',
  'EducationQuest is a nonprofit organization providing free college planning services to Nebraska students and families — FAFSA assistance, scholarship searching, college planning workshops, and financial aid advising. If you are an Omaha student navigating the financial aid process and need help, EducationQuest is a free resource specifically for Nebraska residents. Call 1-888-357-6300 or visit educationquest.org to connect with an advisor. EducationQuest has helped hundreds of thousands of Nebraska students file their FAFSA correctly, find scholarships they qualify for, and understand their financial aid award letters. Their scholarship database is Nebraska-focused and surfaces awards that national databases miss. NOTE: EducationQuest''s services are primarily for Nebraska residents. Iowa students (including Council Bluffs students) are served by ICAN (Iowa College Access Network at icansucceed.org — seeded in migration 023). Both are free. Both are valuable. Both Omaha and CB families should know which resource serves their state.',
  'free_resource',
  'Nebraska residents — primarily for high school students, college students, and their families. Free services. No eligibility requirements to use the service. Contact: 1-888-357-6300 or educationquest.org. Offices in Omaha, Lincoln, and Grand Island. COUNCIL BLUFFS STUDENTS: EducationQuest serves Nebraska residents. CB (Iowa) students should contact ICAN instead at icansucceed.org — Iowa''s equivalent free college planning organization (seeded in migration 023).',
  null,
  'https://www.educationquest.org',
  'Omaha, NE (Multiple Locations)',
  '3135 North 93rd Street', 'Omaha', 'NE', '68134',
  false, true,
  array['low_income', 'first_gen'],
  array['college_access'],
  array['high_school_senior', 'adult_learner'],
  null, null, null,
  'high', 'verified',
  'https://www.educationquest.org', 'official_website', '2026-03-16',
  true, false,
  'Ongoing resource — no deadline. FAFSA help most urgent before April 1 Nebraska state aid priority deadline. Call 1-888-357-6300 or visit educationquest.org. Free workshops and advising available year-round.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["first-generation Nebraska college students", "low-income Nebraska families", "Nebraska students navigating financial aid for the first time"], "mission_notes": "EducationQuest was founded on the premise that every Nebraska student deserves access to expert college planning help regardless of income. FAFSA errors and missed deadlines cost Nebraska students millions in aid every year — EducationQuest exists to make sure that does not happen."}'::jsonb,
  '{"eligible": false, "basis": "explicit", "notes": "EducationQuest primarily serves Nebraska residents. Council Bluffs (Iowa) students should contact ICAN (Iowa College Access Network) at icansucceed.org instead — Iowa''s equivalent free college planning service for Iowa residents (seeded in migration 023). However, CB students who are also applying to Nebraska schools (UNO, Creighton, MCC) may find EducationQuest useful for Nebraska-specific scholarship information.", "source": "https://www.educationquest.org"}'::jsonb,
  '{"institution_abbr": "NU System", "institution_type": "public_4year", "scholarship_type": "merit", "application_method": "separate_application_required", "renewable": {"is_renewable": false, "max_years": 1, "renewal_gpa": null, "notes": "Free resource — no scholarship renewal applicable"}, "stackable": {"stacks_with_other_merit": false, "stacks_with_need_based": false, "notes": "N/A — this is a resource organization, not a scholarship award"}}'::jsonb
);
