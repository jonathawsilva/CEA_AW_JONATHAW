select
  {{ dbt_utils.generate_surrogate_key(['sr.sales_reason_id']) }} as sk_sales_reason,
  sr.sales_reason_id,
  sr.name           as sales_reason
from {{ ref('stg_SALES_SALESREASON') }} sr
