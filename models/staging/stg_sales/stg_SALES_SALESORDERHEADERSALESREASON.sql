with 

source as (

    select * from {{ source('stg_sales', 'SALES_SALESORDERHEADERSALESREASON') }}

),

renamed as (

    select
        salesorderid as sales_order_id,
        salesreasonid as sales_reason_id,
        modifieddate as modifed_date

    from source

)

select * from renamed
