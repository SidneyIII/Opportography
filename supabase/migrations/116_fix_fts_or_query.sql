-- Fix: BM25 was using AND between query words (websearch_to_tsquery default).
-- "space exploration" required BOTH words in a row — OAS has "space" but not "exploration".
-- Fix: build the tsquery as OR of individual stemmed words for better recall.

create or replace function match_opportunities_hybrid(
  query_embedding vector(512),
  query_text text,
  match_count int default 20,
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
  rrf_score float
)
language sql stable
as $$
  with
  -- Build OR tsquery from individual stemmed words (e.g. "space exploration" → 'space' | 'explor')
  -- This ensures partial matches score instead of requiring every word
  fts_query as (
    select to_tsquery('english', string_agg(lexeme, ' | ' order by lexeme)) as q
    from unnest(to_tsvector('english', query_text))
  ),
  -- Vector similarity ranking
  vector_ranked as (
    select
      o.id,
      row_number() over (order by o.embedding <=> query_embedding) as rank
    from opportunities o
    where
      (not filter_active or o.is_active = true)
      and o.embedding is not null
    order by o.embedding <=> query_embedding
    limit 100
  ),
  -- Full-text search ranking using OR query
  fts_ranked as (
    select
      o.id,
      row_number() over (order by ts_rank_cd(o.search_vector, fts_query.q, 32) desc) as rank
    from opportunities o, fts_query
    where
      (not filter_active or o.is_active = true)
      and o.search_vector @@ fts_query.q
    limit 100
  ),
  -- RRF merge
  rrf as (
    select
      coalesce(v.id, f.id) as id,
      coalesce(1.0 / (60 + v.rank), 0) + coalesce(1.0 / (60 + f.rank), 0) as score
    from vector_ranked v
    full outer join fts_ranked f on v.id = f.id
  )
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
    rrf.score as rrf_score
  from rrf
  join opportunities o on o.id = rrf.id
  order by rrf.score desc
  limit match_count;
$$;
