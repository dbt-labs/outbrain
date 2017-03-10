select

    id,
    name,

    livestatus__amountspent as spend,
    livestatus__campaignonair as active,
    livestatus__onairreason as status,
    currency,
    targeting__language as targeting_language,

    split_part(split_part(suffixtrackingcode,'utm_source=',2), '&', 1) as utm_source,
    split_part(split_part(suffixtrackingcode,'utm_medium=',2), '&', 1) as utm_medium,
    split_part(split_part(suffixtrackingcode,'utm_campaign=',2), '&', 1) as utm_campaign,
    split_part(split_part(suffixtrackingcode,'utm_content=',2), '&', 1) as utm_content,
    split_part(split_part(suffixtrackingcode,'utm_term=',2), '&', 1) as utm_term,

    enabled,
    creationtime created_at,
    lastmodified as updated_at


from {{var('campaigns_table')}}
