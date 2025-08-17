select
  territory_id,
  territory_name,
  country_code,
  territory_group
from {{ ref('stg_SALESTERRITORY') }}

