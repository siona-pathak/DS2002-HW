use sakila; 

-- Question 1 
SELECT actor.first_name AS 'Actor First Name', actor.last_name AS "Actor Last Name"
FROM actor, film_actor, film 
WHERE actor.actor_id = film_actor.actor_id 
AND film_actor.film_id = film.film_id 
AND film.title = "Academy Dinosaur"; 

-- Question 2
SELECT category.name AS 'Category', COUNT(film_category.film_id) AS "Count of Movies By Category" 
FROM category, film_category, film
WHERE category.category_id = film_category.category_id 
AND film_category.film_id = film.film_id 
GROUP BY category.name;

-- Question 3 
SELECT film.rating, AVG(film.rental_duration) AS 'Average Rental Duration Per Film Rating'
from film 
GROUP BY film.rating;

-- Question 4 
SELECT customer.first_name as 'First Name', customer.last_name, COUNT(rental.rental_id) AS 'Count of Rentals Per Customer'
FROM customer, rental
WHERE rental.customer_id = customer.customer_id
GROUP BY customer.customer_id; 

-- Question 5 
SELECT inventory.store_id, count(rental.rental_id) as RentalCount
FROM rental, inventory 
WHERE inventory.inventory_id = rental.inventory_id 
GROUP BY inventory.store_id
ORDER by RentalCount DESC
LIMIT 1; 

-- Question 6 
SELECT category.name as 'Category Name', COUNT(rental.rental_id) AS RentalCount
FROM rental, inventory, film_category, category 
WHERE category.category_id = film_category.category_id 
AND film_category.film_id = inventory.film_id 
AND inventory.inventory_id = rental.inventory_id 
GROUP BY category.name
ORDER BY RentalCount DESC
LIMIT 1;

-- Question 7 
SELECT category.name AS 'Film Category', AVG(film.rental_rate) AS "Average Rental Cost" 
FROM category, film_category, film
WHERE category.category_id = film_category.category_id
AND film_category.film_id = film.film_id 
GROUP BY category.category_id;

-- Question 8 
SELECT film.title AS "Film Title", rental.rental_date
FROM rental, film; 

-- Question 9 
SELECT customer.first_name AS "First Name", customer.last_name AS "Last Name", SUM(payment.amount) AS "Total Customer Expenditure"
FROM customer, payment 
WHERE payment.customer_id = customer.customer_id 
GROUP BY customer.customer_id; 

-- Group 10 
SELECT language.name AS "Language", AVG(film.length) AS "Average Film Length"
FROM film, language 
WHERE language.language_id = film.language_id
GROUP BY language.name; 