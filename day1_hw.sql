--1. How many actors are there with the last name ‘Wahlberg’?
--2

SELECT last_name
FROM actor
where last_name = 'Wahlberg';

--2. How many payments were made between $3.99 and $5.99?
--2

SELECT amount
FROM payment
where amount BETWEEN 3.99 AND 5.99;

--3. What film does the store have the most of? (search in inventory)
--film ID 350

SELECT film_id, COUNT(*) AS film_count
FROM inventory
GROUP BY film_id
ORDER BY film_count DESC
LIMIT 1;





--4. How many customers have the last name ‘William’?
-- 0 None

SELECT last_name
FROM actor
where last_name LIKE 'W%';

--5. What store employee (get the id) sold the most rentals?
-- 1

SELECT staff_id, COUNT(inventory_id)
FROM rental
GROUP BY staff_id;

--6. How many different district names are there?
--378 different uniqe districts

SELECT count(DISTINCT district)
FROM address;

--7. What film has the most actors in it? (use film_actor table and get film_id)
--Lambs Cincinatti

SELECT film_id, COUNT(actor_id) AS num_actors
FROM film_actor
GROUP BY film_id
ORDER BY num_actors DESC
LIMIT 1;

SELECT title, film_id
FROM film ;


--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
-- 21 customers have a last name ending in 'es'

SELECT count(last_name)
FROM customer
WHERE last_name LIKE '%es';


--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)

SELECT COUNT(*) 
FROM payment
WHERE customer_id BETWEEN 380 AND 430
  AND amount > 250;



--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?
--5
-- pg-13

SELECT COUNT(DISTINCT rating) AS num_rating_categories
FROM film;

SELECT rating, COUNT(*) AS num_movies
FROM film
GROUP BY rating
ORDER BY num_movies DESC
LIMIT 1;
