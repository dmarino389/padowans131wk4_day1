SELECT * 
FROM actor;

SELECT first_name, last_name
FROM actor;

-- add specificity to our query
SELECT first_name, last_name
FROM actor
WHERE last_name = 'Wahlberg';

-- LIKE clause
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE 'Wahlberg';


-- WILDCARD %
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE 'W%';

-- single letter wild card (underscore) _
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE 'C____%';


-- Comparing operators
-- > greater than
-- < less than
-- >= greater or equal
-- <= less or equal
--!= not equal
-- <> Not equal

SELECT *
FROM payment;

-- find all payments greater than $5
SELECT customer_id
FROM payment
WHERE amount > 5;

-- ordering based on amount
SELECT customer_id, amount
FROM payment
WHERE amount > 5
ORDER BY amount DESC;

-- conjunctions AND or OR operators
SELECT customer_id, amount
FROM payment
WHERE amount > 5 OR customer_id = 3
ORDER BY amount DESC

-- aggregator
-- SUM, AVG, COUNT, MIN, MAX

SELECT SUM(amount)
FROM payment
WHERE amount > 0;


SELECT AVG(amount)
FROM payment
WHERE amount > 0;


SELECT COUNT(amount)
FROM payment
WHERE amount > 0;


SELECT MAX(amount)
FROM payment
WHERE amount > 0;


SELECT MIN(amount) AS smallest_amount --smallest amount is optional
FROM payment
WHERE amount > 0;

-- Distinct

SELECT DISTINCT customer_id 
FROM payment
WHERE amount > 5;


SELECT COUNT(DISTINCT customer_id) 
FROM payment
WHERE amount > 5;

-- GROUP BY

SELECT customer_id, SUM(amount)
from payment
WHERE amount > 0
group by customer_id
order by sum(amount) DESC;

-- HAVING CLAUSE
-- (adding a filter to our aggregate)


SELECT customer_id, SUM(amount)
from payment
WHERE amount > 0
group by customer_id
HAVING SUM(amount) > 100
order by sum(amount) DESC;


-- EXTRA STUFF


SELECT customer_id, SUM(amount)
from payment
WHERE amount > 0
group by customer_id
HAVING SUM(amount) > 50
order by sum(amount) DESC
LIMIT 3
OFFSET 1