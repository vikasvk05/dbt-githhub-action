{{
  config(
    materialized='view',
    schema='netflix_staging'
  )
}}

select
  session_id,
  profile_id,
  content_id,
  device_id,
  started_at,
  ended_at
from {{ source('dbt_netflix_raw','viewing_sessions') }}