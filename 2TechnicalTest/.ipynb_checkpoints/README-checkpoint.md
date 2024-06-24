# Data Engineer Technical Test
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