
-- ROLLING VACCINATED POPULATION BY LOCATION ORDERED BY DATE

WITH VacPerPop (continent, location, date, population, new_vaccinations, NewVaccinationRolling) AS (
SELECT cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations,
SUM(cv.new_vaccinations) OVER (PARTITION BY cd.location ORDER BY cd.date) AS NewVaccinationRolling
	FROM coviddeaths AS cd 
	JOIN covidvac AS cv
	ON cd.location = cv.location 
	AND cd.date = cv.date
WHERE cd.continent IS NOT NULL )
SELECT *, ROUND((NewVaccinationRolling/population) * 100, 3) AS NewVaccinationRollingPercentage FROM VacPerPop WHERE NewVaccinationRolling IS NOT NULL;

-- CREATING VIEW FOR VISUALIZATIONS

CREATE VIEW VacPerPop AS
SELECT cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations,
SUM(cv.new_vaccinations) OVER (PARTITION BY cd.location ORDER BY cd.date) AS NewVaccinationRolling
	FROM coviddeaths AS cd 
	JOIN covidvac AS cv
	ON cd.location = cv.location 
	AND cd.date = cv.date
WHERE cd.continent IS NOT NULL