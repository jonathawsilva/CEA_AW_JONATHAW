-- reprova se existir linha com valor líquido negativo
select *
from {{ ref('fact_sales') }}
where net_revenue < 0
