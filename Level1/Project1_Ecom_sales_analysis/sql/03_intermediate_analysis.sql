-- Q11: What are the top 5 most sold SKUs based on quantity?
-- I want to list the top 5 products by quantity sold.
-- SQL:
select asr.sku,
sum(asr.qty) as total_quantity
from amazon_sale_report asr 
group by asr.sku 
order by total_quantity desc
limit 5
;
-- ANS: JNE3797-KR-L

-- Q12: Which product category generated the highest total revenue?
-- I want to sum revenue per category and identify the top one.
-- SQL:
select asr.category,
round(sum(asr.amount), 2) as total_revenue
from amazon_sale_report asr 
group by asr.category 
order by total_revenue desc
limit 1
;
-- ANS: Set

-- Q13: What is the average order value per customer type (B2B vs non-B2B)?
-- I want to calculate the average transaction amount grouped by customer type.
-- SQL:
select case when asr.b2b is true then 'B2B' else 'non-B2B' end as customer_type,
round(avg(asr.amount), 2) as avg_transaction_value
from amazon_sale_report asr 
group by case when b2b is true then 'B2B' else 'non-B2B' end
;
-- ANS: B2B - 701.33
--		non-B2B - 648.19

-- Q14: Which day of the week had the highest sales volume?
-- I want to analyze which weekday has the most sales.
-- SQL:
select extract(dow from asr.date) as day_of_week,
count(*) as transactions_count
from amazon_sale_report asr 
group by extract(dow from asr."date")
order by transactions_count desc 
limit 1
;
-- ANS: 2