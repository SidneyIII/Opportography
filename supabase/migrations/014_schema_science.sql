-- ============================================================
-- Opportography — Migration 014
-- Schema additions for Phase 10 (Open Science & Discovery Batch)
-- Run AFTER 013_seed_phase9.sql
-- Date: 2026-03-05
-- ============================================================

-- ── Add learning_context field ────────────────────────────
-- Phase 10 (Open Science) introduces the concept of describing
-- what participation actually *feels like* — not just what
-- an opportunity is, but what someone experiences when they
-- show up. This is particularly important for science programs
-- because the biggest barrier to participation isn't cost or
-- location — it's intimidation.
--
-- Shape when populated:
-- {
--   "formality": "informal | semi_formal | structured",
--   "social_setting": "solo | small_group | large_group | community",
--   "commitment_level": "drop_in | recurring_casual | series | training_program",
--   "description": "One sentence describing what showing up actually looks like."
-- }
--
-- Rules:
--   • Write descriptions in plain, human language — no jargon.
--   • The description should make someone who has never attended
--     feel invited, not intimidated.
--   • commitment_level should reflect real participation burden:
--     drop_in = no registration, show up anytime
--     recurring_casual = regular event, low pressure to attend every time
--     series = structured sequence of sessions
--     training_program = significant time commitment, application/enrollment
--   • formality should reflect the actual atmosphere, not the org's self-description.
--     A university planetarium show is "semi_formal" (structured presentation)
--     even though UNO is a research institution.
--   • Can be null for opportunities where experience type is self-evident
--     (e.g., a job listing or scholarship application).

alter table public.opportunities
  add column if not exists learning_context jsonb;

-- ── GIN index on learning_context ────────────────────────
-- Enables efficient filtering on formality, social_setting,
-- or commitment_level within the JSONB structure.

create index if not exists idx_opportunities_learning_context
  on public.opportunities using gin (learning_context);

-- ── Documentation ─────────────────────────────────────────
-- learning_context: JSONB documenting the experiential quality
--   of an opportunity — what does showing up actually feel like?
--   Designed to reduce the intimidation barrier for first-time
--   participants, especially in science and learning contexts.
--   Null for non-experiential opportunities (scholarships, etc.)
-- ============================================================
