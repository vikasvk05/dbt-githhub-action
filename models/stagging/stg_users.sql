{{
  config(
    materialized='view',
    schema='netflix_staging'
  )
}}

select
  user_id,
  email,
  signup_date,
  country
from {{ source('dbt_netflix_raw','users') }}