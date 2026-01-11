/* 1. which countries and regions have the highest and lowest prevalence of mental illnesses?
   2. how does the burden of disease (dalys) compare to prevalence? */

-- 1.1 countries with the highest prevalence of depression in the most recent year
-- Uganda has the highest rate
select 
    entity,
    year,
    round(depressive::numeric, 2) as depression_rate
from mental_illnesses_prevalence
where code is not null
order by year desc, depressive desc;

-- 1.2 the burden-prevalence ratio (joining prevalence and burden_disease)
-- Singapore has the highest ration for 14 distinct years
select 
    p.entity,
    p.year,
    p.anxiety as anxiety_prevalence,
    b.anxiety_disorders as anxiety_burden_daly,
    round((b.anxiety_disorders / nullif(p.anxiety, 0))::numeric, 2) as burden_per_case_ratio
from mental_illnesses_prevalence p
join burden_disease b on p.entity = b.entity and p.year = b.year
where p.code is not null
order by burden_per_case_ratio desc;


-- Do some illnesses cause disproportionate health loss (DALYs) compared to how common they are?
-- Palestine shows the highest ratio
select 
    p.entity,
    p.year,
    p.depressive as prevalence_rate,
    b.depressive_disorder as burden_rate_daly,
    round((b.depressive_disorder / nullif(p.depressive, 0))::numeric, 2) as burden_intensity_ratio
from mental_illnesses_prevalence p
join burden_disease b 
    on p.entity = b.entity 
    and p.year = b.year
where p.code is not null
order by burden_intensity_ratio desc;