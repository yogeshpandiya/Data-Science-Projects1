use world;

-- ----------------------------------TASK1 -------------------

select Code, Name as 'Country Name' from country
where code in ('usa','gbr', 'are');

-- ----------------------------------TASK2 -------------------

CREATE  VIEW TASK2 AS
SELECT Continent, SUM(Population) AS Avg_Population FROM COUNTRY
GROUP BY Continent;
select * from task2;
SELECT avg(Avg_Population) as 'Avg_Popultion of continents' FROM TASK2;

-- ----------------------------------TASK3 -------------------

select Name, continent, language from country
join countrylanguage on countrylanguage.CountryCode = country.code
where continent = 'Europe' and Language='french';

-- ----------------------------------TASK4 -------------------


SELECT continent, name, population FROM country 
WHERE population IN (SELECT MAX(population) FROM country group by CONTINENT)
group by CONTINENT;

-- ----------------------------------TASK1 SAKILA-------------------

use SAKILA;

select  title, count(film.film_id) from inventory
join film on inventory.film_id = film.film_id
where title in ('BROTHERHOOD BLANKET' , 'SOUP WISDOM')
group by film.film_id;

-- ----------------------------------TASK2 SAKILA-------------------


select  category.name as Genre, count(film.film_id) as "Number of Movies"  from film
join film_category on film_category.film_id = film.film_id
join category on film_category.category_id = category.category_id
join inventory on inventory.film_id = film.film_id
group by category.name;

-- ----------------------------------TASK3 SAKILA-------------------

select  concat(actor.first_name,' ', actor.last_name) as 'Actor Name', SUM(FILM.replacement_cost) AS 'Total Replacement Cost' from film
join film_actor on film_actor.film_id = film.film_id
join actor on actor.actor_id= film_actor.actor_id
GROUP BY ACTOR.actor_id
order by FILM.replacement_cost DESC LIMIT 3;


/*FILM.replacement_cost , concat(actor.first_name,' ', actor.last_name) as 'Actor Name' */

-- ----------------------------------TASK4 SAKILA-------------------

-- common city name
-- ancient , tale , abondoned, discover, escape, outrace, challange, 
-- tales , drama, astronaut
-- feminist 
--


select case
when description like  '%australia%' then 'Actual Incident'
when description like  '%china%' then 'Actual Incident'
when description like  '%brazil%' then 'Actual Incident'
when description like  '%ancient%' then 'Mystery' 
when description like  '%tale%' then 'Mystery' 
when description like  '%abondoned%' then 'Mystery' 
when description like  '%discover%' then 'Mystery' 
when description like  '%escape%' then 'Mystery' 
when category.name like  '%sci' then 'Fiction' 
when category.name like  '%drama%' then 'Fiction' 
when category.name like  '%animation%' then 'Fiction'
when description like  '%feminist%' then 'Political Issue' 

end as 'Different_Types_of_Movies', 

sum(payment.amount) as 'Total Sales' from film
join film_category on film_category.film_id = film.film_id
join category on film_category.category_id = category.category_id
join inventory on inventory.film_id = film.film_id
join rental on rental.inventory_id = inventory.inventory_id
join payment on payment.rental_id= rental.rental_id
group by Different_Types_of_Movies
order by sum(payment.amount) limit 4; -- To remove null values 

-- ----------------------------------TASK5 SAKILA-------------------

(select  category.name as Genre, sum(payment.amount) as Gross_Revenues from film
join film_category on film_category.film_id = film.film_id
join category on film_category.category_id = category.category_id
join inventory on inventory.film_id = film.film_id
join rental on rental.inventory_id = inventory.inventory_id
join payment on payment.rental_id= rental.rental_id
group by category.name
order by Gross_Revenues desc limit 10)

into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Task5_s4_c2_challange.csv'
fields terminated by ', '
lines terminated by '\n';
















