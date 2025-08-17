with 

source as (

    select * from {{ source('stg_sales', 'SALES_SALESTERRITORY') }}

),

renamed as (

    select
       *
    from source

)

select * from renamed