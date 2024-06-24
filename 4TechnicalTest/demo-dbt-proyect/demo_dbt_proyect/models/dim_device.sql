WITH device AS (
 SELECT DISTINCT
    GENERATE_UUID() as devices_id
    ,devices AS devices
 FROM 
    {{ source('analytics_report', 'weekly_analytics_report') }}
 WHERE 
    devices IS NOT NULL
)
SELECT
    devices_id
    ,devices
FROM 
    device d;