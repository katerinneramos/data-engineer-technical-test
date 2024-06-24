# etl_google_analytics_to_bigquery.py
from airflow import DAG
from airflow.utils.dates import days_ago
from airflow.operators.python_operator import PythonOperator
from google.oauth2 import service_account
from googleapiclient.discovery import build
from google.cloud import bigquery
from datetime import datetime, timedelta

# Define default arguments
default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
}

# Define the DAG
dag = DAG(
    'etl_google_analytics_to_bigquery',
    default_args=default_args,
    description='ETL pipeline for Google Analytics to BigQuery',
    schedule_interval='@weekly',  # Run once a week
    start_date=days_ago(1),
    catchup=False,
)

# Function to extract data from Google Analytics and load to BigQuery
def extract_load():
    SCOPES = ['https://www.googleapis.com/auth/analytics.readonly']
    SERVICE_ACCOUNT_FILE = '/path/to/service-account-file.json'
    credentials = service_account.Credentials.from_service_account_file(
        SERVICE_ACCOUNT_FILE, scopes=SCOPES)
    
    # Initialize Analytics Reporting API
    analytics = build('analyticsreporting', 'v4', credentials=credentials)

    # Define the date range (last 7 days)
    date_range = {
        'startDate': '7daysAgo',
        'endDate': 'yesterday'
    }

    # Define the metrics and dimensions
    metrics = [
        {'expression': 'ga:sessions'},
        {'expression': 'ga:pageviews'},
        {'expression': 'ga:users'},
        {'expression': 'ga:bounceRate'},
        {'expression': 'ga:conversionRate'},
        {'expression': 'ga:average_session_duration'}
    ]
    dimensions = [
        {'name': 'ga:date'},
        {'name': 'ga:devices'},
        {'name': 'ga:country'}
        {'name': 'ga:postal_co'}
        {'name': 'ga:campaign'}
        {'name': 'ga:campaign_id'}
    ]

    # Make the API request
    request = analytics.reports().batchGet(
        body={
            'reportRequests': [
                {
                    'viewId': 'YOUR_VIEW_ID',
                    'dateRanges': [date_range],
                    'metrics': metrics,
                    'dimensions': dimensions
                }]
        }
    ).execute()

    # Process the request and transform data for BigQuery
    rows = []
    for report in request.get('reports', []):
        for row in report.get('data', {}).get('rows', []):
            date = row.get('dimensions', [])[0]
            devices = row.get('dimensions', [])[1]
            country = row.get('dimensions', [])[2]
            postal_co = row.get('dimensions', [])[3]
            campaign = row.get('dimensions', [])[4]
            campaign_id = row.get('dimensions', [])[5]
            metrics_data = row.get('metrics', [])[0].get('values', [])
            rows.append({
                'week_start_date': date,
                'sessions': int(metrics_data[0]),
                'pageviews': int(metrics_data[1]),
                'users': int(metrics_data[2]),
                'bounce_rate': float(metrics_data[3]),
                'conversion_rate': float(metrics_data[4]),
                'devices': devices,
                'country': country,
                'postal_co': postal_co,
                'campaign': campaign,
                'campaign_id': campaign_id,
                'average_session_duration': float(metrics_data[5])
            })

    # Load data into BigQuery
    client = bigquery.Client()
    table_id = 'demo-dbt-project.analytics-report.weekly_analytics_report'
    errors = client.insert_rows_json(table_id, rows)

    if errors:
        print(f'Encountered errors while inserting rows: {errors}')
    else:
        print('Rows successfully inserted.')

# Define the PythonOperator to run the extract_load function
run_etl = PythonOperator(
    task_id='run_etl',
    python_callable=extract_load,
    dag=dag,
)

run_etl