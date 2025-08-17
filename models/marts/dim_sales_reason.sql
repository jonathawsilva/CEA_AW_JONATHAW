select
  sr.sales_reason_id  as sales_reason_id,
  sr.name           as sales_reason
from {{ ref('stg_SALES_SALESREASON') }} sr
