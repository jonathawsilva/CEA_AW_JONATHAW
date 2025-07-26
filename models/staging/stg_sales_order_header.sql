-- models/staging/stg_sales/stg_sales_order_header.sql

with source as (
    select * from {{ source('RAW_ADVENTURE_WORKS', 'SALES_SALESORDERHEADER') }}
),

renamed as (
    select
        salesorderid,
        orderdate,
        duedate,
        shipdate,
        status,
        customerid,
        salespersonid,
        territoryid,
        billtoaddressid,
        shiptoaddressid,
        creditcardid,
        totaldue,
        rowguid,
        modifieddate
    from source
)

select * from renamed
