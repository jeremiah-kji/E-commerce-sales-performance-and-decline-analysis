-- E-Commerce Sales Performance and Decline Analysis
-- Question 5: Customer Ordering Behavior
-- Objective: Compare individual customer order frequency 
-- between Stage A (Feb-Apr) and Stage B (May-Jul).

SELECT CASE
	WHEN order_date BETWEEN '2026-02-01' AND '2026-04-30' THEN 'A'
    WHEN order_date BETWEEN '2026-05-01' AND '2026-07-31' THEN 'B'
END AS Stage, AVG(quantity) AS Avg_quantity, SUM(quantity) AS Total_quantity
FROM orders
WHERE order_date BETWEEN '2026-02-01' AND '2026-07-31'
GROUP BY Stage;