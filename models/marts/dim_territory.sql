with territories as (
    select
        territoryid             as territory_id,
        name                    as territory_name,
        countryregioncode       as country_code,
        "group"                 as territory_group
    from {{ ref('stg_SALES_SALESTERRITORY') }}
)

select * from territories
