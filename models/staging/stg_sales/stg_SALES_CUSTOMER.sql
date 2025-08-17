with 

source as (

    select * from {{ source('stg_sales', 'SALES_CUSTOMER') }}

),

renamed as (

    select
        customerid as customer_id,
        personid as person_id,
        storeid as store_id,
        territoryid as territory_id,
        rowguid as rowgu_id,
        modifieddate as modified_date

    from source

)

select * from renamed
