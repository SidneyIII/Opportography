-- ============================================================
-- Opportography — Migration 058
-- Add 'tutoring' type for Phase 14: Tutoring & Academic Support
-- Date: 2026-03-17
-- ============================================================

-- Drop existing type check constraint
ALTER TABLE public.opportunities
  DROP CONSTRAINT IF EXISTS opportunities_type_check;

-- Re-add with 'tutoring' included
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
    'scientific_exploration',
    'tutoring'
  ));
