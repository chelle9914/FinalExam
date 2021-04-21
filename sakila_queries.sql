use sakila_DW;
go

/*
Se puede determinar el margen de ingresos que tiene la empresa en varias dimensiones,
por rango de tiempo, por zonas, por género de las películas que se arrendan.
*/

-- Por rango de tiempo.
select
	sum(pay.amount) as total
from
	dim_payment pay,
	dim_rental rent,
	dim_time time
where
	(pay.rental_id = rent.rental_id)
	and
	(time.id = rent.rental_date)
	and
	(time.registerdate > '2005-05-24')
	and
	(time.registerdate < '2006-02-15');

-- Por zonas (país, ciudad y distrito).
select
	country.country,
	city.city,
	dist.district,
	sum(pay.amount) as total
from
	dim_payment pay,
	dim_customer cust,
	dim_district dist,
	dim_city city,
	dim_country country
where
	(country.country_id = city.country_id)
	and
	(dist.city_id = country.country_id)
	and
	(dist.district_id = cust.district_id)
	and
	(pay.customer_id = cust.customer_id)
group by
	country.country,
	city.city,
	dist.district
order by
	country.country,
	city.city,
	dist.district;

-- Por género de las películas (categorías).
select
	cat.name as category,
	sum(pay.amount) as total
from
	dim_payment pay,
	dim_rental rent,
	dim_film film,
	dim_film_category ficat,
	dim_category cat
where
	(cat.category_id = ficat.category_id)
	and
	(film.film_id = ficat.film_id)
	and
	(film.film_id = rent.film_id)
	and
	(pay.rental_id = rent.rental_id)
group by
	cat.name;

/*
Por tiempo determinar que periodos del año generan mayor movimiento de operaciones y
si estas coinciden con fechas calendarios específicas como fiestas patrias, torneos
deportivos, vacaciones escolares.
*/
select
	time.registerdate as period,
	count(rent.rental_id) as rental_amount
from
	dim_rental rent,
	dim_time time
where
	(time.id = rent.rental_date)
	and
	(time.registerdate > '2005-05-24')
	and
	(time.registerdate < '2006-02-15')
group by
	time.registerdate
order by
	count(rent.rental_id) desc;

/*
Determinar los géneros de filmes más buscados y cuales los menos, como para determinar
correcciones en los procesos de adquisición de nuevo material, o en su defecto eliminar
material que no registra movimientos.
*/
select
	cat.name as category,
	count(rent.rental_id) as rental_amount
from
	dim_rental rent,
	dim_film film,
	dim_film_category ficat,
	dim_category cat
where
	(cat.category_id = ficat.category_id)
	and
	(film.film_id = ficat.film_id)
	and
	(film.film_id = rent.film_id)
group by
	cat.name
order by
	count(rent.rental_id) desc;