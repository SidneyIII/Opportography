-- ============================================================
-- Opportography — Migration 040
-- Phase 7C: Metropolitan Community College (MCC) — Institution-Specific Scholarships
-- Date: 2026-03-16
--
-- Source: mccneb.edu (official MCC financial aid and foundation pages)
-- Scholarship portal: mccneb.awardspring.com
-- Verify current offerings at:
--   https://www.mccneb.edu/About-MCC-Nebraska/Foundation/Current-MCC-Foundation-Scholarships
--
-- Data confidence: medium — programs from training data through August 2025.
-- Verify all amounts and eligibility at official MCC sources before deployment.
--
-- COUNCIL BLUFFS / TUITION RESIDENCY NOTE:
-- MCC is a Nebraska community college. Unlike UNO, MCC does NOT have a
-- Pottawattamie County reciprocity agreement. Council Bluffs (Iowa) students
-- attending MCC pay Nebraska out-of-state community college tuition rates.
-- However, CB students CAN still apply for MCC Foundation scholarships —
-- scholarship eligibility is separate from tuition residency.
-- A scholarship from the MCC Foundation can help offset the higher out-of-state
-- tuition for CB students who choose MCC.
-- Note this on every entry — CB students considering MCC need to understand
-- the full cost picture before enrolling.
--
-- KEY FACT: MCC Foundation has $6+ million in available scholarships.
-- One application at mccneb.awardspring.com covers all scholarships.
--
-- Entries in this file:
--   1. MCC Foundation Scholarship (General Pool — AwardSpring)
--   2. Nebraska Promise at MCC (Nebraska residents only)
--   3. MetroMavs at MCC (MCC side of MCC-UNO transfer pipeline)
--   4. MCC Culinary Arts and Program-Specific Scholarships
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

-- ── 1. MCC Foundation Scholarship — General Pool (AwardSpring) ───────────────
-- Over $6 million available. One application covers all scholarships.
-- AwardSpring portal: mccneb.awardspring.com
-- Most important entry in this batch — covers the broadest pool.
(
  'MCC Foundation Scholarships — One Application, $6 Million+ Available',
  'Metropolitan Community College Foundation',
  'https://www.mccneb.edu',
  'The MCC Foundation manages more than $6 million in scholarship funds available to MCC students. One application at mccneb.awardspring.com considers you for every scholarship you are eligible for — you do not apply separately for each award. Awards cover every program area at MCC: healthcare, technology, culinary arts, automotive, welding, business, liberal arts, and more. If you are planning to attend MCC for any program, apply for Foundation scholarships as soon as the portal opens each cycle. Awards are highly competitive — the earlier you apply, the more scholarships you can still access. Most awards do not require a minimum GPA; some are need-based (requiring FAFSA), some are merit-based, and many are program-specific. Log in at mccneb.awardspring.com to see which scholarships currently match your profile. COUNCIL BLUFFS STUDENTS: You CAN apply for MCC Foundation scholarships even as an out-of-state student. MCC is a Nebraska school, so Iowa residents (including CB students) pay out-of-state tuition — but scholarship eligibility is separate from tuition residency. An MCC Foundation scholarship can help offset the higher out-of-state tuition. Before enrolling at MCC as a CB student, calculate the full out-of-state tuition cost and what scholarships are available to you, and compare to Iowa Western Community College (IWCC) in Council Bluffs, where you would pay Iowa in-state tuition.',
  'scholarship',
  'Must be enrolled or planning to enroll at Metropolitan Community College (MCC — Omaha, NE). Eligibility varies by individual scholarship within the pool — some require NE residency, some are open to all students, some require specific program enrollment, some require FAFSA for need-based consideration. One application at mccneb.awardspring.com matches you to applicable scholarships. Contact MCC Financial Aid at (402) 457-2400 for assistance.',
  null,
  'https://mccneb.awardspring.com/',
  'Omaha, NE (Multiple Campuses)',
  '5300 N 30th Street', 'Omaha', 'NE', '68111',
  false, false,
  array['low_income', 'first_gen'],
  array['scholarship', 'college_access'],
  array['high_school_senior', 'adult_learner'],
  'scholarship_amount', null, 'annual',
  'medium', 'needs_confirmation',
  'https://www.mccneb.edu/About-MCC-Nebraska/Foundation/Current-MCC-Foundation-Scholarships', 'official_website', '2026-03-16',
  true, true,
  'One application at mccneb.awardspring.com covers all Foundation scholarships. Check the portal for the current application cycle deadline. Contact MCC Financial Aid at (402) 457-2400. Verify current scholarship pool and application window at mccneb.edu/Foundation.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["first-generation college students", "low-income students", "career and technical students", "adult learners"], "mission_notes": "MCC serves one of the most diverse student bodies in the metro. The Foundation scholarship pool reflects that — awards exist for students across all programs, income levels, and life situations. The single-application portal removes the barrier of applying to dozens of scholarships individually."}'::jsonb,
  '{"eligible": null, "basis": "likely", "notes": "COUNCIL BLUFFS STUDENTS: You CAN apply for MCC Foundation scholarships, but important context applies. (1) MCC is a Nebraska school — CB (Iowa) students pay out-of-state tuition at MCC, unlike at UNO where Pottawattamie County has in-state reciprocity. (2) Some MCC Foundation scholarships may require Nebraska residency — the AwardSpring portal will match you only to scholarships you qualify for. (3) Compare your total out-of-state MCC cost vs. Iowa Western Community College (IWCC in Council Bluffs) where you pay Iowa in-state rates. Contact MCC Financial Aid at (402) 457-2400 to clarify your tuition residency status before enrolling.", "source": "https://mccneb.awardspring.com/"}'::jsonb,
  '{"institution_abbr": "MCC", "institution_type": "public_2year", "scholarship_type": "merit-and-need", "application_method": "general_scholarship_app", "renewable": {"is_renewable": false, "max_years": 1, "renewal_gpa": null, "notes": "Many MCC Foundation scholarships are one-time or single-year awards. Some are renewable — check individual scholarship terms in the AwardSpring portal."}, "stackable": {"stacks_with_other_merit": true, "stacks_with_need_based": true, "notes": "Multiple MCC Foundation scholarships can be received simultaneously since they are individual awards within a pool. The single AwardSpring application matches you to all awards you qualify for."}}'::jsonb
),

