-- ============================================================
-- Opportography — Migration 098
-- Phase 16: Global Platform Architecture
--            Step 2A — Metro Areas Table + metro_area_id FK
-- Date: 2026-03-26
--
-- Creates metro_areas table and adds metro_area_id foreign key
-- to every opportunity record. All existing Omaha/Council Bluffs
-- records are assigned to metro_area_id = 1 (Omaha–Council Bluffs Metro).
--
-- POST-MIGRATION INVARIANT: zero null metro_area_id values.
-- ============================================================

-- ── Create metro_areas table ────────────────────────────────

CREATE TABLE IF NOT EXISTS public.metro_areas (
  id           SERIAL PRIMARY KEY,
  name         TEXT    NOT NULL,  -- e.g. "Omaha–Council Bluffs Metro"
  short_name   TEXT    NOT NULL,  -- e.g. "Omaha–CB"
  slug         TEXT    NOT NULL UNIQUE, -- URL-safe, e.g. "omaha-cb"
  region       TEXT    NOT NULL,  -- e.g. "Midwest United States"
  country      TEXT    NOT NULL DEFAULT 'US',
  is_active    BOOLEAN NOT NULL DEFAULT false,
  is_flagship  BOOLEAN NOT NULL DEFAULT false,
  population_estimate INTEGER,
  created_at   TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Only one metro can be flagship
CREATE UNIQUE INDEX IF NOT EXISTS idx_metro_areas_one_flagship
  ON public.metro_areas (is_flagship)
  WHERE is_flagship = true;

-- ── Seed the flagship metro ─────────────────────────────────

INSERT INTO public.metro_areas (id, name, short_name, slug, region, country, is_active, is_flagship, population_estimate)
VALUES (1, 'Omaha–Council Bluffs Metro', 'Omaha–CB', 'omaha-cb', 'Midwest United States', 'US', true, true, 967000)
ON CONFLICT (id) DO NOTHING;

-- Seed Akron as the announced second metro (inactive / coming soon)
INSERT INTO public.metro_areas (id, name, short_name, slug, region, country, is_active, is_flagship, population_estimate)
VALUES (2, 'Akron Metro', 'Akron', 'akron', 'Midwest United States', 'US', false, false, 703000)
ON CONFLICT (id) DO NOTHING;

-- ── Add metro_area_id to opportunities ──────────────────────

ALTER TABLE public.opportunities
  ADD COLUMN IF NOT EXISTS metro_area_id INTEGER REFERENCES public.metro_areas(id);

-- Assign every existing record to the Omaha–Council Bluffs Metro
UPDATE public.opportunities
SET metro_area_id = 1
WHERE metro_area_id IS NULL;

-- Make non-nullable now that all rows are assigned
ALTER TABLE public.opportunities
  ALTER COLUMN metro_area_id SET NOT NULL,
  ALTER COLUMN metro_area_id SET DEFAULT 1;

-- ── Indexes ─────────────────────────────────────────────────

CREATE INDEX IF NOT EXISTS idx_opportunities_metro_area_id
  ON public.opportunities (metro_area_id);

-- Composite index for the most common query pattern: active opps in a metro
CREATE INDEX IF NOT EXISTS idx_opportunities_metro_active
  ON public.opportunities (metro_area_id, is_active);

-- ── RLS: public read for metro_areas ────────────────────────

ALTER TABLE public.metro_areas ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public can read metro areas"
  ON public.metro_areas
  FOR SELECT
  USING (true);

-- ── Verification query (run after applying) ──────────────────
-- SELECT COUNT(*) FROM opportunities WHERE metro_area_id IS NULL;
-- Expected result: 0
