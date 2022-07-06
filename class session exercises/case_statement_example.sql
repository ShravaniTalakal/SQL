use customer_info;

drop table if exists products;
create table products (
	prdid 	int primary key auto_increment,
    prdname	varchar(20) not null,
    price	float not null,
    discount	float);
    
insert into products(prdname, price, discount) values 
		('abc', 10.25, null),('xyz',11.35,5.0),('def',21.0,8.0);

insert into products (prdname, price, discount) values
	('pqr',25.50, 15),('rst',35.02,18);
    
select * from products;        
        
## Provide discount 10% if there is any discount for a product
## Provide 15% discount if product discount is more than 15%
## Otherwise give the discount as available in the product table 
       
select prdname, price, round(price * (100 -
	case 
		when ifnull(discount,0) = 0 then 10
        when discount > 15 then 15
        else discount 
	end) / 100,2) as 'discountedPrice',
    discount as actual_discount
from products;    

select discount, ifnull(discount,10) from products;    