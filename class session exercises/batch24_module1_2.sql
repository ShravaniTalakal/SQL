use batch24;

show tables;

desc customer;

alter table customer modify name varchar(35) not null;

select * from customer;

insert into customer values 
	(1, 'Shan', 'India', 'Bangalore', '560100'),
    (2, 'Anand', 'India', 'Bombay', '400000');
insert into customer values     
	(3, 'Bill','USA','Boston','17528'),
    (4, 'Mark','UK','London','23455');    
insert into customer (cust_id, name, pincode) values 
	(5, 'Amy','17528'),
    (6, 'Anny','23455');
    
update customer set
		country = 'USA',
        city = 'California'
where country is NULL;        

show tables;

desc order_info;

select * from order_info;

alter table order_info add price decimal(10,2) not null default 0;

select * from cust_personal_info;
insert into order_info values (1, 10, 1, 10.25), (2, 25, 1, 30.00);

alter table order_info add total_price decimal(10,2);

update order_info set
	total_price = order_qty * price;
    
select * from order_info;    

insert into order_info values (3, 50, 1, 15.50, order_qty * price);

create table order_master (
	order_id	int	primary key,
    order_value	decimal(12,2) not null);

insert into order_master
	select order_id, sum(total_price) from order_info
    group by order_id;

use batch24;
create table dup_order_master as 
	select * from order_master;
    
delete from order_master;    

insert into order_master 
	select * from dup_order_master;
    
delete from order_master where order_id <= 2;    

select * from order_master;

select * from personal_info;

create table dup_customer
	select * from customer;
    
select * from customer;    

delete from customer;

insert into customer
	select * from dup_customer
    where country != 'USA' ;
    
desc customer; 
desc dup_customer; 

### SELECT Statement

## Selecting all the columns and all the rows
select * from customer;  

## Selecting the only the required columns for all rows.
select name, cust_id, city, country 
from dup_customer;

select name, city, country
from dup_customer
where country = 'India' or country = 'UK';

select name, city, country
from dup_customer
where 	country = 'India' and 
		city = 'Bombay';
        
select * from order_info;   

select order_id, total_price
from order_info
where order_qty > 20;     
  
show databases;
  
## Text matching Select query
use sakila;

select * from sakila.actor limit 10;

select * from actor where last_name like'%G';

select * from actor where first_name like '____';

select * from actor where first_name not like '____';

select * from actor where first_name like '__A';

desc payment;

select * from payment where amount between 10.00 and 20.00;

select * from payment where staff_id in (1, 2);

select * from payment 
where payment_date between '2005-06-01' and '2005-06-30';

select * from payment
where payment_date < '2005-06-01';

select * from actor where first_name like 'WI%';

desc film_actor;

select f.actor_id, a.first_name, count(film_id)
from film_actor as f, actor as a
where f.actor_id = a.actor_id
group by actor_id;


use batch24;

desc products;

alter table order_info drop primary key;

desc order_info;

alter table order_info add product_id int;

alter table order_info 
	add foreign key (product_id) references products(prodid);
    
desc order_info;   

alter table order_info add primary key (ord_cust_id, product_id); 

select * from order_info;

select * from products;

update order_info set
	product_id = 1;
    
delete from order_info where order_qty > 10; 

create table sample_table (
	id1 int,
    id2 int,
    val int,
    primary key (id1, id2));
    
desc sample_table;    

select * from order_info;
select * from cust_personal_info;
insert into cust_personal_info values 
	(2, 'Anand',null, 'India', 'Bombay');

insert into order_info values 
	(1, 20, 1, 20.50, order_qty * price, 2),
    (2, 50, 2, 20.50, order_qty * price, 2),
    (2, 100, 2, 10.50, order_qty * price, 1);
    
select * from order_info;    

select ord_cust_id, order_id, sum(total_price)
from order_info
group by ord_cust_id, order_id
order by sum(total_price) desc;

select ord_cust_id, avg(total_price)
from batch24.order_info
group by ord_cust_id;

select ord_cust_id, order_id, max(grand_total)
from ( select ord_cust_id, order_id, sum(total_price) as 'grand_total'
from order_info
group by ord_cust_id, order_id) t;

select max(total_price) from order_info;

use batch24;

select sum(total_price), 
	max(total_price), 
		min(total_price),
	avg(total_price)
        from order_info;

select distinct ord_cust_id from order_info
order by ord_cust_id;           
        
select count(distinct ord_cust_id) from order_info;        

use sakila;

select last_name, first_name from actor
order by last_name, first_name desc;

describe actor;

select year(payment_date), month(payment_date), sum(amount)
from payment
where year(payment_date) > 2005
group by year(payment_date), month(payment_date)
having sum(amount) > 200
order by sum(amount) desc;

alter table order_info drop foreign key 
SELECT TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, CONSTRAINT_NAME
       FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
       WHERE REFERENCED_TABLE_SCHEMA IS NOT NULL;



 
    
    
    
    
    

