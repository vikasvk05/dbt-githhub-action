{{
  config(
    materialized='view',
    schema='netflix_staging'
  )
}}

select
  content_id,
  genre_id
from {{ source('dbt_netflix_raw','content_genres') }}
