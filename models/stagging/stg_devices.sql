{{
  config(
    materialized='view',
    schema='netflix_staging'
  )
}}

select
  device_id,
  device_type
from {{ ref('devices') }}