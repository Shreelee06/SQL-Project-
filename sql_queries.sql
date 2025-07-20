
-- 1. Customers who spent >= $110 with staff ID 2
SELECT customer_id
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) >= 110;

-- 2. Count of films starting with 'J'
SELECT COUNT(*)
FROM film
WHERE title LIKE 'J%';

-- 3. Highest customer ID with name starting 'E' and address ID < 500
SELECT first_name, last_name
FROM customer
WHERE first_name LIKE 'E%' AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1;

-- 4. Top 5 cities with most customers
SELECT city.city, COUNT(customer.customer_id) AS customer_count
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
GROUP BY city.city
ORDER BY customer_count DESC
LIMIT 5;

-- 5. Top 5 paying customers
SELECT customer.customer_id, first_name, last_name, SUM(amount) AS total_spent
FROM payment
JOIN customer ON payment.customer_id = customer.customer_id
GROUP BY customer.customer_id, first_name, last_name
ORDER BY total_spent DESC
LIMIT 5;

-- 6. Most active staff member
SELECT staff.first_name, staff.last_name, COUNT(rental.rental_id) AS total_rentals
FROM rental
JOIN staff ON rental.staff_id = staff.staff_id
GROUP BY staff.first_name, staff.last_name
ORDER BY total_rentals DESC
LIMIT 1;

-- 7. Most frequently rented film
SELECT film.title, COUNT(rental.rental_id) AS rental_count
FROM rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
GROUP BY film.title
ORDER BY rental_count DESC
LIMIT 1;

-- 8. Average rental duration by film category
SELECT category.name AS category, AVG(film.rental_duration) AS avg_duration
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
GROUP BY category.name
ORDER BY avg_duration DESC;
