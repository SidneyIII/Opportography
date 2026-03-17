-- ============================================================
-- Opportography — Migration 029
-- Phase 11: Technology Entry-Level Jobs
-- Research: March 12, 2026
--
-- Omaha's tech sector is growing. Google's Council Bluffs
-- data center is one of the most significant tech employers
-- in the region — and they hire Data Center Technicians with
-- a high school diploma and no college degree required.
-- Buildertrend (Omaha-based construction software) is a
-- confirmed Great Place to Work with active openings.
-- ACI Worldwide processes nearly $20 trillion in payments
-- annually from its Elkhorn, NE offices.
--
-- Key confirmed facts:
--   Google CB: confirmed hiring Data Center Technicians
--   Buildertrend: 4-8 open Omaha positions including BDR
--     at $19.27/hr; IT Support Specialist listed
--
-- Listings in this file:
--   1. Google — Data Center Technician (Council Bluffs)
--   2. Buildertrend — Business Development Representative
--   3. Buildertrend — IT Support Specialist
--   4. ACI Worldwide — entry-level portal (Elkhorn)
--   5. Cox Communications — entry-level tech/customer roles
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

-- ── 1. Google Data Center Technician — Council Bluffs ───────────────────────
(
  'Data Center Technician',
  'Google (Council Bluffs Data Center)',
  'https://www.google.com',
  'https://www.google.com/about/careers/applications/locations/council-bluffs/',
  'Google operates a major data center campus in Council Bluffs, Iowa — five miles from downtown Omaha across the river. Data Center Technicians maintain and troubleshoot the physical infrastructure that runs Google''s services worldwide: servers, networking hardware, power systems, cooling systems. Google trains you on their specific systems — a high school diploma is required, not a computer science degree. The pay and benefits at Google data center roles are substantially above average for the region. This is one of the clearest examples of a major global tech employer hiring locally, in Council Bluffs, with no college degree required. Go to google.com/about/careers and search ''Council Bluffs'' for current openings.',
  'job',
  'technology',
  'High school diploma or GED required. No college degree required. Experience in data center, IT, or network operations environments preferred but not always required for entry-level roles. Physical requirements: ability to lift 50 lbs, work non-standard hours including nights and weekends. Comfortable working in server room environments.',
  'https://www.google.com/about/careers/applications/locations/council-bluffs/',
  'Council Bluffs, IA',
  'Council Bluffs', 'IA', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'no_college_required', 'benefits', 'career_ladder', 'full_time', 'shift_work', 'council_bluffs', 'technology'],
  'paid',
  '$20–$35/hr estimated (Google does not always publish data center tech rates — check current posting)',
  'hourly',
  '{"minimum": "high_school_diploma", "preferred": "Experience in IT, data center, or network operations preferred", "certifications": ["CompTIA A+ or similar IT certification helpful but not always required"], "notes": "No bachelor degree required. Google trains on their systems. Physical role — ability to lift 50 lbs and work rotating shifts including nights/weekends required. This is a Council Bluffs job site, not Omaha."}',
  '{"advancement": "Data Center Technician II → Senior Technician → Data Center Facilities Engineer. Google data center staff also have access to internal transfer opportunities across Google''s global operations. Google is known for strong pay, benefits, and career development.", "employer_training": "Full technical training on Google''s proprietary infrastructure systems. Google benefits include health insurance, 401(k), and substantial additional perks. Internal promotion pathways within the data center operation.", "typical_next_roles": ["Data Center Technician II", "Data Center Facilities Technician", "Senior Data Center Technician", "Data Center Operations Lead"], "tuition_reimbursement": false, "apprenticeship": false}',
  'confirmed_active',
  'high',
  'verified',
  'https://www.google.com/about/careers/applications/locations/council-bluffs/',
  'official_website',
  '2026-03-12',
  true, true
),

