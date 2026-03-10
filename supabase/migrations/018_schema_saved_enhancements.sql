-- Migration 018: Add match data and starring to saved_opportunities
-- Run in Supabase Dashboard > SQL Editor

ALTER TABLE saved_opportunities
  ADD COLUMN IF NOT EXISTS match_score DECIMAL(5,2),
  ADD COLUMN IF NOT EXISTS match_reasoning TEXT,
  ADD COLUMN IF NOT EXISTS starred BOOLEAN NOT NULL DEFAULT FALSE;
