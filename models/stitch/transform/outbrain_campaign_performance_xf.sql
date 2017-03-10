with performance as (

    select * from {{ref('outbrain_campaign_performance')}}

),

campaigns as (

    select * from {{ref('outbrain_campaigns')}}

),

joined as (

    select

        performance.*,
        campaigns.utm_medium,
        campaigns.utm_source,
        campaigns.utm_campaign,
        campaigns.utm_content,
        campaigns.utm_term

    from performance
    inner join campaigns on performance.campaign_id = campaigns.id

)

select * from joined
