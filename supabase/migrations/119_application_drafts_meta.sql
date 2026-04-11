-- Add metadata columns to application_drafts
alter table application_drafts
  add column if not exists name text,
  add column if not exists priority text not null default 'none'
    check (priority in ('high', 'medium', 'low', 'none')),
  add column if not exists deadline date,
  add column if not exists scratchpad text;
