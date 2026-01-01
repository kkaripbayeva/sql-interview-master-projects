/* PROJECT 3: Marketing Campaign Performance
   Level 1: Volume & Demographics
*/

-- 1. Database Scale: How many total customer records are in the dataset?
-- Answer: 2240

select count(*) as total_records
from "marketing_campaign.csv" mcc 

-- 2. Education Mix: What is the count of customers for each 'education' level?
-- Answer:Basic	54
--		  2n Cycle	203
-- 		  Master	370
--		  PhD	486
--		  Graduation	1127

select education,
count(*) as record_count
from "marketing_campaign.csv" mcc
group by education ;

-- 3. Household Composition: How many customers have at least one child (kidhome) or teenager (teenhome)?
-- Answer: 1602
select count(*) as record_count
from "marketing_campaign.csv" mcc 
where mcc.kidhome > 0 or mcc.teenhome  > 0

-- 4. Average Income: What is the average yearly household income across all customers?
-- Answer: 52247.25
select round(avg(mcc.income), 2) as avg_income
from "marketing_campaign.csv" mcc 