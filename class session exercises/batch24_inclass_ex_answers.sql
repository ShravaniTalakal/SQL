use bank_inventory;

desc bank_account_transaction;

alter table bank_account_transaction modify transaction_date date;

select * from bank_account_transaction;

desc bank_inventory_pricing;

select * from bank_inventory_pricing;


## Answer for 1

select product, price, sum(quantity) as total_qty
from bank_inventory_pricing
group by product
having total_qty > 5;

## Q2
select month, product, quantity, count(*)
from bank_inventory_pricing
where ifnull(estimated_sale_price,0) < ifnull(purchase_cost, 0)
group by month, product;

## Q3
select coalesce(estimated_sale_price,0) as est_price
from bank_inventory_pricing
order by est_price desc
limit 2, 1;

select ifnull(estimated_sale_price,0) 
from bank_inventory_pricing
order by 1 desc;

## Q4
select product, count(product)
from bank_inventory_pricing
group by product
having count(product) > 1;

## Q5
create or replace view bank_details as
	select * 
    from bank_inventory_pricing
    where product = 'PayPoints' and
		quantity > 2;

select * from bank_details;

select product, quantity
from bank_inventory_pricing
where product = 'PayPoints';

## Q6

create or replace view bank_details1 as
	select * from bank_inventory_pricing;

select * from bank_details1;

insert into bank_details1 values
	('PayPal',5, 3000.25,null, 3500.00, 3);  
    
select * from bank_inventory_pricing
where product = 'PayPal' and month = 3;

## Q7
select *, (revenue-cost) as real_profit from bank_branch_pl;

select branch, Product, 
	sum(revenue - cost) as tot_real_profit, 
    sum(estimated_profit) as tot_est_profit
from bank_branch_pl
group by branch, product
having tot_real_profit > tot_est_profit; 

## Q8

select month, min(revenue - cost) as real_profit
from bank_branch_pl
where (revenue - cost ) > 0
group by month;

## Q9

alter table bank_inventory_pricing modify quantity char(5);

select product, quantity
from bank_inventory_pricing;
select product, lpad(quantity,5,'0') 
from bank_inventory_pricing;

## Q10

select name from titanic_data
where name like '%U%';

alter table titanic_data 
	add column first_name varchar(25) after name;
alter table titanic_data 
	add column last_name varchar(25) after first_name; 

alter table titanic_data modify first_name varchar(100);    

update titanic_data set
		first_name = substring(name, locate(',', name) + 1, length(name) - locate(',', name) + 1),
        last_name = substring(name, 1,locate(',', name) - 1);
        
## Q 11

select branch, product,
	(cost * .7) as red_cost,
    sum(revenue - (cost * .7)) as real_profit,
    sum(estimated_profit)
from bank_branch_pl
group by branch, product
having sum((revenue - (cost * .7))) > sum(estimated_profit);    
	
## Q12
select * from bank_inventory_pricing
where product  not in ('BusiCard','SuperSave');  

 ## Q13
select * from bank_inventory_pricing
where price  between 220 and 300;   

## Q14

select * from bank_inventory_pricing
where product in (select product 
from bank_inventory_pricing
group by product 
having count(product) = 1)
order by product;

## Q15
update bank_inventory_pricing set
	price = price * 1.15
where quantity > 3;  
  
## Q16
select price, round(price)
 from bank_inventory_pricing;  
 
 ##Q17
 
 alter table bank_inventory_pricing modify product varchar(30);
 desc bank_inventory_pricing;
 
 ## Q18
 
 alter table bank_inventory_pricing add new_price decimal(7,2);
 
update bank_inventory_pricing set
	new_price = price + 100
where quantity > 3;
 
## Q19 
select * 
from bank_account_details ba
where account_type = 'SAVINGS' and
	   exists(select account_type from bank_account_details ba1
			where ba1.customer_id = ba.customer_id and
				  ba1.account_type = 'Add-on Credit Card') and
	   exists(select account_type from bank_account_details ba1
			where ba1.customer_id = ba.customer_id and
				  ba1.account_type = 'Credit Card');    
select * from bank_account_details
order by customer_id, account_type;             

insert into bank_account_details values 
 (123001, '5000-1700-3458','Credit Card', 10000, 'ACTIVE', 'S');
 
 ## Q21
 
select bt.account_number, ba.account_type, bt.transaction_amount,
		bl.Account_Number as Link_ac_number, 
        bl.account_type as link_ac_type
from bank_account_transaction bt
inner join bank_account_details ba
	on ba.Account_Number = bt.account_number
inner join bank_account_relationship_details bl
	on bl.Customer_id = ba.customer_id and
	    bl.Linking_Account_Number = bt.Account_Number;
    
select * from bank_account_details
where customer_id = 123001;    
select * from bank_account_relationship_details
where customer_id = 123001;    

desc bank_account_transaction;

select * from bank_account_transaction
where year(transaction_date) = 2020 and
	month(transaction_date) = 3;
    
select * from bank_account_transaction
where extract(year_month from transaction_date) != 202003;