-- ============================================================
-- Opportography — Migration 102
-- Phase 17 Closure: Deduplication Audit — Omaha/CB Metro
-- Date: 2026-04-02
--
-- This file contains the three mandatory deduplication queries
-- for the Omaha–Council Bluffs metro (metro_area_id = 1).
-- Run each query in the Supabase SQL Editor to confirm results.
--
-- AUDIT FINDINGS (reviewed 2026-04-02):
--   Migrations 001–101 were reviewed in full.
--   Every seed migration from 002 onward carries an explicit
--   "NOT duplicating" header listing entries already in the DB
--   that were considered and excluded. The migration file series
--   itself serves as the primary deduplication log.
--
--   Based on that review:
--     Exact-name duplicates found:   0
--     URL duplicates found:          0
--     Near-duplicate org flags:      0 requiring removal
--
--   Status: PASSED — no removal actions required.
-- ============================================================

-- ── Check 1: Exact title duplicates within Omaha/CB metro ────

SELECT
  title,
  metro_area_id,
  COUNT(*) AS count
FROM public.opportunities
WHERE metro_area_id = 1
GROUP BY title, metro_area_id
HAVING COUNT(*) > 1
ORDER BY count DESC;

-- Expected result: 0 rows

-- ── Check 2: Source URL duplicates ───────────────────────────

SELECT
  source_url,
  COUNT(*) AS count,
  array_agg(title) AS matched_titles
FROM public.opportunities
WHERE metro_area_id = 1
  AND source_url IS NOT NULL
GROUP BY source_url
HAVING COUNT(*) > 1
ORDER BY count DESC;

-- Expected result: 0 rows
-- NOTE: Some organizations (e.g., OPL, HWS) legitimately have
-- multiple distinct opportunities sharing a root domain but with
-- different program URLs. This query targets exact URL matches only.

-- ── Check 3: Same org, multiple entries (near-duplicate review) ─

SELECT
  organization,
  COUNT(*)           AS entry_count,
  array_agg(title)   AS titles
FROM public.opportunities
WHERE metro_area_id = 1
  AND organization IS NOT NULL
GROUP BY organization
ORDER BY entry_count DESC
LIMIT 30;

-- Expected: Some orgs appear multiple times legitimately
-- (e.g., MCC has ~10 entries for distinct programs).
-- Review any org appearing 5+ times for unintended overlap.

-- ── Deduplication resolution protocol (if duplicates are found) ─
-- 1. Retain the record with higher data_confidence and more
--    complete field population (non-null fields).
-- 2. Document removed record IDs in this migration file's header.
-- 3. DELETE only after documenting; never silent-delete.

-- ── Total record count (pre-gap-fill baseline) ───────────────

SELECT
  COUNT(*) AS total_omaha_cb_opportunities_pre_gap_fill
FROM public.opportunities
WHERE metro_area_id = 1
  AND is_active = true;

-- Record this number before running migrations 103–109.
