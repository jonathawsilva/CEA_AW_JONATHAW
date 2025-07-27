with 

source as (

    select * from {{ source('stg_sales', 'SALES_SALESORDERHEADERSALESREASON') }}

),

renamed as (

    select
        salesorderid,
        salesreasonid,
        modifieddate

    from source

)

select * from renamed
