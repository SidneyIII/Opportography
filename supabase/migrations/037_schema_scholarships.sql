-- ============================================================
-- Opportography — Migration 037
-- Phase 7: Scholarship Metadata Schema Extension
-- Date: 2026-03-16
--
-- Adds a scholarship_metadata JSONB column to store structured
-- per-scholarship data: institution abbreviation, scholarship type,
-- application method, renewable conditions, and stackability rules.
--
-- This follows the pattern established by prior phase-specific
-- JSONB columns (cb_eligibility, iowa_specific, equity_focus, etc.)
--
-- Schema for scholarship_metadata:
-- {
--   "institution_abbr": "UNO",                  -- short institution code
--   "institution_type": "public_4year",          -- public_4year | private_4year | public_2year
--   "scholarship_type": "merit",                 -- merit | need-based | merit-and-need | competitive | automatic | departmental
--   "application_method": "automatic_upon_admission", -- see values below
--   "renewable": {
--     "is_renewable": true,
--     "max_years": 4,                            -- max years/semesters of eligibility
--     "renewal_gpa": "3.0",                      -- minimum GPA to renew (as string, e.g. "3.30")
--     "notes": "..."                             -- additional renewal conditions
--   },
--   "stackable": {
--     "stacks_with_other_merit": false,
--     "stacks_with_need_based": true,
--     "notes": "..."                             -- specifics about stacking rules
--   }
-- }
--
-- application_method values:
--   "automatic_upon_admission"     -- awarded automatically when admitted, no action needed
--   "separate_application_required" -- student must submit a separate competitive application
--   "general_scholarship_app"      -- one portal application covers all scholarships
--   "department_application"       -- applied through specific college/department
-- ============================================================

alter table public.opportunities
  add column if not exists scholarship_metadata jsonb;

comment on column public.opportunities.scholarship_metadata is
  'Phase 7: Structured scholarship data — institution_abbr, scholarship_type, application_method, renewable conditions, and stackability rules. See migration 037 for full schema.';
