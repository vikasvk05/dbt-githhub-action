-- models/core/user_profiles.sql
select
  u.user_id,
  u.email,
  p.profile_id,
  p.profile_name,
  p.age_group,
  p.preferred_language
from {{ ref('stg_users') }} u
join {{ ref('stg_profiles') }} p on u.user_id = p.user_id
