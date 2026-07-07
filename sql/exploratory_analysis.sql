--Observation #1: What does the average user look like?

SELECT
ROUND(AVG(TotalSteps),0) AS avg_steps,
ROUND(AVG(TotalDistance),2) AS avg_distance,
ROUND(AVG(Calories),0) AS avg_calories,
ROUND(AVG(VeryActiveMinutes),0) AS avg_very_active,
ROUND(AVG(FairlyActiveMinutes),0) AS avg_fairly_active,
ROUND(AVG(LightlyActiveMinutes),0) AS avg_lightly_active,
ROUND(AVG(SedentaryMinutes),0) AS avg_sedentary
FROM `bellabeat-case-study-499507.bellabeat.daily_activity_mar_apr`
 
SELECT
ROUND(AVG(TotalSteps),0) AS avg_steps,
ROUND(AVG(TotalDistance),2) AS avg_distance,
ROUND(AVG(Calories),0) AS avg_calories,
ROUND(AVG(VeryActiveMinutes),0) AS avg_very_active,
ROUND(AVG(FairlyActiveMinutes),0) AS avg_fairly_active,
ROUND(AVG(LightlyActiveMinutes),0) AS avg_lightly_active,
ROUND(AVG(SedentaryMinutes),0) AS avg_sedentary
FROM `bellabeat-case-study-499507.bellabeat.daily_activity_apr_may`
 
Average Daily User Profile:
Steps- 6547.0 & 7638.0
Distance- 4.66 & 5.49
Calories- 2189.0 & 2304.0
Very Active Minutes- 17.0 & 21.0
Fairly Active Minutes- 13.0 & 14.0
Lightly Active Minutes- 170.0 & 193.0
Sedentary Minutes- 995.0 & 991.0
 
--Observation #2: How active are users?
  --Activity segmentation: grouped users by average daily step count.
  
SELECT
CASE
WHEN TotalSteps < 5000 THEN 'low activity'
WHEN TotalSteps > 10000 THEN 'moderate actvity'
ELSE 'high activity'
END AS activity_level,
COUNT(*) AS records
FROM `bellabeat-case-study-499507.bellabeat.daily_activity_mar_apr`
GROUP BY activity_level
ORDER BY records DESC
 
SELECT
CASE
WHEN TotalSteps < 5000 THEN 'low activity'
WHEN TotalSteps > 10000 THEN 'moderate actvity'
ELSE 'high activity'
END AS activity_level,
COUNT(*) AS records
FROM `bellabeat-case-study-499507.bellabeat.daily_activity_mar_apr`
GROUP BY activity_level
ORDER BY records DESC
 
--Observation #3: What day has the highest average steps? What day had the lowest? Are weekends noticeably different?
  --Daily patterns: compared average steps by day of the week.

SELECT
FORMAT_DATE('%A', ActivityDate) AS weekday,
ROUND(AVG(TotalSteps),0) AS avg_steps
FROM `bellabeat-case-study-499507.bellabeat.daily_activity_mar_apr` 
GROUP BY weekday
 
SELECT
FORMAT_DATE('%A', ActivityDate) AS weekday,
ROUND(AVG(TotalSteps),0) AS avg_steps
FROM `bellabeat-case-study-499507.bellabeat.daily_activity_apr_may` 
GROUP BY weekday

--Observation #4: How are users spending their day?

SELECT
ROUND(AVG(VeryActiveMinutes),0) AS very_active,
ROUND(AVG(FairlyActiveMinutes),0) AS fairly_active,
ROUND(AVG(LightlyActiveMinutes),0) AS lightly_active,
ROUND(AVG(SedentaryMinutes),0) AS sedentary
FROM `bellabeat-case-study-499507.bellabeat.daily_activity_mar_apr`
 
SELECT
ROUND(AVG(VeryActiveMinutes),0) AS very_active,
ROUND(AVG(FairlyActiveMinutes),0) AS fairly_active,
ROUND(AVG(LightlyActiveMinutes),0) AS lightly_active,
ROUND(AVG(SedentaryMinutes),0) AS sedentary
FROM `bellabeat-case-study-499507.bellabeat.daily_activity_apr_may`

--Observation #5: Are there any disparities in calories vs steps?
  --Relationship between steps and calories burned.

SELECT
TotalSteps,
Calories
FROM `bellabeat-case-study-499507.bellabeat.daily_activity_mar_apr`
  
SELECT
TotalSteps,
Calories
FROM `bellabeat-case-study-499507.bellabeat.daily_activity_apr_may`
