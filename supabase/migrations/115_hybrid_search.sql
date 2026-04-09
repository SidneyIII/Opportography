-- Hybrid search: vector similarity + full-text (BM25) merged via Reciprocal Rank Fusion

-- 1. Add tsvector column for full-text search
alter table opportunities
  add column if not exists search_vector tsvector;

-- 2. Populate it from all text fields (weighted: title > organization > description > location)
update opportunities set search_vector =
  setweight(to_tsvector('english', coalesce(title, '')), 'A') ||
  setweight(to_tsvector('english', coalesce(organization, '')), 'B') ||
  setweight(to_tsvector('english', coalesce(description, '')), 'C') ||
  setweight(to_tsvector('english', coalesce(location, '')), 'D') ||
  setweight(to_tsvector('english', coalesce(city, '')), 'D') ||
  setweight(to_tsvector('english', coalesce(array_to_string(category_tags, ' '), '')), 'B');

-- 3. GIN index for fast full-text queries
create index if not exists opportunities_search_vector_idx
  on opportunities using gin(search_vector);

-- 4. Auto-update tsvector on insert/update
create or replace function opportunities_search_vector_update()
returns trigger language plpgsql as $$
begin
  new.search_vector :=
    setweight(to_tsvector('english', coalesce(new.title, '')), 'A') ||
    setweight(to_tsvector('english', coalesce(new.organization, '')), 'B') ||
    setweight(to_tsvector('english', coalesce(new.description, '')), 'C') ||
    setweight(to_tsvector('english', coalesce(new.location, '')), 'D') ||
    setweight(to_tsvector('english', coalesce(new.city, '')), 'D') ||
    setweight(to_tsvector('english', coalesce(array_to_string(new.category_tags, ' '), '')), 'B');
  return new;
end;
$$;

drop trigger if exists opportunities_search_vector_trigger on opportunities;
create trigger opportunities_search_vector_trigger
  before insert or update on opportunities
  for each row execute function opportunities_search_vector_update();

-- 5. Hybrid search function using Reciprocal Rank Fusion (RRF)
--    RRF score = 1/(k + rank_vector) + 1/(k + rank_fts)
--    k=60 is standard — dampens the effect of very high ranks
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
  -- Full-text search ranking (BM25 via ts_rank_cd)
  fts_ranked as (
    select
      o.id,
      row_number() over (order by ts_rank_cd(o.search_vector, query, 32) desc) as rank
    from opportunities o,
         websearch_to_tsquery('english', query_text) query
    where
      (not filter_active or o.is_active = true)
      and o.search_vector @@ query
    limit 100
  ),
  -- RRF merge: combine both ranked lists
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
