-- ============================================================
-- Opportography — Migration 099
-- Phase 16: Global Platform Architecture
--            Step 2B — audience_type field + grade_levels display fix
-- Date: 2026-03-26
--
-- 1. Adds audience_type text column with a practical vocabulary
-- 2. Populates audience_type for all existing records via
--    rules derived from type + grade_levels
-- 3. Fixes broken grade_levels values introduced in Phase 17
--    (migrations 091–097) where 'adult', 'post_secondary', and
--    'high_school_senior' were stored as grade identifiers,
--    causing display bugs like "adultth Grade"
-- ============================================================

-- ── Add audience_type column ────────────────────────────────

ALTER TABLE public.opportunities
  ADD COLUMN IF NOT EXISTS audience_type TEXT;

-- ── Populate audience_type by opportunity type ───────────────

-- Jobs are for adult workforce
UPDATE public.opportunities
SET audience_type = 'adult_workforce'
WHERE type = 'job'
  AND audience_type IS NULL;

-- Scholarships: determine by grade_levels if available
UPDATE public.opportunities
SET audience_type = 'k12_high_school'
WHERE type IN ('scholarship', 'institutional_scholarship')
  AND grade_levels && ARRAY['9','10','11','12','grade_9','grade_10','grade_11','grade_12','high_school_senior']::text[]
  AND audience_type IS NULL;

UPDATE public.opportunities
SET audience_type = 'college_undergraduate'
WHERE type IN ('scholarship', 'institutional_scholarship')
  AND grade_levels && ARRAY['college_freshman']::text[]
  AND NOT grade_levels && ARRAY['9','10','11','12','grade_9','grade_10','grade_11','grade_12','high_school_senior']::text[]
  AND audience_type IS NULL;

-- Scholarships with no grade restriction → community_all
UPDATE public.opportunities
SET audience_type = 'community_all'
WHERE type IN ('scholarship', 'institutional_scholarship')
  AND audience_type IS NULL;

-- College access, mentorship, tutoring, internship, summer_program → K-12 / young adult
UPDATE public.opportunities
SET audience_type = 'k12_high_school'
WHERE type IN ('college_access', 'mentorship', 'tutoring', 'internship', 'summer_program', 'competition')
  AND grade_levels && ARRAY['9','10','11','12','grade_9','grade_10','grade_11','grade_12','high_school_senior']::text[]
  AND audience_type IS NULL;

UPDATE public.opportunities
SET audience_type = 'young_adult'
WHERE type IN ('college_access', 'mentorship', 'tutoring', 'internship', 'summer_program', 'competition')
  AND grade_levels && ARRAY['college_freshman','post_secondary','adult']::text[]
  AND NOT grade_levels && ARRAY['9','10','11','12']::text[]
  AND audience_type IS NULL;

-- Community, networking, scientific_exploration, free_resource, workshop → open to all
UPDATE public.opportunities
SET audience_type = 'community_all'
WHERE type IN ('community', 'networking', 'scientific_exploration', 'free_resource', 'workshop')
  AND audience_type IS NULL;

-- Any remaining nulls → community_all (safe default)
UPDATE public.opportunities
SET audience_type = 'community_all'
WHERE audience_type IS NULL;

-- ── Fix broken grade_levels values ──────────────────────────
-- Phase 17 (migrations 091–097) stored non-K-12 strings in grade_levels
-- that cause the detail page to render "adultth Grade", etc.
-- Fix: remove these non-display values, keeping only real K-12 grade strings.
--
-- Values to remove from grade_levels arrays:
--   'adult', 'post_secondary', 'high_school_senior'
--
-- Values to normalize (rename) within arrays:
--   'grade_9' → '9', 'grade_10' → '10', 'grade_11' → '11', 'grade_12' → '12'
--   'grade_8' → '8' (middle school — valid but wasn't in original enum)

-- Step 1: Remove broken non-K-12 strings
-- We use array_remove to strip offending values
UPDATE public.opportunities
SET grade_levels = (
  SELECT array_agg(v) FILTER (WHERE v NOT IN ('adult', 'post_secondary', 'high_school_senior'))
  FROM unnest(grade_levels) AS v
)
WHERE grade_levels && ARRAY['adult','post_secondary','high_school_senior']::text[];

-- Ensure we don't have NULLs from empty array_agg; convert to empty array
UPDATE public.opportunities
SET grade_levels = '{}'
WHERE grade_levels IS NULL;

-- Step 2: Normalize 'grade_N' prefixed values to plain numeric strings
UPDATE public.opportunities
SET grade_levels = (
  SELECT array_agg(
    CASE
      WHEN v = 'grade_8'  THEN '8'
      WHEN v = 'grade_9'  THEN '9'
      WHEN v = 'grade_10' THEN '10'
      WHEN v = 'grade_11' THEN '11'
      WHEN v = 'grade_12' THEN '12'
      ELSE v
    END
  )
  FROM unnest(grade_levels) AS v
)
WHERE grade_levels && ARRAY['grade_8','grade_9','grade_10','grade_11','grade_12']::text[];

-- Ensure no nulls after normalization
UPDATE public.opportunities
SET grade_levels = '{}'
WHERE grade_levels IS NULL;

-- ── Verification queries (run after applying) ────────────────
-- SELECT COUNT(*) FROM opportunities WHERE audience_type IS NULL;
-- Expected: 0
--
-- SELECT COUNT(*) FROM opportunities WHERE grade_levels && ARRAY['adult','post_secondary','high_school_senior','grade_8','grade_9','grade_10','grade_11','grade_12']::text[];
-- Expected: 0 (all normalized/removed)
