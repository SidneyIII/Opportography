-- ============================================================
-- Opportography — Migration 096
-- Phase 17H: Trades, Vocational & Apprenticeship Pathways
--             Workforce Bridge, Pre-Apprenticeship & Support Programs
-- Date: 2026-03-24
--
-- 5 verified entries:
--   1. Heartland Workforce Solutions (HWS) — WIOA Individual Training Accounts (Nebraska)
--   2. IowaWORKS Council Bluffs — WIOA Training Support (Iowa)
--   3. Job Corps Omaha — Free Residential Trades Training (Ages 16–24)
--   4. Goodwill Omaha YouthBuild — Construction Pre-Apprenticeship (Ages 16–24)
--   5. Helmets to Hardhats — Veteran Trades Apprenticeship Placement (National/Metro)
--
-- Sources:
--   - hws-ne.org (Heartland Workforce Solutions)
--   - workforce.iowa.gov/jobs/iowaworks/iowaworks-council-bluffs (IowaWORKS)
--   - jobcorps.gov (Job Corps)
--   - goodwillomaha.org/programs/ (Goodwill YouthBuild)
--   - helmetstohardhats.org (Helmets to Hardhats)
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

-- ── 1. Heartland Workforce Solutions — WIOA Individual Training Accounts (NE) ─
-- hws-ne.org confirmed: administers WIOA Title I Adult, Dislocated Worker, Youth
-- for Greater Omaha; provides ITAs to pay for approved training at MCC and other
-- WIOA-eligible providers; main: 5752 Ames Ave Omaha NE 68104, 402-444-4700,
-- also 4425 S. 24th St; onestop@hws-ne.org
(
  'Heartland Workforce Solutions — Free Job Training Funding (WIOA / Individual Training Account) for Omaha Area',
  'Heartland Workforce Solutions',
  'https://hws-ne.org',
  'Heartland Workforce Solutions (HWS) is the organization that administers federal Workforce Innovation and Opportunity Act (WIOA) funds for the Greater Omaha area. If you are an adult, recently laid off, or a young person (ages 14–24) who qualifies based on income or employment status, HWS can pay for your approved job training — including trades programs at Metropolitan Community College, registered apprenticeships, and other WIOA-eligible training programs. This is not a loan and not a scholarship you have to compete for. It is a federal program that provides Individual Training Accounts (ITAs) — essentially a grant specifically for workforce training — to eligible residents. If you have wanted to pursue HVAC training, welding certification, CDL licensing, CNA certification, electrical technology, or dozens of other programs and could not afford the cost, HWS is the first phone call to make. HWS operates two American Job Centers in Omaha: the main center at 5752 Ames Avenue (North Omaha) and a south location at 4425 S. 24th Street. Both are walk-in accessible Monday through Friday, 8am–5pm. MCC programs are co-located and directly partnered with HWS. If you are an Omaha or Douglas/Sarpy County Nebraska resident and cost has been the barrier between you and a trades credential — walk into HWS and ask about WIOA eligibility today.',
  'free_resource',
  'Must be an adult (18+), dislocated worker, or youth (14–24) meeting income or employment status criteria under WIOA. Nebraska residents in the Greater Omaha area (Douglas, Sarpy, and surrounding counties). Walk in Monday–Friday 8am–5pm: 5752 Ames Ave, Omaha NE 68104 (main) or 4425 S. 24th St, Omaha NE. Call 402-444-4700 or email onestop@hws-ne.org.',
  NULL,
  'https://hws-ne.org',
  'Omaha, NE', '5752 Ames Avenue', 'Omaha', 'NE', '68104',
  false, false,
  '{low_income,first_gen}'::text[], '{workforce_development,WIOA,free_training,ITA,trades_funding,career_support,American_Job_Center,Nebraska,financial_assistance,pre_apprenticeship}'::text[], '{post_secondary,adult}'::text[],
  'high', 'verified',
  'https://hws-ne.org', 'official_website', '2026-03-24',
  'Walk-in Mon–Fri 8am–5pm. Main: 5752 Ames Ave, Omaha NE 68104. South: 4425 S. 24th St, Omaha NE. Phone: 402-444-4700. Email: onestop@hws-ne.org. MCC programs co-located and partnered. Also administers YouthBuild (Goodwill partnership) for 16–24 year-olds.',
  true, true, '2026-03-24', '2026-03-24',
  '{"career_field": "workforce_support", "program_type": "wioa_american_job_center", "trades_relevant": true, "what_they_fund": ["Individual Training Accounts (ITAs) for approved training programs", "MCC trades programs", "Registered apprenticeship readiness", "Career counseling and job placement support"], "eligibility_categories": ["Adults meeting income criteria", "Dislocated workers", "Youth ages 14-24 with barriers to employment"], "dual_state_notes": "HWS serves Nebraska residents in the Greater Omaha area. Council Bluffs/Iowa residents should use IowaWORKS Council Bluffs — see separate listing. These are separate federal program administrators under the same federal WIOA law.", "delivery": "in_person", "listing_type": "workforce_support_program", "cost_details": {"amount": 0, "cost_type": "free", "conditions": "Federal WIOA funds — no repayment required for eligible participants"}}'::jsonb
),

