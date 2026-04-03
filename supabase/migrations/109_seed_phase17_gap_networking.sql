-- ============================================================
-- Opportography — Migration 109
-- Phase 17 Closure — Gap Fill: Category 7 Networking
--                    & Professional Communities
-- Date: 2026-04-02
--
-- 2 verified entries:
--   1. Young Nonprofit Professionals Network of Greater Omaha
--      (ynpnGO) — Free, 100+ member emerging leader network
--   2. Military Founders Lab (IVMF / former Bunker Labs) —
--      Free 10-week virtual veteran entrepreneur cohort program
--
-- NOT duplicating (already in DB):
--   - 1 Million Cups Omaha (migration 036)
--   - Nonprofit Association of the Midlands — Events &
--     Workshops (migration 067)
--   - YP Omaha / YP Council Bluffs (migration 036)
--   - Helmets to Hardhats veteran trades program (migration 096)
--
-- RESEARCHED BUT EXCLUDED:
--   - Social Enterprise Alliance Nebraska: Chapter website
--     (se-alliance.org) could not confirm an active Nebraska/
--     Omaha chapter with regular programming as of 2026 research.
--     National organization is active but local chapter status
--     uncertain. Not added — would require direct confirmation.
--   - SHRM/PMI Omaha new chapters (2025–2026): Both SHRM
--     Greater Omaha and PMI Nebraska have existing DB entries
--     (migration 036). No newly launched chapters found that
--     are not already captured.
--   - Millwork Commons free community events: Individual event
--     programming at Millwork Commons coworking space does not
--     have a stable recurring event URL that would constitute
--     a standalone listing.
--
-- Sources verified 2026-04-02:
--   Entry 1: ynpnomaha.org, shareomaha.org/nonprofit/ynpngo,
--             nebraskatable.org/partners/ynpngo
--   Entry 2: ivmf.syracuse.edu/programs/entrepreneurship/
--             start-up/military-founders-lab/
--
-- Confidence:
--   Entry 1 (ynpnGO): 0.90 — active website, confirmed 100+
--     members, programs listed, volunteer-run chapter active.
--   Entry 2 (Military Founders Lab): 0.90 — active IVMF page,
--     3 cohorts/year confirmed, eligibility documented, formerly
--     Bunker Labs Omaha chapter (now rolled into IVMF).
-- ============================================================

INSERT INTO public.opportunities (
  title, organization, organization_website, description,
  type, networking_subcategory, eligibility, link,
  location, city, state,
  is_remote, is_hybrid,
  identity_tags, category_tags,
  compensation_type,
  schedule, audience_type,
  data_confidence, verification_status,
  source_url, source_type, source_retrieved_date,
  who_shows_up, networking_value,
  is_active, is_featured,
  metro_area_id,
  cb_eligibility
) VALUES

-- ── 1. YNPN of Greater Omaha ──────────────────────────────────
(
  'Young Nonprofit Professionals Network of Greater Omaha (ynpnGO) — Free Emerging Leader Network',
  'Young Nonprofit Professionals Network of Greater Omaha',
  'https://www.ynpnomaha.org',
  'The Young Nonprofit Professionals Network of Greater Omaha (ynpnGO) is a free, volunteer-run professional network for young people (predominantly 20s and 30s) working in or interested in the nonprofit sector. Membership is free and open to anyone — you don''t need to already work at a nonprofit to join. With 100+ members from organizations across the metro, ynpnGO is the primary professional community for emerging nonprofit leaders in Omaha. Programs include the Rising Leaders Institute (structured professional development cohort), the Emerging Nonprofit Leader Award, and Professional Development Mini-Grants for members who need funding to attend conferences or training. If you are exploring a career in nonprofits, currently working at one, or thinking about launching a social venture — this is the network where those conversations happen in Omaha.',
  'networking',
  'young_professionals',
  'Free membership open to anyone interested in the nonprofit sector — no current employment in nonprofits required. Most members are in their 20s and 30s. Join at ynpnomaha.org/get-involved/ynpngo-membership/.',
  'https://www.ynpnomaha.org',
  'Omaha, NE (metro-wide events)',
  'Omaha', 'NE', false, true,
  array[]::text[],
  array['networking', 'nonprofit', 'professional_development', 'emerging_leaders', 'career', 'social_impact', 'Omaha'],
  'unpaid',
  'Regular programming throughout the year. Check ynpnomaha.org for current events, Rising Leaders Institute cohort dates, and award application deadlines.',
  'young_adult',
  'high', 'verified',
  'https://www.ynpnomaha.org', 'official_website', '2026-04-02',
  '{"typical_attendees": "Nonprofit program staff, development professionals, social workers, recent grads exploring nonprofit careers, graduate students in social work/public admin, career changers", "experience_level": "Entry to mid-level — targeted at emerging leaders", "age_range": "Primarily 20s–30s, all ages welcome", "notes": "Completely free. Volunteer-run. No prior nonprofit experience required to join."}',
  '{"primary_value": "Direct connection to Omaha nonprofit professionals across sectors — healthcare nonprofits, arts orgs, social services, advocacy groups, education nonprofits.", "for_newcomers": "Free and welcoming to anyone interested in nonprofits — not just people already working in the field.", "for_job_seekers": "Members include hiring managers at Omaha nonprofits. One of the best informal hiring networks for nonprofit roles in the metro.", "notes": "ynpnGO is an official YNPN national chapter. Professional development mini-grants are a distinctive benefit."}',
  true, false,
  1,
  '{"eligible": true, "basis": "likely", "notes": "Membership is open to anyone in the greater Omaha metro area. Council Bluffs nonprofit professionals and students are welcome.", "source": "https://www.ynpnomaha.org"}'::jsonb
),

