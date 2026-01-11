# Project 1: YouTube Sentiment & Popularity Analysis 📺

## Project Overview
This project explores the relationship between YouTube video performance (views, likes, engagement) and audience sentiment. By connecting video metadata with their most relevant comments, this analysis uncovers how specific keywords drive virality, how sentiment shifts across different content categories, and the impact of restricted engagement (disabled comments/likes) on a video's reach.

---

## Dataset Schema

### 1. `videos-stats.csv` (Metadata Table)
| Column | Description |
| :--- | :--- |
| **Title** | The title of the YouTube video. |
| **Video ID** | The unique identifier for each video (Primary Key). |
| **Published At** | Date of publication (YYYY-MM-DD). |
| **Keyword** | Content category associated with the video. |
| **Likes** | Total likes (Value of `-1` indicates likes are hidden). |
| **Comments** | Total comment count (Value of `-1` indicates comments are disabled). |
| **Views** | Total view count. |

### 2. `comments.csv` (Engagement Table)
| Column | Description |
| :--- | :--- |
| **Video ID** | Identifier used to link to the stats table (Foreign Key). |
| **Comment** | The text content of the comment. |
| **Likes** | Number of likes received by that specific comment. |
| **Sentiment** | Numerical score: `0` (Negative), `1` (Neutral), `2` (Positive). |



---

## Business Questions to Answer

### 🎯 Content & Keyword Strategy
1. **Keyword Performance:** Which keywords are associated with the highest-performing videos in terms of views, likes, and comments?
2. **Growth Trends:** Are there common patterns in topics or content types that consistently outperform others?
3. **Temporal Impact:** How does the publication date relate to performance? Are newer videos trending better, or do older videos maintain long-term engagement?

### 🧠 Audience Sentiment & Behavior
4. **The Virality vs. Sentiment Link:** Do videos with high engagement (likes/views) tend to have more positive, negative, or neutral comments? 
5. **Polarization:** Do videos with high comment volumes attract more polarized reactions (extreme 0 or 2 scores) compared to low-engagement videos?
6. **Sentiment Drivers:** Are there specific keywords that consistently result in higher comment sentiment or more "liked" comments?
7. **The "Helpful" Critic:** What is the sentiment of the most-liked comments? Are they generally positive/supportive or critical of the content?

### 🛠️ Algorithmic & Platform Insights
8. **Restricted Engagement:** What proportion of videos have disabled comments or hidden like counts?
9. **The "Penalty" Check:** Do videos with disabled engagement features still perform well in terms of views, or does the algorithm prioritize open interaction?
10. **Sentiment Evolution:** Is there a trend by keyword or publishing date for disabled features?

---

## Main Skills Used (Level 2 Proficiency)
* **Relational Joins:** Executing `INNER JOIN` and `LEFT JOIN` to connect metadata with comment sentiment.
* **Advanced Filtering:** Handling "flag" values (like `-1`) to prevent skewed averages.
* **Conditional Logic:** Utilizing `CASE WHEN` to transform numerical sentiment into categorical data (Positive/Negative).
* **Data Aggregation:** Using `GROUP BY` across multiple joined tables to calculate keyword-level KPIs.
* **Sentiment Profiling:** Correlating text-based sentiment scores with quantitative performance metrics.

---

## Technical Stack
* **Database:** PostgreSQL
* **Analysis:** SQL (CTEs, Joins, Aggregations)
* **Visualization:** Python (Pandas, Seaborn, Matplotlib)