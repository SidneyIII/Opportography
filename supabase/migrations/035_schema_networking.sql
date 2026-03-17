-- ============================================================
-- Opportography — Migration 035
-- Phase 12 Schema: Networking & Community Connection
-- Research: March 12, 2026
--
-- Adds 'networking' to the type CHECK constraint and three
-- new nullable columns for networking-specific metadata.
-- All columns are nullable so existing rows are unaffected.
-- ============================================================

-- 1. Expand type CHECK constraint to include 'networking'
ALTER TABLE public.opportunities
  DROP CONSTRAINT IF EXISTS opportunities_type_check;

ALTER TABLE public.opportunities
  ADD CONSTRAINT opportunities_type_check CHECK (
    type IN (
      'scholarship', 'internship', 'summer_program', 'mentorship',
      'competition', 'free_resource', 'workshop', 'college_access',
      'job', 'networking'
    )
  );

-- 2. Add networking-specific metadata columns
ALTER TABLE public.opportunities
  ADD COLUMN IF NOT EXISTS networking_subcategory TEXT
    CHECK (networking_subcategory IN (
      'professional_assoc', 'young_professionals', 'tech_community',
      'maker_creative', 'identity_based', 'civic_social', 'startup_entrepreneurship'
    )),
  ADD COLUMN IF NOT EXISTS who_shows_up JSONB,
  ADD COLUMN IF NOT EXISTS networking_value JSONB;

-- 3. Index for type=networking filter
CREATE INDEX IF NOT EXISTS idx_opportunities_networking
  ON public.opportunities (type, networking_subcategory)
  WHERE type = 'networking';
