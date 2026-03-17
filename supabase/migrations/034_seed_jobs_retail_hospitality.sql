-- ============================================================
-- Opportography — Migration 034
-- Phase 11: Retail, Hospitality & Customer Service Jobs
-- Research: March 12, 2026
--
-- Nebraska Furniture Mart (Berkshire Hathaway subsidiary) is
-- the largest furniture retailer in North America and an
-- Omaha institution. The three Council Bluffs casinos
-- (Horseshoe, Ameristar, Harrah's — all Caesars Entertainment)
-- are major CB employers.
--
-- Key confirmed facts:
--   NFM: Delivery Specialist and Flooring Specialist confirmed,
--     $18.77–$22.80/hr, nfm.com/careers
--   Horseshoe/Harrah's CB: 28 open positions including Security
--     Officer, Beverage Server, Host/Hostess; shared Caesars portal
--   Hy-Vee: confirmed Council Bluffs locations, major regional
--     grocery employer
--
-- Listings in this file:
--   1. Nebraska Furniture Mart — Delivery Specialist
--   2. Nebraska Furniture Mart — Sales/Floor Associate
--   3. Horseshoe & Harrah's Council Bluffs — Floor/Guest Services
--   4. Ameristar Casino Council Bluffs — General Portal
--   5. Hy-Vee — Entry-Level Store Associate (Council Bluffs)
--   6. Hilton Omaha — Hotel Front Desk / Guest Services
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

-- ── 1. Nebraska Furniture Mart — Delivery Specialist ────────────────────────
(
  'Delivery Specialist',
  'Nebraska Furniture Mart',
  'https://www.nfm.com',
  'https://www.nfm.com/careers/',
  'Nebraska Furniture Mart is a Berkshire Hathaway company and the largest home furnishings retailer in North America — their Omaha store covers 77 acres. Delivery Specialists load and deliver furniture and appliances to customers'' homes, handle installation and setup, and ensure a quality customer experience at delivery. Physical role: loading, driving, and delivering large items. Pay is $18.77–$22.80/hr, which is above average for delivery work in the metro. NFM is known for a strong employee culture and competitive benefits. Confirmed current openings.',
  'job',
  'retail_hospitality',
  'High school diploma or GED required. Valid driver license required (CDL may be required for larger delivery vehicles — check specific posting). Ability to lift 50+ lbs and move heavy furniture with team. No prior delivery experience required — training provided.',
  'https://www.nfm.com/careers/',
  'Omaha, NE',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'no_experience', 'paid_training', 'benefits', 'career_ladder', 'full_time', 'omaha', 'retail'],
  'paid',
  '$18.77–$22.80/hr',
  'hourly',
  '{"minimum": "high_school_diploma", "preferred": "Delivery or driving experience preferred", "certifications": ["Valid driver license required; CDL may be required for large vehicle routes"], "notes": "Pay confirmed at $18.77–$22.80/hr range. Physical delivery role. NFM is a Berkshire Hathaway subsidiary with strong benefits."}',
  '{"advancement": "Delivery Specialist → Senior Delivery Specialist → Delivery Supervisor → Operations Manager. NFM is large enough to offer many internal advancement pathways across delivery, warehouse, sales, and management.", "employer_training": "Paid training on delivery procedures, customer service, and product handling. Full benefits: health insurance, 401(k), employee discount, paid time off.", "typical_next_roles": ["Senior Delivery Specialist", "Delivery Supervisor", "Warehouse Coordinator", "Customer Service Specialist"], "tuition_reimbursement": false, "apprenticeship": false}',
  'confirmed_active',
  'high',
  'verified',
  'https://www.nfm.com/careers/',
  'official_website',
  '2026-03-12',
  true, false
),

