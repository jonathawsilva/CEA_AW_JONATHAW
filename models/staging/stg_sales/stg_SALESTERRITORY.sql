with src as (
  select *
  from {{ source('stg_sales', 'SALES_SALESTERRITORY') }}
)
select
  TerritoryID        as territory_id,
  Name               as territory_name,
  CountryRegionCode  as country_code,
  "group"              as territory_group
from src
