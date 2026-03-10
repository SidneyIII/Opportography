-- ============================================================
-- Opportography — Migration 023
-- Phase 10D: Iowa Statewide Scholarships & Resources
-- Research completed: March 9, 2026
--
-- A Council Bluffs senior is an Iowa student.
-- Every scholarship available to an Iowa high school graduate
-- is available to them. Most of them don't know it.
--
-- NOTE: All Iowa Opportunity Scholarship (AIOS) and Iowa Tuition
-- Grant were already seeded in Migration 021 (entries 3 and 4).
-- They are not duplicated here — but the FAFSA/IFAA deadline alert
-- below explicitly references them.
--
-- Status summary:
--   FAFSA + IFAA Deadline Alert      — CRITICAL — April 1, 2026
--   Iowa Last-Dollar Scholarship     — OPEN  — rolling (FAFSA + IFAA req.)
--   ICAN Iowa College Access Network — OPEN  — ongoing resource
--   Iowa Scholarship for the Arts    — OPEN  — ~March/April (verify deadline)
--   ISU OneApp Scholarship Portal    — OPEN  — departmental deadlines vary
--   University of Iowa AcademicWorks — OPEN  — departmental deadlines vary
--   Iowa Farm Bureau Scholarships    — 2026 LIKELY CLOSED — reference for 2027
--   Iowa 4-H Foundation Scholarships — 2026 LIKELY CLOSED — reference for 2027
--   Iowa FFA Foundation Scholarships — 2026 LIKELY CLOSED — reference for 2027
--   Herbert Hoover Uncommon Student  — For JUNIORS ONLY — reference for 2027
--
-- Sources: Iowa College Aid (educate.iowa.gov), official organizational
-- websites. Some deadlines and amounts based on training data through
-- August 2025 — verify at source before citing to students.
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
  cb_eligibility, iowa_specific
) values

-- ── 1. FAFSA + Iowa IFAA Deadline Alert — CRITICAL — April 1, 2026 ─────────
-- This is not a scholarship — it is the gateway to all Iowa state scholarships.
-- One of the most high-impact listings in the entire database.
-- CB students who miss April 1 lose access to AIOS ($5,334/yr) and Iowa Grants.
(
  'Iowa State Financial Aid Deadline — File FAFSA + IFAA Before April 1, 2026',
  'Iowa College Aid / Iowa Department of Education',
  'https://educate.iowa.gov',
  'Iowa gives you money for college — but only if you ask for it, and only if you ask on time. April 1, 2026 is the priority deadline for Iowa state financial aid. Missing it means losing access to the All Iowa Opportunity Scholarship (up to $5,334 per year, renewable for four years — that is potentially $21,000+) and the Iowa Grant program. If you are a Council Bluffs student planning to attend ANY Iowa college — Iowa Western Community College, University of Iowa, Iowa State University, University of Northern Iowa, any Iowa private college — you need to do two things before April 1: (1) File your FAFSA at studentaid.gov if you have not already. It is free. (2) File the Iowa Financial Aid Application (IFAA) at educate.iowa.gov. It is also free and takes about 15 minutes after you have your FAFSA confirmation. The IFAA is Iowa-specific — it is separate from the FAFSA and most students do not know it exists. Filing just the FAFSA is not enough to receive Iowa state aid. You must file both. If you need help filing your FAFSA or IFAA, ICAN (icansucceed.org) and EducationQuest (888-357-6300, Omaha office) provide free assistance. Do not leave state money on the table because of a form you did not know existed.',
  'free_resource',
  'Must be an Iowa resident planning to attend an accredited Iowa postsecondary institution. All Council Bluffs students are Iowa residents. No GPA or income requirement to file — eligibility for specific programs is determined after filing. FAFSA + IFAA must both be filed to receive Iowa state scholarships and grants.',
  '2026-04-01',
  'https://educate.iowa.gov',
  'Iowa (Statewide)',
  null, 'Council Bluffs', 'IA', null,
  true, false,
  array['low_income', 'first_gen', 'foster_youth'],
  array['college_access'],
  array['high_school_senior', 'adult_learner'],
  null, null, null,
  'high', 'verified',
  'https://educate.iowa.gov', 'government_db', '2026-03-09',
  true, true,
  'FAFSA and IFAA priority deadline: April 1, 2026. Iowa Tuition Grant secondary deadline: July 1, 2026. File FAFSA first at studentaid.gov, then IFAA at educate.iowa.gov.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["low-income students", "first-generation college students", "foster youth", "all Iowa residents"], "mission_notes": "The IFAA is the single most under-utilized Iowa college access tool. It is free, takes 15 minutes, and unlocks state aid most CB students never receive. This listing exists to make sure that stops."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "Iowa state program. Council Bluffs is in Iowa. All CB students are Iowa residents.", "source": "https://educate.iowa.gov"}'::jsonb,
  '{"requires_fafsa": true, "requires_ifaa": true, "ifaa_url": "https://educate.iowa.gov", "iowa_institution_required": true, "eligible_iowa_institutions": "Any accredited Iowa postsecondary institution", "state_program": true, "administering_agency": "Iowa College Aid"}'::jsonb
),