-- ── 2. Nebraska Furniture Mart — Flooring Specialist / Sales ────────────────
(
  'Flooring Specialist / Sales Associate',
  'Nebraska Furniture Mart',
  'https://www.nfm.com',
  'https://www.nfm.com/careers/',
  'NFM hires Flooring Specialists to help customers select flooring products — carpet, hardwood, tile, laminate — and process sales. This is a customer-facing sales and service role on the showroom floor. You learn product knowledge, assist with measurements and estimates, and build ongoing customer relationships. NFM pays competitive commission-eligible rates and provides full product training. Confirmed current opening.',
  'job',
  'retail_hospitality',
  'High school diploma or GED required. Strong customer service and communication skills. Interest in home improvement or interior products helpful. No prior flooring or sales experience required — NFM provides full product training.',
  'https://www.nfm.com/careers/',
  'Omaha, NE',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'no_experience', 'paid_training', 'benefits', 'career_ladder', 'full_time', 'omaha', 'retail'],
  'paid',
  '$18.77–$22.80/hr base (commission potential on top)',
  'hourly',
  '{"minimum": "high_school_diploma", "preferred": "Retail or customer service experience preferred", "certifications": [], "notes": "Product training provided. Commission structure on top of base pay possible. NFM employee discount."}',
  '{"advancement": "Sales Associate → Senior Associate → Department Lead → Assistant Manager. Top sales performers at NFM earn substantially more through commission. NFM is large enough to promote into management.", "employer_training": "Comprehensive product training on NFM''s flooring inventory. Full benefits. Employee discount on products.", "typical_next_roles": ["Senior Sales Associate", "Department Lead", "Assistant Store Manager"], "tuition_reimbursement": false, "apprenticeship": false}',
  'confirmed_active',
  'high',
  'verified',
  'https://www.nfm.com/careers/',
  'official_website',
  '2026-03-12',
  true, false
),

-- ── 3. Horseshoe & Harrah's Council Bluffs — Guest Services / Gaming ─────────
(
  'Casino Floor Staff — Security, Beverage Server, Guest Services',
  'Caesars Entertainment — Horseshoe & Harrah''s Council Bluffs',
  'https://www.caesars.com',
  'https://edmn.fa.us2.oraclecloud.com/hcmUI/CandidateExperience/en/sites/CX_1/pages/24061',
  'Horseshoe Casino and Harrah''s Council Bluffs are both owned by Caesars Entertainment and operate under the same careers portal. Combined, they are major employers in the Council Bluffs area with 28 current open positions. Entry-level roles include Security Officer (monitor gaming floor, handle guest incidents), Beverage Server (full and part-time, including overnight), Host/Hostess (guest experience in restaurants), Casino Services staff (handling cash transactions), and Server Assistant. Caesars promotes from within and offers affordable healthcare through an on-site Caesars Health Center at the property.',
  'job',
  'retail_hospitality',
  'High school diploma or GED required for most positions. Must be 21+ to work on gaming floor (Iowa gaming regulation). Security Officer roles may require security guard registration or be willing to obtain it. Beverage server roles typically require 21+.',
  'https://edmn.fa.us2.oraclecloud.com/hcmUI/CandidateExperience/en/sites/CX_1/pages/24061',
  'Council Bluffs, IA',
  'Council Bluffs', 'IA', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'no_experience', 'paid_training', 'benefits', 'career_ladder', 'full_time', 'part_time', 'shift_work', 'council_bluffs', 'hospitality', 'gaming'],
  'paid',
  'Competitive hourly rate + tips for service roles (check current posting)',
  'hourly',
  '{"minimum": "high_school_diploma", "preferred": "Customer service or hospitality experience preferred", "certifications": [], "notes": "Must be 21+ for gaming floor and beverage service roles per Iowa gaming regulations. On-site Caesars Health Center for benefits. 28 current openings confirmed."}',
  '{"advancement": "Caesars Entertainment has a strong promote-from-within culture. Entry-level gaming floor and hospitality staff can advance to supervisory roles, pit management, or hospitality management. Caesars is a large company with properties nationally — internal transfer opportunities exist.", "employer_training": "Training on Iowa gaming regulations, customer service standards, and role-specific procedures. On-site health center. Affordable healthcare plans.", "typical_next_roles": ["Supervisor", "Pit Manager (gaming)", "Food & Beverage Manager", "Hospitality Manager"], "tuition_reimbursement": false, "apprenticeship": false}',
  'confirmed_active',
  'high',
  'verified',
  'https://edmn.fa.us2.oraclecloud.com/hcmUI/CandidateExperience/en/sites/CX_1/pages/24061',
  'official_website',
  '2026-03-12',
  true, true
),