-- ── 2. Military Founders Lab (IVMF / Bunker Labs) ────────────
(
  'Military Founders Lab — Free 10-Week Virtual Entrepreneur Cohort for Veterans & Military Spouses',
  'D''Aniello Institute for Veterans and Military Families (IVMF) at Syracuse University',
  'https://ivmf.syracuse.edu',
  'Military Founders Lab is a free, 10-week virtual program for veterans, reservists, National Guard members, and military spouses who have been actively working on a business for six or more months. Formerly known as Bunker Labs — which had an active Omaha chapter given the city''s proximity to Offutt Air Force Base — the program is now administered through Syracuse University''s Institute for Veterans and Military Families (IVMF). Three cohorts run per year (winter, spring, fall), and each provides access to business tools, expert mentorship, peer networks, and multiple program tracks aligned by business type or experience level. This is the most structured free entrepreneurship program available specifically to veterans and military-connected individuals in the Omaha metro. If you are transitioning out of service, currently in the Guard or Reserve, or a military spouse building a business — this program has been the primary national network for veteran entrepreneurs for over a decade.',
  'networking',
  'startup_entrepreneurship',
  'Active-duty service members, veterans, reservists, National Guard members, military spouses, life partners, or caregivers of veterans (all eras, all branches). Must have been actively engaged in business development for 6+ months. Honorable service documentation required. Apply at ivmf.syracuse.edu/programs/entrepreneurship/start-up/military-founders-lab/. Three cohorts per year — winter, spring, and fall.',
  'https://ivmf.syracuse.edu/programs/entrepreneurship/start-up/military-founders-lab/',
  'Virtual (open to Omaha/CB metro veterans)',
  'Omaha', 'NE', true, false,
  array['military'],
  array['entrepreneurship', 'veteran', 'military_spouse', 'startup', 'business_development', 'virtual', 'free', 'Offutt_AFB', 'National_Guard'],
  'unpaid',
  'Three 10-week cohorts per year: winter, spring, and fall. Check ivmf.syracuse.edu for current cohort start dates and application deadlines.',
  'community_all',
  'high', 'verified',
  'https://ivmf.syracuse.edu/programs/entrepreneurship/start-up/military-founders-lab/', 'official_website', '2026-04-02',
  '{"typical_attendees": "Veterans building startups, military spouses running small businesses, transitioning service members exploring entrepreneurship, Guard/Reserve members with side businesses", "experience_level": "6+ months into business — not for idea-stage pre-business", "age_range": "18+, all military-connected", "notes": "Formerly Bunker Labs — rebranded under Syracuse IVMF in 2024. Omaha is a strong market given Offutt AFB proximity."}',
  '{"primary_value": "Structured 10-week cohort with mentorship, business tools, and peer network of veteran entrepreneurs nationally.", "for_newcomers": "Must have a business already in development for 6+ months — not an intro program.", "for_job_seekers": "For business owners, not job seekers. Use Helmets to Hardhats (separately listed) for trades career transitions.", "notes": "Free. No equity taken. Virtual format means Omaha/CB veterans can participate without travel."}',
  true, false,
  1,
  '{"eligible": true, "basis": "explicit", "notes": "Virtual program — all eligible veterans and military-connected individuals in the Omaha/CB metro can apply, including those stationed at or near Offutt AFB in Bellevue, NE, and Nebraska/Iowa National Guard members.", "source": "https://ivmf.syracuse.edu/programs/entrepreneurship/start-up/military-founders-lab/"}'::jsonb
);
