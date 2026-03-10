-- ============================================================
-- Opportography — Migration 020
-- Add cb_eligibility JSONB column to opportunities
--
-- Purpose: Machine-readable flag for whether Council Bluffs,
-- Iowa students are explicitly eligible for opportunities
-- that otherwise appear Nebraska-specific. The Missouri River
-- is not a scholarship boundary.
--
-- Structure:
--   {
--     "eligible": true | false | null (null = unverified),
--     "basis": "explicit" | "likely" | "unknown",
--     "notes": "Short explanation",
--     "source": "URL or org contact that confirmed eligibility"
--   }
-- ============================================================

ALTER TABLE public.opportunities
  ADD COLUMN IF NOT EXISTS cb_eligibility JSONB;

COMMENT ON COLUMN public.opportunities.cb_eligibility IS
  'Council Bluffs / Pottawattamie County Iowa student eligibility.
   Structure: {eligible: bool|null, basis: text, notes: text, source: text}
   eligible=null means unverified. basis values: explicit | likely | unknown.';

CREATE INDEX IF NOT EXISTS idx_opp_cb_eligibility
  ON public.opportunities
  USING GIN (cb_eligibility)
  WHERE cb_eligibility IS NOT NULL;