-- ── 2. IowaWORKS Council Bluffs — WIOA Training Support (Iowa) ────────────────
-- workforce.iowa.gov confirmed: 300 W Broadway Suite 13, Council Bluffs IA 51503,
-- 712-352-3480, CouncilBluffsIowaWORKS@iwd.iowa.gov
(
  'IowaWORKS Council Bluffs — Free Job Training Funding (WIOA) for Council Bluffs & Southwest Iowa Residents',
  'Iowa Workforce Development — IowaWORKS Council Bluffs',
  'https://workforce.iowa.gov',
  'IowaWORKS is Iowa''s American Job Center system — the Iowa counterpart to Nebraska''s Heartland Workforce Solutions. Council Bluffs, Pottawattamie County, and Southwest Iowa residents who want to pursue trades training, apprenticeship programs, or vocational certifications should start here. IowaWORKS Council Bluffs administers federal WIOA funds for eligible residents, which can pay for approved training programs including Iowa Western Community College (IWCC) trades programs, registered apprenticeship preparation, and other WIOA-eligible training. If cost has been the barrier between you and a trades credential — and you are a Council Bluffs or Iowa-side resident — the IowaWORKS Council Bluffs office is your first stop. Services include: WIOA Individual Training Accounts for eligible adults and dislocated workers, youth employment programs, resume help, job search assistance, labor market information, and direct referrals to approved training providers including IWCC. The Council Bluffs office is located at the Omni Centré Business Mall, 300 West Broadway, Suite 13. Call 712-352-3480 or email CouncilBluffsIowaWORKS@iwd.iowa.gov.',
  'free_resource',
  'Iowa residents in Pottawattamie County and Southwest Iowa. Adults (18+) meeting income or employment criteria, dislocated workers, and youth (14–24) with employment barriers are typically eligible for WIOA services. Walk-in or call for current eligibility requirements. Location: Omni Centré Business Mall, 300 W Broadway Suite 13, Council Bluffs IA 51503. Phone: 712-352-3480. Email: CouncilBluffsIowaWORKS@iwd.iowa.gov.',
  NULL,
  'https://workforce.iowa.gov/jobs/iowaworks/iowaworks-council-bluffs',
  'Council Bluffs, IA', '300 W Broadway, Suite 13', 'Council Bluffs', 'IA', '51503',
  false, false,
  '{low_income,first_gen}'::text[], '{workforce_development,WIOA,free_training,ITA,trades_funding,career_support,American_Job_Center,Iowa,council_bluffs,financial_assistance}'::text[], '{post_secondary,adult}'::text[],
  'high', 'verified',
  'https://workforce.iowa.gov/jobs/iowaworks/iowaworks-council-bluffs', 'official_website', '2026-03-24',
  'Omni Centré Business Mall, 300 W Broadway Suite 13, Council Bluffs IA 51503. Phone: 712-352-3480. Email: CouncilBluffsIowaWORKS@iwd.iowa.gov. Serves Pottawattamie County and Southwest Iowa. Partners with IWCC for approved training referrals.',
  true, true, '2026-03-24', '2026-03-24',
  '{"career_field": "workforce_support", "program_type": "wioa_american_job_center", "state": "iowa", "trades_relevant": true, "what_they_fund": ["Individual Training Accounts (ITAs) for approved training", "IWCC trades programs", "Career counseling", "Job placement support"], "dual_state_notes": "IowaWORKS Council Bluffs serves Iowa residents. Nebraska/Omaha residents should use Heartland Workforce Solutions (HWS) at 5752 Ames Ave, Omaha — see separate listing. Do not confuse these — they administer separate state WIOA systems.", "delivery": "in_person", "listing_type": "workforce_support_program", "cost_details": {"amount": 0, "cost_type": "free", "conditions": "Federal WIOA funds — no repayment required for eligible participants"}}'::jsonb
),

