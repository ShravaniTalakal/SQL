create database testdb;

use testdb;

drop table if exists t1;

create table t1(
pd int,
id int);

insert into t1 values (1,1),(1,2),(1,3),(1,4),(2,1),(2,2),(2,3),(2,4);
insert into t1 values (3, 1), (3, 3), (4,2), (4,3), (5,3), (5,1), (5,4);

insert into t1 values (1, 2), (1,3);

select * from t1;


select id1, id2, count(*) count from
(select t1.id id1, t2.id id2, t1.pd usr
from t1 t1
inner join t1 t2 on t1.pd = t2.pd and
t1.id < t2.id) t
group by id1, id2
order by id1, id2, count desc
limit 100;

select name p1, name p2, count(*) count from
(select t1.product_id id1, t2.product_id id2, t1.user_id usr
from transaction_tbl t1
inner join transaction_tbl t2 on t1.user_id = t2.user_id and
t1.proudct_id < t2.proudct_id) t
inner join product p1 on p1.product_id = id1
inner join product p2 on p2.product_id = id2
group by p1, p1
order by count desc
limit 100;





