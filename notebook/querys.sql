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



