with order_header as (

    select *
    from {{ ref('stg_SALES_SALESORDERHEADER') }}

),

customers as (

    select *
    from {{ ref('stg_SALES_CUSTOMER') }}

),

creditcards as (

    select *
    from {{ ref('stg_SALES_CREDITCARD') }}

),

orders_enriched as (

    select
        oh.sales_order_id,
        oh.customer_id,
        c.person_id,
        oh.credit_card_id,
        cc.card_type,
        oh.status,
        oh.total_due,
        oh.order_date,
        oh.ship_date
    from order_header oh
    left join customers c 
        on oh.customer_id = c.customer_id
    left join creditcards cc 
        on oh.credit_card_id = cc.credit_card_id

)

select * from orders_enriched
