--Simple Data Explorations Project on Covid Dataset
--working tables
select * from PortfolioProject1..CovidDeaths$
select * from PortfolioProject1..CovidVaccinations$
--First Table Exploration
select location,date,total_cases,new_cases,total_deaths,new_deaths
from PortfolioProject1..CovidDeaths$
--total cases result by total_cases + new_cases
select count(total_cases+new_cases) as cases_result from PortfolioProject1..CovidDeaths$
--total cases by continet
select continent,count(total_cases) as c_by_continet from PortfolioProject1..CovidDeaths$
where continent is not null
group by continent
--avg cases per contitnet
select continent,avg(total_cases) as avg_cases from PortfolioProject1..CovidDeaths$
where continent is not null
group by continent
order by 1,2
--total deaths
select location,COUNT(total_deaths) as overall_deaths from PortfolioProject1..CovidDeaths$
group by location--no deaths
--total detahs by date
select date,count(total_deaths) as deaths_by_date
from PortfolioProject1..CovidDeaths$
group by date--again no deaths found
--top 3 continent by  covid cases
select  top 3 continent,max(total_cases) as max_cases
from PortfolioProject1..CovidDeaths$
where continent is not null
group by continent
order by max(total_cases) desc
--bottom 3 continent by covid cases
select top 3 continent,min(total_cases) as min_cases
from PortfolioProject1..CovidDeaths$
where continent is not null
group by continent
order by min(total_cases) desc--this one not very helpful but i have explore
--filter max cases by date
select date,max(total_cases) as max_cases
from PortfolioProject1..CovidDeaths$
group by date
order by max(total_cases) desc
--filter min cases by date
select date,min(total_cases) as min_cases
from PortfolioProject1..CovidDeaths$
group by date
order by min(total_cases) desc
--avg patients med aged by each country
select location ,avg(median_age) as med_agePatient
from PortfolioProject1..CovidVaccinations$
where location is not null
group by location
order by avg(median_age) desc
--avg patients aged 65 plus by each country
select location ,avg(aged_65_older) as age_65Plus_Patient
from PortfolioProject1..CovidVaccinations$
group by location
order by avg(aged_65_older) desc
--avg patients aged 70 plus by each country
select location ,avg(aged_70_older) as med_agePatient
from PortfolioProject1..CovidVaccinations$
group by location
order by avg(aged_70_older) desc
--total population by continent
select  continent,COUNT(population_density) as total_population
from PortfolioProject1..CovidVaccinations$
where continent is not null
group by continent
order by count(population_density) desc
--total population by  each counrty
select  location,COUNT(population_density) as total_population
from PortfolioProject1..CovidVaccinations$
where location is not null
group by location
order by count(population_density) desc
--I think its enough