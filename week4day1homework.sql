-- Week 5 - Monday Questions -Shoha
-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT COUNT(*)
FROM actor
WHERE last_name = 'Wahlberg'
-- ANS: 2


-- 2. How many payments were made between $3.99 and $5.99?
SELECT COUNT(*)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99
-- ANS: 5607


-- 3. What film does the store have the most of? (search in inventory)
SELECT store_id, film_id, COUNT(film_id)
FROM inventory
GROUP BY store_id, film_id
ORDER BY COUNT(film_id) DESC;
--ANS: There are 525 different films that are tied at a count 4. I have the count split by each store(store_id:1 and store_id:2)


-- 4. How many customers have the last name ‘William’?
SELECT COUNT(*)
FROM customer
WHERE last_name = 'William';
-- ANS: 0, None of the customers have the last name 'William'


-- 5. What store employee (get the id) sold the most rentals?
SELECT staff_id, COUNT(*)
FROM payment
GROUP BY staff_id
ORDER BY COUNT(*) DESC;
-- ANS: Staff#2 Solid the most rentals at count 7304


-- 6. How many different district names are there?
SELECT COUNT(DISTINCT district)
FROM address;
-- ANS: 378


-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(actor_id) AS number_of_actors
FROM film_actor
GROUP BY film_id
ORDER BY number_of_actors DESC;
-- ANS: film_id 508 has the most actors at 15


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT store_id, COUNT(*)
FROM customer
WHERE last_name LIKE '%es'
GROUP BY store_id;
-- ANS: store_id 1 has 13 customers with last names ending in 'es'


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
SELECT amount, COUNT(*)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(*)>250;
-- ANS: 3 payment amounts


-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
SELECT rating, COUNT(*)
FROM film
GROUP BY rating;
-- ANS: There are 5 rating categories (R, NC-17, G, PG, and PG-13). PG-13 has the most at 223 movies total.
