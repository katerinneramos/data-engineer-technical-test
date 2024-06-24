## Exercises 4
#### Data pipeline Design:
Design a data pipeline to create a week-over-week report using Google <br>
Analytics data. The report should provide insights into website traffic trends <br>
and key performance indicators for each week. <br>
#### Data Extraction:
Describe your approach to extract data from the Google Analytics API <br>
and store it in BigQuery. Explain the steps you would take to achieve this, <br>
including any necessary authentication, data retrieval, and data loading into <br>
BigQuery. You can use any method or tool of your choice, and there is no <br>
restriction on using open-source or proprietary solutions. <br>
#### Data Modeling:
Design a table to store the week-over-week report data. The table <br>
should have columns for week_start_date, sessions, pageviews, users, <br>
bounce_rate, conversion_rate, etc. The week_start_date column will be used to <br>
represent each reporting week's starting date. <br>
#### Generating the Week-over-Week Report:
Use a SQL query to aggregate the data from the extracted table to <br>
calculate the week-over-week metrics. For example, calculate the percentage <br>
change in sessions, pageviews, users, etc., from the previous week. <br>
#### Bonus: Using dbt for Data Modeling (Partial Implementation):
For bonus points, you can use dbt to automate the data modeling process. <br>
Create dbt models to define the data transformations required to calculate <br>
week-over-week metrics. Store the results in a separate table. <br>
