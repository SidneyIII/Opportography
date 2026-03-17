-- ============================================================
-- Opportography — Migration 047
-- Phase 8: Community & Interest Groups — Schema Changes
-- Date: 2026-03-17
--
-- 1. Updates the type check constraint to include 'community'
-- 2. Adds community_metadata JSONB column for Phase 8 listings
-- ============================================================

-- Drop existing type check constraint
ALTER TABLE public.opportunities
  DROP CONSTRAINT IF EXISTS opportunities_type_check;

-- Re-add with 'community' included
ALTER TABLE public.opportunities
  ADD CONSTRAINT opportunities_type_check CHECK (type IN (
    'scholarship',
    'institutional_scholarship',
    'internship',
    'summer_program',
    'mentorship',
    'competition',
    'free_resource',
    'workshop',
    'college_access',
    'job',
    'networking',
    'community'
  ));

-- Add community_metadata JSONB column
-- Structure: { subcategory, passion_tags[], listing_type, accessibility{} }
ALTER TABLE public.opportunities
  ADD COLUMN IF NOT EXISTS community_metadata jsonb;
