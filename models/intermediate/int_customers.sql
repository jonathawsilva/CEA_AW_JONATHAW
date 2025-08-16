with customers as (

    select *
    from {{ ref('stg_SALES_CUSTOMER') }}

),

people as (

    select *
    from {{ ref('stg_PERSON') }}

),

joined as (

    select
        customers.customer_id
        , customers.person_id
        , customers.store_id
        , customers.territory_id
        , people.title as person_title
        , people.firstname as first_name
        , people.middlename as middle_name
        , people.lastname as last_name
        , people.suffix as person_suffix
    from customers
    inner join people
        on customers.person_id = people.businessentityid

)

select *
from joined