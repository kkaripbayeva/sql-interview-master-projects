# Project 1 — Analyze Amazon Sales Data 📦

## Project Overview
This project focuses on exploring **customer service operations** through data. By analyzing ticket volumes, resolution times, and support channels, I aimed to surface patterns that inform how a company can improve its customer experience and operational efficiency.

---

## Learning Objectives
By completing this project, I practiced:

- **Data Cleaning**: Standardizing text fields and handling missing resolution dates.
- **Time-Series Analysis**: Using `DATE_TRUNC` and `EXTRACT` to find trends over months and hours.
- **Operational Metrics**: Calculating Average Resolution Time (ART) and same-day resolution rates.
- **Advanced Logic**: Using CTEs (Common Table Expressions) and Window Functions to rank performance.

---

## Dataset
- **File:** `SupportTickets.csv`  
- **Source:** Kaggle or provided dataset  
I uploaded it to my PostgreSQL database to start exploring and analyzing the data.

---

## Practice Questions — Beginner to Advanced

### 🔹 Level 1: Basic Operations & Volume
1. How many total support tickets are in the dataset?
2. What are the most common issue types reported?
3. How many tickets were submitted through each support channel (Email, Phone, Chat, etc.)?
4. What is the total number of currently unresolved tickets?

### 🔹 Level 2: Performance & Efficiency
5. What is the average resolution time across all tickets?
6. How many tickets were resolved on the same day they were submitted?
7. Which support channel has the fastest average response time?
8. Identify tickets that have been open for more than 7 days (Backlog Analysis).

### 🔹 Level 3: Intermediate Trends
9. How many tickets were submitted each month? (Identifying seasonality).
10. What is the peak hour of the day for ticket submissions?
11. Which product categories or issue types result in the longest resolution times?

### 🔹 Level 4: Advanced Analytics (CTEs & Window Functions)
12. Monthly Growth: What is the month-over-month percentage change in ticket volume?
13. Agent Ranking: Rank support agents by their resolution speed for high-priority tickets.
14. Resolution Buckets: Categorize tickets into 'Fast', 'Standard', and 'Slow' based on time-to-close.

---

## Deliverables
- My SQL queries answering all the questions above  

---

## Tips I Followed
- SQL (PostgreSQL): For data extraction and complex aggregations.
- Jupyter Notebooks: For Python-based data visualization.
- GitHub: For version control and project documentation.