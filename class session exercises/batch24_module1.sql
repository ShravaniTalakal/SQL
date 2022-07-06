create database batch24;

show databases;

drop database batch24;

use batch24;

create table products (
prodid int primary key,
name	varchar(20),
price	decimal(10,2),
qty		smallint);

show tables;
desc products;

insert into products values (1, 'abc', 100.20, 100), (2, 'def', 250.00, 200);
select * from products;
insert into products (prodid) values (4), (5);


create table customer (
	cust_id int primary key,
    cust_name	varchar(50));
    
use batch24;


drop table customer_info;
drop table if exists customer_info;

create table customer_info (
	cust_id		tinyint	primary key,
    first_name	varchar(25) not null,
    last_name	varchar(25),
    dob			date,
    gender		char(1),
    phoneno		int unique,
    constraint chk_gender check (gender in ('M','F')));
    
alter table customer_info modify phoneno varchar(10) unique;

alter table customer_info change dob dateofbirth date;
    
desc customer_info;

insert into customer_info values 
	(1, 'Shan', 'Thiagarajan', '1988-10-01','M','9845036391');
    
select * from customer_info;

insert into customer_info (cust_id, first_name, gender, phoneno) 
	values (2, 'Anand','M','9845036392');

show tables;

create table customer (
	cust_id 	int,
    name		varchar(20),
    country		varchar(20),
    city		varchar(20)
);

alter table customer add primary key(cust_id);

alter table customer add pincode varchar(6) not null;

desc customer;

select * from customer_info;

CREATE TABLE personal_info (
	Cust_id int Not Null,
  Name varchar(20) Not Null,
  Country varchar(20) Not Null,
  City varchar(20),
PRIMARY KEY (Cust_id)); 

desc personal_info;

create table order_info (
	order_id 	int		primary key,
    order_qty	smallint	not null,
    ord_cust_id	int not null,
    foreign key (ord_cust_id) references cust_personal_info(cust_id)
    );

show tables;
select * from personal_info;
select * from order_info;

insert into personal_info  values (1, 'Shan', 'India','Bangalore');

insert into order_info values (1, 10, 1);
insert into order_info values (2, 100, 1);

drop table order_info;

select * from customer;

select * from personal_info;

create table t1 (
id	int primary key auto_increment,
val varchar(10));

desc t1;

insert into t1(val) values ('abc'),('dec');

select * from t1;

delete from t1 where id <= 5;

truncate table t1;

desc personal_info;

alter table personal_info change name full_name varchar(30) not null;

alter table personal_info drop primary key;

alter table personal_info add column last_name varchar(30) after full_name;

alter table personal_info modify country varchar(30) not null;

alter table personal_info add column pincode varchar(6);

alter table personal_info add primary key(cust_id);

alter table personal_info drop column pincode;

rename table personal_info to cust_personal_info;

desc cust_personal_info;

desc order_info;

create table personal_info like cust_personal_info;

desc personal_info;

select * from personal_info;

select * from cust_personal_info;

drop table if exists personal_info;

create table personal_info as
	select * from cust_personal_info;
