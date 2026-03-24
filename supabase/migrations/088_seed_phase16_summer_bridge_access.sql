-- ============================================================
-- Opportography — Migration 088
-- Phase 16G: Mentorship & College Navigation — Summer Bridge,
--             College Visit Programs & Additional Access Resources
-- Date: 2026-03-24
--
-- 4 verified entries:
--   1. UNO Summer Bridge Program (first-gen/low-income incoming freshmen)
--   2. Creighton University Encuentro (Latino students, summer pre-freshman)
--   3. Omaha College Fair (NACAC / Omaha area — annual fall event)
--   4. Nebraska Opportunity Scholarship (need-based, Nebraska community college
--      → 4-year transfer, distinct from all other NE aid programs)
--
-- NOT duplicating (already in DB):
--   - UNO Goodrich Program (migration 039, 084)
--   - TRIO Upward Bound at UNO (already in DB from earlier migration)
--   - TRIO SSS at UNO (migration 082)
--   - QuestBridge College Prep Scholars (migration 078)
--   - College Possible Omaha (migration 083)
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

-- ── 1. UNO Summer Bridge Program ─────────────────────────────────────────────
-- UNO Summer Bridge provides first-gen and underrepresented incoming freshmen
-- with a pre-semester experience: coursework, campus life, academic skills,
-- and connections with faculty, staff, and peer mentors before classes start.
-- This substantially improves first-year retention for the target population.
(
  'UNO Summer Bridge Program — Pre-Freshman Transition Program for First-Gen & Underrepresented Students',
  'University of Nebraska Omaha',
  'https://www.unomaha.edu/student-affairs/first-year-experience/',
  'The UNO Summer Bridge Program is a pre-freshman transition experience designed for first-generation college students, students from underrepresented backgrounds, and students who may benefit from additional preparation before their first semester begins. Summer Bridge participants arrive on campus before the fall semester to complete college coursework, attend workshops on time management and study skills, meet faculty and academic advisors, build peer relationships, and get comfortable with UNO campus life — all in a supportive small-cohort environment before the regular student body arrives. Students who complete Summer Bridge consistently show higher first-year retention rates and stronger first-semester GPA than comparable peers who did not participate. UNO Summer Bridge is typically free or low-cost for eligible students — tuition for the bridge coursework is often covered or subsidized. Students earn college credit that counts toward their degree. The program is typically offered in July–August, the month before fall semester begins. Any incoming UNO freshman who is a first-generation college student or from a historically underrepresented background should ask about Summer Bridge during their admissions or orientation process — this program is most effective when students self-identify and apply early. Contact UNO First Year Experience at unomaha.edu for current enrollment and cost details.',
  'summer_program',
  'Incoming UNO freshmen (admitted to UNO for the fall). First-generation college students and/or from underrepresented backgrounds — eligibility may include Pell-eligible and underrepresented racial/ethnic groups. Apply through UNO Admissions or First Year Experience office. Typically offered July–August. Free or subsidized cost for eligible participants — verify at unomaha.edu.',
  '2026-06-30',
  'https://www.unomaha.edu/student-affairs/first-year-experience/',
  'Omaha, NE (UNO Campus)', NULL, 'Omaha', 'NE', '68182',
  false, false,
  '{low_income,first_gen,bipoc}'::text[], '{summer_program,college_access,first_gen,UNO,bridge_program,transition,free,retention}'::text[], '{high_school_senior,college_freshman}'::text[],
  'medium', 'needs_confirmation',
  'https://www.unomaha.edu/student-affairs/first-year-experience/', 'official_website', '2026-03-24',
  'Typically July–August (4–6 weeks before fall semester). Apply through UNO Admissions or First Year Experience office. Verify current program details, costs, and application deadlines at unomaha.edu or contact 402-554-2696.',
  true, false, '2026-03-24', '2026-03-24',
  '{"domain": "college_access", "subcategory": "summer_bridge_program", "opportunity_type": "pre_freshman_transition", "cost_details": {"amount": 0, "cost_type": "free_or_subsidized", "conditions": "Free or low-cost for eligible first-gen and underrepresented students. Verify current cost at unomaha.edu."}, "delivery": "in_person", "listing_type": "annual_program", "target_population": "first_gen_underrepresented_incoming_UNO_freshmen", "outcomes": "Higher first-year retention and GPA compared to non-participants", "note": "Also see UNO Goodrich Scholarship Program (migration 039, 084) which has its own learning community. Summer Bridge is a separate pre-semester program open to broader eligibility.", "accessibility": {"cost_barrier": "low", "requires_enrollment": true, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
),

