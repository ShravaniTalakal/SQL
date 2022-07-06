create database Imarticus;
show databases;
use Imarticus;

create table countries(
country_id int,
country_name varchar(10),
city varchar(10));

rename table countries to country_new;
desc country_new;

alter table country_new add regio_id decimal(10,0);

use Imarticus;
create table locations(
address varchar(20),
city varchar(10),
country_id int);
alter table locations add id int first;
desc locations;

alter table locations add region_id int after city;
desc locations;

alter table locations modify country_id smallint ;
alter table locations drop city;
alter table locations add state_province varchar(10) after region_id;
alter table locations change state_province state varchar(10);
alter table locations add primary key(id);
desc locations;
alter table locations drop primary key;
