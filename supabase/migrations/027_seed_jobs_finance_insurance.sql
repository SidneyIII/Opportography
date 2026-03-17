-- ============================================================
-- Opportography — Migration 027
-- Phase 11: Finance & Insurance Entry-Level Jobs
-- Research: March 12, 2026
--
-- Omaha is a national leader in finance and insurance —
-- four Fortune 500 HQs, the largest privately held bank in
-- the US (FNBO), and an insurance cluster that employs tens
-- of thousands. These listings cover real entry points
-- accessible with a high school diploma or an associate's/
-- bachelor's degree.
--
-- Hiring status confirmed via employer careers pages and
-- web searches conducted March 12, 2026.
--
-- Listings in this file:
--   1. FNBO Bank Teller (Omaha metro)
--   2. Mutual of Omaha Customer Service Representative
--   3. Physicians Mutual Customer Service
--   4. Mutual of Omaha Claims Processor
--   5. Farm Credit Services of America — General Career Portal
-- ============================================================

INSERT INTO public.opportunities (
  title, organization, organization_website, employer_careers_url,
  description, type, sector, eligibility, link,
  location, city, state, is_remote, is_hybrid,
  identity_tags, category_tags,
  compensation_type, compensation_amount, compensation_frequency,
  education_requirement, career_pathway, hiring_status,
  data_confidence, verification_status,
  source_url, source_type, source_retrieved_date,
  is_active, is_featured
) VALUES

-- ── 1. FNBO Bank Teller ──────────────────────────────────────────────────────
(
  'Bank Teller',
  'First National Bank of Omaha (FNBO)',
  'https://www.fnbo.com',
  'https://www.fnbo.com/careers',
  'FNBO — the largest privately held bank in the United States — is based in Omaha and hires bank tellers across its metro branch network. Tellers process customer transactions at branch locations: deposits, withdrawals, loan payments, cashier checks. You are the first face customers see. No prior banking experience required — they train you. FNBO''s tuition assistance program helps tellers move up to personal banker and beyond. Currently 82 open positions at FNBO.',
  'job',
  'finance_insurance',
  'High school diploma or GED required. No prior banking experience required — FNBO provides paid training. Ability to stand for extended periods and lift up to 25 lbs. Strong customer service and communication skills. Previous cash handling experience is a plus but not required.',
  'https://www.fnbo.com/careers',
  'Omaha metro (multiple branch locations)',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'no_experience', 'paid_training', 'benefits', 'tuition_reimbursement', 'career_ladder', 'full_time', 'omaha', 'finance'],
  'paid',
  'Competitive hourly rate (check posting for current rate)',
  'hourly',
  '{"minimum": "high_school_diploma", "preferred": "Some customer service or cash handling experience preferred", "certifications": [], "notes": "No banking experience required — FNBO provides full paid training. GED accepted."}',
  '{"advancement": "Tellers at FNBO frequently advance to Personal Banker within 18-24 months. Personal Banker roles move into Branch Management or Loan Officer tracks. FNBO has strong promote-from-within culture.", "employer_training": "Paid on-the-job training provided. Tuition assistance program available for ongoing education. Career coaching and job shadowing programs offered.", "typical_next_roles": ["Personal Banker", "Loan Officer Trainee", "Branch Manager Trainee"], "tuition_reimbursement": true, "apprenticeship": false}',
  'confirmed_active',
  'high',
  'verified',
  'https://www.fnbo.com/careers',
  'official_website',
  '2026-03-12',
  true, false
),

