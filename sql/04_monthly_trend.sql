-- E-Commerce Sales Performance and Decline Analysis
-- Question 4: Monthly Order Trend
-- Objective: Determine whether order decline was consistent
-- throughout Stage B and identify month-to-month changes.

WITH monthly_orders AS (
SELECT MONTH(order_date) AS month_num, MONTHNAME(order_date) AS months, COUNT(order_id) AS total_order
FROM orders
WHERE order_date BETWEEN '2026-05-01' AND '2026-07-31'
GROUP BY month_num, months)
SELECT months, total_order, total_order - LAG(total_order) OVER(ORDER BY month_num) AS order_change
FROM monthly_orders;