select
    sum(order_qty * unit_price) as faturamento_bruto_2011
from {{ ref('fact_sales') }}
where extract(year from order_date) = 2011