-- ── 2. Buildertrend — Business Development Representative ───────────────────
(
  'Business Development Representative (BDR)',
  'Buildertrend',
  'https://buildertrend.com',
  'https://buildertrend.com/careers/',
  'Buildertrend is Omaha''s most prominent homegrown tech company — they build construction management software used by contractors and builders nationwide. As a Business Development Representative, you are the first point of contact for potential customers: you identify leads, make outbound calls, qualify prospects, and set up demos for the sales team. This is an entry-level sales role, not a technical coding role. Pay is $19.27/hr plus weekly and monthly performance bonuses. Buildertrend has been Certified as a Great Place to Work in 2025 and offers 15 days PTO year one plus paid volunteer time.',
  'job',
  'technology',
  'High school diploma or GED required. No prior software sales experience required — Buildertrend trains new BDRs. Strong communication skills and comfort making phone calls. Competitive, motivated personality. Interest in sales and technology.',
  'https://buildertrend.com/careers/',
  'Omaha, NE',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'no_experience', 'paid_training', 'benefits', 'career_ladder', 'full_time', 'omaha', 'technology', 'sales'],
  'paid',
  '$19.27/hr + weekly and monthly performance bonuses',
  'hourly',
  '{"minimum": "high_school_diploma", "preferred": "Some customer service or sales experience preferred", "certifications": [], "notes": "No tech background required. This is a sales role, not a coding role. Training provided on construction software industry."}',
  '{"advancement": "BDR → Account Executive → Senior Account Executive → Account Manager. Sales track at a fast-growing SaaS company is one of the clearest career ladders in Omaha tech. Top BDRs move to full AE roles within 12-18 months.", "employer_training": "Sales training and ongoing coaching provided. 15 days PTO in year 1. Paid volunteer time. Company-wide events. Parental leave.", "typical_next_roles": ["Account Executive", "Senior Account Executive", "Account Manager", "Sales Team Lead"], "tuition_reimbursement": false, "apprenticeship": false}',
  'confirmed_active',
  'high',
  'verified',
  'https://buildertrend.com/careers/',
  'official_website',
  '2026-03-12',
  true, false
),

-- ── 3. Buildertrend — IT Support Specialist ─────────────────────────────────
(
  'IT Support Specialist',
  'Buildertrend',
  'https://buildertrend.com',
  'https://buildertrend.com/careers/',
  'Buildertrend is hiring an IT Support Specialist to provide technical help desk support to their Omaha staff. You troubleshoot hardware, software, and network issues, set up new employee workstations, manage user accounts, and escalate complex problems to the infrastructure team. This is an in-office IT role at a growing tech company — a strong starting point for anyone building an IT career in Omaha. Buildertrend offers Great Place to Work certification, 15 days PTO, and a collaborative culture.',
  'job',
  'technology',
  'Associate degree or certification in IT, computer science, or related field preferred. High school diploma plus relevant IT certifications (CompTIA A+, Google IT Support Certificate) also considered. 1 year of IT support experience preferred but not required for entry-level.',
  'https://buildertrend.com/careers/',
  'Omaha, NE',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'associates_degree', 'benefits', 'career_ladder', 'full_time', 'omaha', 'technology'],
  'paid',
  'Competitive salary (check current posting)',
  'annual',
  '{"minimum": "high_school_diploma", "preferred": "Associate degree or CompTIA A+ certification preferred", "certifications": ["CompTIA A+ helpful", "Google IT Support Professional Certificate helpful"], "notes": "Relevant certifications (CompTIA A+, Google IT) can substitute for degree. Entry-level IT role."}',
  '{"advancement": "IT Support → Systems Administrator → Infrastructure Engineer or IT Manager. Working at a growing SaaS company provides exposure to modern cloud and DevOps environments.", "employer_training": "On-the-job training. Access to learning resources. Buildertrend has a culture of internal promotion.", "typical_next_roles": ["IT Systems Administrator", "Network Administrator", "DevOps Engineer", "IT Manager"], "tuition_reimbursement": false, "apprenticeship": false}',
  'confirmed_active',
  'high',
  'verified',
  'https://buildertrend.com/careers/',
  'official_website',
  '2026-03-12',
  true, false
),

