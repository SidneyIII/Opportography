-- Enable pgvector extension (safe to run if already enabled)
create extension if not exists vector;

-- Add embedding column to opportunities (1024 dims = voyage-3-lite default)
alter table opportunities
  add column if not exists embedding vector(1024);

-- Create an HNSW index for fast similarity search
create index if not exists opportunities_embedding_idx
  on opportunities
  using hnsw (embedding vector_cosine_ops);

-- Function: match_opportunities
-- Finds the top N opportunities by cosine similarity to a query embedding.
-- Called from the chat route instead of keyword ilike queries.
create or replace function match_opportunities(
  query_embedding vector(1024),
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