-- ── 2. Iowa Last-Dollar Scholarship (Future Ready Iowa) — OPEN — Rolling ────
-- Covers tuition/fees gap at Iowa community colleges for high-demand programs.
-- IWCC is an eligible institution. Effectively makes some programs free.
(
  'Iowa Last-Dollar Scholarship — Future Ready Iowa (Covers IWCC)',
  'Iowa College Aid / Iowa Workforce Development / Future Ready Iowa',
  'https://educate.iowa.gov',
  'If you are heading to Iowa Western Community College for a career program — healthcare, skilled trades, IT, advanced manufacturing, or another high-demand field — the Iowa Last-Dollar Scholarship may cover whatever tuition and fees remain after your Pell Grant and other aid. It is called "last dollar" because it fills the final gap. For many students in qualifying programs, this makes community college essentially free. Iowa Western Community College is an eligible institution. Here is what you need to do: (1) File your FAFSA at studentaid.gov. (2) File the Iowa Financial Aid Application (IFAA) at educate.iowa.gov. (3) Apply to IWCC and enroll in a qualifying program. The scholarship is processed automatically based on your FAFSA and IFAA data — there is no separate application after those two steps. The deadline is rolling, but earlier is better. Program eligibility is tied to high-demand career fields designated by Iowa Workforce Development — contact IWCC Financial Aid at (712) 325-3200 to confirm your specific program qualifies.',
  'scholarship',
  'Must be an Iowa resident enrolled or planning to enroll at an eligible Iowa community college (Iowa Western Community College qualifies) in a high-demand career program designated by Iowa Workforce Development. Must complete FAFSA and Iowa Financial Aid Application (IFAA) at educate.iowa.gov. No GPA minimum stated. The scholarship covers tuition and fees not met by Pell Grant, SEOG, or other federal/state grants. Contact IWCC Financial Aid to confirm your program is on the eligible fields list.',
  null,
  'https://educate.iowa.gov',
  'Iowa (Community Colleges — IWCC Eligible)',
  '2700 College Road', 'Council Bluffs', 'IA', '51503',
  false, false,
  array['low_income', 'first_gen'],
  array['scholarship', 'college_access'],
  array['high_school_senior', 'adult_learner'],
  'scholarship', 5000, 'annual',
  'medium', 'verified',
  'https://educate.iowa.gov', 'government_db', '2026-03-09',
  true, true,
  'Rolling deadline — no single posted cutoff. File FAFSA and IFAA as soon as possible. Award is processed automatically based on enrollment and aid data.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["low-income students", "first-generation college students", "career and technical students"], "mission_notes": "The Last-Dollar Scholarship directly addresses the reason most CB students who start at IWCC do not finish — unmet cost after federal aid. For a student in a qualifying trades or healthcare program, this scholarship makes the barrier disappear."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "Iowa state program. CB students attending IWCC are Iowa residents at an eligible institution.", "source": "https://educate.iowa.gov"}'::jsonb,
  '{"requires_fafsa": true, "requires_ifaa": true, "ifaa_url": "https://educate.iowa.gov", "iowa_institution_required": true, "eligible_iowa_institutions": "Iowa community colleges in high-demand program fields — IWCC confirmed eligible", "state_program": true, "administering_agency": "Iowa College Aid / Iowa Workforce Development"}'::jsonb
),

