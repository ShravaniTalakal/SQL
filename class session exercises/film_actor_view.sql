use sakila;

select * from film_actor limit 5;

create or replace view film_actors as
select title, cat.name as category, 
		 act.first_name, act.last_name
from film_actor fa
inner join actor act
	on act.actor_id = fa.actor_id
inner join film fm
		on fm.film_id = fa.film_id
inner join film_category fc
	on fc.film_id = fa.film_id
inner join category cat
		on cat.category_id = fc.category_id;
        
desc film_actors;  

select title, category, first_name, last_name
from film_actors
where title like '%Lord%' and
	category = 'Children';      

select * from film_category;
