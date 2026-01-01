/* PROJECT 3: Marketing Campaign Performance
   Level 2: Spending & Channel Analysis
*/

-- 5. The Wine Factor: What is the average amount spent on wine (mntwines)?
-- Answer: 303.94
select round(avg(mcc.mntwines),2) as avg_wine_spent
from "marketing_campaign.csv" mcc 

-- 6. Channel Preference: What is the total number of purchases made through the 'store' vs. the 'web'?
-- Answer: total - 12970
--			web - 9150
--			catalog - 5963
select 
    sum(numstorepurchases) as total_store,
    sum(numwebpurchases) as total_web,
    sum(numcatalogpurchases) as total_catalog
from "marketing_campaign.csv";

-- 7. Gold Buyers: Which marital_status group spends the most on luxury items (mntgoldprods)?
-- Answer: Married
select marital_status, sum(mntgoldprods) as total_gold
from "marketing_campaign.csv"
group by marital_status
order by total_gold desc;

-- 8. Recency: What is the average number of days since the last purchase?
-- Answer: 49.1
select round(avg(recency),2) from "marketing_campaign.csv";