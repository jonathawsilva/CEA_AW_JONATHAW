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
        orh.salesorderid,
        sr.salesreasonid,
        sr.name as sales_reason
    from order_reason orh
    left join reasons sr
        on orh.salesreasonid = sr.salesreasonid

)

select * from orders_with_reason
