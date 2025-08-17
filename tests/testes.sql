select customer_id, count(*) 
from {{ ref('int_customers_with_territory') }}
group by customer_id
having count(*) > 1
