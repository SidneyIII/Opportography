-- ============================================================
-- Opportography — Migration 101
-- Phase 17 Closure: Add seeding lifecycle columns to metro_areas
-- Date: 2026-04-02
--
-- Adds three columns needed for the metro seal step:
--   seeding_status        — lifecycle state of the metro's dataset
--   seeding_completed_at  — timestamp when seeding was marked complete
--   seeding_notes         — free-text summary of what was done
-- ============================================================

ALTER TABLE public.metro_areas
  ADD COLUMN IF NOT EXISTS seeding_status        TEXT    DEFAULT 'in_progress'
    CHECK (seeding_status IN ('not_started','in_progress','complete')),
  ADD COLUMN IF NOT EXISTS seeding_completed_at  TIMESTAMPTZ,
  ADD COLUMN IF NOT EXISTS seeding_notes         TEXT;

COMMENT ON COLUMN public.metro_areas.seeding_status IS
  'Lifecycle state of this metro''s opportunity dataset.
   Values: not_started | in_progress | complete';

COMMENT ON COLUMN public.metro_areas.seeding_completed_at IS
  'Timestamp at which the metro''s dataset was sealed as complete.
   NULL until seeding_status = ''complete''.';

COMMENT ON COLUMN public.metro_areas.seeding_notes IS
  'Free-text summary of the seeding sprint that closed this metro.
   Intended for internal audit / handoff notes.';

-- All existing metros default to 'in_progress' via column default.
-- The Omaha/CB metro (id=1) will be updated to 'complete' in
-- migration 110 after the gap fill is verified.

-- ── Verification ──────────────────────────────────────────────
-- SELECT id, name, seeding_status FROM metro_areas;
-- Expected: id=1 → in_progress, id=2 → in_progress