-- ── 2. Mutual of Omaha Customer Service Representative ───────────────────────
(
  'Customer Service Representative',
  'Mutual of Omaha',
  'https://www.mutualofomaha.com',
  'https://www.mutualofomaha.com/careers',
  'Mutual of Omaha — a Fortune 500 insurance company headquartered in Omaha — is actively hiring Customer Service Representatives. In this role you handle policyholder and provider inquiries by phone and digital channels, research issues, and process requests. Many positions are remote or hybrid. Mutual of Omaha offers a 401(k) with dollar-for-dollar match up to 6% plus 2%, tuition reimbursement up to $5,250/year, and strong internal promotion pathways. Currently 90+ open positions company-wide. Applications accepted only through mutualofomaha.com/careers.',
  'job',
  'finance_insurance',
  'High school diploma or GED required. Strong verbal and written communication skills. Ability to research and resolve customer issues. Some insurance or customer service experience preferred but not required. Entry-level role with comprehensive paid training.',
  'https://www.mutualofomaha.com/careers/jobs/search',
  'Omaha, NE (remote and hybrid options available)',
  'Omaha', 'NE', false, true,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'no_experience', 'paid_training', 'benefits', 'tuition_reimbursement', 'career_ladder', 'full_time', 'omaha', 'finance', 'remote_option'],
  'paid',
  'Competitive salary (check current posting)',
  'annual',
  '{"minimum": "high_school_diploma", "preferred": "Associate or bachelor degree in business or related field preferred", "certifications": [], "notes": "Entry-level role. GED accepted. Insurance industry experience not required — paid training provided."}',
  '{"advancement": "Customer Service Representatives move into Claims Examiner, Underwriting Assistant, or Team Lead roles. Mutual of Omaha is a large employer with many internal career tracks in insurance, finance, and HR.", "employer_training": "Comprehensive paid training program. Tuition reimbursement up to $5,250/year for full-time employees. Strong promote-from-within culture.", "typical_next_roles": ["Claims Examiner", "Underwriting Assistant", "Team Lead", "Account Manager"], "tuition_reimbursement": true, "apprenticeship": false}',
  'confirmed_active',
  'high',
  'verified',
  'https://www.mutualofomaha.com/careers',
  'official_website',
  '2026-03-12',
  true, false
),

-- ── 3. Physicians Mutual Customer Service ────────────────────────────────────
(
  'Customer Service Representative (Part-Time or Full-Time)',
  'Physicians Mutual',
  'https://www.physiciansmutual.com',
  'https://careers.physiciansmutual.com',
  'Physicians Mutual is an insurance company headquartered in Omaha, founded 1902 and still privately held. They offer life, health, and dental insurance products, and regularly hire customer service staff. Current postings include part-time Customer Service opportunities. Physicians Mutual is known for a stable, professional work environment with full benefits and a straightforward application process. 14 current open positions across the company.',
  'job',
  'finance_insurance',
  'High school diploma or GED required. Customer service experience helpful but not required. Strong communication skills. Comfortable working with customers by phone or in writing.',
  'https://careers.physiciansmutual.com',
  'Omaha, NE',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'benefits', 'full_time', 'part_time', 'omaha', 'finance'],
  'paid',
  'Competitive hourly rate (check current posting)',
  'hourly',
  '{"minimum": "high_school_diploma", "preferred": "Some customer service experience preferred", "certifications": [], "notes": "GED accepted. Part-time options available."}',
  '{"advancement": "Customer service staff at insurance companies can move into claims processing, underwriting support, or administrative roles with experience. Physicians Mutual is a stable employer with long employee tenure.", "employer_training": "On-the-job training provided. Benefits include health insurance and retirement contributions.", "typical_next_roles": ["Claims Processor", "Account Services Representative", "Team Lead"], "tuition_reimbursement": false, "apprenticeship": false}',
  'confirmed_active',
  'high',
  'verified',
  'https://careers.physiciansmutual.com',
  'official_website',
  '2026-03-12',
  true, false
),

