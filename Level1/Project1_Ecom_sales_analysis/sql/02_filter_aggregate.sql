-- Q6: How many sales were B2B transactions vs non-B2B?
-- I want to separate transactions by customer type and count them.
-- SQL:
select case when asr.b2b is true then 'B2B' else 'non-B2B' end as customer_type,
count(*) as transactions_count
from amazon_sale_report asr 
group by case when b2b is true then 'B2B' else 'non-B2B' end
;
-- ANS: non-B2B - 128104
--      B2B - 871

-- Q7: How many sales were made for each product size?
-- I want to group sales by size and count total sales.
-- SQL:
select size,
count(*) as transactions_count
from amazon_sale_report asr 
group by asr.size 
order by transactions_count desc
;
-- ANS: highest for M size, lowest for Free size

-- Q8: Which fulfilment method was used most frequently?
-- I want to find the delivery method that appears the most.
-- SQL:
select asr.fulfilment, 
count(*) as transactions_count
from amazon_sale_report asr
group by asr.fulfilment 
order by transactions_count desc 
limit 1
;
-- ANS: Amazon - 89698

-- Q9: Which month had the highest total sales revenue?
-- I want to aggregate revenue by month and identify the top one.
-- SQL:
select extract(month from asr.date) as month,
count(*) as transactions_count
from amazon_sale_report asr 
group by extract(month from asr."date")
order by transactions_count desc 
limit 1
;
-- ANS: April - 35030

-- Q10: How many sales were made for each region or country?
-- If the dataset includes location, I want to count sales per region.
-- SQL:
select asr."ship-state"  ,
count(*) as transactions_count
from amazon_sale_report asr 
group by "ship-state" 
order by transactions_count desc
;
-- ANS: MAHARASHTRA - highest