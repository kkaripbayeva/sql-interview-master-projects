-- 4. Do videos with high engagement (likes/views) tend to have more positive, negative, or neutral comments? 
-- Answer: higher views does not mean it has more positive comments, but it keeps on positive side
select 
    vs.keyword,
    round(avg(vs.views)::numeric, 0) as avg_views,
    round(avg(c.sentiment)::numeric, 2) as avg_sentiment_score
from videos_stats vs
join comments c on vs.videoid = c.videoid
group by vs.keyword
order by avg_views desc; 

-- 5. Do videos with high comment volumes attract more polarized reactions (extreme 0 or 2 scores) compared to low-engagement videos?
-- Answer: more comments, more positive reactions
select 
    vs.videoid,
    vs.title,
    vs.comments as total_comments,
    sum(case when c.sentiment = 0 then 1 else 0 end) as negative_count,
    sum(case when c.sentiment = 2 then 1 else 0 end) as positive_count,
    sum(case when c.sentiment = 1 then 1 else 0 end) as neutral_count
from videos_stats vs
join comments c on vs.videoid = c.videoid
where vs.comments <> -1
group by vs.videoid, vs.title, vs.comments
order by vs.comments desc
limit 20;

-- 6. Are there specific keywords that consistently result in higher comment sentiment or more "liked" comments?
-- Answer: 'lofi' has higher sentiment but not the highest comments
select 
    vs.keyword,
    round(avg(c.sentiment)::numeric, 2) as avg_sentiment,
    round(avg(c.likes)::numeric, 0) as avg_comment_likes
from videos_stats vs
join comments c on vs.videoid = c.videoid
group by vs.keyword
order by avg_sentiment desc;

-- 7. What is the sentiment of the most-liked comments? Are they generally positive/supportive or critical of the content?
-- Answer: positive sentiment to engage more with the channel
select 
    c.comment,
    c.sentiment,
    c.likes as comment_likes,
    vs.keyword
from comments c
join videos_stats vs on c.videoid = vs.videoid
order by c.likes desc
limit 10;