USE CovidData;

SELECT location, date, total_cases, new_cases, total_deaths, population FROM coviddeaths WHERE location='Nepal' ORDER BY date DESC;


-- TOTAL CASES VS TOTAL DEATHS IN NEPAL TILL 2023-10-04
-- 1.99% of total infected population died in Nepal

SELECT location, date, total_cases, total_deaths, ROUND((CAST(total_deaths AS FLOAT)/CAST(total_cases AS FLOAT)) * 100 , 3) AS DeathToCaseRatio FROM coviddeaths 
WHERE date=(SELECT MAX(date) FROM coviddeaths) and location='Nepal'
ORDER BY date DESC;


-- TOTAL CASES VS POPULATION IN NEPAL
-- 3.285% of total population were infected by covid-19

SELECT location, date, total_cases, population, ROUND((CAST(total_cases AS FLOAT)/ CAST(population AS FLOAT))*100, 3)  AS InfectedPopRatio FROM coviddeaths WHERE location='Nepal' AND date=(SELECT MAX(date) FROM coviddeaths)
