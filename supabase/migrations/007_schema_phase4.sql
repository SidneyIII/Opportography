-- ============================================================
-- Opportography — Migration 007
-- Schema additions for Phase 4 (equity & access batch)
-- Run AFTER 006_seed_phase3.sql
-- Date: 2026-02-25
-- ============================================================

-- ── Add language_access field ──────────────────────────────
-- Phase 4 introduces many bilingual and multilingual resources.
-- Storing language access information as flexible JSONB allows
-- different organizations to document what they offer without
-- requiring every resource to have the same fields.
--
-- Shape when populated:
-- {
--   "primary_language": "Spanish",
--   "additional_languages": ["English"],
--   "interpretation_available": true,
--   "bilingual_staff": true,
--   "translated_materials": ["Spanish"],
--   "language_line_available": false,
--   "notes": "GED instruction is in Spanish; ELL classes are bilingual"
-- }
--
-- Rules:
--   • Only populate when verified from official organizational sources.
--   • Set to null when language access info is not available — never infer.
--   • Do NOT assume bilingual services from neighborhood demographics alone.

alter table public.opportunities
  add column if not exists language_access jsonb;

-- ── Add cost_structure field ───────────────────────────────
-- Phase 4 includes many free or reduced-cost services where the
-- existing compensation fields (designed for jobs/internships) do not
-- adequately capture whether a service is free, income-gated, sliding
-- scale, or reduced cost.
--
-- Shape when populated:
-- {
--   "type": "free | free_with_eligibility | sliding_scale | reduced_cost | varies",
--   "details": "e.g., Free for households below 200% FPL",
--   "accepts_insurance": true,
--   "accepts_medicaid": true,
--   "accepts_medicare": false,
--   "notes": "No one turned away for inability to pay"
-- }
--
-- Rules:
--   • "free" means no cost to anyone, no qualifications.
--   • "free_with_eligibility" means free only if you meet requirements.
--   • "sliding_scale" means cost varies based on income/ability to pay.
--   • "reduced_cost" means below market rate but not free.
--   • "varies" means cost depends on specific program or service.
--   • Set to null when cost information is not verifiable from source.
--   • Never mix cost details with immigration status assumptions.

alter table public.opportunities
  add column if not exists cost_structure jsonb;

-- ── GIN indexes on new JSONB fields ───────────────────────
-- Enables efficient querying inside the JSON structures,
-- for example finding all resources with Spanish services
-- or all resources that accept Medicaid.

create index if not exists idx_opportunities_language_access
  on public.opportunities using gin (language_access);

create index if not exists idx_opportunities_cost_structure
  on public.opportunities using gin (cost_structure);

-- ── Documentation ─────────────────────────────────────────
-- language_access: Structured JSON documenting multilingual availability.
--   Null for entries where language access was not verified from source.
--   Null ≠ English-only — it means unknown/unverified.
--
-- cost_structure: Structured JSON documenting cost to the end user.
--   Supplements the existing compensation_type field, which was
--   designed for job/internship compensation rather than service costs.
--   Null means cost information was not verifiable from official source.
-- ============================================================