-- ── 3. Job Corps Omaha ─────────────────────────────────────────────────────────
-- jobcorps.gov confirmed: active center at 4521 Leavenworth St, Omaha NE 68106,
-- 402-926-2810; free residential program ages 16-24 low-income;
-- national program covering construction, transportation, advanced manufacturing, healthcare;
-- specific Omaha center trade programs require verification via 800-733-JOBS
(
  'Job Corps Omaha — Free Residential Trades Training for Low-Income Youth Ages 16–24',
  'U.S. Department of Labor — Job Corps',
  'https://www.jobcorps.gov',
  'Job Corps is a federally funded, completely free residential education and job training program for young people ages 16–24 who come from low-income backgrounds. It is one of the most consequential free programs available to young people in the Omaha metro who face significant barriers to education and career entry — and it is dramatically underutilized because not enough people know about it. Here is what "free and residential" means: Job Corps provides housing, meals, healthcare, and a living allowance in addition to the training itself. You do not need to pay for anything. The Omaha Job Corps Center is located at 4521 Leavenworth Street. Job Corps nationally offers training across ten industries including Construction, Transportation (including CDL), Advanced Manufacturing, and Health Care — the core trades and vocational sectors covered in this phase. The specific trades programs offered at the Omaha center require direct verification because programs vary by center and change over time. To find out exactly what trades training is currently available at the Omaha center and whether you are eligible, call the Job Corps national line at 1-800-733-JOBS (1-800-733-5627) or visit enroll.jobcorps.gov. If you are a young person, 16–24, from a low-income household, and you do not know what you want to do or how to afford training — this is the conversation to have.',
  'free_resource',
  'Ages 16–24. Must come from a low-income household (income guidelines based on federal poverty level). U.S. citizen, national, or lawful permanent resident. Not currently enrolled in school (or have special circumstances). Drug-free. Program is FREE — housing, meals, healthcare, and living allowance included. Call 1-800-733-JOBS (1-800-733-5627) or visit enroll.jobcorps.gov to apply and confirm current Omaha center program offerings. Center address: 4521 Leavenworth St, Omaha NE 68106, 402-926-2810.',
  NULL,
  'https://www.jobcorps.gov',
  'Omaha, NE', '4521 Leavenworth Street', 'Omaha', 'NE', '68106',
  false, false,
  '{low_income,first_gen,bipoc}'::text[], '{trades,pre_apprenticeship,free_program,residential_program,youth_employment,construction,CDL,manufacturing,healthcare,workforce_development,Job_Corps,ages_16_24}'::text[], '{grade_10,grade_11,grade_12,post_secondary}'::text[],
  'high', 'verified',
  'https://www.jobcorps.gov', 'official_website', '2026-03-24',
  'Free residential program. Ages 16–24. Must meet low-income criteria. Center: 4521 Leavenworth St, Omaha NE 68106, 402-926-2810. National line: 1-800-733-JOBS. Apply at enroll.jobcorps.gov. Specific Omaha center trade programs: call to verify current offerings — programs vary by center.',
  true, true, '2026-03-24', '2026-03-24',
  '{"career_field": "workforce_support", "program_type": "federal_residential_training", "target_population": "low-income youth ages 16-24", "trades_relevant": true, "program_includes": ["Free housing", "Free meals", "Healthcare", "Living allowance", "Vocational training in chosen field", "GED/diploma completion support"], "industries_nationally": ["Construction", "Transportation/CDL", "Advanced Manufacturing", "Health Care", "Homeland Security", "Hospitality", "Information Technology", "Retail Sales", "Finance and Business", "Building and Property Maintenance"], "verification_note": "Specific trades available at the OMAHA center require direct verification — call 800-733-5627 or visit enroll.jobcorps.gov. Programs vary by center.", "dual_state_notes": "Omaha Job Corps center serves Nebraska. Council Bluffs/Iowa residents should verify whether they can attend the Omaha center or whether there is a preferred Iowa center. Call 800-733-5627.", "delivery": "in_person", "listing_type": "federal_program", "cost_details": {"amount": 0, "cost_type": "completely_free", "conditions": "All costs covered for eligible participants — housing, meals, healthcare, training, living allowance"}}'::jsonb
),

