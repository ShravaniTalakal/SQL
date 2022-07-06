use customer_info;

drop table if exists high_sal;
create table high_sal (
	name 	varchar(10) not null,
    salary	int not null);

insert into high_sal values 
		('Anand',50000),
        ('Akshay',45000),
        ('Amy',50000),
        ('Bill',45000),
        ('John',30000),
        ('Abhi',45000);
        
select * from high_sal 
order by salary desc; 

select salary, row_number() over (order by salary desc)
from high_sal;   

select salary, dense_rank() over (order by salary desc) as ranknum
from high_sal;  

## Using row_number() function to get the 2nd 
## highest Salary..
select salary from 
(select salary, row_number() over (order by salary desc) as rownum
from high_sal) t1
where rownum = 2; 

## Using Dense_rank function to get the required 2nd 
## highest salary.
select  distinct salary from 
(select salary, dense_rank() over (order by salary desc) as ranknum
from high_sal) t1
where ranknum = 2;    
    