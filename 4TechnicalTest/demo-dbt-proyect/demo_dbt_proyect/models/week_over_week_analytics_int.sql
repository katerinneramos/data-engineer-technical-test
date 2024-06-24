{{ config(
    materialized = 'view'
) }}

WITH weekly_data AS (

    SELECT
        week_start_date as datetime_id,
        SUM(sessions) AS sessions,
        SUM(pageviews) AS pageviews,
        SUM(users) AS users,
        AVG(bounce_rate) AS bounce_rate,
        AVG(conversion_rate) AS conversion_rate,
        AVG(average_session_duration) AS average_session_duration,
        devices,
        country,
        postal_co,
        {{ dbt_utils.generate_surrogate_key(['country', 'postal_co']) }} as country_id,
        campaign,
        campaign_id
    FROM
        {{ ref('week_over_week_analytics_stg') }}
    GROUP BY
        week_start_date
)
SELECT
    dt.datetime_id as week_start_date,
    sessions,
    pageviews,
    users,
    bounce_rate,
    conversion_rate,
    average_session_duration,
    devices,
    dd.devices_id,
    country,
    dc.country_id,
    postal_co,
    campaign,
    dcamp.campaign_id
FROM
    weekly_data week
INNER JOIN {{ ref('dim_datetime') }} dt ON week.datetime_id = dt.datetime_id
INNER JOIN {{ ref('dim_country') }} dc ON week.country_id = dc.country_id
INNER JOIN {{ ref('dim_devices') }} dd ON week.devices = dd.devices
INNER JOIN {{ ref('dim_campaign') }} dcamp ON week.campaign_id = dcamp.campaign_id;
