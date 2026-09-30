-- E-Commerce Sales Performance and Decline Analysis
-- Question 6: Returning vs One-Time Buyers
-- Objective: Compare one-time and returning customers
-- across Stage A (Feb-Apr) and Stage B (May-Jul).

WITH cus_type AS (SELECT customer_id, COUNT(order_date) AS total_order,
CASE
	WHEN order_date BETWEEN '2026-02-01' AND '2026-04-30' THEN 'A'
    WHEN order_date BETWEEN '2026-05-01' AND '2026-07-31' THEN 'B'
END AS stage
FROM orders
WHERE order_date BETWEEN '2026-02-01' AND '2026-07-31'
GROUP BY customer_id, stage)
SELECT stage, 
CASE
	WHEN total_order > 1 THEN 'Returning'
    WHEN total_order = 1 THEN 'One-time'
END AS customer_type,
COUNT(stage) AS total
FROM cus_type
GROUP BY stage, customer_type;

