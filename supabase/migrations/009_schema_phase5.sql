-- ============================================================
-- Opportography — Migration 009
-- Schema additions for Phase 5 (growth & literacy batch)
-- Run AFTER 008_seed_phase4.sql
-- Date: 2026-02-25
-- ============================================================

-- ── Add recurrence field ─────────────────────────────────
-- Phase 5 introduces many recurring events: meetups, weekly
-- workshops, monthly networking nights, annual conferences.
-- The existing `schedule` text field captures the human-readable
-- description ("Every Monday at 6:15 PM"). This new field adds
-- machine-readable structure to enable filtering by frequency,
-- day of week, or upcoming date.
--
-- Shape when populated:
-- {
--   "frequency": "weekly | biweekly | monthly | quarterly | annual | varies",
--   "day_of_week": "Monday",       (optional — for weekly/biweekly)
--   "week_of_month": "first",      (optional — first|second|third|fourth|last)
--   "time": "6:15 PM",             (optional — local time of event)
--   "timezone": "CT",              (optional — CT = Central Time)
--   "next_date": "2026-03-02",     (optional — ISO date of next confirmed event)
--   "notes": "..."                 (optional — free text for caveats)
-- }
--
-- Rules:
--   • Only populate when recurrence is confirmed from official source.
--   • Set to null for appointment-based or on-demand services.
--   • Set to null for one-time events with no confirmed recurrence.
--   • `next_date` should reflect the next known event date when confirmed.
--   • Use `schedule` (text) for the human-readable description;
--     use `recurrence` (jsonb) for structured machine-readable data.
--   • Do NOT infer recurrence from past events alone — it must be confirmed.

alter table public.opportunities
  add column if not exists recurrence jsonb;

-- ── GIN index on recurrence ───────────────────────────────
-- Enables efficient filtering inside the JSON structure,
-- for example finding all monthly events or all events on Mondays.

create index if not exists idx_opportunities_recurrence
  on public.opportunities using gin (recurrence);

-- ── Documentation ─────────────────────────────────────────
-- recurrence: Structured JSON documenting event recurrence pattern.
--   Supplements the schedule (text) field added in migration 005.
--   schedule = human-readable ("Every first Thursday at 6:00 PM")
--   recurrence = machine-readable ({"frequency": "monthly", "week_of_month": "first", ...})
--   Null for appointment-based services, on-demand resources,
--   one-time events, or entries where recurrence is unverified.
-- ============================================================
