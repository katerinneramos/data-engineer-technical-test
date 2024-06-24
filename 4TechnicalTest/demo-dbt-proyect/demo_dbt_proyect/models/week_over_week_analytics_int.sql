{{ config(
    materialized = 'view'
) }}

WITH weekly_data AS (

    SELECT
        week_start_date,
        SUM(sessions) AS sessions,
        SUM(pageviews) AS pageviews,
        SUM(users) AS users,
        AVG(bounce_rate) AS bounce_rate,
        AVG(conversion_rate) AS conversion_rate,
        AVG(average_session_duration) AS average_session_duration
    FROM
        {{ ref('week_over_week_analytics_stg') }}
    GROUP BY
        week_start_date
)
SELECT
    week_start_date,
    sessions,
    pageviews,
    users,
    bounce_rate,
    conversion_rate,
    average_session_duration
FROM
    weekly_data
