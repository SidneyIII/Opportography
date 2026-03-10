-- ============================================================
-- Opportography — Migration 016
-- Schema additions for Phase 11 (Open Humanities & Creative
-- Expression Batch)
-- Run AFTER 015_seed_science.sql
-- Date: 2026-03-06
-- ============================================================

-- ── Add equity_focus field ─────────────────────────────────
-- Phase 11 (Humanities) introduces the equity_focus field to
-- document when an organization has an explicit mission to serve
-- historically underrepresented or underresourced communities.
--
-- Omaha's arts landscape is geographically and racially stratified.
-- Many of the most vital creative spaces in the metro — The Union
-- for Contemporary Art, the North Omaha music and arts ecosystem,
-- the spoken word scene — were built specifically because mainstream
-- institutions were not serving everyone. This field captures that
-- context accurately so users can find spaces where they will feel
-- most welcome.
--
-- Shape when populated:
-- {
--   "serves_underserved": true,
--   "communities": [
--     "North Omaha residents",
--     "BIPOC artists",
--     "emerging artists without studio access"
--   ],
--   "mission_notes": "One or two sentences on the organization's
--     specific equity mission and why it was founded."
-- }
--
-- Rules:
--   • Only populate when verified from official organizational sources.
--   • Must reflect what the organization itself says about its mission.
--   • "serves_underserved" = true only when the organization has an
--     explicit equity or access mission documented on its website or
--     in press coverage — not inferred from neighborhood location alone.
--   • communities[] entries should be specific and factual, not generic.
--   • mission_notes should be descriptive, not evaluative.
--   • Set to null for organizations with general public missions
--     where no specific equity focus is documented.
--   • This field is not about tokenizing — it is about accuracy.
--     Omitting this field for organizations that have an explicit
--     equity mission is itself inaccurate.

alter table public.opportunities
  add column if not exists equity_focus jsonb;

-- ── GIN index on equity_focus ──────────────────────────────
-- Enables efficient filtering by community type or equity status
-- within the JSONB structure.

create index if not exists idx_opportunities_equity_focus
  on public.opportunities using gin (equity_focus);

-- ── Documentation ──────────────────────────────────────────
-- equity_focus: Structured JSON documenting whether an organization
--   has an explicit mission to serve historically underrepresented or
--   underresourced communities.
--   Null for organizations with general public missions.
--   Null ≠ "does not serve underserved communities" — it means the
--   organization has not documented a specific equity focus.
-- ============================================================
