with src as (
  select *
  from {{ ref('int_orders_final') }}  -- contém customer_id, etc.
),
cust as (
  select
    customer_id,
    territory_id
  from {{ ref('int_customers_with_territory') }}
)

select
  -- chaves
  i.sales_order_detail_id                               as sales_item_id,   -- PK do fato
  i.sales_order_id,
  i.customer_id                                         as customer_id,     -- QUALIFICADO
  i.product_id,

  -- + território (novo atributo)
  c.territory_id                                        as territory_id,

  -- dimensões de negócio
  i.card_type,
  i.status,
  i.sales_reason,

  -- tempo
  i.order_date,
  date_trunc('month', i.order_date)::date               as order_month,
  extract(year from i.order_date)::int                  as order_year,

  -- medidas
  i.order_qty,
  i.unit_price,
  i.unit_precied_discount,
  (i.order_qty * i.unit_price)                          as gross_revenue,
  (i.order_qty * i.unit_precied_discount)               as discount_amount,
  (i.order_qty * (i.unit_price - i.unit_precied_discount)) as net_revenue,

  -- contadores
  1                                                     as orders_count
from src i
left join cust c
  on i.customer_id = c.customer_id
