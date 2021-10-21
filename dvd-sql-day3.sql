-- 1. LIST ALL CUSTOMERS WHO LIVE IN TEXAS (USE JOIN)
SELECT address.district, customer.first_name, customer.last_name
FROM address
JOIN customer
ON customer.address_id = address.address_id
WHERE district = 'Texas';
-- 2. GET ALL PAYMENTS ABOVE $6.99 WITH THE CUSTOMER'S FULL NAME
SELECT customer.first_name, customer.last_name, payment.amount
FROM customer
JOIN payment
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99
ORDER BY amount DESC;
-- 3. SHOW ALL CUSTOMERS NAMES WHO HAVE MADE PAYMENTS OVER $175 (USE SUBQUERIES)
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);

-- 4. LIST ALL CUSTOMERS THAT LIVE IN NEPAL (USE THE CITY TABLE)
SELECT customer.first_name, customer.last_name
FROM customer
JOIN address
ON address.address_id = customer.address_id
JOIN city
ON city.city_id = address.city_id
JOIN country
ON country.country_id = city.country_id
WHERE country = 'Nepal';

-- 5. WHICH STAFF MEMBER GOT THE MOST TRANSACTIONS
SELECT staff.staff_id, COUNT(payment.payment_id)
FROM staff
JOIN payment
ON payment.staff_id = staff.staff_id
GROUP BY staff.staff_id
ORDER BY COUNT DESC;

-- 6. HOW MANY MOVIES OF EACH RATING ARE THERE?
SELECT rating, COUNT(title)
FROM film
GROUP BY rating
ORDER BY count DESC

-- 7. SHOW ALL CUSTOMERS WHO HAVE MADE A SINGLE PAYMENT ABOVE $6.99 (USE SUBQUERIES)
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
)

-- 8 HOW MANY FREE RENTALS DID OUR STORES GIVE AWAY?
SELECT COUNT(rental.rental_id)
FROM rental
JOIN payment
ON payment.rental_id = rental.rental_id
WHERE payment.amount = 0