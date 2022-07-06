use customer_info;

## Selecting system date and time using now()
select now();

## Selecting only date part from system date using curdate()
select curdate(), current_date();

select curtime(), current_time();

## Extracting only date from now()  which is equal to curdate()
select date(now());

drop table if exists salesorders;
CREATE TABLE SalesOrders (
    ID INTEGER,
    CustomerID Integer,
    OrderDate Date,
    FinancialCode Char( 2 ),
    Region Char( 7 ),
    SalesRepresentative Integer);
    
INSERT INTO SalesOrders VALUES(2001, 101, '2000-03-16', 'r1', 'Eastern', 299);
INSERT INTO SalesOrders VALUES( 2002, 102, '2000-03-17', 'r2', 'Western', 399);
INSERT INTO SalesOrders VALUES (2003, 103, '2000-03-18', 'r3', 'Western', 499);
INSERT INTO SalesOrders VALUES (2004, 104, '2001-01-02', 'y1', 'Eastern', 599);
INSERT INTO SalesOrders VALUES (2005, 105, '2001-01-03', 'y2', 'Western', 699);
INSERT INTO SalesOrders VALUES (2006, 106, '2001-01-04', 'y3', 'Eastern', 799);
INSERT INTO SalesOrders VALUES (2007, 107, '2007/01/04', 'y3', 'Eastern', 799);
INSERT INTO SalesOrders VALUES (2007, 108, str_to_date('23/08/2007','%d/%m/%Y'), 'y5', 'Eastern', 899);
INSERT INTO SalesOrders VALUES (2008, 109, '2003/03/15', 'y3', 'Eastern', 799);
INSERT INTO SalesOrders VALUES (2009, 110, '2003/03/20', 'y3', 'Eastern', 799);

select 
	year('2022-01-07'), 
	month('2022-01-07'), 
    day('2022-01-07'),
    quarter('2022-01-07');
    

select * from salesorders;

select year(OrderDate), month(OrderDate), sum(SalesRepresentative)
from SalesOrders
group by year(OrderDate), month(OrderDate)
order by year(OrderDate), month(OrderDate);

select year(OrderDate), quarter(OrderDate), sum(SalesRepresentative)
from SalesOrders
where year(OrderDate) >= 2007
group by year(OrderDate), quarter(OrderDate)
having sum(SalesRepresentative) > 800
order by year(OrderDate), quarter(OrderDate);

select extract(year_month from OrderDate), sum(SalesRepresentative)
from SalesOrders
group by extract(year_month from OrderDate)
order by extract(year_month from OrderDate);
update salesorders set
orderdate = '2000-03-15'
where id = 2008;
update salesorders set
orderdate = '2000-03-20'
where id = 2009;
select * from salesorders;

## Selecting data between two dates.  The default date format is YYYY-MM-DD
SELECT *
FROM salesorders
where OrderDate between '2000-03-15' and '2000-03-20';

## Selecting data with only year part
SELECT * FROM salesorders 
WHERE YEAR(OrderDate) <= 2001 and month(OrderDate) = 03;

## Selecting data with year_month part
SELECT * from salesorders
where EXTRACT(YEAR_MONTH FROM OrderDate) <= 200103;

select month(orderdate), day(orderdate), count(*) 
from salesorders 
group by month(orderdate), day(orderdate)
order by month(orderdate), day(orderdate);

## Selecting only the month from orderdate
select distinct month(orderdate) from salesorders order by month(orderdate) desc;
select distinct monthname(orderdate) from salesorders;

## Converting string to a date
select STR_TO_DATE('07-01-2022', "%d-%m-%Y");

## Formating the date
select date_format(curdate(), '%d-%m-%Y');

## Extracting date as string in desired format
select str_to_date(orderdate,"%Y-%m-%d") from salesorders;
select date_format(orderdate,"%d-%m-%Y") from salesorders;

## Str_to_date will help to format the date string to date
SELECT date_add(STR_TO_DATE('August,5,2017', "%M,%d,%Y"), interval 30 day);
SELECT STR_TO_DATE('Monday, August 14, 2017', '%W, %M %d, %Y');

## Dateadd function
select date_add(curdate(), interval 28 day);
SELECT DATE_ADD(curdate(), interval 1 month);
select date_add(curdate(), interval 1 year);

## Substracting days from a date
SELECT DATE_ADD("2021-06-04", INTERVAL -2 MONTH);
SELECT DATE_SUB("2021-06-04", INTERVAL 2 MONTH);

## Extracting the parts of the date
SELECT DATE_FORMAT(curdate(),'%D %y %a %d %m %b %j');

SELECT DATE_FORMAT(date_add(curdate(), interval 150 day),'%D %y %a %d %m %b %j');

use customer_info;

## Question # 8 on w3Resource create table.
drop table if exists job_history;
CREATE TABLE IF NOT EXISTS job_history ( 
EMPLOYEE_ID decimal(6,0) NOT NULL, 
START_DATE date NOT NULL, 
END_DATE varchar(10) NOT NULL
CHECK (END_DATE LIKE '__/__/____'), 
JOB_ID varchar(10) NOT NULL, 
DEPARTMENT_ID decimal(4,0) NOT NULL 
);

desc job_history;
insert into job_history values (
	1, curdate(), '01/07/2022', '1', 1.0);
    
select str_to_date(end_date, '%d/%m/%Y')
from job_history;    
    
use sakila;

## This query will return the payment for years and quarters.
select year(payment_date) as 'Year', 
	case 
		when quarter(payment_date) = 1 Then '1st Qtr'
        when quarter(payment_date) = 2 Then '2nd Qtr'
        when quarter(payment_date) = 3 Then '3rd Qtr'
        else '4th Qtr'
	end as 'Quarter',
    sum(amount) as 'Total Amount'
from payment
group by Year, Quarter;   

select 	
		year(payment_date) as 'Year', 
		monthname(payment_date) as 'Month',
		sum(amount) as "Total Payment"
from 	
		payment
group by Year, Month
having sum(amount) > 5000;

select year(payment_date) as "Year", 
	case 
		when quarter(payment_date) = 1 Then '1st Qtr'
        when quarter(payment_date) = 2 Then '2nd Qtr'
        when quarter(payment_date) = 3 Then '3rd Qtr'
        else '4th Qtr'
	end as 'Quarter',
    sum(amount)
from payment
group by year(payment_date), quarter(payment_date);  