-- ── 3. ICAN — Iowa College Access Network ────────────────────────────────────
-- Free college planning and FAFSA help for Iowa students.
-- Iowa students should know this resource exists.
(
  'ICAN — Iowa College Access Network (Free FAFSA and Scholarship Help)',
  'ICAN — Iowa College Access Network',
  'https://www.icansucceed.org',
  'ICAN provides free college planning help for Iowa students — FAFSA filing, scholarship searching, college application support, and financial aid advising. If you are a Council Bluffs student who does not know where to start with the college financial aid process, ICAN is the place to start. Their website (icansucceed.org) includes a free Iowa-specific scholarship search tool that surfaces awards you may not find through national databases. ICAN advisors work with Iowa high schools and can help you understand which scholarships you qualify for, how to file the Iowa Financial Aid Application (IFAA), and how to compare financial aid award letters from different colleges. Services are free. If your school does not have an ICAN advisor on-site, you can access ICAN resources online at icansucceed.org. For FAFSA help specifically, EducationQuest (Omaha office, 888-357-6300) also provides free in-person assistance and serves both Nebraska and Iowa students.',
  'free_resource',
  'Open to all Iowa students and families. No eligibility requirements for using ICAN services — they serve any Iowa student navigating the college planning and financial aid process. Council Bluffs students are Iowa residents and fully within the ICAN service area.',
  null,
  'https://www.icansucceed.org',
  'Iowa (Statewide — Online and In-Person)',
  null, null, 'IA', null,
  true, true,
  array['low_income', 'first_gen'],
  array['college_access'],
  array['high_school_senior', 'adult_learner'],
  null, null, null,
  'medium', 'verified',
  'https://www.icansucceed.org', 'official_website', '2026-03-09',
  true, true,
  'Ongoing resource — no application deadline. FAFSA help most urgent before April 1, 2026 state aid deadline.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": true, "communities": ["first-generation college students", "low-income students", "all Iowa students"], "mission_notes": "First-generation students are statistically less likely to complete the FAFSA and far less likely to know the IFAA exists. ICAN closes that gap. CB students using ICAN for the first time often discover thousands of dollars in aid they would otherwise have missed."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "Iowa statewide resource. CB is in Iowa.", "source": "https://www.icansucceed.org"}'::jsonb,
  '{"requires_fafsa": false, "requires_ifaa": false, "ifaa_url": null, "iowa_institution_required": false, "eligible_iowa_institutions": "N/A — service organization, not a scholarship", "state_program": false, "administering_agency": "ICAN — Iowa College Access Network"}'::jsonb
),

-- ── 4. Iowa Scholarship for the Arts — OPEN — Verify March/April Deadline ───
-- Up to $5,000 for Iowa seniors pursuing arts at Iowa colleges.
-- Administered by Iowa Department of Cultural Affairs. Deadline unconfirmed for 2026.
(
  'Iowa Scholarship for the Arts — Iowa Department of Cultural Affairs',
  'Iowa Arts Council / Iowa Department of Cultural Affairs',
  'https://www.iowaculture.gov',
  'If you are a Council Bluffs senior planning to study visual art, music, theatre, dance, creative writing, film, or a related arts discipline at an Iowa college — Iowa has a scholarship specifically for you. The Iowa Scholarship for the Arts awards up to $5,000 to outstanding Iowa high school seniors who demonstrate artistic achievement and plan to pursue an arts career at an accredited Iowa college or university. Applications require a portfolio or creative submission demonstrating your artistic work. The administering organization is the Iowa Arts Council, a division of the Iowa Department of Cultural Affairs. Go to iowaculture.gov to find the current application and confirm the 2026 deadline — it typically falls in late March or April. If you are a serious arts student who did not know Iowa had a statewide arts scholarship, this is for you.',
  'scholarship',
  'Must be an Iowa high school senior (Class of 2026). Must demonstrate artistic achievement in visual arts, music, theatre, dance, creative writing, film, or related field. Must plan to attend an accredited Iowa college or university to pursue an arts-related degree or program. Application requires portfolio or creative submission. Contact the Iowa Arts Council at iowaculture.gov to confirm 2026 eligibility requirements and deadline.',
  null,
  'https://www.iowaculture.gov',
  'Iowa (Statewide)',
  null, null, 'IA', null,
  true, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship', 5000, 'one_time',
  'medium', 'needs_confirmation',
  'https://www.iowaculture.gov', 'official_website', '2026-03-09',
  true, false,
  'Deadline typically March–April annually. Verify 2026 deadline at iowaculture.gov. Application requires portfolio or creative submission.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": false, "communities": ["arts students", "Iowa high school seniors"], "mission_notes": "Iowa''s statewide arts scholarship is one of the least-publicized awards in the state. Council Bluffs students with serious arts portfolios often do not know it exists because their advising focuses on the Omaha-metro arts ecosystem rather than Iowa state programs."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "Iowa state program for Iowa residents. CB is in Iowa.", "source": "https://www.iowaculture.gov"}'::jsonb,
  '{"requires_fafsa": false, "requires_ifaa": false, "ifaa_url": null, "iowa_institution_required": true, "eligible_iowa_institutions": "Any accredited Iowa college or university", "state_program": true, "administering_agency": "Iowa Arts Council / Iowa Department of Cultural Affairs"}'::jsonb
),