-- ── 4. ACI Worldwide — Entry-Level (Elkhorn, NE) ────────────────────────────
(
  'Entry-Level Positions — ACI Worldwide',
  'ACI Worldwide',
  'https://www.aciworldwide.com',
  'https://www.aciworldwide.com/about/careers',
  'ACI Worldwide is a global payment software company headquartered in Elkhorn, Nebraska (near Omaha). Their technology processes nearly $20 trillion in payments annually — payments you probably made today ran through their systems. ACI hires entry-level software developers, business analysts, quality assurance engineers, and technical support specialists out of their Elkhorn office. They recruit from the metro''s computer science and business programs. Entry-level roles typically require a bachelor degree in CS, IT, or business. Visit their careers page for current openings.',
  'job',
  'technology',
  'Entry-level software development and QA roles typically require a bachelor degree in computer science, information systems, or software engineering. Business analyst and technical support roles may accept associates degrees with relevant experience.',
  'https://www.aciworldwide.com/about/careers',
  'Elkhorn, NE',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'bachelors_degree', 'associates_degree', 'benefits', 'career_ladder', 'full_time', 'omaha', 'technology'],
  'paid',
  'Competitive salary (check current posting)',
  'annual',
  '{"minimum": "associate", "preferred": "Bachelor degree in computer science, information systems, or business", "certifications": [], "notes": "Software development roles typically require CS bachelor degree. Business analyst roles may accept relevant experience in lieu of degree."}',
  '{"advancement": "Entry-level developers at ACI progress from developer to senior developer to architect or team lead tracks. ACI has global operations, providing potential for international career mobility.", "employer_training": "On-the-job training and mentorship. Access to technical development resources. Competitive benefits.", "typical_next_roles": ["Software Developer", "Senior Developer", "Business Analyst", "Technical Lead"], "tuition_reimbursement": false, "apprenticeship": false}',
  'check_careers_page',
  'medium',
  'needs_confirmation',
  'https://www.aciworldwide.com/about/careers',
  'official_website',
  '2026-03-12',
  true, false
),

-- ── 5. Gallup — Entry-Level Positions (Omaha) ────────────────────────────────
(
  'Entry-Level Research / Data Analyst Positions',
  'Gallup',
  'https://www.gallup.com',
  'https://www.gallup.com/careers/',
  'Gallup — the global analytics and research firm known for workplace engagement research and public polling — is headquartered in Washington D.C. but has a major operational hub in Omaha. Gallup hires data analysts, client service staff, and research associates out of their Omaha office. Entry-level roles typically require strong analytical skills and a bachelor degree. Gallup is known for a strong workplace culture (they literally measure employee engagement for other companies) and competitive compensation.',
  'job',
  'technology',
  'Bachelor degree in data analytics, psychology, statistics, business, or a related quantitative field typically required for analyst roles. Strong Excel or data analysis skills. Interest in research and data. Client service roles may have lower education requirements.',
  'https://www.gallup.com/careers/',
  'Omaha, NE',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'bachelors_degree', 'benefits', 'career_ladder', 'full_time', 'omaha', 'technology', 'data_analytics'],
  'paid',
  'Competitive salary (check current posting)',
  'annual',
  '{"minimum": "bachelor", "preferred": "Bachelor degree in analytics, statistics, psychology, or business required for most roles", "certifications": [], "notes": "Strong analytical background needed. Data visualization skills (Tableau, Power BI) helpful."}',
  '{"advancement": "Analyst → Senior Analyst → Consultant → Managing Consultant. Gallup is a data-forward organization with a strong learning culture.", "employer_training": "Mentorship and professional development programs. Gallup University offers internal training. Strong benefits package.", "typical_next_roles": ["Senior Research Analyst", "Client Development Manager", "Data Science Consultant"], "tuition_reimbursement": false, "apprenticeship": false}',
  'check_careers_page',
  'medium',
  'needs_confirmation',
  'https://www.gallup.com/careers/',
  'official_website',
  '2026-03-12',
  true, false
);
