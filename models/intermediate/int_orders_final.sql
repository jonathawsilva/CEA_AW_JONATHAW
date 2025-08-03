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
        o.sales_order_id,
        o.customer_id,
        o.person_id,
        o.card_type,
        o.status,
        o.total_due,
        o.order_date,
        o.ship_date,
        i.sales_order_detail_id,
        i.product_id,
        i.product_name,
        i.order_qty,
        i.unit_price,
        i.unit_precied_iscount,
        i.total_item_value,
        r.sales_reason
    from orders o
    left join items i
        on o.sales_order_id = i.sales_order_id
    left join reasons r
        on o.sales_order_id = r.sales_order_id

)

select * from final
