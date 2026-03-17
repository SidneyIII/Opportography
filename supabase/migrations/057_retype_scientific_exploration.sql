-- ============================================================
-- Opportography — Migration 057
-- Add 'scientific_exploration' type and reclassify science/nature entries
-- Date: 2026-03-17
--
-- Separates science, nature, astronomy, biology, medicine, and related
-- STEM exploration opportunities from general community listings.
-- Targets entries whose community_metadata.subcategory = 'science_nature'
-- (i.e., the 3 entries from migration 056: Omaha Astronomical Society,
-- Audubon Society of Omaha, Fontenelle Forest volunteer program).
-- ============================================================

-- Drop existing type check constraint
ALTER TABLE public.opportunities
  DROP CONSTRAINT IF EXISTS opportunities_type_check;

-- Re-add with 'scientific_exploration' included
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
    'community',
    'scientific_exploration'
  ));

-- Reclassify science/nature community entries
UPDATE public.opportunities
SET type = 'scientific_exploration'
WHERE type = 'community'
  AND community_metadata IS NOT NULL
  AND community_metadata->>'subcategory' = 'science_nature';