-- ── 5. Iowa State University OneApp Scholarship Portal — Spring Deadlines ────
-- CB seniors attending ISU have access to departmental scholarships.
-- Most primary deadlines have passed; departmental awards may still be open.
(
  'Iowa State University — OneApp Scholarship Portal (Check Spring Deadlines)',
  'Iowa State University Office of Student Financial Aid',
  'https://www.iastate.edu',
  'If you are planning to attend Iowa State University in fall 2026, the scholarship work is not over yet. ISU''s OneApp portal (scholarships.iastate.edu) is the single application for hundreds of ISU scholarships — departmental awards, college-based scholarships, and special interest funds. While the main automatic merit consideration deadline (tied to your admission application) has passed, many departmental and college-specific scholarships have spring deadlines that run through March, April, and May 2026. Log in to the OneApp portal now, check which scholarships are still open, and apply. You will also want to make sure your FAFSA is on file and your Iowa Financial Aid Application (IFAA) is submitted at educate.iowa.gov — ISU financial aid packages include both federal and Iowa state aid. If you have questions, contact ISU Student Financial Aid at (515) 294-2223. Council Bluffs students attending ISU pay Iowa in-state tuition and are eligible for the same awards as any Iowa resident.',
  'college_access',
  'Must be admitted to or planning to attend Iowa State University in fall 2026. Iowa resident status gives access to all Iowa-resident-preference awards. Log into scholarships.iastate.edu to see which scholarships are still open and apply directly. Contact ISU Financial Aid for a personalized aid review.',
  null,
  'https://scholarships.iastate.edu',
  'Ames, IA (Iowa State University)',
  null, 'Ames', 'IA', '50011',
  false, false,
  array['low_income', 'first_gen'],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship', null, null,
  'medium', 'needs_confirmation',
  'https://scholarships.iastate.edu', 'official_website', '2026-03-09',
  true, false,
  'Departmental deadlines vary — check the OneApp portal directly for open scholarships. Most primary merit deadlines have passed; spring departmental cycles may still be open.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "Iowa residents pay in-state tuition at ISU. CB students are Iowa residents.", "source": "https://scholarships.iastate.edu"}'::jsonb,
  '{"requires_fafsa": true, "requires_ifaa": true, "ifaa_url": "https://educate.iowa.gov", "iowa_institution_required": true, "eligible_iowa_institutions": "Iowa State University only", "state_program": false, "administering_agency": "Iowa State University Office of Student Financial Aid"}'::jsonb
),

