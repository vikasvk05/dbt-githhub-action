{{ config(materialized='table', dataset='netflix_mart') }}

select
  c.content_id,
  c.title,
  c.type,
  c.release_date,
  string_agg(g.genre_name order by g.genre_name) as genres
from {{ ref('stg_content') }} c
left join {{ ref('stg_content_genres') }} cg on c.content_id = cg.content_id
left join {{ ref('stg_genres') }} g on cg.genre_id = g.genre_id
group by all
