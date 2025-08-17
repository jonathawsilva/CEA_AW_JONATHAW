with src as (
  select *
  from {{ ref('int_orders_final') }}  -- contém customer_id, etc.
),
cust as (
  select
    customer_id,
    territory_id
  from {{ ref('int_customers_with_territory') }}
  qualify row_number() over (partition by customer_id order by territory_id) = 1
)

select
  -- chaves
  i.sales_order_detail_id                               as sales_item_id,   -- PK do fato

  -- 📦 Chaves substitutas para dimensões
  {{ dbt_utils.generate_surrogate_key(['i.customer_id']) }}     as sk_cliente,
  {{ dbt_utils.generate_surrogate_key(['i.product_id']) }}      as sk_produto,
  {{ dbt_utils.generate_surrogate_key(['i.order_date']) }}      as sk_data,
  {{ dbt_utils.generate_surrogate_key(['c.territory_id']) }}    as sk_territorio,
  {{ dbt_utils.generate_surrogate_key(['i.sales_reason']) }}    as sk_sales_reason,

  
    -- 🧩 Dimensões adicionais 
  i.customer_id as customer_id, 
  i.product_id,
  c.territory_id as territory_id,
  i.sales_order_id,
  i.sales_reason,

  -- dimensões de negócio
  i.card_type,
  i.status,

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
