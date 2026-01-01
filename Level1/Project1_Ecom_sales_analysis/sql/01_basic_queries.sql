-- Q1: How many total sales records are in the dataset?
-- I want to get the total number of rows in my dataset.
-- SQL:
select count(asr.orderid) as total_records
from amazon_sale_report asr;
-- ANS: 128975

-- Q2: What is the total revenue generated across all sales?
-- I want to calculate total revenue from all transactions.
-- SQL:
select asr.currency , sum(asr.amount) as total_revenue
from amazon_sale_report asr 
group by asr.currency;
-- ANS: 78592678.30 INR

-- Q3: How many unique SKUs were sold?
-- I want to count distinct products sold.
-- SQL:
select count(distinct sku) as unique_SKUs_count
from amazon_sale_report asr;
-- ANS: 7195

-- Q4: Which product category had the highest total quantity sold?
-- I want to see which category sold the most items in total.
-- SQL:
select asr.category, sum(asr.qty) as total_quantity_sold
from amazon_sale_report asr 
group by asr.category 
order by 2 desc 
limit 1;
-- ANS: Set - 45289

-- Q5: What is the average sales amount per transaction?
-- I want to calculate the mean sales value per order.
-- SQL:
select round(avg(asr.amount), 2) as avg_sales_per_transaction
from amazon_sale_report asr
;
-- ANS: 648.56 INR