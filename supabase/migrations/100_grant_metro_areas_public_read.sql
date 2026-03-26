-- ============================================================
-- Opportography — Migration 100
-- Fix: Explicit GRANT SELECT on metro_areas for anon + authenticated
--
-- Tables created via raw SQL migrations in Supabase don't automatically
-- inherit the default public-schema grants that the Table Editor applies.
-- This grants read access so the anon key can query metro_areas.
-- ============================================================

GRANT SELECT ON public.metro_areas TO anon;
GRANT SELECT ON public.metro_areas TO authenticated;
