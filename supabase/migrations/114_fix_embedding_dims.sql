-- voyage-3-lite outputs 512 dimensions, not 1024. Fix the column and function.

-- Drop the index first (required before altering column type)
drop index if exists opportunities_embedding_idx;

-- Change column to 512 dims
alter table opportunities
  drop column if exists embedding;

alter table opportunities
  add column embedding vector(512);

-- Recreate index for 512 dims
create index opportunities_embedding_idx
  on opportunities
  using hnsw (embedding vector_cosine_ops);

-- Recreate function with 512 dims
create or replace function match_opportunities(
  query_embedding vector(512),
  match_count int default 12,
  filter_active boolean default true
)
returns table (
  id uuid,
  title text,
  organization text,
  description text,
  type text,
  deadline date,
  link text,
  city text,
  location text,
  similarity float
)
language sql stable
as $$
  select
    o.id,
    o.title,
    o.organization,
    o.description,
    o.type,
    o.deadline,
    o.link,
    o.city,
    o.location,
    1 - (o.embedding <=> query_embedding) as similarity
  from opportunities o
  where
    (not filter_active or o.is_active = true)
    and o.embedding is not null
  order by o.embedding <=> query_embedding
  limit match_count;
$$;
