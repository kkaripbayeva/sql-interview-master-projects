/* PROJECT 2: Customer Support Ticket Analysis
   Level 2: Performance & Efficiency
*/

-- 5. What is the average resolution time across all tickets?

select avg (cst.time_to_resolution  - cst.first_response_time) as avg_resolution
from customer_support_tickets cst 
where time_to_resolution is not null
-- 00:16:41

-- 6. How many tickets were resolved on the same day they were submitted?
select count(*) as ticket_count
from customer_support_tickets cst 
where cst.time_to_resolution::date = cst.first_response_time::date
and time_to_resolution is not null
-- 663

-- 7. Which support channel has the fastest average resolution time?
select cst.ticket_channel, 
avg (cst.time_to_resolution  - cst.first_response_time) as avg_resolution
from customer_support_tickets cst 
where time_to_resolution is not null
and time_to_resolution > first_response_time
group by cst.ticket_channel 
-- social media 07:47:08

-- 8. Identify tickets that have been open for more than 7 days (Backlog Analysis).
select * 
from customer_support_tickets cst 
where (time_to_resolution - first_response_time > interval '7 days')
   or (time_to_resolution is null and first_response_time < NOW() - interval '7 days')