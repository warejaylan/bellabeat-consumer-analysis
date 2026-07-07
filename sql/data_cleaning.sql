--Data Cleaning: standardized dates, checked nulls and duplicates, and prepared the two daily activity datasets for analysis.

--Cleaning Step #1:Total Records

SELECT
COUNT(*)
FROM `bellabeat-case-study-499507.bellabeat.daily_activity_mar_apr`
 
SELECT
COUNT(*)
FROM `bellabeat-case-study-499507.bellabeat.daily_activity_apr_may`
Total Records: 457 & 940
 
--Cleaning Step #2: User Count

SELECT
COUNT(DISTINCT Id)
FROM `bellabeat-case-study-499507.bellabeat.daily_activity_mar_apr`
 
SELECT
COUNT(DISTINCT Id)
FROM `bellabeat-case-study-499507.bellabeat.daily_activity_apr_may`
Unique Users: 35 & 33
 
--Cleaning Step #3: Date Range

SELECT
MIN(ActivityDate) AS start_date,
MAX(ActivityDate) AS end_date
FROM `bellabeat-case-study-499507.bellabeat.daily_activity_mar_apr`

SELECT
MIN(ActivityDate) AS start_date,
MAX(ActivityDate) AS end_date
FROM `bellabeat-case-study-499507.bellabeat.daily_activity_apr_may`
Date Ranges: 3.12.16 - 4.11.16 & 4.12.16 - 5.12.16
 
--Cleaning Step #4: Duplicate Records

SELECT Id,
ActivityDate,
COUNT(*) AS duplicate_count
FROM `bellabeat-case-study-499507.bellabeat.daily_activity_mar_apr`
GROUP BY
Id,
ActivityDate
HAVING COUNT(*) > 1
 
SELECT Id,
ActivityDate,
COUNT(*) AS duplicate_count
FROM `bellabeat-case-study-499507.bellabeat.daily_activity_apr_may`
GROUP BY
Id,
ActivityDate
HAVING COUNT(*) > 1
Result: No duplicate records found.
 
--Cleaning Step #5: Null Values

SELECT
COUNTIF (TotalSteps IS NULL) AS null_steps,
COUNTIF (TotalDistance IS NULL) AS null_distance,
COUNTIF (Calories IS NULL) AS null_calories
FROM `bellabeat-case-study-499507.bellabeat.daily_activity_mar_apr`
 
SELECT
COUNTIF (TotalSteps IS NULL) AS null_steps,
COUNTIF (TotalDistance IS NULL) AS null_distance,
COUNTIF (Calories IS NULL) AS null_calories
FROM `bellabeat-case-study-499507.bellabeat.daily_activity_apr_may`
Result: No null values found.
 
--Cleaning Step #6: Impossible Values

SELECT *
FROM `bellabeat-case-study-499507.bellabeat.daily_activity_mar_apr`
WHERE TotalSteps < 0
 
SELECT *
FROM `bellabeat-case-study-499507.bellabeat.daily_activity_apr_may`
WHERE TotalSteps < 0
 
SELECT *
FROM `bellabeat-case-study-499507.bellabeat.daily_activity_mar_apr`
WHERE Calories < 0
 
SELECT *
FROM `bellabeat-case-study-499507.bellabeat.daily_activity_apr_may`
WHERE Calories < 0
Result: No impossible values found.
 
--Cleaning Step #7: Zero Activity

SELECT *
FROM `bellabeat-case-study-499507.bellabeat.daily_activity_mar_apr`
WHERE TotalSteps = 0
 
SELECT *
FROM `bellabeat-case-study-499507.bellabeat.daily_activity_apr_may`
WHERE TotalSteps = 0
Action Taken: Queries saved to bellabeats dataset.