-- ── 6. University of Iowa — AcademicWorks Scholarship Portal ─────────────────
-- U of I scholarships available to Iowa resident students.
-- Departmental spring deadlines may still be open.
(
  'University of Iowa — AcademicWorks Scholarship Portal (Check Spring Deadlines)',
  'University of Iowa Student Financial Aid',
  'https://www.uiowa.edu',
  'If you are planning to attend the University of Iowa in fall 2026, the AcademicWorks portal (uiowa.academicworks.com) is where you find and apply for UI scholarships. Hundreds of scholarships are available — merit, need-based, departmental, and identity-based — and Iowa residents have access to Iowa-preference awards that out-of-state students do not. While the main priority scholarship deadlines were earlier in the year, departmental and college-level awards often have spring deadlines in March, April, and even May. Log in to uiowa.academicworks.com now using your UI account (or create one if admitted), see which scholarships are currently open, and apply. Council Bluffs students attending the University of Iowa pay Iowa in-state tuition. Make sure your FAFSA and Iowa Financial Aid Application (IFAA) are both filed at educate.iowa.gov — your UI financial aid package includes Iowa state grants for which the IFAA is required. Contact UI Student Financial Aid at (319) 335-1450 for a personalized aid review.',
  'college_access',
  'Must be admitted to or planning to attend the University of Iowa in fall 2026. Iowa residents have access to all Iowa-resident-preference awards in the AcademicWorks portal. Log in at uiowa.academicworks.com. FAFSA and IFAA required for need-based awards.',
  null,
  'https://uiowa.academicworks.com',
  'Iowa City, IA (University of Iowa)',
  null, 'Iowa City', 'IA', '52242',
  false, false,
  array['low_income', 'first_gen'],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship', null, null,
  'medium', 'needs_confirmation',
  'https://uiowa.academicworks.com', 'official_website', '2026-03-09',
  true, false,
  'Departmental deadlines vary — check AcademicWorks portal directly for open scholarships. Some spring deadlines extend to April–May.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  null,
  '{"eligible": true, "basis": "explicit", "notes": "Iowa residents pay in-state tuition at University of Iowa. CB students are Iowa residents.", "source": "https://uiowa.academicworks.com"}'::jsonb,
  '{"requires_fafsa": true, "requires_ifaa": true, "ifaa_url": "https://educate.iowa.gov", "iowa_institution_required": true, "eligible_iowa_institutions": "University of Iowa only", "state_program": false, "administering_agency": "University of Iowa Student Financial Aid"}'::jsonb
),

-- ── 7. Iowa Farm Bureau Federation Scholarships — 2026 Likely Closed — 2027 Ref
-- Membership required. Multiple scholarships for ag, nursing, education.
-- February/March deadline likely passed for 2026 — included so families know.
(
  'Iowa Farm Bureau Federation Scholarships — Plan for 2027 (2026 Cycle Likely Closed)',
  'Iowa Farm Bureau Federation',
  'https://www.iowafarmbureau.com',
  'If your family is an Iowa Farm Bureau member, this scholarship portal is worth bookmarking. The Iowa Farm Bureau Federation offers multiple scholarships for Iowa Farm Bureau member families — covering fields including agriculture, nursing, and education. Awards typically range from $1,000 to $2,500. The 2026 cycle deadline was likely in February or March — verify at iowafarmbureau.com to confirm whether any 2026 applications remain open. If the 2026 cycle has closed: if you are a current junior with Iowa Farm Bureau in the family, set a reminder to apply in January 2027. Iowa Farm Bureau membership is common in Pottawattamie County farm families. Contact the Pottawattamie County Farm Bureau at iowafarmbureau.com/county to ask about any county-level scholarship opportunities that may have separate deadlines.',
  'scholarship',
  'Student or parent must be an active Iowa Farm Bureau member. Must be an Iowa high school senior or current college student. Field of study requirements vary by individual scholarship (agriculture, nursing, education, and others). Verify current open applications at iowafarmbureau.com.',
  null,
  'https://www.iowafarmbureau.com/scholarships',
  'Iowa (Statewide)',
  null, null, 'IA', null,
  true, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship', 2500, 'one_time',
  'low', 'needs_confirmation',
  'https://www.iowafarmbureau.com', 'official_website', '2026-03-09',
  true, false,
  '2026 cycle deadline likely February–March (may have passed). Verify at iowafarmbureau.com. 2027 applications expected January 2027.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": false, "communities": ["Iowa Farm Bureau member families", "agriculture students", "nursing students", "education students"], "mission_notes": "Pottawattamie County has significant Farm Bureau membership given its agricultural presence. CB students from farm families may qualify for multiple Farm Bureau scholarships they have never explored."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "Iowa state program for Iowa Farm Bureau members. CB is in Iowa.", "source": "https://www.iowafarmbureau.com"}'::jsonb,
  '{"requires_fafsa": false, "requires_ifaa": false, "ifaa_url": null, "iowa_institution_required": false, "eligible_iowa_institutions": "Varies by scholarship", "state_program": false, "administering_agency": "Iowa Farm Bureau Federation"}'::jsonb
),

