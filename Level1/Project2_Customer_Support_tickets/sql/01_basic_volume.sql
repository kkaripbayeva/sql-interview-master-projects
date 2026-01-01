/* PROJECT 2: Customer Support Ticket Analysis
   Level 1: Basic Operations & Volume
*/

-- 1. How many total support tickets are in the dataset?
select count(*) as ticket_count
from customer_support_tickets cst ;
-- 2364

-- 2. What are the most common issue types reported?
select cst.ticket_type,
count(*) as ticket_count
from customer_support_tickets cst 
group by cst.ticket_type 
order by ticket_count desc ;
-- Technical issue

-- 3. How many tickets were submitted through each support channel?
select cst.ticket_channel,
count(*) as ticket_count
from customer_support_tickets cst 
group by cst.ticket_channel ;


-- 4. What is the total number of currently unresolved tickets?
select count(*) as ticket_count
from customer_support_tickets cst 
where cst.time_to_resolution is null
--1557
