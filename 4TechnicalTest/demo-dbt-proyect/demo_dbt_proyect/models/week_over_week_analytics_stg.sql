{{ config(
    materialized = 'view'
) }}

WITH source AS (

    SELECT
        week_start_date,
        sessions,
        pageviews,
        users,
        bounce_rate,
        conversion_rate,
        average_session_duration,
        devices,
        country,
        postal_co,
        campaign,
        campaign_id
    FROM
        {{ source('analytics', 'weekly_analytics_report') }}
)
SELECT
    week_start_date,
    sessions,
    pageviews,
    users,
    bounce_rate,
    conversion_rate,
    average_session_duration,
    devices,
    country,
    postal_co,
    campaign,
    campaign_id
FROM
    source
