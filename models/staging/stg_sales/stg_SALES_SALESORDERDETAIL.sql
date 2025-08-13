with 

source as (

    select * from {{ source('stg_sales', 'SALES_SALESORDERDETAIL') }}

),

renamed as (

    select
        salesorderid as sales_order_id,
        salesorderdetailid as sales_order_detail_id,
        carriertrackingnumber,
        orderqty as order_qty,
        productid as product_id,
        specialofferid as special_offer_id,
        unitprice as unit_price,
        unitpricediscount as unit_precied_discount,
        rowguid as rowgu_id,
        modifieddate as modified_date

    from source

)

select * from renamed
