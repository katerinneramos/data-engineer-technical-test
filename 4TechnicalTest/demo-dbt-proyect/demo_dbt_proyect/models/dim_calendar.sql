WITH datetime AS ( 
 SELECT DISTINCT
 week_start_date AS datetime_id,
 CASE
 WHEN LENGTH(week_start_date) = 16 THEN
 - Date format: "DD/MM/YYYY HH:MM"
 PARSE_DATETIME('%m/%d/%Y %H:%M', week_start_date)
 WHEN LENGTH(week_start_date) <= 14 THEN
 - Date format: "MM/DD/YY HH:MM"
 PARSE_DATETIME('%m/%d/%y %H:%M', week_start_date)
 ELSE
 NULL
 END AS date_part
 FROM 
    {{ source('analytics', 'weekly_analytics_report') }}
 WHERE week_start_date IS NOT NULL
)
SELECT
 datetime_id,
 date_part as datetime,
 EXTRACT(YEAR FROM date_part) AS year,
 EXTRACT(MONTH FROM date_part) AS month,
 EXTRACT(DAY FROM date_part) AS day,
 EXTRACT(HOUR FROM date_part) AS hour,
 EXTRACT(MINUTE FROM date_part) AS minute,
 EXTRACT(DAYOFWEEK FROM date_part) AS weekday
FROM datetime;