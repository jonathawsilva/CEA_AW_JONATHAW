with 

source as (

    select * from {{ source('stg_sales', 'SALES_SALESORDERHEADER') }}

),

renamed as (

    select
        salesorderid as sales_order_id,
        revisionnumber as revision_number,
        orderdate as order_date,
        duedate as due_date,
        shipdate as ship_date,
        status,
        onlineorderflag as online_order_flag,
        purchaseordernumber,
        accountnumber as account_number,
        customerid as customer_id,
        salespersonid as sales_person_id,
        territoryid as territory_id,
        billtoaddressid as bill_to_address_id,
        shiptoaddressid as ship_to_address_id,
        shipmethodid as ship_method_id,
        creditcardid as credit_card_id,
        creditcardapprovalcode as credit_Card_approvalcode,
        currencyrateid as currencyrate_id,
        subtotal,
        taxamt,
        freight,
        totaldue as total_due,
        comment,
        rowguid as rowgu_id,
        modifieddate as modified_date

    from source

)

select * from renamed
