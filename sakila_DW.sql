/*
Integrantes:
> Brandon Ramírez Jiménez
> Michelle Rodríguez Hernández
> William García Molina
*/

use master;
go

create database sakila_DW;
go

use sakila_DW;
go

create table dim_category(
	category_id tinyint identity(1,1) not null,
	name varchar(25) not null,
	last_update int not null
);
go

create table dim_city(
	city_id smallint identity(1,1) not null,
	city varchar(50) not null,
	country_id smallint not null,
	last_update int not null
);
go

create table dim_country(
	country_id smallint identity(1,1) not null,
	country varchar(50) not null,
	last_update int not null
);
go

create table dim_customer(
	customer_id smallint identity(1,1) not null,
	first_name varchar(45) not null,
	last_name varchar(45) not null,
	phone varchar(20) not null,
	email varchar(50) null,
	district_id smallint not null,
	active bit not null,
	create_date int not null,
	last_update int not null
);
go

create table dim_district(
	district_id smallint identity(1,1) not null,
	district varchar(20) not null,
	city_id smallint not null,
	last_update int not null
);
go

create table dim_film(
	film_id smallint identity(1,1) not null,
	title varchar(255) not null,
	description text null,
	release_year smallint null,
	rental_duration tinyint not null,
	rental_rate decimal(4,2) not null,
	length smallint null,
	replacement_cost decimal(5,2) not null,
	rating varchar(6) not null,
	special_features varchar(100) null,
	last_update int not null,
);
go

create table dim_film_category(
	film_id smallint not null,
	category_id tinyint not null,
	last_update int not null
);
go

create table dim_payment(
	payment_id smallint identity(1,1) not null,
	customer_id smallint not null,
	rental_id int null,
	amount decimal(5,2) not null,
	payment_date int not null,
	last_update int not null
);
go

create table dim_rental(
	rental_id int identity(1,1) not null,
	rental_date int not null,
	film_id smallint not null,
	customer_id smallint not null,
	return_date int null,
	last_update int not null
);
go

create table dim_time(
	id int identity(1,1) not null,
	registerdate datetime not null,
	year smallint not null,
	month varchar(12) not null,
	day smallint not null,
	dayname varchar(12) not null,
	quarter varchar(12) not null
);
go

alter table dim_category add constraint pk_category primary key(category_id);
alter table dim_city add constraint pk_city primary key(city_id);
alter table dim_country add constraint pk_country primary key(country_id);
alter table dim_customer add constraint pk_customer primary key(customer_id);
alter table dim_district add constraint pk_district primary key(district_id);
alter table dim_film add constraint pk_film primary key(film_id);
alter table dim_payment add constraint pk_payment primary key(payment_id);
alter table dim_rental add constraint pk_rental primary key(rental_id);
alter table dim_time add constraint pk_time primary key(id);

alter table dim_city add constraint fk_city_country foreign key(country_id) references dim_country(country_id);
alter table dim_customer add constraint fk_cust_district foreign key(district_id) references dim_district(district_id);
alter table dim_district add constraint fk_dist_city foreign key(city_id) references dim_city(city_id);
alter table dim_film_category add constraint fk_cat_category foreign key(category_id) references dim_category(category_id);
alter table dim_film_category add constraint fk_cat_film foreign key(film_id) references dim_film(film_id);
alter table dim_payment add constraint fk_pay_customer foreign key(customer_id) references dim_customer(customer_id);
alter table dim_payment add constraint fk_pay_rental foreign key(rental_id) references dim_rental(rental_id);
alter table dim_rental add constraint fk_rent_customer foreign key(customer_id) references dim_customer(customer_id);
alter table dim_rental add constraint fk_rent_film foreign key(film_id) references dim_film(film_id);

alter table dim_customer add constraint fk_cust_time foreign key(create_date) references dim_time(id);
alter table dim_payment add constraint fk_pay_time foreign key(payment_date) references dim_time(id);
alter table dim_rental add constraint fk_rent_time_rental foreign key(rental_date) references dim_time(id);
alter table dim_rental add constraint fk_rent_time_return foreign key(return_date) references dim_time(id);

alter table dim_category add constraint fk_cat_last_update foreign key(last_update) references dim_time(id);
alter table dim_city add constraint fk_city_last_update foreign key(last_update) references dim_time(id);
alter table dim_country add constraint fk_country_last_update foreign key(last_update) references dim_time(id);
alter table dim_customer add constraint fk_cust_last_update foreign key(last_update) references dim_time(id);
alter table dim_district add constraint fk_dist_last_update foreign key(last_update) references dim_time(id);
alter table dim_film add constraint fk_film_last_update foreign key(last_update) references dim_time(id);
alter table dim_film_category add constraint fk_film_cat_last_update foreign key(last_update) references dim_time(id);
alter table dim_payment add constraint fk_pay_last_update foreign key(last_update) references dim_time(id);
alter table dim_rental add constraint fk_rent_last_update foreign key(last_update) references dim_time(id);