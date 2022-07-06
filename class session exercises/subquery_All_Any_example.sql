drop database if exists schooldb;

create database schooldb;

use schooldb;
create table department (
	id			tinyint	primary key,
    name		varchar(20)	not null,
    capacity	smallint not null
);

create table students (
	id	smallint	primary key,
    name	varchar(30)	not null,
    gender	varchar(10)	not null,
    age		tinyint	not null,
    dep_id	tinyint not null references department(id)
);


create table subjects (
	sub_id	int	primary key,	
    sub_name	varchar(20) not null);

insert into subjects values
	(1, 'Java'),
    (2, 'Python'),
    (3, 'SQL'),    
	(4, 'Web Design'); 
    
create table stu_marks (
	stu_id	int	not null references student(id),
    sub_id	int	not null references subjects(sub_id),
    mark	int	not null);

select * from department;
select * from student;    
select * from subjects;

select name from student order by id;
select * from subjects; 
select * from stu_marks;

select avg(mark) from stu_marks 
					group by sub_id;
                    
select st.name, s.sub_name, sm.mark
from stu_marks sm
inner join student st on st.id = sm.stu_id
inner join subjects s on s.sub_id = sm.sub_id
where sm.mark > ANY(select avg(mark) from stu_marks 
					group by sub_id)
order by 2, 1; 

select st.name, s.sub_name, sm.mark
from stu_marks sm
inner join student st on st.id = sm.stu_id
inner join subjects s on s.sub_id = sm.sub_id
where sm.mark > ALL(select avg(mark) from stu_marks 
					group by sub_id)
order by 2, 1;   