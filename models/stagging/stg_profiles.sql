{{
  config(
    materialized='view',
    schema='netflix_staging'
  )
}}

select
  profile_id,
  user_id,
  name as profile_name,
  age_group,
  preferred_language
from {{ source('dbt_netflix_raw','profiles') }}