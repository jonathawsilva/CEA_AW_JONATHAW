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
        oi.sales_order_detail_id,
        oi.sales_order_id,
        oi.product_id,
        p.name as product_name,
        p.listprice,
        p.standard_cost,
        oi.order_qty,
        oi.unit_price,
        oi.unit_precied_discount,
        (oi.order_qty * (oi.unit_price - oi.unit_precied_discount)) as total_item_value
    from order_items oi
    left join products p
        on oi.product_id = p.product_id

)

select * from items_enriched
