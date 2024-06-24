{{ config(
    materialized = 'view'
) }}

WITH raw_data AS (

    SELECT
        week_start_date,
        sessions,
        pageviews,
        users,
        bounce_rate,
        conversion_rate,
        average_session_duration,
        devices,
        geography
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
    geography
FROM
    raw_data
