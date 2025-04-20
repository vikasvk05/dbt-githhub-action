{{ config(materialized='table', schema='netflix_mart') }}

select
  v.session_id,
  v.profile_id,
  p.user_id,
  v.content_id,
  c.title,
  v.device_id,
  d.device_type,
  v.started_at,
  v.ended_at,
  timestamp_diff(v.ended_at, v.started_at, second) as watch_duration_seconds
from {{ ref('stg_viewing_sessions') }} v
left join {{ ref('stg_profiles') }} p on v.profile_id = p.profile_id
left join {{ ref('stg_content') }} c on v.content_id = c.content_id
left join {{ ref('stg_devices') }} d on v.device_id = d.device_id