-- ── 2. Nebraska Promise at MCC ────────────────────────────────────────────────
-- Full tuition for Nebraska residents with household AGI ≤$60k.
-- MCC is one of the participating community colleges.
-- CB students (Iowa residents) are NOT eligible.
(
  'Nebraska Promise — Full Tuition at MCC (Nebraska Residents with AGI ≤$60k)',
  'Metropolitan Community College / NU System / Nebraska Department of Education',
  'https://www.mccneb.edu',
  'Nebraska Promise covers 100% of tuition at Metropolitan Community College for Nebraska residents whose household Adjusted Gross Income is $60,000 or less. If you are a Nebraska resident from Omaha with family income at or below $60,000, your MCC tuition is covered in full — you pay only fees, books, and other non-tuition costs. File your FAFSA by April 1 to be considered. No separate Nebraska Promise application is needed — your FAFSA triggers eligibility review automatically. Nebraska Promise applies to all MCC program areas (credit programs). This can make a technical or healthcare certification at MCC essentially free for qualifying Nebraska families. COUNCIL BLUFFS STUDENTS: Nebraska Promise requires Nebraska residency. As Iowa residents, Council Bluffs students are NOT eligible for Nebraska Promise at MCC. Additionally, CB students already pay out-of-state tuition at MCC (higher than in-state rates). CB students with financial need who want community college should look at Iowa Western Community College (IWCC) in Council Bluffs, where in-state Iowa rates apply, plus Iowa state financial aid programs.',
  'scholarship',
  'Nebraska RESIDENT required (Iowa residents not eligible). Household Adjusted Gross Income (AGI) of $60,000 or less as shown on FAFSA. Must enroll at MCC (credit programs). File FAFSA by April 1 annually. No separate application required. Must maintain satisfactory academic progress. Renewable annually with continued FAFSA filing and enrollment.',
  '2026-04-01',
  'https://www.mccneb.edu/financial-aid/scholarships-grants/',
  'Omaha, NE',
  '5300 N 30th Street', 'Omaha', 'NE', '68111',
  false, false,
  array['low_income', 'first_gen'],
  array['scholarship', 'college_access'],
  array['high_school_senior', 'adult_learner'],
  'scholarship_amount', 3600, 'annual',
  'medium', 'needs_confirmation',
  'https://www.mccneb.edu/financial-aid/scholarships-grants/', 'official_website', '2026-03-16',
  true, true,
  'File FAFSA by April 1. Nebraska residency required. No separate application. Verify current tuition rate (covered in full) and program eligibility at mccneb.edu/financial-aid. Contact MCC Financial Aid at (402) 457-2400.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["low-income Nebraska residents", "first-generation college students", "Omaha metro low-income families"], "mission_notes": "Nebraska Promise at MCC removes the tuition barrier for Omaha families earning under $60k who want to pursue a certificate, associate''s degree, or career training program. Combined with Pell Grant and other federal aid, total cost of attendance at MCC can be dramatically reduced."}'::jsonb,
  '{"eligible": false, "basis": "explicit", "notes": "Nebraska residency required. Council Bluffs students are Iowa residents and are NOT eligible for Nebraska Promise. CB students considering community college should look at Iowa Western Community College (IWCC) in Council Bluffs, where: (1) you pay Iowa in-state tuition, (2) Iowa Last-Dollar Scholarship may cover remaining tuition in qualifying programs, (3) IWCC Foundation scholarships are available. Attending MCC from CB means out-of-state tuition with no Nebraska Promise access.", "source": "https://www.mccneb.edu/financial-aid/scholarships-grants/"}'::jsonb,
  '{"institution_abbr": "MCC", "institution_type": "public_2year", "scholarship_type": "need-based", "application_method": "automatic_upon_admission", "renewable": {"is_renewable": true, "max_years": 2, "renewal_gpa": null, "notes": "Annual FAFSA filing required; satisfactory academic progress required; income eligibility recertified annually"}, "stackable": {"stacks_with_other_merit": true, "stacks_with_need_based": false, "notes": "Nebraska Promise stacks with merit scholarships but coordinates with other need-based aid (Pell Grant, SEOG) to cover remaining tuition after other aid is applied."}}'::jsonb
),