-- ── 4. Mutual of Omaha Claims Processor / Examiner ───────────────────────────
(
  'Claims Processor / Claims Examiner (Entry Level)',
  'Mutual of Omaha',
  'https://www.mutualofomaha.com',
  'https://www.mutualofomaha.com/careers',
  'Mutual of Omaha hires entry-level Claims staff to evaluate and process insurance claims accurately and on time. You review submitted claims documentation, verify coverage, apply policy terms, and communicate decisions to customers and providers. Mutual of Omaha offers internship pathways in claims for students, but also hires entry-level full-time Claims Examiners. This is one of the clearest career ladders in Omaha insurance — Claims Examiner to Senior Examiner to Supervisor with salary growth at each step.',
  'job',
  'finance_insurance',
  'Associate or bachelor degree in business, finance, or related field preferred. High school diploma plus relevant experience considered. Strong analytical and attention-to-detail skills. Ability to read and apply insurance policy language after training.',
  'https://www.mutualofomaha.com/careers/jobs/search',
  'Omaha, NE (hybrid options available)',
  'Omaha', 'NE', false, true,
  array[]::text[],
  array['jobs', 'entry_level', 'associates_degree', 'bachelors_degree', 'benefits', 'tuition_reimbursement', 'career_ladder', 'full_time', 'omaha', 'finance'],
  'paid',
  'Competitive salary (check current posting)',
  'annual',
  '{"minimum": "high_school_diploma", "preferred": "Associate or bachelor degree in business, finance, or healthcare administration preferred", "certifications": [], "notes": "Experience in customer service, data entry, or healthcare billing also considered."}',
  '{"advancement": "Claims Examiner → Senior Claims Examiner → Claims Supervisor → Claims Manager. One of the clearest internal career ladders in insurance. Mutual of Omaha actively promotes from within.", "employer_training": "Comprehensive claims training provided. Tuition reimbursement up to $5,250/year. Career coaching available.", "typical_next_roles": ["Senior Claims Examiner", "Claims Supervisor", "Underwriter", "Account Manager"], "tuition_reimbursement": true, "apprenticeship": false}',
  'likely_active',
  'high',
  'verified',
  'https://www.mutualofomaha.com/careers',
  'official_website',
  '2026-03-12',
  true, false
),

-- ── 5. Farm Credit Services of America ───────────────────────────────────────
(
  'Entry-Level Positions — Farm Credit Services of America',
  'Farm Credit Services of America',
  'https://www.fcsamerica.com',
  'https://www.fcsamerica.com/about/careers',
  'Farm Credit Services of America is a major agricultural lending cooperative headquartered in Omaha that provides loans, insurance, and financial services to farmers, ranchers, and rural residents across Iowa, Nebraska, South Dakota, and Wyoming. They hire entry-level staff in customer service, data analysis, loan processing, and administrative support. FCSAmerica offers competitive pay, strong benefits, and a stable work environment — they have operated continuously for over 100 years. Visit their careers page for current entry-level openings.',
  'job',
  'finance_insurance',
  'Education requirements vary by role. Customer service and administrative roles typically require a high school diploma or GED. Financial analyst and loan officer trainee roles typically require a bachelor degree in finance, agribusiness, or a related field.',
  'https://www.fcsamerica.com/about/careers',
  'Omaha, NE',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'bachelors_degree', 'benefits', 'career_ladder', 'full_time', 'omaha', 'finance'],
  'paid',
  'Competitive salary (see current posting)',
  'annual',
  '{"minimum": "high_school_diploma", "preferred": "Bachelor degree in finance, agribusiness, accounting, or business for professional roles", "certifications": [], "notes": "Entry-level support roles accessible with high school diploma. Professional tracks require bachelor degree."}',
  '{"advancement": "Administrative and customer service staff can move into loan processing and account management roles. Finance graduates can progress from analyst to loan officer to branch management.", "employer_training": "Comprehensive on-boarding and ongoing training. Tuition assistance available. Strong mentorship program.", "typical_next_roles": ["Loan Processor", "Financial Analyst", "Loan Officer", "Branch Manager"], "tuition_reimbursement": true, "apprenticeship": false}',
  'check_careers_page',
  'medium',
  'needs_confirmation',
  'https://www.fcsamerica.com/about/careers',
  'official_website',
  '2026-03-12',
  true, false
);
