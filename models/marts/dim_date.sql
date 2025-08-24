with dates as (
  select distinct order_date::date as date_day
  from {{ ref('int_orders_enriched') }}
  where order_date is not null
)

select
  {{ dbt_utils.generate_surrogate_key(['date_day']) }}     as sk_data,
  date_day                                                 as date_id,
  date_day                                                 as date,
  extract(year  from date_day)::int                        as year,
  extract(month from date_day)::int                        as month,
  to_char(date_day, 'YYYY-MM')                             as year_month_label,
  date_trunc('month', date_day)::date                      as first_day_of_month
from dates