-- ── 4. Ameristar Casino Council Bluffs ──────────────────────────────────────
(
  'Casino & Hotel Staff — Entry Level',
  'Ameristar Casino Resort Spa Council Bluffs',
  'https://www.bwresortscasinos.com',
  'https://www.bwresortscasinos.com/careers/',
  'Ameristar Casino Resort Spa is Council Bluffs'' largest casino property, operated by Boyd Gaming. They hire entry-level staff across gaming, food & beverage, hotel front desk, spa, and security. Ameristar is a full resort property with a hotel, multiple restaurants, an event center, and a spa — providing more varied entry-level employment options than a standalone casino. Boyd Gaming offers comprehensive benefits including health insurance, 401(k), and employee dining. Must be 21+ for gaming floor positions per Iowa regulations.',
  'job',
  'retail_hospitality',
  'High school diploma or GED required. Must be 21+ for gaming floor positions. No prior casino experience required for most entry-level roles — training provided. Customer service or hospitality experience helpful.',
  'https://www.bwresortscasinos.com/careers/',
  'Council Bluffs, IA',
  'Council Bluffs', 'IA', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'no_experience', 'paid_training', 'benefits', 'career_ladder', 'full_time', 'part_time', 'shift_work', 'council_bluffs', 'hospitality', 'gaming'],
  'paid',
  'Competitive hourly rate + tips for service roles (check current posting)',
  'hourly',
  '{"minimum": "high_school_diploma", "preferred": "Hospitality or customer service experience preferred", "certifications": [], "notes": "21+ required for gaming floor. Iowa gaming regulations apply. Boyd Gaming careers portal."}',
  '{"advancement": "Entry floor staff to supervisory roles. Hotel front desk to guest services management. Ameristar is a full resort with many advancement pathways.", "employer_training": "Role-specific training on Iowa gaming regulations and service standards. Full benefits through Boyd Gaming.", "typical_next_roles": ["Floor Supervisor", "Hotel Supervisor", "Food & Beverage Supervisor", "Security Supervisor"], "tuition_reimbursement": false, "apprenticeship": false}',
  'check_careers_page',
  'medium',
  'needs_confirmation',
  'https://www.bwresortscasinos.com/careers/',
  'official_website',
  '2026-03-12',
  true, false
),

