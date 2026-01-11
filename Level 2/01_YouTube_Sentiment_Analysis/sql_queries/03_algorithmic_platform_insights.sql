-- 8. what proportion of videos have disabled comments or hidden like counts?
-- answer: 0.37 hidden likes, 0.11 disabled comments
select 
    count(*) filter (where likes = -1) as hidden_likes_count,
    count(*) filter (where comments = -1) as disabled_comments_count,
    round(count(*) filter (where likes = -1)::numeric / count(*) * 100, 2) as pct_hidden_likes,
    round(count(*) filter (where comments = -1)::numeric / count(*) * 100, 2) as pct_disabled_comments
from videos_stats;


-- 9. do these videos still perform well in terms of views, or does the algorithm prioritize open interaction?
-- answer: algorithm prioritize open interaction
select 
    case 
        when comments = -1 or likes = -1 then 'restricted'
        else 'open'
    end as engagement_status,
    count(*) as video_count,
    round(avg(views)::numeric, 0) as avg_views
from videos_stats
group by engagement_status;


-- 10. is there a trend by keyword or publishing date for disabled features?
-- answer: 'movies'
select 
    keyword,
    count(*) as restricted_count
from videos_stats
where comments = -1
group by keyword
order by restricted_count desc;
