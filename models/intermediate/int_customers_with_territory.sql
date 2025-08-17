with customers as (
  select *
  from {{ ref('stg_SALES_CUSTOMER') }}
),
territories as (
  select *
  from {{ ref('stg_SALESTERRITORY') }}
)
select
  c.customer_id,
  c.person_id,
  c.territory_id,
  t.territory_name,
  t.country_code,
  t.territory_group
from customers c
left join territories t
  on c.territory_id = t.territory_id 
