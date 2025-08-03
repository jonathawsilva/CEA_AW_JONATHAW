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
        oh.salesorderid,
        oh.customerid,
        c.personid,
        oh.creditcardid,
        cc.cardtype,
        oh.status,
        oh.totaldue,
        oh.orderdate,
        oh.shipdate
    from order_header oh
    left join customers c 
        on oh.customerid = c.customerid
    left join creditcards cc 
        on oh.creditcardid = cc.creditcardid

)

select * from orders_enriched
