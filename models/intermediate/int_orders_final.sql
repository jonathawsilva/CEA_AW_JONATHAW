with 

orders as (

    select * from {{ ref('int_orders_enriched') }}

),

items as (

    select * from {{ ref('int_order_items_enriched') }}

),

reasons as (

    select * from {{ ref('int_orders_with_reason') }}

),

final as (

    select
        o.salesorderid,
        o.customerid,
        o.personid,
        o.cardtype,
        o.status,
        o.totaldue,
        o.orderdate,
        o.shipdate,
        i.salesorderdetailid,
        i.productid,
        i.productname,
        i.orderqty,
        i.unitprice,
        i.unitpricediscount,
        i.totalitemvalue,
        r.salesreason
    from orders o
    left join items i
        on o.salesorderid = i.salesorderid
    left join reasons r
        on o.salesorderid = r.salesorderid

)

select * from final
