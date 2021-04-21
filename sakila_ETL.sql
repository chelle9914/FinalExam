/*
Integrantes:
> Brandon Ramírez Jiménez
> Michelle Rodríguez Hernández
> William García Molina
*/

-- Extraer fecha de registro del cliente (S1).
select distinct(cust.create_date), 
       cast(year(cust.create_date) as smallint ) as year,
       case MONTH(cust.create_date)
		  when 1 then 'January'   when 2 then 'February'   when 3 then 'March'
		  when 4 then 'April'     when 5 then 'May'        when 6 then 'June'
		  when 7 then 'July'      when 8 then 'August'     when 9 then 'September'
		  when 10 then 'October'  when 11 then 'November'  when 12 then 'December'
	   end as month,
	   cast(day(cust.create_date) as smallint ) as day,
	   case datepart(WEEKDAY, cust.create_date)
	      when 1 then 'Sunday'    when 2 then 'Monday'  
		  when 3 then 'Tuesday'   when 4 then 'Wednesday'
		  when 5 then 'Thursday'  when 6 then 'Friday'
		  when 7 then 'Saturday'
	   end as dayname,
	   case 
		  when MONTH(cust.create_date) <= 3 then 'Quarter 1'
		  when MONTH(cust.create_date) <= 6 then 'Quarter 2'
		  when MONTH(cust.create_date) <= 9 then 'Quarter 3'
		  when MONTH(cust.create_date)  <= 12 then 'Quarter 4'
	   end as quarter
from sakila_SA.dbo.customer cust
where cust.create_date not in (select registerdate from sakila_DW.dbo.dim_time);

-- Extraer fecha de pago (S2).
select distinct(pay.payment_date), 
       cast(year(pay.payment_date) as smallint ) as year,
       case MONTH(pay.payment_date)
		  when 1 then 'January'   when 2 then 'February'   when 3 then 'March'
		  when 4 then 'April'     when 5 then 'May'        when 6 then 'June'
		  when 7 then 'July'      when 8 then 'August'     when 9 then 'September'
		  when 10 then 'October'  when 11 then 'November'  when 12 then 'December'
	   end as month,
	   cast(day(pay.payment_date) as smallint ) as day,
	   case datepart(WEEKDAY, pay.payment_date)
	      when 1 then 'Sunday'    when 2 then 'Monday'  
		  when 3 then 'Tuesday'   when 4 then 'Wednesday'
		  when 5 then 'Thursday'  when 6 then 'Friday'
		  when 7 then 'Saturday'
	   end as dayname,
	   case 
		  when MONTH(pay.payment_date) <= 3 then 'Quarter 1'
		  when MONTH(pay.payment_date) <= 6 then 'Quarter 2'
		  when MONTH(pay.payment_date) <= 9 then 'Quarter 3'
		  when MONTH(pay.payment_date)  <= 12 then 'Quarter 4'
	   end as quarter
from sakila_SA.dbo.payment pay
where pay.payment_date not in (select registerdate from sakila_DW.dbo.dim_time);

-- Extraer fecha de arrendamiento (S3).
select distinct(rent.rental_date), 
       cast(year(rent.rental_date) as smallint ) as year,
       case MONTH(rent.rental_date)
		  when 1 then 'January'   when 2 then 'February'   when 3 then 'March'
		  when 4 then 'April'     when 5 then 'May'        when 6 then 'June'
		  when 7 then 'July'      when 8 then 'August'     when 9 then 'September'
		  when 10 then 'October'  when 11 then 'November'  when 12 then 'December'
	   end as month,
	   cast(day(rent.rental_date) as smallint ) as day,
	   case datepart(WEEKDAY, rent.rental_date)
	      when 1 then 'Sunday'    when 2 then 'Monday'  
		  when 3 then 'Tuesday'   when 4 then 'Wednesday'
		  when 5 then 'Thursday'  when 6 then 'Friday'
		  when 7 then 'Saturday'
	   end as dayname,
	   case 
		  when MONTH(rent.rental_date) <= 3 then 'Quarter 1'
		  when MONTH(rent.rental_date) <= 6 then 'Quarter 2'
		  when MONTH(rent.rental_date) <= 9 then 'Quarter 3'
		  when MONTH(rent.rental_date)  <= 12 then 'Quarter 4'
	   end as quarter
from sakila_SA.dbo.rental rent
where rent.rental_date not in (select registerdate from sakila_DW.dbo.dim_time);

-- Extraer fecha de devoluci�n (S4).
select distinct(rent.return_date), 
       cast(year(rent.return_date) as smallint ) as year,
       case MONTH(rent.return_date)
		  when 1 then 'January'   when 2 then 'February'   when 3 then 'March'
		  when 4 then 'April'     when 5 then 'May'        when 6 then 'June'
		  when 7 then 'July'      when 8 then 'August'     when 9 then 'September'
		  when 10 then 'October'  when 11 then 'November'  when 12 then 'December'
	   end as month,
	   cast(day(rent.return_date) as smallint ) as day,
	   case datepart(WEEKDAY, rent.return_date)
	      when 1 then 'Sunday'    when 2 then 'Monday'  
		  when 3 then 'Tuesday'   when 4 then 'Wednesday'
		  when 5 then 'Thursday'  when 6 then 'Friday'
		  when 7 then 'Saturday'
	   end as dayname,
	   case 
		  when MONTH(rent.return_date) <= 3 then 'Quarter 1'
		  when MONTH(rent.return_date) <= 6 then 'Quarter 2'
		  when MONTH(rent.return_date) <= 9 then 'Quarter 3'
		  when MONTH(rent.return_date)  <= 12 then 'Quarter 4'
	   end as quarter
