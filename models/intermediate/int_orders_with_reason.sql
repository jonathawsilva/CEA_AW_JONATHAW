with order_reason as (
    select *
    from {{ ref('stg_SALES_SALESORDERHEADERSALESREASON') }}
),

reasons as (
    select *
    from {{ ref('stg_SALES_SALESREASON') }}
),

orders_with_reason as (
    select
        orh.sales_order_id,
        listagg(sr.name, ', ') within group (order by sr.name) as sales_reason
    from order_reason orh
    left join reasons sr
        on orh.sales_reason_id = sr.sales_reason_id
    group by orh.sales_order_id
)

select * from orders_with_reason
