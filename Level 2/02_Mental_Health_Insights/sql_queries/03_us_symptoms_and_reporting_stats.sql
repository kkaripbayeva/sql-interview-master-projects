/* 5. which depressive symptoms are most commonly reported in the u.s.?
   6. global reporting check: are more countries providing primary data over time? */

-- 3.1 us depressive symptom frequency trends
-- sleep problems occur more frequently everyday than other diseases
select 
    entity,
    every_day,
    more_half_days,
    several_days,
    not_at_all
from us_depressive_symptoms
order by every_day desc;

-- 3.2 tracking the number of countries providing primary data
-- Attention-deficit hyperactivity disorder has the highest reporting count
select 
    entity,
    sum(number) as total_reporting_diseases
from countries
group by entity
order by total_reporting_diseases  desc;
