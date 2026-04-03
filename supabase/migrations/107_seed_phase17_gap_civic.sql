-- ============================================================
-- Opportography — Migration 107
-- Phase 17 Closure — Gap Fill: Category 5 Civic Engagement
-- Date: 2026-04-02
--
-- 2 verified entries:
--   1. City of Council Bluffs — Boards & Commissions
--      (open appointment process, rolling vacancies)
--   2. Pottawattamie County, Iowa — Boards & Commissions
--      (Supervisors appoint members, applications open)
--
-- NOT duplicating (already in DB):
--   - League of Women Voters of Greater Omaha (migration 010)
--   - Civic Nebraska (migration 010)
--   - City of Omaha boards/commissions: not yet in DB
--     (candidate for a future civic engagement expansion phase)
--
-- RESEARCHED BUT EXCLUDED:
--   - OPS student advisory council: OPS has an established
--     Student Advisory Council but it is for currently enrolled
--     OPS students only, not post-graduates or non-enrolled
--     young adults. Not broad enough for platform scope.
--   - City of Omaha participatory budgeting: No active open
--     cycle confirmed as of April 2026 research. Candidate for
--     future sprint when a cycle is announced.
--   - Neighborhood association vacancies: No single registry of
--     open leadership seats found with a stable URL and current
--     vacancy listings. Omaha Planning Dept neighborhood
--     association page lists associations but not seat vacancies.
--
-- Sources verified 2026-04-02:
--   - councilbluffs-ia.gov/94/Boards-Commissions (CB official)
--   - pottcounty-ia.gov/supervisors/boards_and_commissions/
--     (Pottawattamie County official)
--
-- Confidence:
--   Entry 1 (CB): 0.87 — official city page confirmed, boards
--     and application process documented.
--   Entry 2 (Pott. Co.): 0.85 — county page confirmed; vacancy
--     listing process involves contacting the county directly.
-- ============================================================

INSERT INTO public.opportunities (
  title, organization, organization_website, description,
  type, eligibility, deadline, link,
  location, address, city, state, zip,
  is_remote, is_hybrid,
  identity_tags, category_tags, grade_levels,
  data_confidence, verification_status,
  source_url, source_type, source_retrieved_date,
  schedule, audience_type,
  organization_type,
  is_active, is_featured, date_added, last_verified,
  metro_area_id,
  cb_eligibility
) VALUES

-- ── 1. City of Council Bluffs Boards & Commissions ───────────
(
  'City of Council Bluffs — Apply for an Appointed Board or Commission Seat',
  'City of Council Bluffs, Iowa',
  'https://www.councilbluffs-ia.gov',
  'The City of Council Bluffs appoints residents to a range of advisory boards and commissions that help shape city decisions on parks, planning, housing, historic preservation, and more. Boards include the Historic Preservation Commission, Parks and Recreation Commission, City Planning Commission, Board of Library Trustees, Municipal Housing Agency, and others. Appointments are volunteer positions — no pay, but real influence over how the city operates. If you live in Council Bluffs and want to participate in local governance, applying for a board or commission seat is one of the most direct ways to do it. The application process and current vacancies are listed at the City''s official Boards & Commissions page. Vacancies occur on a rolling basis as terms expire.',
  'free_resource',
  'Must be a resident of the City of Council Bluffs, Iowa. Specific eligibility requirements vary by board (some require residency only; others may require professional qualifications). Applications and current vacancy listings are available at councilbluffs-ia.gov/94/Boards-Commissions. Contact the City Clerk''s office at (712) 328-4629 for information on open seats.',
  NULL,
  'https://www.councilbluffs-ia.gov/94/Boards-Commissions',
  'Council Bluffs, IA', '209 Pearl St', 'Council Bluffs', 'IA', '51503',
  false, false,
  '{}'::text[],
  '{civic_engagement,local_government,volunteer,appointed_boards,commissions,Council_Bluffs,Iowa,civic_leadership}'::text[],
  '{}'::text[],
  'high', 'verified',
  'https://www.councilbluffs-ia.gov/94/Boards-Commissions', 'official_website', '2026-04-02',
  'Rolling vacancies as terms expire. Check councilbluffs-ia.gov/94/Boards-Commissions for current openings. City Council meets twice monthly — appointments typically approved at City Council meetings.',
  'community_all',
  'government_program',
  true, false, '2026-04-02', '2026-04-02',
  1,
  '{"eligible": true, "basis": "explicit", "notes": "These positions are specifically for City of Council Bluffs, Iowa residents. This is a CB-specific opportunity.", "source": "https://www.councilbluffs-ia.gov/94/Boards-Commissions"}'::jsonb
),

-- ── 2. Pottawattamie County Boards & Commissions ─────────────
(
  'Pottawattamie County, Iowa — Appointed Positions on County Boards & Commissions',
  'Pottawattamie County Board of Supervisors',
  'https://www.pottcounty-ia.gov',
  'Pottawattamie County — which includes Council Bluffs and the surrounding Iowa communities across the river from Omaha — appoints county residents to a range of boards and commissions that advise on county services including conservation, health, planning, and community development. The five-member Board of Supervisors appoints members to these advisory bodies. Serving on a county board is an accessible way to participate in local government, build civic credentials, and influence decisions that affect communities across the county. Applications for open positions are posted on the county''s official website. Contact the Board of Supervisors office to ask about currently open seats.',
  'free_resource',
  'Must be a resident of Pottawattamie County, Iowa (includes Council Bluffs, Carter Lake, Treynor, Avoca, and surrounding communities). Applications for open Board or Commission seats are posted at pottcounty-ia.gov. Contact the Board of Supervisors office at (712) 328-5600 for information on current vacancies.',
  NULL,
  'https://www.pottcounty-ia.gov/supervisors/boards_and_commissions/',
  'Council Bluffs, IA (Pottawattamie County)', '227 S 6th St', 'Council Bluffs', 'IA', '51501',
  false, false,
  '{}'::text[],
  '{civic_engagement,county_government,volunteer,appointed_boards,Pottawattamie_County,Iowa,Council_Bluffs,civic_leadership}'::text[],
  '{}'::text[],
  'high', 'verified',
  'https://www.pottcounty-ia.gov/supervisors/boards_and_commissions/', 'official_website', '2026-04-02',
  'Vacancies posted on a rolling basis. Board of Supervisors meets twice monthly. Check pottcounty-ia.gov or call (712) 328-5600 for current openings.',
  'community_all',
  'government_program',
  true, false, '2026-04-02', '2026-04-02',
  1,
  '{"eligible": true, "basis": "explicit", "notes": "These positions are specifically for Pottawattamie County, Iowa residents, the county that includes Council Bluffs. CB residents are the primary audience.", "source": "https://www.pottcounty-ia.gov/supervisors/boards_and_commissions/"}'::jsonb
);