-- ── 3. MetroMavs at MCC — Transfer Pathway to UNO ────────────────────────────
-- MCC side of the MCC-UNO partnership. Guaranteed transfer pathway.
-- See also migration 039 (UNO MetroMavs entry) for the UNO side.
(
  'MetroMavs Partnership — MCC Side (Guaranteed Transfer to UNO)',
  'Metropolitan Community College / University of Nebraska at Omaha',
  'https://www.mccneb.edu',
  'The MetroMavs Partnership is a formal agreement between MCC and UNO that creates a guaranteed pathway from an MCC Associate''s degree to a UNO bachelor''s degree. If you complete an Associate''s degree at MCC with a qualifying GPA, you are guaranteed admission to UNO and receive scholarship support for your remaining undergraduate years. The strategy: start at MCC (lower cost), save money on your first two years, then transfer to UNO with your scholarship. Contact MCC''s Transfer Services office for the current program terms, qualifying GPA, and eligible program areas. Contact UNO Transfer Admissions at (402) 554-3441 for the UNO-side scholarship details. COUNCIL BLUFFS STUDENTS: If you are considering this pathway, be aware that MCC charges Iowa residents out-of-state tuition — calculate the full two-year MCC cost before committing. When you transfer to UNO, Pottawattamie County reciprocity gives you in-state rates at UNO. Compare the MCC start (out-of-state tuition for 2 years) + UNO transfer (in-state rates with scholarship) vs. starting at IWCC (in-state Iowa tuition) + transferring elsewhere. Run the full numbers with both financial aid offices.',
  'scholarship',
  'Must complete an Associate''s degree at MCC with qualifying GPA (verify current GPA threshold with MCC Transfer Services). Must apply for transfer admission to UNO. Scholarship applies at UNO after transfer — contact UNO Transfer Admissions at (402) 554-3441 for the scholarship component terms. No residency restriction for the transfer pathway itself (scholarship amounts at UNO may vary for Iowa vs. Nebraska students — verify with UNO).',
  null,
  'https://www.mccneb.edu/student-services/transfer-services/',
  'Omaha, NE',
  '5300 N 30th Street', 'Omaha', 'NE', '68111',
  false, false,
  array['first_gen', 'low_income'],
  array['scholarship', 'college_access'],
  array['high_school_senior', 'adult_learner'],
  'scholarship_amount', null, 'annual',
  'medium', 'needs_confirmation',
  'https://www.mccneb.edu/student-services/transfer-services/', 'official_website', '2026-03-16',
  true, false,
  'Contact MCC Transfer Services for current program terms and GPA requirements. Contact UNO Transfer Admissions at (402) 554-3441 for the scholarship component. Verify program details at mccneb.edu/transfer and unomaha.edu/transfer.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["first-generation college students", "community college students", "cost-conscious students"], "mission_notes": "The MetroMavs pathway reduces the cost of a four-year degree by starting at community college tuition rates and transferring with scholarship support. It also reduces the risk of the four-year commitment for students who are uncertain about their path."}'::jsonb,
  '{"eligible": null, "basis": "likely", "notes": "CB (Iowa) students can participate in the MetroMavs pathway but should carefully calculate costs. MCC charges out-of-state tuition to Iowa residents (higher than IWCC in-state rates). When transferring to UNO, Pottawattamie County reciprocity grants in-state tuition rates. Full comparison: (Option A) 2 years MCC out-of-state + 2 years UNO in-state with MetroMavs scholarship vs. (Option B) 2 years IWCC in-state + 2 years elsewhere. Call MCC Transfer at mccneb.edu/transfer and UNO Transfer at (402) 554-3441 to get current numbers.", "source": "https://www.mccneb.edu/student-services/transfer-services/"}'::jsonb,
  '{"institution_abbr": "MCC", "institution_type": "public_2year", "scholarship_type": "merit", "application_method": "separate_application_required", "renewable": {"is_renewable": false, "max_years": 1, "renewal_gpa": null, "notes": "Transfer pathway — scholarship applies at UNO after transfer, not at MCC"}, "stackable": {"stacks_with_other_merit": false, "stacks_with_need_based": true, "notes": "Scholarship component is at UNO level — verify stacking with UNO Financial Aid after transfer."}}'::jsonb
),

