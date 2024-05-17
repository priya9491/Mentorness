SELECT * FROM corona.corona;

select count(*) from corona.corona;
#Q1. Write a code to check NULL values

SELECT * 
FROM corona.corona_virus
WHERE NOT( Province IS NOT NULL AND 
			Country IS NOT NULL AND 
            Latitude IS NOT NULL AND 
            Longitude IS NOT NULL AND
            Date IS NOT NULL AND 
            Confirmed IS NOT NULL AND
            Deaths IS NOT NULL AND
            Recovered IS NOT NULL);

#Q2. If NULL values are present, update them with zeros for all columns. 
Update corona.corona
set
	Province  = COALESCE(Province,'0'),
    Country= COALESCE(Country,'0'),
    Latitude =COALESCE(Latitude ,'0'),
    Longitude = COALESCE(Longitude,'0'),
    Date=COALESCE(Date,'0'),
    Confirmed = COALESCE(Confirmed,'0'),
    Deaths =COALESCE(Deaths,'0'),
    Recovered = COALESCE(Recovered,'0');
    
#Q3 check total number of rows

SELECT COUNT(*) AS total_rows
FROM corona.corona;

#Q4. Check what is start_date and end_date

SELECT min(DATE) AS START_DATE, max(DATE) AS END_DATE
FROM corona.corona;

# Q5. Number of month present in dataset
 
SELECT
	EXTRACT(MONTH FROM Date) AS MONTH,
    COUNT(*) AS NUM_OF_MONTHS
FROM
	corona.corona
GROUP BY
	extract(MONTH FROM Date);
    
# Q6. Find monthly average for confirmed, deaths, recovered

SELECT 
    YEAR(Date) AS year,
    MONTH(Date) AS month,
    AVG(Confirmed) AS avg_confirmed,
    AVG(Deaths) AS avg_deaths,
    AVG(Recovered) AS avg_recovered
FROM 
    corona.corona
GROUP BY 
    YEAR(Date), MONTH(Date);
    
# Q7. Find most frequent value for confirmed, deaths, recovered each month 
SELECT MONTH(date) AS Month,YEAR(DATE) AS Year,
       MAX(confirmed) AS most_frequent_confirmed,
       MAX(deaths) AS most_frequent_deaths,
       MAX(recovered) AS most_frequent_recovered
FROM corona.corona
GROUP BY MONTH,YEAR
ORDER BY YEAR,MONTH;


#Q8 Find minimum values for confirmed, deaths, recovered per year
SELECT 
    YEAR(date) AS year,
    MIN(confirmed) AS min_confirmed,
    MIN(deaths) AS min_deaths,
    MIN(recovered) AS min_recovered
FROM 
    corona.corona
GROUP BY 
    YEAR(date);
    
 #Q9 Find maximum values of confirmed, deaths, recovered per year   
    
SELECT 
    YEAR(date) AS year,
    Max(confirmed) AS max_confirmed,
    Max(deaths) AS max_deaths,
    Max(recovered) AS max_recovered
FROM 
    corona.corona
GROUP BY 
    YEAR(date);
    
   
#Q10. The total number of case of confirmed, deaths, recovered each month
 SELECT 
    YEAR(date) AS year,
    MONTH(date) AS month,
    SUM(confirmed) AS total_confirmed,
    SUM(deaths) AS total_deaths,
    SUM(recovered) AS total_recovered
 FROM 
    corona.corona
 GROUP BY 
    YEAR(date), MONTH(date);

#Q11. Check how corona virus spread out with respect to confirmed case
#(Eg.: total confirmed cases, their average, variance & STDEV )
SELECT
	YEAR(DATE) AS YEAR,
    MONTH(DATE) AS MONTH,
    SUM(confirmed) AS TOTALConfirmed,
    AVG(confirmed) AS AVGConfirmed,
    VARIANCE(confirmed) AS VARIANCEConfirmed,
    STDDEV(confirmed) AS STDDEVConfirmed
FROM
	CORONA.CORONA
GROUP BY
	YEAR(DATE) ,MONTH(DATE)
ORDER BY
	YEAR(DATE),MONTH(DATE);
    
# Q12. Check how corona virus spread out with respect to death case per month
#--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT
	YEAR(DATE) AS YEAR,
    MONTH(DATE) AS MONTH,
    SUM(DEATHS) AS TOTALDeaths,
    AVG(DEATHS) AS AVGDeaths,
    VARIANCE(DEATHS) AS VARIANCEDeaths,
    STDDEV(DEATHS) AS STDDEVDeaths
FROM
	CORONA.CORONA
GROUP BY
	YEAR(DATE) ,MONTH(DATE)
ORDER BY
	YEAR(DATE),MONTH(DATE);
#Q13. Check how corona virus spread out with respect to recovered case
#--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT
	YEAR(DATE) AS YEAR,
    MONTH(DATE) AS MONTH,
    SUM(recovered) AS TOTALRecoveredCases,
    AVG(recovered) AS AVGRecoveredCases,
    VARIANCE(recovered) AS VARIANCERecoveredCases,
    STDDEV(recovered) AS STDDEVRecoveredCases
FROM
	CORONA.CORONA
GROUP BY
	YEAR(DATE) ,MONTH(DATE)
ORDER BY
	YEAR(DATE),MONTH(DATE);
    
#Q14. Find Country having highest number of the Confirmed case
select country,max(confirmed) as Highest_confirmed_case
from corona.corona
group by Country
order by Highest_confirmed_case desc
limit 1;

#Q15. Find Country having lowest number of the death case
select country, min(deaths) as lowest_num_deaths
from corona.corona
group by country
order by lowest_num_deaths desc
limit 1;

#Q16. Find top 5 countries having highest recovered case
select country,max(recovered) as highest_recoverd_case
from corona.corona
group by country
order by highest_recoverd_case desc
limit 5;
