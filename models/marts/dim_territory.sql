select
  {{ dbt_utils.generate_surrogate_key(['territory_id']) }} as sk_territorio,
  territory_id,
  territory_name,
  country_code,
  territory_group
from {{ ref('stg_SALESTERRITORY') }}
