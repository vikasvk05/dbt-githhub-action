{{
  config(
    materialized='view',
    schema='netflix_staging'
  )
}}

select
  content_id,
  title,
  type,
  release_date
from{{ source('dbt_netflix_raw','content') }}