# 📊 SQL Project: DVD Rental Insights

This is a small SQL project I worked on while doing the Complete SQL Bootcamp course on Udemy. I used the DVD Rental sample database and wrote some queries to explore the data and answer practical questions related to customers, rentals, and staff performance.

---

## 🔧 Tools
- PostgreSQL
- DVDRental database (free sample from PostgreSQL Tutorial)
- Basic to intermediate SQL queries

---

## 💡 What I Did

### 1. Customers who spent at least $110 with staff ID 2
```sql
SELECT customer_id
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) >= 110;
```
**Result:** Customers 148 and 187  
I grouped payments by customer and filtered for those spending $110+.

---

### 2. Number of films starting with 'J'
```sql
SELECT COUNT(*)
FROM film
WHERE title LIKE 'J%';
```
**Result:** 20 films

---

### 3. Customer whose name starts with 'E', address ID < 500, and highest customer ID
```sql
SELECT first_name, last_name
FROM customer
WHERE first_name LIKE 'E%' AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1;
```
**Result:** Eddie Tomlin

---

### 4. Top 5 cities with most customers
```sql
SELECT city.city, COUNT(customer.customer_id) AS customer_count
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
GROUP BY city.city
ORDER BY customer_count DESC
LIMIT 5;
```

---

### 5. Top 5 customers by total payments
```sql
SELECT customer.customer_id, first_name, last_name, SUM(amount) AS total_spent
FROM payment
JOIN customer ON payment.customer_id = customer.customer_id
GROUP BY customer.customer_id, first_name, last_name
ORDER BY total_spent DESC
LIMIT 5;
```

---

### 6. Staff member with most rentals handled
```sql
SELECT staff.first_name, staff.last_name, COUNT(rental.rental_id) AS total_rentals
FROM rental
JOIN staff ON rental.staff_id = staff.staff_id
GROUP BY staff.first_name, staff.last_name
ORDER BY total_rentals DESC
LIMIT 1;
```

---

### 7. Most rented movie
```sql
SELECT film.title, COUNT(rental.rental_id) AS rental_count
FROM rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
GROUP BY film.title
ORDER BY rental_count DESC
LIMIT 1;
```

---

### 8. Average rental duration by category
```sql
SELECT category.name AS category, AVG(film.rental_duration) AS avg_duration
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
GROUP BY category.name
ORDER BY avg_duration DESC;
```

---

## ✍️ Notes

I did this project as practice while learning SQL. It helped me understand things like:
- How to use GROUP BY with HAVING
- How joins actually work across multiple tables
- Writing queries to answer real questions

---
