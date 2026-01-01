/* PROJECT 3: Marketing Campaign Performance
   Level 3 & 4: Campaign Performance & Advanced Analytics
*/

-- 9. Campaign Success: Compare acceptance counts across all 5 campaigns
-- Answer: highest 163 in cmp3 and cmp5, lowest cmp2 - 30
select 
    sum(acceptedcmp1) as cmp1,
    sum(acceptedcmp2) as cmp2,
    sum(acceptedcmp3) as cmp3,
    sum(acceptedcmp4) as cmp4,
    sum(acceptedcmp5) as cmp5
from "marketing_campaign.csv";


-- 10. Final Response Rate: What % of customers accepted the LAST campaign?
-- Answer: 14.91
select round(avg(response) * 100, 2) as final_response_rate
from "marketing_campaign.csv";


-- 11. Total Customer Value: Summing all product categories
-- This helps identify your "Whales" (top spenders)
-- Answer: 2525 - two highest Whales
select id, 
    (mntwines + mntfruits + mntmeatproducts + mntfishproducts + mntsweetproducts + mntgoldprods) as total_spent
from "marketing_campaign.csv"
order by total_spent desc;

-- 12. Total Spending: Calculate a 'total_spend' by summing all six 'mnt' columns for each customer.
-- Answer: 605.80
select round(avg(mntwines + mntfruits + mntmeatproducts + mntfishproducts + mntsweetproducts + mntgoldprods),2) as avg_spent
from "marketing_campaign.csv"


-- 13. Digital Engagement: Do customers who visit the website >5 times a month make more web purchases?
-- Answer: high visitors - 3.92, low visitors - 4.26
select 
    CASE WHEN numwebvisitsmonth > 5 THEN 'High Visitors (>5)' ELSE 'Low Visitors (<=5)' END AS visit_category,
    avg(numwebpurchases) AS avg_web_purchases
from "marketing_campaign.csv"
group by 1;

-- 14. The "Super-Fan" Segment: How many customers accepted 3 or more campaigns in total?
-- Answer: 97

select count(*) AS super_fan_count
from "marketing_campaign.csv"
where (acceptedcmp1 + acceptedcmp2 + acceptedcmp3 + acceptedcmp4 + acceptedcmp5 + response) >= 3;