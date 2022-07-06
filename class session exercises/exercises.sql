create table job_his(
 emp_id int not null,
 job_id int,
 dept_id decimal(10,0),
 foreign key (job_id) references jobs(job_id)
 );
 
 
 create table employees1(
 emp_id int ,
 first_name varchar(10),
 last_name varchar(10),
 email varchar(12),
 phoneno smallint,
 dept_id int,
 salary decimal(10,0),
 commission_pact int,
 job_id int,
 primary key(emp_id));
 
 insert into employees ( emp_id,first_name,email,job_id) values (1,'abc','gouri',10),(2,'def','veeru',11),
 (3,'zxy','varshu',13),(4,'shivu','shashi',14); 
 
 select * from employees;
 
 update employees set email = 'not availble';

update employees set email='available', commission_pact = 0.10;
select * from employees;
insert into employees (emp_id,dept_id , commission_pact,job_id) values ( 5,110, 1.01,15),(6,110,1.01,16),(7,110,1.01,17);
select * from employees;

update employees set email='notavailable', commission_pact = 0.10 where dept_id = 110;
select * from employees;

create table departments(
dept_id int not null,
dept_name varchar(10),
location_id int);

insert into departments values(110,'physics',10),(2,'biology',11);

update employees set email='notavailble' where dept_id = (select dept_id from departments where dept_name = 'physics');
select * from employees;
select * from departments;

insert into employees1( emp_id, salary) values (1,4500),(2,5500),(3,4800),(4,8500);
select * from employees1;
update employees1 set salary = 8000 where emp_id = 1 and  salary < 5000;
show tables;
use batch24;

desc employees;
select * from employees;

select first_name, last_name, salary from employees1 where salary between 4500 and 8000;


select first_name ,last_name , dept_id from employees1  where dept_id (30,110) order by dept_id asc;

select first_name from employees1 where fist_name like '%b%' and first_name like  '%c%';

use batch24;

select count(*) job_id from employees1;
select count(job_id ) from employees1;
select sum(salary) from employees1;

select min(salary) from employees1;
select max(salary) from employees1 where job_id = 'programmer';

select avg(salary), count(*) from employees1 where dept_id = 90;

select max(salary),min(salary),sum(salary),avg(salary) from employees1;

select  max (salary) -  min(salary) difference  from employees1;

select dept_id, min(salary) from employees1 where dept_id is not null group by dept_id order by dept_id desc;






