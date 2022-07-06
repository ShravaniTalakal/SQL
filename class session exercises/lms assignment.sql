use logistics;

create table emp_detail(
emp_id int primary key,
emp_name varchar(30) not null,
emp_branch varchar(15),
emp_designation varchar(40),
emp_address varchar(100),
emp_cont_no varchar(10));

create table membership(
m_id int primary key,
start_date date,
end_date date);

drop table if exists customer;
create table customer (
cust_id int primary key,
cust_name varchar(30),
cust_email_id varchar(30),
cust_contact_no varchar(10),
cust_addr varchar(100),
cust_type varchar(30) constraint cust_type_check check(cust_type in("Wholesale","Retail","Internal Goods")),
membership_id  int references membership(m_id));