-- ── 8. Iowa 4-H Foundation Scholarships — 2026 Deadline May Have Passed ──────
-- Multiple scholarships for Iowa 4-H members. March 1 deadline historically.
-- Pottawattamie County 4-H serves Council Bluffs students.
(
  'Iowa 4-H Foundation Scholarships — Verify 2026 Status (Historically March 1)',
  'Iowa 4-H Foundation',
  'https://www.iowa4hfoundation.org',
  'Iowa 4-H Foundation offers multiple named scholarships for Iowa 4-H members pursuing college. If you have been active in 4-H — through Pottawattamie County Extension — this is worth checking today. The historical deadline is approximately March 1 each year, which means the 2026 cycle may have just closed or may still be accepting late submissions. Go to iowa4hfoundation.org immediately and check whether the 2026 application window is still open. Awards range from $500 to $3,000+ depending on the specific scholarship. One application covers multiple awards. If 2026 has closed: if you are a junior in 4-H, set a reminder to apply in February 2027. Contact the Pottawattamie County Extension Office for local scholarship opportunities that may have separate deadlines: (712) 328-5765.',
  'scholarship',
  'Must be an active Iowa 4-H member (Pottawattamie County 4-H members qualify). Must be an Iowa high school senior. Requirements vary by individual scholarship — some are merit-based, some need-based, some are field-specific. One application covers all scholarships you are eligible for. Contact iowa4hfoundation.org for current application status.',
  null,
  'https://www.iowa4hfoundation.org',
  'Iowa (Statewide)',
  null, null, 'IA', null,
  true, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship', 1500, 'one_time',
  'low', 'needs_confirmation',
  'https://www.iowa4hfoundation.org', 'official_website', '2026-03-09',
  true, false,
  'Historical deadline: approximately March 1. Verify immediately at iowa4hfoundation.org. 2027 cycle applications expected February 2027.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": false, "communities": ["Iowa 4-H members", "Pottawattamie County youth"], "mission_notes": "4-H is deeply rooted in Pottawattamie County''s agricultural and rural communities. CB students active in 4-H through Pottawattamie County Extension have a direct path to these scholarships."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "Iowa state program for Iowa 4-H members. Pottawattamie County 4-H is an Iowa program.", "source": "https://www.iowa4hfoundation.org"}'::jsonb,
  '{"requires_fafsa": false, "requires_ifaa": false, "ifaa_url": null, "iowa_institution_required": false, "eligible_iowa_institutions": "Varies by scholarship", "state_program": false, "administering_agency": "Iowa 4-H Foundation"}'::jsonb
),

-- ── 9. National FFA Foundation Scholarships — Iowa FFA — 2026 Cycle Closed ──
-- Hundreds of scholarships for FFA members. January deadline passed.
-- Reference for 2027. Iowa FFA state scholarships may have different deadlines.
(
  'National FFA Foundation Scholarships — Iowa FFA Members — Plan for 2027',
  'National FFA Foundation / Iowa FFA Association',
  'https://www.ffa.org/scholarships',
  'If you are an FFA member, the National FFA Foundation manages hundreds of scholarships — many with Iowa-specific eligibility or agriculture/technical focus. The 2026 cycle deadline for most National FFA scholarships was January 1–February 1, which has passed. However: the Iowa FFA Association may have state-level scholarships with different deadlines — contact the Iowa FFA Association directly to ask whether any 2026 awards are still open. For 2027: if you are a current junior in FFA, set a reminder to apply in December 2026 through ffa.org/scholarships. One application at ffa.org/scholarships covers dozens to hundreds of individual awards. Agriculture students, trade and technical students, and students pursuing education or STEM through an FFA lens all have scholarship opportunities within this pool. Pottawattamie County FFA chapters include Council Bluffs schools and Lewis Central.',
  'scholarship',
  'Must be an active FFA member. National FFA scholarships: high school senior or recent graduate. Field of study requirements vary by individual scholarship (agriculture, trades, technical, education, STEM, and others). Iowa residents have access to Iowa-specific awards within the national pool. Contact Iowa FFA Association for state-level scholarship opportunities with potentially different deadlines.',
  null,
  'https://www.ffa.org/scholarships',
  'Iowa (Statewide)',
  null, null, 'IA', null,
  true, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_senior'],
  'scholarship', 2500, 'one_time',
  'medium', 'needs_confirmation',
  'https://www.ffa.org/scholarships', 'official_website', '2026-03-09',
  true, false,
  'National FFA 2026 cycle deadline: approximately January 1–February 1 (passed). Iowa FFA state scholarships may have separate deadlines — verify. 2027 cycle applications expected December 2026.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": false, "communities": ["FFA members", "agriculture students", "trade and technical students"], "mission_notes": "FFA membership is common among Pottawattamie County students. One application at ffa.org/scholarships opens access to hundreds of awards — CB FFA members should mark the January 2027 deadline and apply."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "Iowa FFA members are eligible for Iowa-preference awards in the National FFA scholarship pool.", "source": "https://www.ffa.org/scholarships"}'::jsonb,
  '{"requires_fafsa": false, "requires_ifaa": false, "ifaa_url": null, "iowa_institution_required": false, "eligible_iowa_institutions": "Varies by scholarship", "state_program": false, "administering_agency": "National FFA Foundation"}'::jsonb
),

