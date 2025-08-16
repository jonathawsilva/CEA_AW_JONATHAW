with src as (
  select *
  from {{ ref('int_orders_final') }}
)

select
  -- chaves
  sales_order_detail_id                              as sales_item_id,   -- PK do fato
  sales_order_id,
  sk_cliente,
  product_id,

  -- dimensões de negócio
  card_type,
  status,
  sales_reason,

  -- tempo
  cast(order_date as date)                          as order_date,  -- garante tipo DATE
  date_trunc('month', cast(order_date as date))::date as order_month,
  extract(year from cast(order_date as date))::int  as order_year,

  -- medidas
  order_qty,
  unit_price,
  unit_precied_discount,
  (order_qty * unit_price)                          as gross_revenue,
  (order_qty * unit_precied_discount)               as discount_amount,
  (order_qty * (unit_price - unit_precied_discount)) as net_revenue,

  -- contadores
  1                                                 as orders_count
from src
where cast(order_date as date) in (
    select date_id
    from {{ ref('dim_date') }}
)
