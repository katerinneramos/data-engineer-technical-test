CREATE TABLE `demo-dbt-project.analytics-report.weekly_analytics_report` (
    week_start_date DATE OPTIONS(description="The starting date of the week")
    ,sessions INT64 OPTIONS(description="Total number of sessions")
    ,pageviews INT64 OPTIONS(description="Total number of pageviews")
    ,users INT64 OPTIONS(description="Total number of unique users")
    ,bounce_rate FLOAT64 OPTIONS(description="Percentage of single-page sessions")
    ,conversion_rate FLOAT64 OPTIONS(description="Rate of goal conversions")
    ,devices STRING OPTIONS(description="Types of devices used by users")
    ,country STRING OPTIONS(description="Geographical location of users")
    ,postal_co STRING OPTIONS(description="Postal Code")
    ,campaign STRING OPTIONS(description="Campaign Name")
    ,campaign_id STRING OPTIONS(description="Campaign ID")
    ,average_session_duration FLOAT64 OPTIONS(description="Average duration of sessions in seconds")
);
