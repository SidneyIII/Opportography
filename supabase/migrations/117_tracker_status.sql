-- Add application status tracking to saved_opportunities
alter table saved_opportunities
  add column if not exists status text not null default 'saved'
    check (status in ('saved', 'in_progress', 'submitted', 'accepted', 'declined', 'waitlisted')),
  add column if not exists custom_deadline date;
