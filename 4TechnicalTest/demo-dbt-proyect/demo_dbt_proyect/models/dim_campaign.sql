WITH campaign AS (
 SELECT DISTINCT
    campaign_id
    ,campaign AS campaign
 FROM 
    {{ source('analytics', 'weekly_analytics_report') }}
 WHERE 
    campaign IS NOT NULL
)
SELECT
    camp.campaign_id
    ,camp.campaign
FROM 
    campaign camp;