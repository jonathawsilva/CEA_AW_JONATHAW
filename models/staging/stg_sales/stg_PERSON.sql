with 

source as (

    select * from {{ source('stg_sales', 'PERSON_PERSON') }}

),

renamed as (

    select
        *    
    from source

)

select * from renamed
