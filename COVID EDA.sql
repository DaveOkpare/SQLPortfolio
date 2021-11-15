/*
Covid 19 Data Exploration 
Skills used: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types
*/

-- Total Deaths Per Cases

SELECT location, date, population, total_cases, total_deaths, (total_deaths / total_cases) * 100 AS DeathPerCases 
FROM `gleaming-bot-331818.covid_data.covid_deaths`
WHERE continent IS NOT NULL
ORDER BY 1, 2;

-- Total Cases Per Population

SELECT location, date, population, total_cases, total_deaths, (total_cases / population) * 100 AS CasesPerPopulation
FROM `gleaming-bot-331818.covid_data.covid_deaths`
WHERE continent IS NOT NULL
ORDER BY 1, 2;

-- Countries with Highest Infection Rate compared to Population

SELECT location, population, MAX(total_cases) AS HighestTotalCases, (MAX(total_cases) / population) * 100 AS HighestInfectedPopulation
FROM `gleaming-bot-331818.covid_data.covid_deaths`
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY 4 DESC 



-- Countries with Highest Death Rate compared to Population

SELECT location, population, MAX(total_deaths) AS HighestDeaths, (MAX(total_deaths) / population) * 100 AS HighestDeathsPopulation
FROM `gleaming-bot-331818.covid_data.covid_deaths`
WHERE continent IS NOT NULL 
GROUP BY location, population
ORDER BY 4 DESC
