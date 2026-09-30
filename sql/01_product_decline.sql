-- E-Commerce Sales Performance and Decline Analysis
-- Question 1: Product Performance
-- Objective: Identify Products whose quantity sold declined
-- from stage A (Feb-Apr) to stage B (May-Jul).

WITH product_combination AS (SELECT p.product_id, p.product_name, SUM(o.quantity) AS total_quantity, 
CASE 
	WHEN o.order_date BETWEEN '2026-02-01' AND '2026-04-30' THEN 'stage_A'
    WHEN o.order_date BETWEEN '2026-05-01' AND '2026-07-31' THEN 'stage_B'
END AS periods
FROM orders AS o
JOIN products AS p
	ON p.product_id = o.product_id
WHERE o.order_date BETWEEN '2026-02-01' AND '2026-07-31'
GROUP BY p.product_id, p.product_name, periods),
product_comparison AS (SELECT product_name, 
SUM(CASE
		WHEN periods = 'stage_A' THEN total_quantity ELSE 0
    END) AS stage_A_qty,
SUM(CASE
		WHEN periods = 'stage_B' THEN total_quantity ELSE 0
	END) AS stage_B_qty
FROM product_combination
GROUP BY product_name)
SELECT *
FROM product_comparison
WHERE stage_B_qty < stage_A_qty;