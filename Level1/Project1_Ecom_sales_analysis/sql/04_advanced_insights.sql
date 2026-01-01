-- Q15: How does monthly revenue trend — are there seasonal spikes?
-- I want to calculate total revenue per month and identify trends.
-- SQL:
select extract(month from asr.date) as month_number,
       round(sum(asr.amount), 2) as total_revenue
from amazon_sale_report asr 
group by month_number
order by month_number
;
-- ANS: peaks during May and June, lowest on Apr

-- Q16: What is the percentage contribution of each product category to total revenue?
-- I want to calculate revenue per category as a percentage of total revenue.
-- SQL:
select category,
       round(sum(amount), 2) as total_revenue_per_category,
       round(sum(amount) * 100.0 / sum(sum(amount)) over (), 2) as percentage
from amazon_sale_report
group by category
order by percentage desc
;
-- ANS: highest Set with 49.88%

-- Q17: Which SKUs or categories have the highest average order value?
-- I want to calculate the average order amount per SKU or category.
-- SQL:
select sku,
       round(avg(amount), 2) as avg_order_value
from amazon_sale_report
where amount is not null
group by sku
order by avg_order_value desc
limit 10
;

select category,
       round(avg(amount), 2) as avg_order_value
from amazon_sale_report
where amount is not null
group by category
order by avg_order_value desc;


-- Q18: How do B2B vs non-B2B sales compare over time — are there noticeable trends?
-- I want to analyze revenue trends over time by customer type.
-- SQL:
select extract(month from asr.date) as month,
       case when b2b then 'B2B' else 'non-B2B' end as customer_type,
       round(sum(amount), 2) as total_revenue
from amazon_sale_report asr
group by month, customer_type
order by month, customer_type;
-- ANS: for B2B highest - June, lowest - January
--		for non-B2B highest- April, lowest - December
