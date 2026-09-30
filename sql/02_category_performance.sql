-- E-Commerce Sales Performance and Decline Analysis
-- Question 2: Category Performance
-- Objective: Compare category revenue and order performance
-- between Stage A (Feb-Apr) and Stage B (May-Jul).

WITH comparison AS
(SELECT p.category, 
SUM(CASE WHEN o.order_date BETWEEN '2026-02-01' AND '2026-04-30' THEN p.price * o.quantity ELSE 0 END) AS revenue_A, 
SUM(CASE WHEN o.order_date BETWEEN '2026-05-01' AND '2026-07-31' THEN p.price * o.quantity ELSE 0 END) AS revenue_B, 
COUNT(CASE WHEN o.order_date BETWEEN '2026-02-01' AND '2026-04-30' THEN o.order_id END) AS order_A,
COUNT(CASE WHEN o.order_date BETWEEN '2026-05-01' AND '2026-07-31' THEN o.order_id END) AS order_B
FROM products AS p
JOIN orders AS o
	ON p.product_id = o.product_id
WHERE o.order_date BETWEEN '2026-02-01' AND '2026-07-31'
GROUP BY p.category)
SELECT category, revenue_A, revenue_B, order_A, order_B, (revenue_B - revenue_A) AS revenue_change, (order_B - order_A) AS order_change
FROM comparison;