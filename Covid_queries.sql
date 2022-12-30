-- 1 -- show the percentage of the population that got infected (up to 26 Nov 2022)
SELECT CovidDeaths.location AS "Location",
MAX(CovidDeaths.population) AS "Total population",
MAX(CovidDeaths.total_cases) AS "Total cases",
MAX(CovidDeaths.total_cases)/MAX(CovidDeaths.population)*100 AS "% of population infected"
FROM CovidDeaths
GROUP BY CovidDeaths.location
ORDER BY "% of population infected" desc;

-- 2 -- show the percentage of the infected who passed away (up to 26 Nov 2022)
SELECT CovidDeaths.location AS "Location",
MAX(CovidDeaths.total_cases) AS "Total cases",
MAX(CovidDeaths.total_deaths) AS "Total deceased",
MAX(CovidDeaths.total_deaths)/MAX(CovidDeaths.total_cases)*100 AS "% of infected deceased"
FROM CovidDeaths
GROUP BY CovidDeaths.location
ORDER BY CovidDeaths.location

-- 3 -- show the percentage of the population that got infected and the percentage of the infected who passed away (up to 26 Nov 2022)
SELECT CovidDeaths.location AS "Location",
MAX(CovidDeaths.population) AS "Total population",
MAX(CovidDeaths.total_cases) AS "Total cases",
MAX(CovidDeaths.total_deaths) AS "Total deceased",
MAX(CovidDeaths.total_cases) /MAX(CovidDeaths.population)*100 AS "% of population infected",	
MAX(CovidDeaths.total_deaths)/MAX(CovidDeaths.population)*100 AS "% of population deceased",
MAX(CovidDeaths.total_deaths)/MAX(CovidDeaths.total_cases)*100 AS "% of infected deceased"
FROM CovidDeaths
GROUP BY CovidDeaths.location
ORDER BY CovidDeaths.location;

-- 4 -- show locations with highest to lowest infected deaths (up to 26 Nov 2022)
SELECT CovidDeaths.location AS "Location",
MAX(CovidDeaths.total_deaths) AS "Total deceased"
FROM CovidDeaths
GROUP BY CovidDeaths.location
ORDER BY "Total deceased" DESC;

-- 5 -- show the TOP 5 countries with highest infected death count (up to 26 Nov 2022)
SELECT TOP 5
CovidDeaths.location AS "Location",
MAX(CovidDeaths.total_deaths) AS "Total deceased"
FROM CovidDeaths
GROUP BY CovidDeaths.location
ORDER BY "Total deceased" DESC;

-- 6 -- show the TOP 5 countries with highest infected death % (up to 26 Nov 2022)
SELECT TOP 5
CovidDeaths.location AS "Location",
MAX(CovidDeaths.total_cases) AS "Total cases",
MAX(CovidDeaths.total_deaths) AS "Total deceased",
MAX(CovidDeaths.total_deaths)/MAX(CovidDeaths.total_cases)*100 AS "% of infected deceased"
FROM CovidDeaths
GROUP BY CovidDeaths.location
ORDER BY "% of infected deceased" DESC;

-- 7 -- show the TOP 5 countries with the highest population infection percentage (up to 26 Nov 2022)
SELECT TOP 5
CovidDeaths.location AS "Location",
MAX(CovidDeaths.population) AS "Total population",
MAX(CovidDeaths.total_cases) AS "Total cases",
MAX(CovidDeaths.total_cases)/MAX(CovidDeaths.population)*100 AS "% of population infected"
FROM CovidDeaths
GROUP BY CovidDeaths.location
ORDER BY "% of population infected" DESC;

-- 8 -- show world wide total infected people with toal infected deaths (up to 26 Nov 2022)
SELECT SUM(CovidDeaths.new_cases) AS "Total cases",
SUM(CovidDeaths.new_deaths) AS "Total Deaths",
SUM(CovidDeaths.new_deaths)/SUM(CovidDeaths.new_cases)*100 AS "% of infected deceased"
FROM CovidDeaths

-- 9 -- show continent total infected people with toal infected deaths (up to 26 Nov 2022)
SELECT CovidDeaths.continent as "Continent",
SUM(CovidDeaths.new_cases) AS "Total cases",
SUM(CovidDeaths.new_deaths) AS "Total Deaths",
SUM(CovidDeaths.new_deaths)/SUM(CovidDeaths.new_cases)*100 AS "% of infected deceased"
FROM CovidDeaths
WHERE CovidDeaths.continent IS NOT NULL
GROUP BY CovidDeaths.continent
ORDER BY CovidDeaths.continent;

-- 10 -- show percentage of population that got vaccinated (up to 26 Nov 2022)
SELECT CovidVaccinations.location AS "Country",
MAX(CovidVaccinations.total_vaccinations) AS "Total Vaccinations",
(MAX(CovidVaccinations.total_vaccinations)/MAX(CovidVaccinations.population))*100 AS "% of population vaccinated"
FROM CovidVaccinations
GROUP BY CovidVaccinations.location
ORDER BY CovidVaccinations.location;

-- 11 -- show the incline of infections through time from 1st day of infections recorded (up to 26 Nov 2022)
SELECT CovidDeaths.location as "Country",
CovidDeaths.date AS "Date",
CovidDeaths.total_cases AS "Total Cases",
CovidDeaths.new_cases AS "New Cases"
FROM CovidDeaths
WHERE CovidDeaths.location = 'United States'
AND total_cases IS NOT NULL
ORDER BY "Country", "Date";

-- 12 -- show the incline of vaccinations through time from 1st day of vaccinations recorded from United States (up to 26 Nov 2022)
SELECT CovidVaccinations.location as "Country",
CovidVaccinations.date AS "Date",
CovidVaccinations.total_vaccinations AS "Total Vaccinations",
CovidVaccinations.new_vaccinations AS "New Vaccinations"
FROM CovidVaccinations
WHERE CovidVaccinations.location = 'United States'
AND total_vaccinations IS NOT NULL
ORDER BY "Country", "Date";