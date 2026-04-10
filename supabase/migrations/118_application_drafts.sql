-- Application drafts: stores extracted prompts + student answers per saved opportunity
create table if not exists application_drafts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  saved_opportunity_id uuid references saved_opportunities(id) on delete cascade,
  opportunity_id uuid references opportunities(id) on delete cascade,
  document_name text not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists application_prompts (
  id uuid primary key default gen_random_uuid(),
  draft_id uuid not null references application_drafts(id) on delete cascade,
  position int not null,
  prompt_text text not null,
  field_type text not null default 'essay'
    check (field_type in ('short_answer', 'essay', 'checkbox', 'other')),
  word_limit int,
  answer text,
  updated_at timestamptz not null default now()
);

-- RLS: users can only access their own drafts
alter table application_drafts enable row level security;
alter table application_prompts enable row level security;

create policy "users_own_drafts" on application_drafts
  for all using (auth.uid() = user_id);

create policy "users_own_prompts" on application_prompts
  for all using (
    draft_id in (
      select id from application_drafts where user_id = auth.uid()
    )
  );
