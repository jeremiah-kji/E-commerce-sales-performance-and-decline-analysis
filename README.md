# E-Commerce Sales Performance and Decline Analysis

## Project Overview

This project analyzes sales performance for an e-commerce business after management raised concerns that the business was "not performing as well."

The analysis uses SQL to investigate changes in sales, revenue, product performance, category performance, city performance, monthly trends, and customer ordering behavior.

Rather than assuming that overall performance declined, the analysis compares two periods to identify where performance improved, where it declined, and which areas require further investigation.

---

## Analysis Periods

| Period  | Date Range                  |
| ------- | --------------------------- |
| Stage A | February 1 – April 30, 2026 |
| Stage B | May 1 – July 31, 2026       |

Stage A represents the earlier three-month period, while Stage B represents the most recent three-month period.

---

## Business Questions

1. Which products experienced a decline in quantity sold?
2. How did category revenue and order volume change between the two periods?
3. Which cities experienced the largest changes in order performance?
4. Was the order decline consistent throughout Stage B?
5. How did individual customer ordering behavior change?
6. How did returning and one-time customers compare across the two periods?

---

## Dataset

The analysis uses three relational tables:

### Customers

Contains customer information.

* `customer_id`
* `customer_name`
* `city`

### Products

Contains product information.

* `product_id`
* `product_name`
* `category`
* `price`

### Orders

Contains transaction information.

* `order_id`
* `customer_id`
* `product_id`
* `quantity`
* `order_date`

---

## Tools Used

* MySQL
* SQL
* GitHub

### SQL Techniques Used

* `JOIN`
* `GROUP BY`
* `CASE`
* Aggregate functions
* Common Table Expressions (CTEs)
* Subqueries
* Window functions
* `LAG()`
* Conditional aggregation
* Date filtering
* Comparative analysis

---

## Key Findings

### Overall Sales Performance

| Metric                     |  Stage A |  Stage B |
| -------------------------- | -------: | -------: |
| Total Orders               |       46 |       43 |
| Revenue                    | ₦711,400 | ₦935,700 |
| Average Quantity per Order |   1.6304 |   1.6977 |

Total orders decreased slightly from **46 to 43**, while revenue increased from **₦711,400 to ₦935,700**.

This indicates that the business experienced a decline in order volume but an increase in revenue during Stage B.

---

## Category Performance

Revenue changed differently across product categories.

| Category    | Stage A Revenue | Stage B Revenue |
| ----------- | --------------: | --------------: |
| Electronics |        ₦209,500 |        ₦152,500 |
| Groceries   |        ₦204,900 |        ₦156,200 |
| Beauty      |        ₦138,000 |        ₦240,000 |
| Home        |        ₦104,000 |         ₦51,000 |
| Fashion     |         ₦55,000 |        ₦336,000 |

Fashion recorded the largest revenue increase, while Home recorded a substantial decline.

Beauty was the only category where order volume increased according to the analysis.

---

## Customer Behavior

Customer-level analysis showed mixed behavior between the two periods.

| Customer Behavior | Number of Customers |
| ----------------- | ------------------: |
| Increased Orders  |                   8 |
| Decreased Orders  |                   9 |
| Unchanged         |                   3 |
| Total             |                  20 |

The results show that customer behavior was not uniform: some customers increased their purchasing activity while others reduced theirs.

There were also **18 active customers in Stage B**, consisting of:

* 6 one-time customers
* 12 returning customers

---

## Monthly Trend

Monthly analysis of Stage B showed that:

* May recorded the highest number of orders.
* July recorded the lowest number of orders.
* Orders decreased by 1 from May to June.
* Orders decreased by 6 from June to July.

The `LAG()` window function was used to calculate month-to-month changes.

---

## Business Insights

The analysis suggests that the statement that the business was simply "not performing as well" requires further investigation.

Although order volume declined slightly, revenue increased substantially.

The difference between revenue and order trends suggests that changes in product mix, pricing, or purchasing quantities may have contributed to the increase in revenue.

Customer behavior was also mixed, with both increases and decreases in individual ordering activity.

Further analysis would be required to determine the specific factors responsible for the changes.

---

## Project Structure

```text
e-commerce-sales-performance-and-decline-analysis
│
├── README.md
│
└── sql
    ├── 01_product_decline.sql
    ├── 02_category_performance.sql
    ├── 03_city_performance.sql
    ├── 04_monthly_trend.sql
    ├── 05_customer_behavior.sql
    └── 06_returning_vs_onetime.sql
```

---

## Skills Demonstrated

This project demonstrates practical use of SQL for:

* Data exploration
* Sales performance analysis
* Revenue analysis
* Customer behavior analysis
* Trend analysis
* Comparative analysis
* Business problem solving
* Translating business questions into SQL queries

---

## Future Analysis

Potential next steps include:

* Investigating why revenue increased despite lower order volume
* Analyzing average order value
* Investigating product-level revenue changes
* Examining customer retention
* Identifying high-value customers
* Investigating city-level performance in greater detail
* Exploring factors behind the decline in July orders
