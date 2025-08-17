select
  {{ dbt_utils.generate_surrogate_key(['p.product_id']) }} as sk_produto,
  p.product_id,
  p.name           as product_name,
  p.listprice,
  p.standard_cost
from {{ ref('stg_PRODUCTION_PRODUCT') }} p
