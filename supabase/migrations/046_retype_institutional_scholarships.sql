-- ============================================================
-- Opportography — Migration 046
-- Retype institution-specific scholarships to 'institutional_scholarship'
-- Date: 2026-03-17
--
-- Distinguishes scholarships that require enrollment at a specific
-- institution (Creighton, UNO, MCC, IWCC, UI, ISU, UNI) from
-- general / identity-based scholarships open regardless of school.
--
-- Target: any scholarship row whose scholarship_metadata has an
-- institution_abbr value that is NOT 'NU System' (state programs).
-- This precisely captures migrations 038–044 and nothing else.
-- ============================================================

-- Drop the existing type check constraint
ALTER TABLE public.opportunities
  DROP CONSTRAINT IF EXISTS opportunities_type_check;

-- Re-add with institutional_scholarship included
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
    'networking'
  ));

-- Now retype the institution-specific scholarship rows
UPDATE public.opportunities
SET type = 'institutional_scholarship'
WHERE type = 'scholarship'
  AND scholarship_metadata IS NOT NULL
  AND scholarship_metadata->>'institution_abbr' IS NOT NULL
  AND scholarship_metadata->>'institution_abbr' != 'NU System';
