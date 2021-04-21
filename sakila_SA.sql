use master;
go

create database sakila_SA;
go

use sakila_SA;
go

drop table actor;
go

drop table address;
go

drop table category;
go

drop table city;
go

drop table country;
go

drop table customer;
go

drop table film;
go

drop table film_actor;
go

drop table film_category;
go

drop table film_text;
go

drop table inventory;
go

drop table language;
go

drop table payment;
go

drop table rental;
go

drop table staff;
go

drop table store;
go

create table actor(
	actor_id smallint not null,
	first_name varchar(45) not null,
	last_name varchar(45) not null,
	last_update datetime not null
);
go

create table address(
	address_id smallint not null,
	address varchar(50) not null,
	address2 varchar(50) null,
	district varchar(20) not null,
	city_id smallint not null,
	postal_code varchar(10) null,
	phone varchar(20) not null,
	last_update datetime not null
);
go

create table category(
	category_id tinyint not null,
	name varchar(25) not null,
	last_update datetime not null
);
go

create table city(
	city_id smallint not null,
	city varchar(50) not null,
	country_id smallint not null,
	last_update datetime not null
);
go

create table country(
	country_id smallint not null,
	country varchar(50) not null,
	last_update datetime not null
);
go

create table customer(
	customer_id smallint not null,
	store_id tinyint not null,
	first_name varchar(45) not null,
	last_name varchar(45) not null,
	email varchar(50) null,
	address_id smallint not null,
	active bit not null,
	create_date datetime not null,
	last_update datetime not null
);
go

create table film(
	film_id smallint not null,
	title varchar(255) not null,
	description text null,
	release_year smallint null,
	language_id tinyint not null,
	original_language_id tinyint null,
	rental_duration tinyint not null,
	rental_rate decimal(4,2) not null,
	length smallint null,
	replacement_cost decimal(5,2) not null,
	rating varchar(6) not null,
	special_features varchar(100) null,
	last_update datetime not null,
);
go

create table film_actor(
	actor_id smallint not null,
	film_id smallint not null,
	last_update datetime not null
);
go

create table film_category(
	film_id smallint not null,
	category_id tinyint not null,
	last_update datetime not null
);
go

create table film_text(
	film_id smallint not null,
	title varchar(255) not null,
	description text
);
go

create table inventory(
	inventory_id smallint not null,
	film_id smallint not null,
	store_id tinyint not null,
	last_update datetime not null
);
go

create table language(
	language_id tinyint not null,
	name char(20) not null,
	last_update datetime not null
);
go

create table payment(
	payment_id smallint not null,
	customer_id smallint not null,
	staff_id tinyint not null,
	rental_id int null,
	amount decimal(5,2) not null,
	payment_date datetime not null,
	last_update datetime not null
);
go

create table rental(
	rental_id int not null,
	rental_date datetime not null,
	inventory_id smallint not null,
	customer_id smallint not null,
	return_date datetime null,
	staff_id tinyint not null,
	last_update datetime not null
);
go

create table staff(
	staff_id tinyint not null,
	first_name varchar(45) not null,
	last_name varchar(45) not null,
	address_id smallint not null,
	picture varbinary(max) null,
	email varchar(50) null,
	store_id tinyint not null,
	active bit not null,
	username varchar(16) not null,
	password varchar(40) null,
	last_update datetime not null
);
go

create table store(
	store_id tinyint not null,
	manager_staff_id tinyint not null,
	address_id smallint not null,
	last_update datetime not null
);
go