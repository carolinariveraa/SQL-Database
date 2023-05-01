-- 3 PELICULAS DE LAS QUE MÁS INVENTARIO HAY

SELECT f.title, SUM(i.qty) AS total_qty
FROM inventory i
INNER JOIN film f
ON i.film_film_id = f.film_id
GROUP BY f.title
ORDER BY total_qty DESC
LIMIT 3;

-- 3 PELICULAs MÁS ALQUILADAS

SELECT f.title, COUNT(*) AS num_rentals, f.category
FROM rental r
INNER JOIN film f
ON r.film_film_id = f.film_id
GROUP BY r.film_film_id
ORDER BY num_rentals DESC
LIMIT 3;

-- PELICULAS MÁS CARAS 

SELECT title, replacement_cost
FROM film 
ORDER BY replacement_cost DESC 
LIMIT 3;

-- HAY STOCK?

SELECT i.qty, f.title 
FROM inventory i 
INNER JOIN film f
ON i.film_film_id = f.film_id 
WHERE f.film_id = (
  SELECT f.film_id 
  FROM film f 
  ORDER BY f.replacement_cost DESC 
  LIMIT 1
) 
LIMIT 1;

-- Obtener una lista de todas las películas disponibles en el inventario y su ubicación:

SELECT film.title, inventory.inventory_id
FROM film
INNER JOIN inventory ON film.film_id = inventory.film_film_id;

-- Obtener una lista de los actores que han participado en una película en particular:

SELECT actor.first_name, actor.last_name
FROM actor
INNER JOIN actor_film
 ON actor.actor_id = film_actor.actor_actor_id
INNER JOIN film ON actor_film.film_film_id = film.film_id
WHERE film.title = 'Nombre de la película';

-- Obtener una lista de los clientes que han alquilado una película en particular:

SELECT customer.first_name, customer.last_name, rental.rental_date, rental.return_date
FROM customer
INNER JOIN rental ON customer.customer_id = rental.customer_customer_id
INNER JOIN film ON inventory.film_film_id = film.film_id
WHERE film.title = 'Nombre de la película';

-- Obtener una lista de las películas más populares según la cantidad de veces que han sido alquiladas:

SELECT film.title, COUNT(rental.rental_id) AS rental_count
FROM film
INNER JOIN inventory ON film.film_id = inventory.film_film_id
INNER JOIN rental ON film.film_id = rental.film_film_id
GROUP BY film.film_id
ORDER BY rental_count DESC;

-- PELICULAS DE MÁS DE 120 MINS

SELECT title, inventory_id
FROM film
JOIN inventory ON film.film_id = inventory.film_film_id
WHERE film.length > 120;




