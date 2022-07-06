use sakila;

desc payment;

## Subquery in Where Clause (Single Row Subquery)
select customer_id, amount 
from payment 
where amount > (select round(avg(amount),2) from payment);

select round(avg(amount),2) from payment;

## Subquery in Select Clause and From Clause
select customer_id, p.amount, (select round(avg(amount),2) as 'Avg_Amount' from payment)
from payment p, (select round(avg(amount),2) as 'Amount' 
					from payment) as avg
where p.amount > avg.Amount;

## Subquery in Having Clause
select p.customer_id, sum(p.amount) as "total_amount"
from 	payment p
group by p.customer_id
having total_amount > 2 * (select avg(amount) from payment);

select customer_id, sum(amount) as "Total Amount"
from payment
group by customer_id
order by sum(amount) desc
limit 10;

select customer_id, sum(amount) as total_amount
from payment
group by customer_id
order by total_amount desc
limit 10;

select customer_id, sum(amount )
from payment
group by customer_id;


## Example of nested level subqueries.
select distinct p.customer_id, c.first_name, c.last_name
from payment p
inner join customer c on p.customer_id = c.customer_id
where p.customer_id in (select t.customer_id from 
					(select customer_id, sum(amount) 
                    from payment 
                    group by customer_id 
                    order by 2 desc
                    limit 10) as t);

desc payment;
desc customer;

select p.customer_id, c.last_name, c.first_name
from payment p
inner join customer c on p.customer_id = c.customer_id
limit 10;

use sakila;

## getting the 4th highest payment
select min(total_amount) from (select customer_id, sum(amount) as total_amount
from payment
group by customer_id
order by 2 desc
limit 4) as t;