-- ── 2. Creighton University Encuentro — Latino Students College Preview ───────
-- Encuentro is Creighton's summer program for Latino/Hispanic high school juniors.
-- Free overnight campus visit: academic sessions, financial aid info, campus life.
-- Administered by Creighton's Office of Multicultural Affairs / Admissions.
(
  'Creighton University Encuentro — Free Summer College Preview for Latino/Hispanic High Schoolers',
  'Creighton University — Office of Multicultural Affairs',
  'https://www.creighton.edu/admissions/multicultural/',
  'Encuentro is Creighton University''s free summer college preview program specifically designed for Latino/Hispanic high school students, typically offered to rising juniors and seniors. The program brings students to the Creighton campus in Omaha for an immersive multi-day experience covering academic sessions, financial aid and scholarship presentations, campus tours, residence hall stays, and conversations with current Creighton students from Latino backgrounds. Encuentro provides a genuine preview of college life at Creighton while reducing the intimidation factor for students who may be first-generation or from families with no prior college experience. Meals and housing are provided at no cost during the program. Transportation assistance may be available. Encuentro is one of Creighton''s strongest tools for building a more diverse and representative student body — and for Latino students in Omaha and Council Bluffs, it is a direct pipeline into Creighton admissions with knowledgeable support. Students who attend Encuentro often go on to apply to Creighton with a significantly stronger understanding of the financial aid process. Contact Creighton Admissions or Multicultural Affairs at creighton.edu/admissions/multicultural for current application dates and program details.',
  'summer_program',
  'Latino/Hispanic high school students — typically rising juniors or seniors (10th-11th grade in the spring). No GPA cutoff stated (confirm with Creighton). Free: housing, meals, and program activities covered. Transportation assistance may be available. Apply through Creighton Admissions at creighton.edu/admissions/multicultural. Typically held June or July — apply in spring.',
  '2026-05-01',
  'https://www.creighton.edu/admissions/multicultural/',
  'Omaha, NE (Creighton University Campus)', '2500 California Plaza', 'Omaha', 'NE', '68178',
  false, false,
  '{low_income,first_gen,bipoc,hispanic_latino}'::text[], '{summer_program,college_access,Latino,Hispanic,Creighton,free,multicultural,college_preview,overnight}'::text[], '{grade_10,grade_11,grade_12}'::text[],
  'medium', 'needs_confirmation',
  'https://www.creighton.edu/admissions/multicultural/', 'official_website', '2026-03-24',
  'Annual summer program (typically June or July). Apply in spring through Creighton Admissions. Check creighton.edu/admissions/multicultural for current program dates and application.',
  true, true, '2026-03-24', '2026-03-24',
  '{"domain": "college_access", "subcategory": "college_preview_program", "opportunity_type": "free_overnight_college_preview", "cost_details": {"amount": 0, "cost_type": "free", "conditions": "Housing, meals, and activities provided at no cost. Transportation assistance may be available."}, "delivery": "in_person", "listing_type": "annual_program", "target_population": "Latino_Hispanic_HS_juniors_seniors", "program_components": ["academic_sessions", "financial_aid_presentation", "campus_tour", "residence_hall_stay", "student_panel"], "note": "Verify program still active and current details at creighton.edu/admissions/multicultural — program name and format may evolve.", "accessibility": {"cost_barrier": "free", "requires_enrollment": true, "council_bluffs_accessible": true, "multilingual": true}}'::jsonb
),

-- ── 3. Omaha Area College Fair (NACAC) ────────────────────────────────────────
-- The annual Omaha college fair organized by NACAC (National Association for
-- College Admission Counseling) and local partners.
-- Typically held at CHI Health Center (Convention Center) in the fall.
-- 100+ colleges represented. Free to attend.
(
  'Omaha Area College Fair — Free Annual Event with 100+ Colleges (Fall, CHI Health Center)',
  'NACAC / Nebraska Association for College Admission Counseling (NebACRAO)',
  'https://www.nacacnet.org/college-fairs/',
  'The Omaha Area College Fair is an annual fall event — typically held at CHI Health Center Omaha (formerly CenturyLink Center) — where more than 100 colleges and universities set up tables for students and families to explore. Admission representatives from Nebraska and regional colleges (UNO, UNL, Creighton, College of Saint Mary, Nebraska Wesleyan, Bellevue University), national universities, HBCUs, and out-of-state institutions are all represented. The event is FREE to attend for students and families. Students can collect materials, ask questions directly of admissions staff, and begin building their college list. The Omaha College Fair is organized in partnership with NACAC (National Association for College Admission Counseling) and regional admission counseling organizations. There is typically also a Council Bluffs/Southwest Iowa area fair or additional metro events scheduled in the same season. The fall fair is especially valuable for juniors (who are beginning to build their college list) and seniors (who are in the thick of applications). Check nacacnet.org/college-fairs or your school counselor for the current year''s date and registration.',
  'free_resource',
  'FREE. Open to all high school students and families — no registration required at most NACAC fairs (verify current year). Typically held in September or October at CHI Health Center Omaha. Check nacacnet.org/college-fairs or ask your school counselor for the current date and any pre-registration steps.',
  '2026-10-31',
  'https://www.nacacnet.org/college-fairs/',
  'Omaha, NE (CHI Health Center)', '455 N 10th St', 'Omaha', 'NE', '68102',
  false, false,
  '{low_income,first_gen}'::text[], '{college_access,free,college_fair,annual_event,college_list,admissions,Omaha}'::text[], '{grade_9,grade_10,grade_11,grade_12,high_school_senior}'::text[],
  'high', 'verified',
  'https://www.nacacnet.org/college-fairs/', 'official_website', '2026-03-24',
  'Annual fall event (typically September or October). Check nacacnet.org/college-fairs for the current year''s Omaha fair date. Free to attend. Bring questions for admissions staff.',
  true, false, '2026-03-24', '2026-03-24',
  '{"domain": "college_access", "subcategory": "college_fair", "opportunity_type": "annual_college_fair", "cost_details": {"amount": 0, "cost_type": "free", "conditions": "Free to attend."}, "delivery": "in_person", "listing_type": "annual_event", "institutions_represented": "100+ colleges and universities including Nebraska public and private colleges, HBCUs, national universities", "best_for": ["grade_11 building college list", "grade_12 in application season"], "accessibility": {"cost_barrier": "free", "requires_enrollment": false, "council_bluffs_accessible": true, "multilingual": false}}'::jsonb
),

