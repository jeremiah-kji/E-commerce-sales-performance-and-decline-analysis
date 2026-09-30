-- E-Commerce Sales Performance and Decline Analysis
-- Question 3: City Performance
-- Objective: Compare order performance across cities
-- between Stage A (Feb-Apr) and Stage B (May-Jul).

WITH city_analysis AS
(SELECT c.city, 
SUM(CASE WHEN o.order_date BETWEEN '2026-02-01' AND '2026-04-30' THEN p.price * o.quantity ELSE 0 END) AS revenue_A, 
SUM(CASE WHEN o.order_date BETWEEN '2026-05-01' AND '2026-07-31' THEN p.price * o.quantity ELSE 0 END) AS revenue_B, 
COUNT(CASE WHEN o.order_date BETWEEN '2026-02-01' AND '2026-04-30' THEN o.order_id END) AS order_A,
COUNT(CASE WHEN o.order_date BETWEEN '2026-05-01' AND '2026-07-31' THEN o.order_id END) AS order_B
FROM customers AS c
JOIN orders AS o
	ON c.customer_id = o.customer_id
JOIN products AS p
	ON p.product_id = o.product_id
WHERE o.order_date BETWEEN '2026-02-01' AND '2026-07-31'
GROUP BY c.city)
SELECT city, revenue_A, revenue_B, order_A, order_B, (revenue_B - revenue_A) AS revenue_change, (order_B - order_A) AS order_change
FROM city_analysis;
