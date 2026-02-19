SET SCHEMA 'dvdrental';

--Task1
SELECT *
FROM store;

--Task2
SELECT film.title,film.description
FROM film
WHERE length>120;

--Task3
SELECT *
FROM address a
JOIN store s
ON a.address_id=s.address_id;

--Task4
SELECT first_Name,last_name,c.city
FROM customer as cu
JOIN address a
ON cu.address_id=a.address_id
JOIN city c
on a.city_id=c.city_id
WHERE c.city='Apeldoorn';

--Task5
SELECT f.title,c.name
FROM category c
JOIN film_category fc
ON c.category_id=fc.category_id
JOIN film f
ON fc.film_id=f.film_id
WHERE f.title='ARABIA DOGMA';

--Task6
SELECT a.first_name,a.last_name
FROM actor a
JOIN film_actor fa
ON a.actor_id=fa.actor_id
JOIN film f
ON fa.film_id=f.film_id
WHERE f.title='INTERVIEW LIAISONS';

--Task7
SELECT s.first_name,s.last_name,f.title
FROM staff s
JOIN rental r
ON s.staff_id=r.staff_id
JOIN customer c
ON c.customer_id=r.customer_id
JOIN inventory i
on r.inventory_id=i.inventory_id
JOIN film f
on i.film_id=f.film_id
WHERE f.title='HUNCHBACK IMPOSSIBLE' AND
c.first_name='KURT' AND
c.last_name='EMMONS';

--Task8
SELECT store_id,count(inventory_id)
FROM inventory
GROUP BY store_id;

SELECT first_name,last_name,count(*)
FROM customer c
JOIN rental r
on c.customer_id=r.customer_id
WHERE first_name='VIVIAN'
AND last_name='RUIZ'
GROUP BY first_name, last_name
