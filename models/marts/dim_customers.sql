select
  c.customer_id,
  c.person_id,
  c.territory_id
from {{ ref('stg_SALES_CUSTOMER') }} c
