select

    id,
    name,

    livestatus__amountspent as spend,
    livestatus__campaignonair as active,
    livestatus__onairreason as status,
    currency,
    targeting__language as targeting_language,
    
    {{ dbt_utils.get_url_parameter('suffixtrackingcode', 'utm_source') }} as utm_source,
    {{ dbt_utils.get_url_parameter('suffixtrackingcode', 'utm_medium') }} as utm_medium,
    {{ dbt_utils.get_url_parameter('suffixtrackingcode', 'utm_campaign') }} as utm_campaign,
    {{ dbt_utils.get_url_parameter('suffixtrackingcode', 'utm_content') }} as utm_content,
    {{ dbt_utils.get_url_parameter('suffixtrackingcode', 'utm_term') }} as utm_term,

    enabled,
    creationtime created_at,
    lastmodified as updated_at


from {{var('campaigns_table')}}
