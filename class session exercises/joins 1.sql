use batch24;

create table t1(
id int not null,
v1 char(1) not null default 'á');

insert into t1 values(1,"a"), (2,"b"),(3,"c");

insert into t1(id) values (4);

create table t2(
id int not null,
v2 char(1) not null default 'a'); 

insert into t2 values(1,'a'),(2,'b');

insert into t2(id) values(5);
select * from t1;
select * from t2;

## union operation

select * from t1 union select * from t2;

select count(*) from ( select * from t1 union select * from t2) t;
## union all 

select * from t1 union all select * from t2;

select count(*) from ( select * from t1 union all select * from t2) t;

## intersect operation

select * from t1 where exists ( select t2.id from t2 
where t2.id = t1.id and t2.v2 = t1.v1);

# inner join
select t2.id,t1.v1 from t1 inner join t2 on 
t2.id = t1.id and t2.v2 = t1.v1;

desc customer;

create table orders(
cust_id int,
order_id int,
order_date date,
shipper_id varchar(10));

insert into orders values (101, 1, '2020-10-10','A111'),
							(102,2,'2020-10-11','A112'),
 							(103,3,'2020-10-12','A113'), 
							(104,4,'2020-10-12','A114'),
							(104,5,'2020-10-14','A114');  

select * from customer;

select * from orders;
insert into customer values ( 3, 'xyz','singapore', 'abns', '23678');

## union operation

select * from customer union select * from orders;

alter table customer drop pincode;

select * from customer;
select * from customer union select * from orders;

## inner join

select c.cust_id,c.name,c.country,c.city , o.order_date,o.shipper_id from customer as c
inner join orders as o on o.cust_id = c.cust_id;

create table customer1 (
			cust_id int,
            cust_name varchar(20),
            contact_name varchar(20),
            city varchar(20),
            telephone varchar(10));
insert into customer1 values (102, 'John','Bill','New York','207998701'), 
							(104, 'Joe','Amy','New Jersey','207998702'),
                            (106, 'Gary','George','Chicago','207998703');
select c.cust_id,c.cust_name,c.city , o.order_date,o.shipper_id from customer1 as c
inner join orders as o on o.cust_id = c.cust_id;
select 
	c.cust_id,
    c.cust_name,
    c.contact_name,
    c.telephone,
    c.city,
    o.order_date,
    o.shipper_id
from customer1 as c
inner join orders as o 
on o.cust_id = c.cust_id;   

select 
	c.cust_id,
    c.cust_name,
    c.contact_name,
    c.telephone,
    c.city,
    o.cust_id,
    o.order_id,
    o.order_date,
    o.shipper_id
from customer1 c
left join orders o 
on o.cust_id = c.cust_id; 