-- ── 5. Hy-Vee — Store Associate (Council Bluffs) ────────────────────────────
(
  'Store Associate — Grocery, Deli, Bakery, or Pharmacy Tech',
  'Hy-Vee',
  'https://www.hy-vee.com',
  'https://www.hy-vee.com/our-company/careers/',
  'Hy-Vee is a 100% employee-owned regional grocery chain with multiple locations in Council Bluffs and the Omaha metro. Entry-level positions span every department: cashier, grocery stocker, deli associate, bakery, meat department, floral, and pharmacy technician (with certification). Hy-Vee''s employee ownership model means that every employee owns a piece of the company and benefits from its profits. The pharmacy technician track requires national certification (PTCB exam — Hy-Vee supports this) and pays substantially more than other store roles. Strong benefits for full-time staff.',
  'job',
  'retail_hospitality',
  'No education requirement for most store associate positions. Pharmacy Technician requires PTCB certification or enrollment in a pharmacy technician program. Must be 16+ for most positions; 18+ for some departments. No prior grocery or retail experience required.',
  'https://www.hy-vee.com/our-company/careers/',
  'Council Bluffs, IA (multiple locations)',
  'Council Bluffs', 'IA', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'no_education_required', 'no_experience', 'benefits', 'career_ladder', 'full_time', 'part_time', 'council_bluffs', 'retail'],
  'paid',
  'Competitive hourly rate — pharmacy tech pays more than general store (check current posting)',
  'hourly',
  '{"minimum": "none_specified", "preferred": "PTCB certification for pharmacy tech positions", "certifications": ["PTCB Pharmacy Technician certification required for pharmacy tech roles (Hy-Vee supports obtaining it)"], "notes": "Employee-owned company. Council Bluffs locations. Pharmacy tech pays significantly more — certification is worth pursuing."}',
  '{"advancement": "Store Associate → Department Lead → Assistant Department Manager → Department Manager → Store Manager. Hy-Vee promotes from within at every level. Their employee ownership model means every advancement also increases your share of company profits.", "employer_training": "On-the-job training. Hy-Vee supports pharmacy tech certification for interested employees. Employee ownership profit-sharing.", "typical_next_roles": ["Department Lead", "Assistant Department Manager", "Department Manager", "Pharmacy Technician (with certification)"], "tuition_reimbursement": false, "apprenticeship": false}',
  'likely_active',
  'high',
  'verified',
  'https://www.hy-vee.com/our-company/careers/',
  'official_website',
  '2026-03-12',
  true, false
),

-- ── 6. Hilton Omaha — Hotel Front Desk / Guest Services ─────────────────────
(
  'Front Desk Agent / Guest Services',
  'Hilton Omaha',
  'https://www.hilton.com',
  'https://jobs.hilton.com',
  'Hilton Omaha is a large full-service hotel in downtown Omaha connected to the Convention Center. Front Desk Agents check guests in and out, handle room assignments and billing, answer questions, and resolve issues. This is an entry-level hospitality role that provides genuine career-building experience in hotel management. Hilton is one of the largest hotel companies in the world with thousands of properties — a strong starting point for a hospitality career with potential to move to properties nationally. Hotel staff benefits include Hilton GoHilton travel discounts across thousands of properties worldwide.',
  'job',
  'retail_hospitality',
  'High school diploma or GED required. Strong customer service and communication skills. Comfortable with computers and basic property management software (training provided). No prior hotel experience required.',
  'https://jobs.hilton.com',
  'Omaha, NE (downtown)',
  'Omaha', 'NE', false, false,
  array[]::text[],
  array['jobs', 'entry_level', 'high_school_diploma', 'no_experience', 'paid_training', 'benefits', 'career_ladder', 'full_time', 'part_time', 'shift_work', 'omaha', 'hospitality'],
  'paid',
  'Competitive hourly rate (check current posting)',
  'hourly',
  '{"minimum": "high_school_diploma", "preferred": "Customer service experience preferred", "certifications": [], "notes": "Shift work including evenings and weekends typical in hotel front desk. Hilton GoHilton travel discounts for employees — significant benefit for travel."}',
  '{"advancement": "Front Desk Agent → Front Desk Supervisor → Assistant Front Office Manager → Front Office Manager → General Manager. Hospitality management track. Hilton''s global footprint means internal transfers to other properties and markets are possible.", "employer_training": "Paid training on Hilton systems and service standards. Hilton GoHilton travel discounts. Career development programs. Health insurance and 401(k).", "typical_next_roles": ["Front Desk Supervisor", "Guest Services Manager", "Reservations Manager", "Assistant General Manager"], "tuition_reimbursement": false, "apprenticeship": false}',
  'check_careers_page',
  'medium',
  'needs_confirmation',
  'https://jobs.hilton.com',
  'official_website',
  '2026-03-12',
  true, false
);
