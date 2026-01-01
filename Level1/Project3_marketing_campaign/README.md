# Project 3 — Marketing Campaign Performance 📊

## Project Overview
This project analyzes the behavior and demographics of 2,240 customers to evaluate marketing campaign success. By exploring spending patterns across categories (Wines, Fruits, Meat) and purchase channels (Web, Store, Catalog), I identify high-value customer segments and the primary drivers of campaign conversion.

---

## Learning Objectives
- **Customer Segmentation:** Grouping customers by `education` and `income` to find high-value targets.
- **Conversion Analysis:** Calculating acceptance rates for five distinct marketing campaigns.
- **Behavioral Profiling:** Analyzing how `recency` and `numwebvisitsmonth` impact purchasing.
- **Data Arithmetic:** Summarizing multiple "Mnt" (Amount) columns to calculate Total Customer Value.

---

## Dataset Schema Highlights
- **Demographics:** `year_brth`, `education`, `marital_status`, `income`.
- **Household:** `kidhome`, `teenhome`.
- **Engagement:** `dt_customer` (Enrollment), `recency`, `numwebvisitsmonth`.
- **Spending:** `mntwines`, `mntfruits`, `mntmeatproducts`, `mntfishproducts`, `mntsweetproducts`, `mntgoldprods`.
- **Conversion:** `acceptedcmp1` through `acceptedcmp5`, and the final `response`.

---

## Practice Questions

### 🔹 Level 1: Volume & Demographics
1. **Database Scale:** How many total customer records are in the dataset?
2. **Education Mix:** What is the count of customers for each `education` level?
3. **Household Composition:** How many customers have at least one child (`kidhome`) or teenager (`teenhome`)?

### 🔹 Level 2: Spending & Channel Analysis
4. **The Wine Factor:** What is the average amount spent on wine (`mntwines`) across all customers?
5. **Channel Preference:** What is the total number of purchases made through the `store` vs. the `web`?
6. **Gold Buyers:** Which `marital_status` group spends the most on luxury items (`mntgoldprods`)?
7. **Recency:** What is the average number of days since the last purchase across the database?

### 🔹 Level 3: Campaign Performance
8. **Campaign Success:** What is the total acceptance count for each of the five campaigns (`acceptedcmp1-5`)?
9. **Conversion Rate:** What is the overall percentage of customers who accepted the final campaign (`response`)?
10. **High-Value Responders:** What is the average `income` of customers who accepted the most recent campaign vs. those who didn't?
11. **Bargain Hunters:** How many customers made at least one purchase using a discount (`numdealspurchases` > 0)?

### 🔹 Level 4: Advanced Analytics
12. **Total Spending:** Create a query that calculates a `total_spend` column by summing all six `mnt` (amount) columns.
13. **Digital Engagement:** Do customers who visit the website more than 5 times a month actually make more web purchases?
14. **The "Super-Fan" Segment:** How many customers accepted 3 or more campaigns in total?

---

## Technical Stack
- **SQL (PostgreSQL):** Data aggregation, filtering, and segmentation.
- **Python (Pandas/Seaborn):** Data visualization and correlation analysis.

---