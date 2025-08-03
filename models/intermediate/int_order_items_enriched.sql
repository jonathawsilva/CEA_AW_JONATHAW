with order_items as (

    select *
    from {{ ref('stg_SALES_SALESORDERDETAIL') }}

),

products as (

    select *
    from {{ ref('stg_PRODUCTION_PRODUCT') }}

),

items_enriched as (

    select
        oi.salesorderdetailid,
        oi.salesorderid,
        oi.productid,
        p.name as product_name,
        p.listprice,
        p.standardcost,
        oi.orderqty,
        oi.unitprice,
        oi.unitpricediscount,
        (oi.orderqty * (oi.unitprice - oi.unitpricediscount)) as totalitemvalue
    from order_items oi
    left join products p
        on oi.productid = p.product_id

)

select * from items_enriched
