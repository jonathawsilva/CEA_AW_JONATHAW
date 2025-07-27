with 

source as (

    select * from {{ source('stg_sales', 'PRODUCTION_PRODUCT') }}

),

renamed as (

    select
        productid as product_id
        ,name   
        ,productnumber as product_number
        ,makeflag 
        ,finishedgoodsflag as finished_goods_falg
        ,color
        ,safetystocklevel
        ,reorderpoint
        ,standardcost
        ,listprice
        ,size
        ,sizeunitmeasurecode
        ,weightunitmeasurecode
        ,weight
        ,daystomanufacture
        ,productline
        ,class
        ,style
        ,productsubcategoryid as product_subcategory_id
        ,productmodelid as product_model_id
        ,cast(sellstartdate as date) as sell_start_date
        ,cast(sellenddate as date) as sell_end_date
        ,cast(discontinueddate as date) as discontinued_date
        ,rowguid as rowgu_id
        ,modifieddate as modified_date

    from source

)

select * from renamed
