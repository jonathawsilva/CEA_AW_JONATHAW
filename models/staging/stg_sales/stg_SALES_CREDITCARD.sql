with 

source as (

    select * from {{ source('stg_sales', 'SALES_CREDITCARD') }}

),

renamed as (

    select
        creditcardid as credit_card_id,
        cardtype as card_type,
        cardnumber as card_number,
        expmonth as exp_month,
        expyear as exp_year,
        modifieddate as modified_date

    from source

)

select * from renamed
