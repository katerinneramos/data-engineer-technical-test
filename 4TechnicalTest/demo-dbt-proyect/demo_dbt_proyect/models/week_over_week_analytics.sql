{{ config(
    materialized='table'
) }}

WITH weekly_data_lag AS (
    SELECT
        week_start_date,
        sessions,
        pageviews,
        users,
        bounce_rate,
        conversion_rate,
        average_session_duration,
        LAG(sessions) OVER (ORDER BY week_start_date) AS prev_sessions,
        LAG(pageviews) OVER (ORDER BY week_start_date) AS prev_pageviews,
        LAG(users) OVER (ORDER BY week_start_date) AS prev_users,
        LAG(bounce_rate) OVER (ORDER BY week_start_date) AS prev_bounce_rate,
        LAG(conversion_rate) OVER (ORDER BY week_start_date) AS prev_conversion_rate,
        LAG(average_session_duration) OVER (ORDER BY week_start_date) AS prev_avg_session_duration
    FROM
        {{ ref('week_over_week_analytics_int') }}
)

SELECT
    week_start_date,
    sessions,
    pageviews,
    users,
    bounce_rate,
    conversion_rate,
    average_session_duration,
    prev_sessions,
    prev_pageviews,
    prev_users,
    prev_bounce_rate,
    prev_conversion_rate,
    prev_avg_session_duration,
    SAFE_DIVIDE(sessions - prev_sessions, prev_sessions) * 100 AS pct_change_sessions,
    SAFE_DIVIDE(pageviews - prev_pageviews, prev_pageviews) * 100 AS pct_change_pageviews,
    SAFE_DIVIDE(users - prev_users, prev_users) * 100 AS pct_change_users,
    SAFE_DIVIDE(bounce_rate - prev_bounce_rate, prev_bounce_rate) * 100 AS pct_change_bounce_rate,
    SAFE_DIVIDE(conversion_rate - prev_conversion_rate, prev_conversion_rate) * 100 AS pct_change_conversion_rate,
    SAFE_DIVIDE(average_session_duration - prev_avg_session_duration, prev_avg_session_duration) * 100 AS pct_change_avg_session_duration
FROM
    weekly_data_lag
ORDER BY
    week_start_date;
