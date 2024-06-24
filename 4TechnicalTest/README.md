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


## Data Extraction
![DiagramGA-Composer-BQ.png](attachment:521ccbb9-aacd-4ce7-ac5e-2ac1f6cbb151.png) <br>

#### Authentication and Access
To extract data from the Google Analytics API, we'll need to set up authentication and authorize the application: <br>
##### Google Cloud Platform Setup:
- Create a new project in Google Cloud Platform (GCP).
- Enable the Google Analytics API.
- Create OAuth 2.0 credentials to get a client ID and client secret.
##### Service Account:
- Create a service account in GCP. <br>
- Grant the service account access to the Google Analytics view. <br>
- Download the JSON key file for the service account. <br>
<br>
## Data Pipeline
To automate the execution of the ETL we’ll use Google Cloud Composer so that it runs weekly, we’ll follow these steps: <br>
- ##### Configure Cloud Composer: 
We need to have the Google Cloud Composer environment set up. <br>


- ##### Create the DAG (Directed Acyclic Graph) in Airflow:
Create a DAG that runs weekly to pull data from Google Analytics and load it into BigQuery. <br>

#### DAG to Run the ETL Weekly
First, we need to create a Python file to define the DAG in the Cloud Composer environment. <br>
File path in Cloud Composer:<br>
##### /home/airflow/gcs/dags/etl_google_analytics_to_bigquery.py

<a href = "https://github.com/katerinneramos/data-engineer-technical-test/blob/addProyect/4TechnicalTest/etl_google_analytics_to_bigquery.py">Link to etl_google_analytics_to_bigquery.py</a>
<br>

#### Cloud Composer’s implementation
- ##### Upload the file to the DAG directory:
Upload etl_google_analytics_to_bigquery.py to the Cloud Storage bucket associated with your Cloud Composer environment.

- ##### Verify the DAG in the Airflow UI:
Verify that the etl_google_analytics_to_bigquery DAG is listed and enabled.

- ##### Run and monitor the DAG:
Monitors the execution of the DAG to verify that data is correctly extracted and loaded into BigQuery.

## Data Modeling
Table to store the etl_google_analytics_to_bigquery <br>
<br>
![tableAnalyticsReport.png](attachment:03d8336e-09a2-4869-99ef-86b3632d5f36.png)

<a href = "https://github.com/katerinneramos/data-engineer-technical-test/blob/addProyect/4TechnicalTest/weekly_analytics_report.sql">Link to Create Table Query: weekly_analytics_report.sql</a>
<br>

### Using dbt for Data Modeling
We'll use DBT for data modeling and automating the data transformation process. <br> 
We need to define dbt models to handle the extraction and transformation of data, and then calculate the week-over-week metrics. <br>

We create an staging, intermediate and final model.
### Staging Model
<a href = "https://github.com/katerinneramos/data-engineer-technical-test/blob/addProyect/4TechnicalTest/weekly_analytics_report.sql">Link to Staging Model: week_over_week_analytics_stg.sql</a>
<br>

### Intermediate Model
<a href = "https://github.com/katerinneramos/data-engineer-technical-test/blob/addProyect/4TechnicalTest/weekly_analytics_report.sql">Link to Staging Model: week_over_week_analytics_int.sql</a>
<br>

### Final Model for Week-over-Week Metrics
<a href = "https://github.com/katerinneramos/data-engineer-technical-test/blob/addProyect/4TechnicalTest/weekly_analytics_report.sql">Link to Staging Model: week_over_week_analytics.sql</a>
<br>

### We can create dimension tables

## dim_devices
<a href = "https://github.com/katerinneramos/data-engineer-technical-test/blob/addProyect/4TechnicalTest/weekly_analytics_report.sql">Link to dim_devices</a>
<br>

## dim_campaign

<a href = "https://github.com/katerinneramos/data-engineer-technical-test/blob/addProyect/4TechnicalTest/weekly_analytics_report.sql">Link to dim_campaign</a>
<br>

## dim_country
<a href = "https://github.com/katerinneramos/data-engineer-technical-test/blob/addProyect/4TechnicalTest/weekly_analytics_report.sql">Link to dim_country</a>
<br>

## dim_calendar
<a href = "https://github.com/katerinneramos/data-engineer-technical-test/blob/addProyect/4TechnicalTest/weekly_analytics_report.sql">Link to dim_calendar</a>
<br>
<br>

#### For this we need to set up the profiles.yml file with your BigQuery configuration:
<a href = "https://github.com/katerinneramos/data-engineer-technical-test/blob/addProyect/4TechnicalTest/weekly_analytics_report.sql">Link to profiles.yml</a>
<br>

#### And configure the schema.yml as follow:
<a href = "https://github.com/katerinneramos/data-engineer-technical-test/blob/addProyect/4TechnicalTest/weekly_analytics_report.sql">Link to schema.yml</a>
<br>

#### And configure de source.yml
<a href = "https://github.com/katerinneramos/data-engineer-technical-test/blob/addProyect/4TechnicalTest/weekly_analytics_report.sql">Link to source.yml</a>
