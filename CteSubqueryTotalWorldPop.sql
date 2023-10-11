-- GETTING TOTAL WORLD POPULATION USING CTE and SUB QUERY

WITH country_wize_pop AS (
SELECT location, MAX(population) TotalPop FROM coviddeaths 
WHERE continent IS NOT NULL 
GROUP BY LOCATION
)
SELECT SUM(TotalPop) FROM country_wize_pop


SELECT SUM(TotalPop) FROM (SELECT location, MAX(population) TotalPop FROM coviddeaths 
WHERE continent IS NOT NULL 
GROUP BY LOCATION) AS total_pop_per_country