-- ── 4. Goodwill Omaha — YouthBuild Pre-Apprenticeship ─────────────────────────
-- goodwillomaha.org/programs/ confirmed: YouthBuild Omaha program active;
-- ages 16-24 without HS diploma; construction trades pre-apprenticeship +
-- GED/diploma completion; Mon-Fri 9am-4pm; free
(
  'Goodwill Omaha — YouthBuild: Construction Pre-Apprenticeship + GED Completion (Free, Ages 16–24)',
  'Goodwill Industries of Greater Omaha',
  'https://goodwillomaha.org/programs/',
  'Goodwill Omaha''s YouthBuild program is one of the most important free resources in this city for young people who have left school without a diploma and want a real path into the trades. YouthBuild is a nationally recognized model that combines two things that are usually kept separate: academic credential completion (GED or high school diploma) and real construction trades pre-apprenticeship training — in the same program, at the same time, for free. Participants build actual houses for low-income and homeless individuals. The construction work is the training. By the time you finish, you have both your academic credential and hands-on construction experience that can open the door to a registered apprenticeship with IBEW, the Carpenters, the Laborers, or other union trades. The program runs Monday through Friday, 9am to 4pm. It is designed for at-risk youth ages 16–24 who do not have a high school diploma. The program is free. This is not a community service program — it is a career-building program that takes the most significant structural barrier that keeps young people out of the trades (no diploma + no experience) and eliminates both at once. Contact Goodwill Omaha for current enrollment and intake information.',
  'free_resource',
  'Ages 16–24. Must not have a high school diploma (working toward GED or diploma through the program). At-risk youth — specific eligibility criteria apply. Free program. Monday–Friday 9am–4pm. Contact Goodwill Omaha: goodwillomaha.org/programs/ or call Goodwill Omaha for current enrollment intake information.',
  NULL,
  'https://goodwillomaha.org/programs/',
  'Omaha, NE', NULL, 'Omaha', 'NE', NULL,
  false, false,
  '{low_income,first_gen,bipoc}'::text[], '{trades,pre_apprenticeship,construction,YouthBuild,GED,diploma,workforce_development,free_program,youth_employment,ages_16_24,housing}'::text[], '{grade_9,grade_10,grade_11,grade_12,post_secondary}'::text[],
  'high', 'verified',
  'https://goodwillomaha.org/programs/', 'official_website', '2026-03-24',
  'Mon–Fri 9am–4pm. Ages 16–24 without a high school diploma. Free program. Combines construction pre-apprenticeship training with GED/diploma completion. Builds homes for low-income/homeless individuals. Contact Goodwill Omaha at goodwillomaha.org/programs/ for current intake.',
  true, true, '2026-03-24', '2026-03-24',
  '{"career_field": "trades", "program_type": "pre_apprenticeship_youthbuild", "target_population": "at-risk youth 16-24 without HS diploma", "dual_components": ["Construction pre-apprenticeship training (hands-on homebuilding)", "GED/high school diploma completion"], "schedule": "Monday-Friday, 9am-4pm", "partner_organization": "Goodwill Industries of Greater Omaha", "dual_state_notes": "Goodwill Omaha''s YouthBuild program serves Omaha Nebraska residents primarily. Council Bluffs Iowa residents should contact the program to verify enrollment eligibility.", "delivery": "in_person", "listing_type": "pre_apprenticeship_program", "cost_details": {"amount": 0, "cost_type": "completely_free"}}'::jsonb
),

