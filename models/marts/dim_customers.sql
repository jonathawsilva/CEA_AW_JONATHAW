with 
    customers as(
        select *
        from {{ ref('int_customers') }}
    )

select
  {{ dbt_utils.generate_surrogate_key(['customer_id'])}} as sk_cliente
  , customer_id as id_cliente
  , person_id
  , store_id
  , territory_id
  , first_name as primeiro_nome
  , last_name as ultimo_nome
  , first_name || ' ' || last_name as nome_completo
from customers
