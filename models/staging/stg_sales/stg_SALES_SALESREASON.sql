with 

source as (

    select * from {{ source('stg_sales', 'SALES_SALESREASON') }}

),

renamed as (

    select
        salesreasonid as sales_reason_id,
        name,
        reasontype as reason_type,
        modifieddate as modifed_date

    from source

)

select * from renamed
