USE SAKILA;

-- -----------------------------------------------Task1

select  concat(actor.first_name,' ', actor.last_name) as 'Actor Name', date(inventory.last_update) as 'Date' from film
join film_actor on film_actor.film_id = film.film_id
join actor on actor.actor_id= film_actor.actor_id
join inventory on inventory.film_id = film.film_id
GROUP BY ACTOR.actor_id;


-- --------------------task2a  
select  first_name, last_name from actor
where first_name<>last_name; 

-- --------------------task2b  

SELECT 
    first_name, last_name, 
    COUNT(first_name),COUNT(last_name)
FROM
    actor
GROUP BY first_name, last_name
HAVING COUNT(first_name) > 1 and COUNT(last_name)>1;

-- --------------------task2c 
create view task2c as
SELECT 
    first_name, last_name, 
    COUNT(first_name),COUNT(last_name)
FROM
    actor
GROUP BY first_name, last_name
HAVING COUNT(first_name) = 1 and COUNT(last_name)=1;

select count(first_name) from task2c;

-- -----------------------------------------------Task3
SELECT 
    first_name, last_name, 
    COUNT(first_name),COUNT(last_name)
FROM
    actor
GROUP BY first_name, last_name
HAVING COUNT(first_name) = 1 and COUNT(last_name)=1;-- list of not repeated actor names

SELECT 
    first_name, last_name, 
    COUNT(first_name),COUNT(last_name)
FROM
    actor
GROUP BY first_name, last_name
HAVING COUNT(first_name) > 1 and COUNT(last_name)>1;-- list of repeated actor names


-- -----------------------------------------------Task4
create view task4 as
select  count(category.name) as Movie_count,category.name, concat(actor.first_name,' ', actor.last_name) as Actor_Name  from film
join film_category on film_category.film_id = film.film_id
join category on film_category.category_id = category.category_id
join film_actor on film_actor.film_id = film.film_id
join actor on actor.actor_id= film_actor.actor_id
group by actor.actor_id,category.name 
order by actor_name, count(category.name) desc;

select Actor_Name, Name as 'Genere', Movie_Count from task4
where movie_count in (select max(movie_count) from task4 group by actor_name)
group by actor_name;

-- -----------------------------------------------Task5
select count(category.name) as count from film
join film_category on film_category.film_id = film.film_id
join category on film_category.category_id = category.category_id
group by category.name
order by count(category.name) desc limit 1;   -- Task5a

select title, description, 
case 
when rating like 'Pg' then 'Parental Guidance'
when rating like 'g' then 'General Audiences'
when rating like 'NC-17' then 'No One Seventeen and Under Admitted'
when rating like 'PG-13' then 'Are not considered suitable for children under the age of thirteen'
when rating like 'R' then 'Restricted, Children Under 17'

end as Ratings from film order by ratings;  -- Task5b

-- -----------------------------------------------Task6

select title, replacement_cost from film
where replacement_cost<=9; -- Task6 a

select title, replacement_cost from film
where replacement_cost between 10 and 15; -- Task6 b

select title, replacement_cost, rental_rate from film
having max(replacement_cost) and min(rental_rate); -- Task6 c



-- -----------------------------------------------Task7

select film.title as Movie_Name, count(actor.actor_id) as Actor_count  from film
join film_actor on film_actor.film_id = film.film_id
join actor on actor.actor_id= film_actor.actor_id
group by film.film_id
order by Actor_count desc;

-- -----------------------------------------------Task8
select title from film
where title regexp '^k' or  title regexp '^q';

-- -----------------------------------------------Task9

select film.title as Movie_Name, concat(actor.first_name,' ', actor.last_name) as 'Actor Name'  from film
join film_actor on film_actor.film_id = film.film_id
join actor on actor.actor_id= film_actor.actor_id
where film.title= 'agent truman';

-- -----------------------------------------------Task10

select film.title as Movie_Name , category.name as Category from film
join film_category on film_category.film_id = film.film_id
join category on film_category.category_id = category.category_id
where category.name ='family';


-- -----------------------------------------------Task11

select film.title as Movie_Name, count(film.title) as frequency from film
join inventory on inventory.film_id = film.film_id
join rental on rental.inventory_id = inventory.inventory_id
group by film.title
order by frequency desc;

-- -----------------------------------------------Task12

select title as Movie_Name, replacement_cost, rental_rate, replacement_cost-rental_rate as difference from film
where replacement_cost-rental_rate>15;

-- -----------------------------------------------Task13


create view task13 as
select count(film.film_id) as Number_of_Films,  category.name as Category from film
join film_category on film_category.film_id = film.film_id
join category on film_category.category_id = category.category_id
group by category.category_id; -- created view to get the results

select * from task13
where number_of_films between 60 and 70
order by number_of_films;





