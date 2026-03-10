-- ============================================================
-- Opportography — Migration 005
-- Schema additions for Phase 3 (enrichment/adult resources)
-- Run AFTER 004_seed_phase2.sql
-- Date: 2026-02-25
-- ============================================================

-- ── Add schedule field ────────────────────────────────────
-- Phase 3 introduces many recurring events and programs.
-- The eligibility text field is not suitable for storing
-- schedule info that users need to act on (e.g., "Every Tuesday 6:30 PM").
-- Adding a dedicated optional field for recurring schedule descriptions.

alter table public.opportunities
  add column if not exists schedule text;

-- ── Documentation ─────────────────────────────────────────
-- schedule: Human-readable recurring schedule description.
--   Examples: "Every Wednesday 8:00–9:00 AM"
--             "Mondays and Wednesdays, Jan 26–Apr 8, 2026"
--             "Fall and Spring semesters, rolling enrollment"
--   Null for one-time events or non-recurring opportunities.
-- ============================================================
