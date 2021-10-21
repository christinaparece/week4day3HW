
-- List all customers who live in Texas (use
--JOINs)
SELECT customer.first_name, customer.last_name, address.district
FROM address
JOIN customer
ON customer.address_id = address.address_id
WHERE district = 'Texas'

--Get all payments above $6.99 with the Customer's Full
SELECT customer.first_name, customer.last_name, payment.amount
FROM customer
JOIN payment
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99
ORDER BY amount 

-- Show all customers names who have made payments over $175(use
--subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);

-- List all customers that live in Nepal (use the city
--table)
SELECT customer.first_name,customer.last_name, country 
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id
WHERE country ='Nepal'

-- Which staff member had the most
--transactions?
SELECT staff.first_name, staff.last_name, COUNT(payment.payment_id)
FROM staff
JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.first_name, staff.last_name
ORDER BY COUNT(payment_id)DESC
LIMIT 1

-- How many movies of each rating are
--there?
SELECT rating, COUNT(film_id)
FROM film
GROUP BY rating

--Show all customers who have made a single payment
--bove $6.99 (Use Subqueries)
SELECT customer.first_name,customer.last_name
FROM customer
WHERE customer_id IN (SELECT customer_id 
FROM payment 
WHERE amount > 6.99 
GROUP BY payment.customer_id
)

--8 How many free rentals did stores give away?
SELECT COUNT(amount), amount 
FROM payment 
GROUP BY amount
ORDER BY amount  
LIMIT 1