USE CovidData;

SELECT * FROM coviddeaths WHERE continent IS NOT NULL  ORDER BY date DESC;

DELETE FROM coviddeaths WHERE date > '2023-10-04';

-- TOP 10 COUNTRIES WITH MOST DEATH CASES

SELECT TOP 10 location, MAX(total_deaths) AS max_deaths FROM coviddeaths 
WHERE continent IS NOT NULL
GROUP BY location ORDER BY max_deaths DESC;

-- TOP 10 COUNTRIES WITH HIGHEST CASES

SELECT TOP 10 location, MAX(total_cases) AS total_cases FROM coviddeaths
WHERE continent IS NOT NULL
GROUP BY location ORDER BY total_cases DESC;


-- TOP 10 COUNTRIES WITH HIGH INFECTION RATE COMPARED TO POPULATION


SELECT TOP 10 location, MAX(total_cases) AS total_cases, MAX(population) AS total_population, ROUND((CAST(MAX(total_cases) AS FLOAT)/ CAST( MAX(population) AS FLOAT))*100, 3)  AS InfectedPopRatio FROM coviddeaths 
GROUP BY location
ORDER BY InfectedPopRatio DESC

--TOP 10 COUNTRIES WITH HIGH DEATH COUNT COMPARED TO POPULATION

SELECT TOP 10 location, MAX(total_deaths) AS total_deaths, MAX(population) AS total_population, ROUND((CAST(MAX(total_deaths) AS FLOAT)/ CAST( MAX(population) AS FLOAT))*100, 3)  AS DeathToPopRatio FROM coviddeaths 
GROUP BY location
ORDER BY DeathToPopRatio DESC

-- TOTAL CASES ,TOTAL_DEATHS, POPULATION DAILY IN THE WORLD 

SELECT date, SUM(new_cases)  AS TotalCasesPerDay, SUM(new_deaths) AS TotalDeathsPerDay , SUM(population) AS PopulationPerDay,
CASE
	WHEN SUM(new_cases) > 0 THEN ROUND((CAST(SUM(new_deaths) AS FLOAT)/CAST(SUM(new_cases) AS FLOAT)) * 100 , 3) 
	ELSE 0
END	AS DeathByCasesPerDay
FROM coviddeaths 
WHERE continent IS NOT NULL AND date < '2023-10-02'
GROUP BY date ORDER BY date DESC

 




SELECT SUM(population) FROM coviddeaths WHERE continent IS NOT NULL AND date='2023-10-01'