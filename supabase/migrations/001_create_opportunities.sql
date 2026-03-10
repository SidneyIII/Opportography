-- ============================================================
-- Opportography — Migration 001
-- Creates the opportunities table with full schema
-- Run this in: Supabase Dashboard → SQL Editor → New Query
-- ============================================================

create table if not exists public.opportunities (
  -- Primary key
  id uuid primary key default gen_random_uuid(),

  -- Core display fields
  title                 text not null,
  organization          text not null,
  organization_website  text,
  description           text not null,
  type                  text not null check (type in (
                          'scholarship', 'internship', 'summer_program',
                          'mentorship', 'competition', 'free_resource',
                          'workshop', 'college_access'
                        )),
  eligibility           text,
  deadline              date,
  link                  text not null,

  -- Location
  location              text not null default 'Omaha',
  address               text,
  city                  text,
  state                 text,
  zip                   text,
  is_remote             boolean default false,
  is_hybrid             boolean default false,

  -- Tags (arrays for filtering)
  identity_tags         text[] default '{}',
  category_tags         text[] default '{}',
  grade_levels          text[] default '{}',

  -- Compensation
  compensation_type     text check (compensation_type in (
                          'paid', 'unpaid', 'stipend', 'varies',
                          'scholarship_amount', null
                        )),
  compensation_amount   text,
  compensation_frequency text,

  -- Data quality tracking
  data_confidence       text not null default 'medium' check (
                          data_confidence in ('high', 'medium', 'low')
                        ),
  verification_status   text not null default 'needs_confirmation' check (
                          verification_status in ('verified', 'needs_confirmation')
                        ),
  source_url            text,
  source_type           text check (source_type in (
                          'official_website', 'job_board', 'government_db',
                          'community_org', 'news', null
                        )),
  source_retrieved_date date default current_date,

  -- Lifecycle
  is_active             boolean default true,
  is_featured           boolean default false,
  date_added            timestamp with time zone default now(),
  last_verified         timestamp with time zone default now(),
  created_at            timestamp with time zone default now(),
  updated_at            timestamp with time zone default now()
);

-- ── Indexes ────────────────────────────────────────────────
create index if not exists idx_opportunities_type
  on public.opportunities (type);

create index if not exists idx_opportunities_is_active
  on public.opportunities (is_active);

create index if not exists idx_opportunities_deadline
  on public.opportunities (deadline);

create index if not exists idx_opportunities_identity_tags
  on public.opportunities using gin (identity_tags);

create index if not exists idx_opportunities_category_tags
  on public.opportunities using gin (category_tags);

create index if not exists idx_opportunities_grade_levels
  on public.opportunities using gin (grade_levels);

-- ── updated_at trigger ──────────────────────────────────────
create or replace function public.handle_updated_at()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

create trigger set_updated_at
  before update on public.opportunities
  for each row execute function public.handle_updated_at();

-- ── Row Level Security ──────────────────────────────────────
alter table public.opportunities enable row level security;

-- Public can read active opportunities
create policy "Public can read active opportunities"
  on public.opportunities
  for select
  using (is_active = true);

-- ============================================================
-- Done. After running this, proceed to 002_seed_opportunities.sql
-- ============================================================