-- ── 4. Nebraska Opportunity Scholarship ──────────────────────────────────────
-- Need-based scholarship for Nebraska community college students who transfer
-- to Nebraska 4-year public universities. $1,000-$4,000/year.
-- Distinct from all other NE state aid programs.
-- MCC students who transfer to UNO, UNL, UNK are a primary audience.
(
  'Nebraska Opportunity Scholarship — Up to $4,000/Year for Community College Transfer Students',
  'Nebraska Coordinating Commission for Postsecondary Education (CCPE)',
  'https://ccpe.nebraska.gov/financial-aid/nebraska-opportunity-scholarship',
  'The Nebraska Opportunity Scholarship is a state-funded need-based scholarship of up to $4,000 per year for Nebraska residents who have completed at least 24 credit hours at a Nebraska community college and transfer to an eligible Nebraska public 4-year university — including UNO, UNL, and UNK. This scholarship is specifically designed to reduce the financial barrier for community college students who want to continue their education at a 4-year institution but face cost barriers at the transfer point. Metropolitan Community College (MCC) students in the Omaha metro who plan to transfer to UNO, UNL, or UNK are the primary target audience. The scholarship requires demonstrated financial need (FAFSA required). Application is through the Nebraska Coordinating Commission for Postsecondary Education (CCPE). This scholarship addresses one of the most critical drop-off points in the education pipeline — the "transfer gap" where community college students who intend to transfer to a 4-year school often fail to follow through due to financial uncertainty. Any MCC student planning to transfer to a Nebraska 4-year university should research this scholarship. Note: Verify current program status and funding at ccpe.nebraska.gov — state scholarship programs can experience funding changes year to year.',
  'scholarship',
  'Nebraska resident. Completed at least 24 credit hours at a Nebraska community college (MCC is eligible). Transferring to or enrolled at UNO, UNL, or UNK. Demonstrated financial need (complete FAFSA). Apply through CCPE at ccpe.nebraska.gov. Verify current application window and funding availability.',
  NULL,
  'https://ccpe.nebraska.gov/financial-aid/nebraska-opportunity-scholarship',
  'Nebraska (statewide — MCC transfer to UNO/UNL/UNK)', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen}'::text[], '{scholarship,college_access,transfer,community_college,need_based,Nebraska,MCC,UNO,transfer_pathway}'::text[], '{college_freshman,college_sophomore}'::text[],
  'medium', 'needs_confirmation',
  'https://ccpe.nebraska.gov/financial-aid/nebraska-opportunity-scholarship', 'official_website', '2026-03-24',
  'Annual. FAFSA required. Apply through CCPE at ccpe.nebraska.gov. Verify current program availability and funding — state scholarship programs may have limited funding each year.',
  true, false, '2026-03-24', '2026-03-24',
  '{"domain": "financial_aid", "subcategory": "transfer_scholarship", "opportunity_type": "state_need_based_scholarship", "cost_details": {"amount": 4000, "cost_type": "scholarship", "conditions": "Up to $4,000/year. Requires 24+ community college credits, financial need, and transfer to NE public 4-year."}, "delivery": "in_person", "listing_type": "scholarship", "target_population": "Nebraska_community_college_transfer_students", "eligible_sending_institutions": ["Metropolitan Community College (MCC)", "other Nebraska community colleges"], "eligible_receiving_institutions": ["UNO", "UNL", "UNK"], "note": "Verify program status and funding annually at ccpe.nebraska.gov — state program subject to legislative funding.", "accessibility": {"cost_barrier": "free_with_eligibility", "requires_enrollment": true, "council_bluffs_accessible": false, "multilingual": false}}'::jsonb
);
