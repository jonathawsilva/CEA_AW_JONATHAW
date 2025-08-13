with src as (
  select *
  from {{ ref('int_orders_final') }}
)

select
  -- chaves
  sales_order_detail_id                              as sales_item_id,   -- PK do fato
  sales_order_id,
  customer_id,
  product_id,

  -- dimensões de negócio
  card_type,
  status,
  sales_reason,

  -- tempo
  order_date,
  date_trunc('month', order_date)::date             as order_month,
  extract(year from order_date)::int                as order_year,

  -- medidas
  order_qty,
  unit_price,
  unit_precied_discount,
  (order_qty * unit_price)                          as gross_revenue,
  (order_qty * unit_precied_discount)                 as discount_amount,
  (order_qty * (unit_price - unit_precied_discount))  as net_revenue,

  -- contadores
  1                                                 as orders_count
from src
