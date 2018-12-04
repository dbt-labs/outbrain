select

    {{ dbt_utils.surrogate_key('fromdate', 'campaignid') }} as id,
    to_date(fromdate, 'yyyy-mm-dd') as date_day,
    campaignid as campaign_id,

    impressions,
    clicks,
    conversions,
    spend

from {{var('performance_table')}}