from sakila_SA.dbo.rental rent
where rent.return_date not in (select registerdate from sakila_DW.dbo.dim_time);


-- Extraer la �ltima fecha de modificaci�n para las columnas (cambiar el nombre de la columna) (S 5-13).
select distinct(time.last_update), 
       cast(year(time.last_update) as smallint ) as year,
       case MONTH(time.last_update)
		  when 1 then 'January'   when 2 then 'February'   when 3 then 'March'
		  when 4 then 'April'     when 5 then 'May'        when 6 then 'June'
		  when 7 then 'July'      when 8 then 'August'     when 9 then 'September'
		  when 10 then 'October'  when 11 then 'November'  when 12 then 'December'
	   end as month,
	   cast(day(time.last_update) as smallint ) as day,
	   case datepart(WEEKDAY, time.last_update)
	      when 1 then 'Sunday'    when 2 then 'Monday'  
		  when 3 then 'Tuesday'   when 4 then 'Wednesday'
		  when 5 then 'Thursday'  when 6 then 'Friday'
		  when 7 then 'Saturday'
	   end as dayname,
	   case 
		  when MONTH(time.last_update) <= 3 then 'Quarter 1'
		  when MONTH(time.last_update) <= 6 then 'Quarter 2'
		  when MONTH(time.last_update) <= 9 then 'Quarter 3'
		  when MONTH(time.last_update)  <= 12 then 'Quarter 4'
	   end as quarter
from sakila_SA.dbo.[column] time
where time.last_update not in (select registerdate from sakila_DW.dbo.dim_time);

-- Extraer datos de categor�as (S 14).
select
	cat.name,
	(
		select
			time.id
		from
			sakila_DW.dbo.dim_time time
		where
			time.registerdate = cat.last_update
	) as last_update_id
from
	sakila_SA.dbo.category cat;

-- Extraer datos de pa�ses (S 14).
select
	cou.country,
	(
		select
			time.id
		from
			sakila_DW.dbo.dim_time time
		where
			time.registerdate = cou.last_update
	) as last_update_id
from
	sakila_SA.dbo.country cou;
	
-- Extraer datos de filmes (S 14).
select
	film.title,
	film.description,
	film.release_year,
	film.rental_duration,
	film.rental_rate,
	film.length,
	film.replacement_cost,
	film.rating,
	film.special_features,
	(
		select
			time.id
		from
			sakila_DW.dbo.dim_time time
		where
			time.registerdate = film.last_update
	) as last_update_id
from
	sakila_SA.dbo.film film;

-- Extraer datos de ciudades (S 15).
select
	cit.city,
	cit.country_id,
	(
		select
			time.id
		from
			sakila_DW.dbo.dim_time time
		where
			time.registerdate = cit.last_update
	) as last_update_id
from
	sakila_SA.dbo.city cit;
	
-- Extraer IDs de filmes y categor�as (S 15).
select
	ficat.film_id,
	ficat.category_id,
	(
		select
			time.id
		from
			sakila_DW.dbo.dim_time time
		where
			time.registerdate = ficat.last_update
	) as last_update_id
from
	sakila_SA.dbo.film_category ficat;

-- Extraer datos de distrito desde la direcci�n (S 16).
select
	addr.district,
	addr.city_id,
	(
		select
			time.id
		from
			sakila_DW.dbo.dim_time time
		where
			time.registerdate = addr.last_update
	) as last_update_id
from
	sakila_SA.dbo.address addr;

-- Extraer datos de cliente (S 17).
select
	cust.first_name,
	cust.last_name,
	addr.phone,
	cust.email,
	cust.address_id,
	cust.active,
	(
		select
			time.id
		from
			sakila_DW.dbo.dim_time time
		where
			time.registerdate = cust.create_date
	) as create_date_id,
	(
		select
			time.id
		from
			sakila_DW.dbo.dim_time time
		where
			time.registerdate = cust.last_update
	) as last_update_id
from
	sakila_SA.dbo.customer cust,
	sakila_SA.dbo.address addr
where
	cust.address_id = addr.address_id;

-- Extraer datos de arrendamientos (S 18).
select
	(
		select
			time.id
		from
			sakila_DW.dbo.dim_time time
		where
			time.registerdate = rent.rental_date
	) as rental_date_id,
	film.film_id,
	rent.customer_id,
	(
		select
			time.id
		from
			sakila_DW.dbo.dim_time time
		where
			time.registerdate = rent.return_date
	) as return_date_id,
	(
		select
			time.id
		from
			sakila_DW.dbo.dim_time time
		where
			time.registerdate = rent.last_update
	) as last_update_id
from
	sakila_SA.dbo.film film,
	sakila_SA.dbo.inventory inv,
	sakila_SA.dbo.rental rent
where
	inv.film_id = film.film_id
	and
	inv.inventory_id = rent.inventory_id;

-- Extraer datos de pagos (S 19).
select
	pay.customer_id,
	pay.rental_id,
	pay.amount,
	(
		select
			time.id
		from
			sakila_DW.dbo.dim_time time
		where
			time.registerdate = pay.payment_date
	) as payment_date_id,
	(
		select
			time.id
		from
			sakila_DW.dbo.dim_time time
		where
			time.registerdate = pay.last_update
	) as last_update_id
from
	sakila_SA.dbo.payment pay;

-- Limpiar starting area.
delete from actor;
go

delete from address;
go

delete from category;
go

delete from city;
go

delete from country;
go

delete from customer;
go

delete from film;
go

delete from film_actor;
go

delete from film_category;
go

delete from film_text;
go

delete from inventory;
go

delete from language;
go

delete from payment;
go

delete from rental;
go

delete from staff;
go

delete from store;
go