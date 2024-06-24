WITH country AS (
 SELECT DISTINCT
    {{ dbt_utils.generate_surrogate_key(['country', 'postal_co']) }} as country_id
    ,country AS country
 FROM 
    {{ source('analytics', 'weekly_analytics_report') }}
 WHERE 
    country IS NOT NULL
)
SELECT
    country_id
    ,country
FROM 
    country c;