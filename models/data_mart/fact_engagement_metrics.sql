{{ config(materialized='table', schema='netflix_mart') }}

select
  profile_id,
  count(distinct session_id) as total_sessions,
  count(distinct content_id) as unique_titles_viewed,
  sum(timestamp_diff(ended_at, started_at, second)) as total_watch_time_seconds
from {{ ref('stg_viewing_sessions') }}
group by profile_id