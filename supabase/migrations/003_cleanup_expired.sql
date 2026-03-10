-- ============================================================
-- Opportography — Migration 003
-- Deactivate Phase 1 entries whose deadlines have passed
-- Run AFTER 002_seed_opportunities.sql
-- Date: 2026-02-23
-- ============================================================

-- Susan Thompson Buffett Scholarship — deadline was 2026-02-01
-- Annual program: deactivate until next cycle deadline is published
update public.opportunities
set
  is_active = false,
  is_featured = false,
  updated_at = now()
where title = 'Susan Thompson Buffett Scholarship'
  and deadline = '2026-02-01';

-- Hispanic Scholarship Fund — deadline was 2026-02-15
-- Annual program: deactivate until next cycle deadline is published
update public.opportunities
set
  is_active = false,
  is_featured = false,
  updated_at = now()
where title = 'Hispanic Scholarship Fund'
  and deadline = '2026-02-15';

-- ── Verification ─────────────────────────────────────────
-- After running, confirm with:
-- SELECT title, deadline, is_active FROM opportunities
-- WHERE title IN ('Susan Thompson Buffett Scholarship', 'Hispanic Scholarship Fund');
-- ============================================================
