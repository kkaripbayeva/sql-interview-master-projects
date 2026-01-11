# Project 2: Global Mental Health Insights Dashboard 🧠🌍

## Project Overview
This project involves a deep-dive analysis of global mental health data to uncover patterns in disorder prevalence, the resulting disease burden (DALYs), and critical gaps in healthcare coverage. By synthesizing data from seven distinct sources, I aim to identify regions where the "Treatment Gap" is most severe and evaluate the quality of data collection across different psychiatric conditions.

---

## Dataset Schema
This project utilizes 7 interconnected datasets. All tables are linked by the common keys: `Entity` (Country/Region), `Code`, and `Year`.

| Table Name | Focus | Key Metrics |
| :--- | :--- | :--- |
| **1. Prevalence** | Frequency | % of population with Schizophrenia, Depression, Anxiety, etc. |
| **2. Burden (DALYs)** | Impact | Disability-Adjusted Life Years (Health loss rates). |
| **3 & 4. Population Coverage** | Data Integrity | % of adults covered in primary data studies for specific disorders. |
| **5. Treatment Gap** | Healthcare Gaps | % Untreated vs. Potentially Adequate Treatment (Anxiety). |
| **6. US Symptoms** | Depth | Frequency of depressive symptoms (US specific context). |
| **7. Reporting Count** | Metadata | Number of countries providing primary data for studies. |

---

## Main Skills Used (Level 2 Proficiency)
* **Relational Multi-Table Joins:** Synchronizing data across 3+ tables using composite keys (Entity + Year).
* **Set Operations:** Utilizing `UNION` and `INTERSECT` to identify overlap and gaps in global data coverage.
* **CTEs (Common Table Expressions):** Building modular, readable queries to calculate the "Treatment Gap" before joining with prevalence stats.
* **Data Normalization:** Cleaning and aliasing long-form health descriptors for efficient querying.

