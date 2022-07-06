use sakila;
desc actor;
select * from actor where first_name like "Scarlett";
select * from actor where last_name like "johansson";

select * from actor where first_name like '%SCa';
select * from actor;

select count(distinct last_name) from actor where last_name like 'johansson';
select count(distinct last_name) from actor;

select distinct(last_name) from actor group by last_name having count(*) = 1;
select last_name from actor group by last_name having count(*) > 1;

select actor.actor_id, actor.first_name,actor.last_name, count(actor_id) as film_count from actor join film_actor using(actor_id) group by actor_id order by film_count desc limit 1;

select * from  film_actor f inner join actor a on f.actor_id = a.actor_id group by f.actor_id order by count(f.actor_id) desc limit 1;

 
select film.film_id, film.title, store.store_id, inventory.inventory_id
from inventory join store using (store_id) join film using (film_id)
where film.title = 'Academy Dinosaur' and store.store_id = 1;

select avg(length) from film;

select category.name, avg(length),count(category.name)
from film join film_category using (film_id) join category using (category_id)
group by category.name
order by avg(length) desc;

select category.name, avg(length) from film join category using (film_id) join category using (category_id) group by category.name order by avg(length) desc;