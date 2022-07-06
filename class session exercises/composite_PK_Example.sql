use customer_info;

show tables;

desc employee;

alter table employee add primary key (emp_id);

create table emp_salary (
	emp_id 	int	not null references employee(emp_id),
    yearmonth	smallint	not null,
    salary			decimal(10, 2) not null,
    primary key (emp_id, yearmonth)
    );
alter table emp_salary modify yearmonth int not null;  

alter table emp_salary add foreign key(emp_id) references employee(emp_id);  

desc emp_salary;

select * from employee;

insert into emp_salary values (1, 202201, 3000.25);
insert into emp_salary values (1000, 202201, 3000.25);

select * from emp_salary;

delete from emp_salary where emp_id = 1000;