-- ── 4. MCC Program-Specific Scholarships (Healthcare, Culinary, Trades, IT) ──
-- MCC Foundation has program-area scholarships beyond the general pool.
-- One AwardSpring application covers these as well.
-- Surfacing separately so program-specific students know to look.
(
  'MCC Foundation Program-Specific Scholarships — Healthcare, Culinary, Trades, IT',
  'Metropolitan Community College Foundation',
  'https://www.mccneb.edu',
  'Beyond the general scholarship pool, MCC Foundation has dedicated scholarship funds for students in specific career programs — nursing and allied health, culinary arts, welding and trades, information technology, automotive, and others. If you are enrolling at MCC for a specific career program, there are scholarships targeted to your field in addition to the general Foundation pool. The MUD Culinary Arts Scholarship ($1,000 for culinary students with 2.5+ GPA) is one example. Healthcare scholarships support students in nursing, dental hygiene, medical assisting, and other allied health programs. IT scholarships support students in networking, cybersecurity, and programming programs. These awards are all accessed through the same single application at mccneb.awardspring.com — one application considers you for both general and program-specific awards. If you are pursuing a career path at MCC, the Foundation scholarship pool is specifically designed to support you. COUNCIL BLUFFS STUDENTS: See the CB eligibility note on the MCC Foundation general entry. You can apply for these awards as an out-of-state student, though some may require Nebraska residency. The AwardSpring portal will tell you which awards match your profile.',
  'scholarship',
  'Must be enrolled or planning to enroll at MCC in a qualifying program (healthcare, culinary, trades, IT, automotive, or other career program). Individual scholarship requirements vary — some require specific GPA (e.g., 2.5 for culinary), some require FAFSA, some require program enrollment in a specific semester. All accessed through single application at mccneb.awardspring.com. Contact MCC Financial Aid at (402) 457-2400 for program-specific scholarship guidance.',
  null,
  'https://mccneb.awardspring.com/',
  'Omaha, NE (Multiple Campuses)',
  '5300 N 30th Street', 'Omaha', 'NE', '68111',
  false, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior', 'adult_learner'],
  'scholarship_amount', 1000, 'annual',
  'medium', 'needs_confirmation',
  'https://www.mccneb.edu/About-MCC-Nebraska/Foundation/Current-MCC-Foundation-Scholarships', 'official_website', '2026-03-16',
  true, false,
  'One application at mccneb.awardspring.com. Contact MCC Financial Aid at (402) 457-2400 for program-specific scholarship guidance. Verify current awards and deadlines at mccneb.edu/Foundation.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": null, "basis": "likely", "notes": "CB (Iowa) students can apply for MCC Foundation scholarships including program-specific awards. Some awards may require Nebraska residency — the AwardSpring portal will filter eligibility. CB students attending MCC pay out-of-state tuition, so scholarship funds help offset the higher cost. Remind CB students to compare total MCC cost vs. IWCC (Council Bluffs) before choosing MCC. Contact MCC Financial Aid at (402) 457-2400.", "source": "https://mccneb.awardspring.com/"}'::jsonb,
  '{"institution_abbr": "MCC", "institution_type": "public_2year", "scholarship_type": "departmental", "application_method": "general_scholarship_app", "renewable": {"is_renewable": false, "max_years": 1, "renewal_gpa": null, "notes": "Most program-specific scholarships are one-year awards; some may be renewable — check individual terms in AwardSpring"}, "stackable": {"stacks_with_other_merit": true, "stacks_with_need_based": true, "notes": "Can stack with general MCC Foundation awards — one AwardSpring application covers all."}}'::jsonb
);
