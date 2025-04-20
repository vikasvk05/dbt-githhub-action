{{
  config(
    materialized='view',
    schema='netflix_staging'
  )
}}

select
  genre_id,
  genre_name
from {{ source('dbt_netflix_raw','genres') }}