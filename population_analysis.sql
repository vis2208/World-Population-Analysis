/* Answer the following Analytical question.*/

--1. Which country has the highest population?

select Country_Name  from population where 
population = (select sum(population) as total_population from population group by country_name order by total_population desc limit 1 )

--2. Which country has the least number of people?

select Country_Name  from population where 
population = (select sum(population) as total_population from population group by country_name order by total_population asc limit 1 )

--3. Which country is witnessing the highest population growth?

with population_growth as (select country_name, sum(population)/count(distinct year) as total_population_growth from population
group by country_name order by total_population_growth desc limit 1 ) select country_name from population_growth;

--4. Which country has an extraordinary number for the population?

with extraordinary_population as (select country_name, sum(population)/count(distinct Race_Code) as total_population_growth from population
group by country_name order by total_population_growth desc limit 1 ) select country_name from extraordinary_population;

--5. Which is the most densely populated country in the world?

with population_density as (select country_name, sum(population)/count(distinct Age) as total_population_growth from population
group by country_name order by total_population_growth desc limit 1 ) select country_name from population_density;