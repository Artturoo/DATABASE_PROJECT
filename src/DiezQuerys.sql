-- 1. los generos de pelicula más alquilados
SELECT  category.name,COUNT(rental.rental_id)
FROM rental

LEFT JOIN inventory
ON inventory.inventory_id=rental.inventory_id

LEFT JOIN film
on inventory.film_id=film.film_id

LEFT JOIN old_HDD	
ON film.film_id=old_HDD.film_id

left join category
on old_HDD.category_id = category.category_id

WHERE category.category_id is not null
GROUP BY category.name
ORDER BY  COUNT(rental.rental_id) DESC
LIMIT 5 

-- 2. Las 5 pelis con mas actores 
SELECT film.title, count(old_HDD.actor_id) 
FROM film

LEFT JOIN old_HDD
on old_HDD.film_id=film.film_id

GROUP BY film.title
ORDER BY  count(old_HDD.actor_id) DESC
LIMIT 5

-- 3. Aquellas peliculas que duren mas de 120 minutos
select film.length, film.title
from film
where film.length > 100 
order by film.length desc

-- 4. peliculas con su nombre y en lenguaje ingles
select film.title, language.name
from language
left join film
on language.language_id=film.language_id
where language.name = 'English'

-- 5. Ranking de categorias con mas peliculas
SELECT  category.name, COUNT(film.title)
FROM category
LEFT JOIN old_HDD
on category.category_id=old_HDD.category_id

LEFT JOIN film
ON old_HDD.film_id=film.film_id

GROUP BY category.name
ORDER BY  COUNT(film.title) DESC
LIMIT 5 

-- 6. numero de actores por pelicula
select film.title, count(old_HDD.actor_id)
from film
left join old_HDD
on film.film_id=old_HDD.film_id

group by film.title
order by count(old_HDD.actor_id) desc
limit 5

-- 7.toda la info relacionada con la pelicula en la que sale cada actor
SELECT * FROM old_HDD

LEFT JOIN actor
on old_HDD.actor_id=actor.actor_id

LEFT JOIN film
on old_HDD.film_id=film.film_id

LEFT JOIN language
on film.language_id=language.language_id
limit 10

-- 8. pelis de accion donde salga 'ED CHASE'
select category.name, old_HDD.full_name, film.title
from old_HDD

left join film
on old_HDD.film_id=film.film_id

left join category
on old_HDD.category_id=category.category_id


where old_HDD.full_name = 'ED CHASE' and category.name = 'Action'

-- 9.peliculas de mas de 100 min donde aparezcan actores que contengan en su nombre 'ED'
select film.length, film.title, old_HDD.full_name
from film
left join old_HDD
on film.film_id=old_HDD.film_id
where old_HDD.full_name like '%ED%' and film.length > 100
order by film.length desc

-- 10. Aquellas peliculas que tengan trailer y tengan comentarios
select film.title, film.Trailers, film.Commentaries
from film

where film.Trailers like 'YES' and film.Commentaries like 'YES'
