/* BUSINESS CATEGORY: Content & Keyword Strategy
Focus: Identifying high-growth topics and timing optimization.
*/

-- 1. Which keywords are associated with the highest-performing videos in terms of views, likes, and comments?
-- Answer: 'google' - has the highest views count, 'mrbeast' - highest likes count and comments count 
select vs.keyword,
count(*) as video_count,
round(avg(vs.views::numeric ), 2) as avg_views,
round(avg(vs.likes::numeric), 2) as avg_likes,
round(avg(vs.comments::numeric), 2) as avg_comments
from videos_stats vs
group by vs.keyword 
order by avg_views desc
; 

-- 2. Are there common patterns in topics or content types that consistently outperform others?
-- Answer: 'reaction' outperforms
select vs.keyword,
round((sum(vs.likes::numeric)/nullif(sum(vs.views::numeric),0))*100,2) as engagement_rate
from videos_stats vs 
group by vs.keyword 
order by engagement_rate desc 

-- 3. How does the publication date relate to performance? Are newer videos trending better, or do older videos maintain long-term engagement?
-- Answer: Video count increased, but views and likes decreased
select extract(year from published_at) as pub_year,
count(*) as video_count,
round(avg(vs.views::numeric ), 2) as avg_views,
round(avg(vs.likes::numeric), 2) as avg_likes
from videos_stats vs 
group by pub_year
order by pub_year desc 
