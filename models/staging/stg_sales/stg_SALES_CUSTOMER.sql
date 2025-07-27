with 

source as (

    select * from {{ source('stg_sales', 'SALES_CUSTOMER') }}

),

renamed as (

    select
        customerid,
        personid,
        storeid,
        territoryid,
        rowguid,
        modifieddate

    from source

)

select * from renamed