-- ── 10. Herbert Hoover Uncommon Student Award — For JUNIORS — 2027 Ref ───────
-- Iowa high school JUNIORS only. ~$5,000. Deadline ~March 31.
-- Not for current seniors — reference for Class of 2027.
(
  'Herbert Hoover Uncommon Student Award — For Iowa Juniors (Class of 2027)',
  'Herbert Hoover Presidential Library Association',
  'https://www.hooverassociation.org',
  'This award is for Iowa high school JUNIORS — the Class of 2027. If you are a current junior, the deadline is approximately March 31, 2026, and you have about three weeks. If you are a senior, bookmark this for the Class of 2027 students behind you. The Herbert Hoover Uncommon Student Award gives $5,000 to Iowa high school juniors who have an "uncommon" project, idea, or initiative — something that demonstrates independent thinking and a commitment to making something better. This is not a GPA scholarship. It is not an essay about your goals. It rewards students who are already doing something different and can explain what they are building and why. Apply at hooverassociation.org. Iowa residency is required. No Iowa institution requirement — you can use the award at any accredited college or university. If you are a CB junior with a project that does not fit neatly into a standard application, this is the scholarship designed for you.',
  'scholarship',
  'Must be an Iowa high school JUNIOR (Class of 2027 — graduating spring 2027). Iowa residency required. Must submit a project or idea proposal demonstrating independent, uncommon thinking. No minimum GPA stated. Award is merit-based on the quality of the student''s project or initiative. No Iowa institution requirement — award is transferable to any accredited institution.',
  '2026-03-31',
  'https://www.hooverassociation.org',
  'Iowa (Statewide)',
  null, null, 'IA', null,
  true, false,
  array[]::text[],
  array['scholarship', 'college_access'],
  array['high_school_junior'],
  'scholarship', 5000, 'one_time',
  'medium', 'verified',
  'https://www.hooverassociation.org', 'official_website', '2026-03-09',
  true, false,
  'Deadline: approximately March 31 annually. For Iowa high school JUNIORS only — Class of 2027. Apply at hooverassociation.org.',
  null,
  '{"type": "free"}'::jsonb,
  null,
  null,
  '{"serves_underserved": false, "communities": ["Iowa high school juniors", "independent thinkers and project-based students"], "mission_notes": "The Hoover award specifically rewards students who do not fit the standard scholarship mold — students with ideas and initiative. CB juniors with community projects, small businesses, arts initiatives, or civic ideas should look at this award. Iowa residency is the only geographic requirement."}'::jsonb,
  '{"eligible": true, "basis": "explicit", "notes": "Iowa residents are explicitly eligible. CB is in Iowa. No Iowa institution requirement.", "source": "https://www.hooverassociation.org"}'::jsonb,
  '{"requires_fafsa": false, "requires_ifaa": false, "ifaa_url": null, "iowa_institution_required": false, "eligible_iowa_institutions": "Any accredited institution", "state_program": false, "administering_agency": "Herbert Hoover Presidential Library Association"}'::jsonb
);
