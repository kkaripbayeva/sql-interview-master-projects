/* PROJECT 2: Customer Support Ticket Analysis
   Level 3 & 4: Intermediate Trends & Advanced Analytics
*/

-- 9. How many tickets were submitted each month?
select extract(month from coalesce(first_response_time, date_of_purchase)) as month_number,
count(*) as ticket_count
from customer_support_tickets cst 
group by month_number
order by month_number

-- 10. What is the peak hour of the day for ticket submissions?
select extract(HOUR from first_response_time) as hour_of_the_day,
count(*) as ticket_count
from customer_support_tickets cst 
group by hour_of_the_day
order by hour_of_the_day desc
-- 23

-- 11. Which issue types result in the longest resolution times?
select cst.ticket_type, max(cst.time_to_resolution - cst.first_response_time ) as max_resolution_time
from customer_support_tickets cst 
where cst.time_to_resolution is not null
group by cst.ticket_type 
order by max_resolution_time  desc 
-- Technical issue


-- 12. Monthly Growth: What is the month-over-month percentage change in ticket volume?
with month_count as (select extract(month from coalesce(cst.first_response_time::date, cst.date_of_purchase::date)) as month_number,
count(*) as ticket_count
from customer_support_tickets cst 
where coalesce(cst.first_response_time::date, cst.date_of_purchase::date) is not null
group by month_number)
select month_number,
ticket_count,
lag(ticket_count) over (order by month_number) as prev_ticket_count,
round((ticket_count - lag(ticket_count) over (order by month_number))*100/lag(ticket_count) over (order by month_number),2) as perc_change
from month_count 

-- 13. Resolution Buckets: Categorize tickets into 'Fast', 'Standard', and 'Slow'.
select ticket_id,
       case 
           when (time_to_resolution - first_response_time) < interval '1 hour' then 'Fast'
           when (time_to_resolution - first_response_time) between interval '1 hour' and interval '24 hours' then 'Standard'
           else 'Slow'
       end as resolution_category
from customer_support_tickets
where time_to_resolution is not null;