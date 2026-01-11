/* 3. where is the treatment gap for anxiety disorders the largest?
   4. what percentage of the population is covered in primary data for different illnesses? */

-- 2.1 identifying the largest anxiety treatment gaps
-- Lebanon has the highest gap
select 
    entity,
    year,
    untreated as pct_untreated,
    potentiall_treatment as pct_potentially_adequate
from anxiety_treatment_gap
where untreated is not null
order by untreated desc;

-- 2.2 comparing data coverage across disorders (using union)
-- schizophrenia	15.13
-- major depression	29.00
-- anxiety disorders	34.18
select 'major depression' as disorder, round(avg(major_depression)::numeric, 2) as avg_coverage from population_mental_illnesses
union
select 'schizophrenia' as disorder, round(avg(schizophrenia)::numeric, 2) from population_mental_illnesses
union
select 'anxiety disorders' as disorder, round(avg(anxiety_disorders)::numeric, 2) from population_mental_illnesses
order by avg_coverage asc;

-- Can you spot regions where the need (prevalence/burden) is high but treatment remains low?
-- Portugal has the highest anxiety, but not the highest adequate treatment

select 
    p.entity,
    p.year,
    p.anxiety as anxiety_prevalence,
    t.untreated as pct_untreated,
    t.potentiall_treatment as pct_adequate_treatment
from mental_illnesses_prevalence p
join anxiety_treatment_gap t 
    on p.entity = t.entity 
    and p.year = t.year
where t.untreated > 50  -- focusing on areas where more than half are untreated
order by p.anxiety desc;