-- ── 5. Helmets to Hardhats ────────────────────────────────────────────────────
-- helmetstohardhats.org confirmed: national program connecting veterans to
-- union construction apprenticeships; careers.helmetstohardhats.org portal;
-- 16 trades available; GI Bill compatible; no NE/IA-specific coordinator found —
-- national portal connects to local union apprenticeship programs
(
  'Helmets to Hardhats — Veterans'' Union Trades Apprenticeship Placement (Omaha/Council Bluffs Area)',
  'Helmets to Hardhats',
  'https://helmetstohardhats.org',
  'Helmets to Hardhats (H2H) exists because the skills veterans develop in military service — discipline, technical training, physical ability, working in challenging conditions, following systems, leading teams — translate directly to the trades. H2H is a national program backed by the North America''s Building Trades Unions (NABTU) that connects transitioning active-duty military, National Guard members, Reserve members, and veterans to registered union construction apprenticeships. Sixteen construction trades are available through H2H, including electrical, plumbing, HVAC, ironwork, carpentry, sheet metal, and operating engineers — the same unions with apprenticeship programs in the Omaha/Council Bluffs metro. Veterans create a profile at careers.helmetstohardhats.org, express interest in specific trades and geographic areas, and an H2H representative follows up to connect them with the relevant local union JATC. The actual training and wages are provided by the union apprenticeship itself — H2H is the bridge, not the program. GI Bill benefits can potentially be used alongside apprenticeship wages, creating a dual benefit for eligible veterans. If you are a veteran or separating service member in the Omaha or Council Bluffs area who is interested in construction trades: H2H is a dedicated pathway into the same union apprenticeships that are open to civilian applicants — but with a support structure specifically designed for veterans.',
  'community',
  'Must be a transitioning active-duty service member, National Guard or Reserve member, or veteran. Create a free profile at careers.helmetstohardhats.org and express interest in specific trades and the Omaha/Council Bluffs area. An H2H representative will follow up. GI Bill benefits may be applicable — verify with the specific apprenticeship program. No Nebraska/Iowa specific coordinator — use national portal.',
  NULL,
  'https://helmetstohardhats.org',
  'Omaha/Council Bluffs Metro (national program — remote intake)', NULL, 'Omaha', 'NE', NULL,
  false, true,
  '{veteran}'::text[], '{trades,veteran,apprenticeship,union,helmets_to_hardhats,career_transition,construction,skilled_labor,GI_Bill,council_bluffs_accessible}'::text[], '{post_secondary,adult}'::text[],
  'high', 'verified',
  'https://helmetstohardhats.org', 'official_website', '2026-03-24',
  'National program. Create veteran profile at careers.helmetstohardhats.org. H2H representative connects you with local union JATC. 16 construction trades available. GI Bill may be applicable alongside apprenticeship wages. Backed by North America''s Building Trades Unions (NABTU). No specific Omaha/CB coordinator — use national portal.',
  true, true, '2026-03-24', '2026-03-24',
  '{"career_field": "trades", "program_type": "veteran_apprenticeship_placement", "target_population": "veterans, transitioning military, National Guard, Reserve", "union_affiliated": true, "trades_available_nationally": 16, "gi_bill_compatible": true, "how_it_works": "Veterans profile at H2H careers portal -> H2H rep connects with local union JATC -> Veteran enters union apprenticeship program with H2H support", "local_union_partners": ["IBEW Local 22 (electrical)", "Ironworkers Local 21 (structural steel - covers NE+IA)", "IUOE Local 571 (heavy equipment)", "Laborers Local 1140 (construction)", "SMART Local 3 (sheet metal)", "Carpenters Training Institute (carpentry)", "UA Local 464 (plumbing/pipefitting)"], "dual_state_notes": "H2H is a national program that works with union locals in both Nebraska and Iowa. No state-specific coordinator was found. Veterans in both Omaha and Council Bluffs should use the national portal.", "delivery": "remote_intake_then_in_person", "listing_type": "veteran_placement_program", "cost_details": {"amount": 0, "cost_type": "free", "conditions": "H2H placement service is free. Apprenticeship programs themselves are earn-while-you-learn at no tuition cost."}}'::jsonb
);
