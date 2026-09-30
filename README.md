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

### Product Performance

The analysis identified **11 products** whose quantity sold declined from Stage A to Stage B.

| Product                | Stage A Quantity | Stage B Quantity |
| ---------------------- | ---------------: | ---------------: |
| Smartphone Case        |                4 |                0 |
| Instant Noodles Carton |                5 |                0 |
| Milk Powder Tin        |                4 |                3 |
| Perfume 50ml           |                4 |                2 |
| Bedsheet Set           |                3 |                0 |
| Blender                |                3 |                2 |
| Spaghetti Pack         |                4 |                3 |
| Wireless Earbuds       |                5 |                2 |
| Power Bank 10000mAh    |                7 |                3 |
| Table Lamp             |                4 |                0 |
| USB-C Cable            |                6 |                3 |

Several products recorded **zero sales in Stage B**, including Smartphone Case, Instant Noodles Carton, Bedsheet Set, and Table Lamp.

The largest decline in absolute quantity was recorded by the **Power Bank 10000mAh**, which decreased from 7 units to 3 units.

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

### City Performance

City-level analysis showed that performance varied considerably across locations.

| City          | Stage A Revenue | Stage B Revenue | Stage A Orders | Stage B Orders | Revenue Change | Order Change |
| ------------- | --------------: | --------------: | -------------: | -------------: | -------------: | -----------: |
| Port Harcourt |        ₦118,000 |        ₦155,700 |              7 |              8 |       +₦37,700 |           +1 |
| Kano          |        ₦107,000 |        ₦125,400 |              8 |              7 |       +₦18,400 |           -1 |
| Benin City    |         ₦50,900 |         ₦45,800 |              5 |              2 |        -₦5,100 |           -3 |
| Lagos         |        ₦165,400 |        ₦166,500 |              8 |              6 |        +₦1,100 |           -2 |
| Enugu         |         ₦86,000 |        ₦197,500 |              7 |              5 |      +₦111,500 |           -2 |
| Abuja         |        ₦184,100 |        ₦226,800 |             11 |             14 |       +₦42,700 |           +3 |
| Ibadan        |              ₦0 |         ₦18,000 |              0 |              1 |       +₦18,000 |           +1 |

The largest revenue increase occurred in **Enugu**, where revenue increased by ₦111,500 despite a decrease in order count.

**Abuja** recorded the largest increase in order volume, rising from 11 to 14 orders.

**Benin City** recorded the largest decline in order volume, decreasing from 5 to 2 orders.

The city-level results show that changes in revenue did not always move in the same direction as changes in order volume.

---

### Monthly Trend

Monthly analysis of Stage B showed that:

* May recorded the highest number of orders.
* July recorded the lowest number of orders.
* Orders decreased by 1 from May to June.
* Orders decreased by 6 from June to July.

| Month | Orders | Change from Previous Month |
| ----- | -----: | -------------------------: |
| May   |     17 |                          — |
| June  |     16 |                         -1 |
| July  |     10 |                         -6 |

The `LAG()` window function was used to calculate month-to-month changes.

The results show a continued decline in monthly order volume throughout Stage B, with the largest month-to-month decrease occurring between June and July.


---

### Customer Behavior

Customer-level analysis showed mixed changes in ordering behavior between Stage A and Stage B.

| Customer Behavior | Customers | Stage A Orders | Stage B Orders | Change |
| ----------------- | --------: | -------------: | -------------: | -----: |
| Increased         |         8 |             12 |             25 |    +13 |
| Decreased         |         9 |             30 |             14 |    -16 |
| Unchanged         |         3 |              4 |              4 |      0 |
| **Total**         |    **20** |         **46** |         **43** | **-3** |

Nine customers decreased their ordering activity, while eight customers increased theirs. Three customers maintained the same number of orders across both periods.

The decrease among customers who reduced their ordering activity was larger than the increase among customers who increased their activity, contributing to the overall decline from 46 to 43 orders.

This shows that the overall order decline was driven by a combination of different customer-level behaviors rather than every customer reducing their purchases.

---

### Returning vs One-Time Customers

Customer ordering patterns were also classified as either returning or one-time customers in each analysis period.

| Period  | Customer Type | Number of Customers |
| ------- | ------------- | ------------------: |
| Stage A | Returning     |                  15 |
| Stage A | One-time      |                   3 |
| Stage B | Returning     |                  12 |
| Stage B | One-time      |                   6 |

The number of returning customers decreased from **15 in Stage A to 12 in Stage B**, while one-time customers increased from **3 to 6**.

This indicates a shift in the composition of customers between the two periods, with fewer customers making multiple orders and more customers making only one order during Stage B.

---

## Business Insights

The analysis shows that overall business performance changed in different ways between the two periods.

* **Order volume declined slightly**, from 46 orders in Stage A to 43 orders in Stage B.
* **Revenue increased substantially**, from ₦711,400 to ₦935,700.
* **11 products experienced a decline in quantity sold**, with several recording zero sales in Stage B.
* **Category performance varied considerably**, with Fashion and Beauty showing revenue growth while Electronics, Groceries, and Home declined.
* **City-level performance was mixed**, with some cities increasing revenue despite recording fewer orders.
* **Monthly order volume declined throughout Stage B**, with the largest decrease occurring between June and July.
* **Customer behavior was mixed**, with 8 customers increasing their order activity, 9 decreasing, and 3 remaining unchanged.
* **Returning customers decreased from 15 to 12**, while one-time customers increased from 3 to 6.

These findings show that the change in business performance cannot be explained by order volume alone. Revenue, product performance, customer behavior, location, and monthly trends all provide different perspectives on the business.


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

This project demonstrates practical skills in:

* SQL data analysis
* Data exploration and aggregation
* Sales and revenue analysis
* Customer behavior analysis
* Trend analysis
* Comparative analysis
* Using CTEs and window functions
* Translating business questions into analytical queries
* Interpreting query results to identify business insights
* Communicating analytical findings clearly


---

## Future Analysis

The current analysis provides a high-level view of the changes between the two periods. Further analysis could explore:

* Average order value and revenue per order
* Product-level revenue changes
* Customer retention and repeat purchase patterns
* High-value customers and their contribution to revenue
* The relationship between order quantity and revenue
* Factors behind the decline in July orders
* More detailed analysis of city-level performance
* Potential reasons for the shift from returning to one-time customers

These additional analyses could provide deeper insight into the factors associated with the observed changes in business performance.
