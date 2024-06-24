# Data Engineer Technical Test
## Exercises 1
##### Implement the "annograms" function that uses the WORD.LST file to return anagrams of the word given in the "word" parameter.

def annograms(word): <br>
   #Write your code here. <br>
   words = [w.rstrip() for w in open('WORD.LST')]<br>
   raise NotImplementedError<br>
if __name__ == "__main__":<br>
   print(annograms("train"))<br>
   print('--')<br>
   print(annograms('drive'))<br>
   print('--')<br>
   print(annograms('python'))<br>
<br>

## Exercises 2
Bleatrix Trotter the sheep has devised a strategy that helps her fall asleep <br>
faster. First, she picks a number N. Then she starts naming N, 2 × N, 3 × N, and <br>
so on. Whenever she names a number, she thinks about all of the digits in that <br>
number. She keeps track of which digits (0, 1, 2, 3, 4, 5, 6, 7, 8, and 9) she has <br>
seen at least once so far as part of any number she has named. Once she has <br>
seen each of the ten digits at least once, she will fall asleep. <br>
Bleatrix must start with N and must always name (i + 1) × N directly after i × N. <br>
For example, suppose that Bleatrix picks N = 1692. She would count as follows: <br>
<br>
- N = 1692. Now she has seen the digits 1, 2, 6, and 9. <br>
- 2N = 3384. Now she has seen the digits 1, 2, 3, 4, 6, 8, and 9. <br>
- 3N = 5076. Now she has seen all ten digits, and falls asleep. <br>
What is the last number that she will name before falling asleep? If she will <br>
count forever, print INSOMNIA instead. <br>
<br>

##### INPUT <br>
The first line of the input gives the number of test cases, T. T test cases follow. <br>
Each consists of one line with a single integer N, the number Bleatrix has chosen. <br>
<br>

##### OUTPUT <br>
For each test case, output one line containing Case #x: y, where x is the test <br>
case number (starting from 1) and y is the last number that Bleatrix will name <br>
before falling asleep, according to the rules described in the statement. <br>
<br>

##### LIMITS <br>
1 ≤ T ≤ 100. <br>
##### DATASET <br>
0 ≤ N ≤ 200. <br>
<br>

##### SAMPLE <br>
Input <br>
5 <br>
0 <br>
1 <br>
2 <br>
11 <br>
1692 <br>
Output <br>
Case #1: INSOMNIA <br>
Case #2: 10 <br>
Case #3: 90 <br>
Case #4: 110 <br>
Case #5: 5076 <br>
<br>
- In Case #1, since 2 × 0 = 0, 3 × 0 = 0, and so on, Bleatrix will never see any <br>
digit other than 0, and so she will count forever and never fall asleep. Poor sheep! <br>
- In Case #2, Bleatrix will name 1, 2, 3, 4, 5, 6, 7, 8, 9, 10. The 0 will be the last <br>
digit needed, and so she will fall asleep after 10. <br>
- In Case #3, Bleatrix will name 2, 4, 6... and so on. She will not see the digit 9 in <br>
any number until 90, at which point she will fall asleep. By that point, she will <br>
have already seen the digits 0, 1, 2, 3, 4, 5, 6, 7, and 8, which will have appeared <br>
for the first time in the numbers 10, 10, 2, 30, 4, 50, 6, 70, and 8, respectively. <br>
- In Case #4, Bleatrix will name 11, 22, 33, 44, 55, 66, 77, 88, 99, 110 and then fall asleep. <br>
- Case #5 is the one described in the problem statement. <br>
<br>

## Exercises 3
Generate a report with a tool of your choice (eg. pandas, jupyter notebooks,etc), 
##### The report must comply the following requirements :
The summary_date must be in ISO Date format. <br>
The metrics must be grouped by campaign. <br>
The metrics that must be: <br>
Number of impressions. <br>
Number of clicks. <br>
Number of installs. <br>
Amount of spend. <br>
CTR (number of clicks/number of impressions) <br>
CPI (amount of spend/number of installs) <br>
<br>

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
