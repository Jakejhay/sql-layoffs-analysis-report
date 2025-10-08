# 📊 SQL Layoffs Analysis Report (2020–2023)

### 🔍 Overview
This project analyzes **global tech and business layoffs between 2020 and 2023** using SQL to uncover patterns, industry impacts, and funding-stage relationships.  
The dataset contains **2,361 recorded layoff events**, including details such as company name, location, industry, funding stage, number of employees laid off, and layoff percentage.

The aim was to practice **real-world SQL data cleaning and analysis**, tackling inconsistencies, NULL values, and duplicates — while generating actionable insights from raw data.

---

## 🧾 Dataset Source
- **Source:** [Kaggle – Global Tech Layoffs Dataset (2020–2023)](https://www.kaggle.com)  
- **Records:** 2,361 layoff events  
- **Description:** Captures global layoff activities from 2020 to 2023, including total layoffs, percentage laid off, company stage, and industry information.  
- The dataset started as a **raw, uncleaned CSV** with multiple missing values and inconsistencies — making it an excellent case for end-to-end SQL cleaning and transformation.

---

## 🧠 Objectives
1. Analyze layoff trends from 2020 to 2023 to identify patterns across industries, companies, and countries.
2. Clean and preprocess a raw dataset of 2,361 records to ensure data quality for reliable insights.
3. Provide actionable insights through SQL-based exploration and analysis, focusing on yearly, monthly, and industry impacts.
4. Document the workflow and findings to serve as a reusable template for similar data projects.

---

## 🧰 Tools & Technologies
| Tool | Purpose |
|------|----------|
| **MySQL Workbench** | Data import, cleaning, and SQL analysis |
| **Excel** | Simple charts (bar & pie) for trend visualization |
| **GitHub** | Version control and portfolio presentation |

---

## 🧩 Project Workflow
1. **Data Import:**  
   Imported the CSV into MySQL Workbench using the Table Data Import Wizard.

2. **Staging Table Creation:**  
   Created a staging table to preserve the raw dataset before cleaning.

3. **Data Cleaning:**  
   - Removed duplicates and handled NULL values.  
   - Standardized company names, industries, and country entries.  
   - Ensured proper date formats for temporal analysis.  

4. **Exploratory Analysis:**  
   - Total layoffs per year and per industry.  
   - Average layoff percentage by funding stage.  
   - Most affected countries and companies.  

5. **Insights & Exports:**  
   Exported cleaned data and summary query results to Excel for simple charting and further review.

---

## 📊 Key Insights & Findings

| Insight | Description |
|----------|--------------|
| **1️⃣ Peak in 2022** | Layoffs surged in **2022**, recording **1,211 events** and **160,661 total layoffs** — over double 2020’s 80,998 — likely linked to post-pandemic corrections and global economic slowdown. |
| **2️⃣ Consumer & Retail Hit Hardest** | **Consumer** and **Retail** industries recorded the highest totals (**44,782** and **43,613** layoffs respectively). **Travel** had the highest average layoff percentage (**31.9%**), showing deeper cuts per event. |
| **3️⃣ Fluctuating Severity** | **2021** had fewer events (44) but the **highest average layoff percentage (40.2%)**, showing smaller but more severe waves. **2023** eased slightly at **22.4%** average. |
| **4️⃣ Funding Stage Effect** | Mid-funded firms (**$100M–$500M**) recorded the highest layoffs (**48,000** across 1,200 events)**,** suggesting vulnerability among mid-stage companies. |
| **5️⃣ Stage Maturity Impact** | **Post-IPO companies** accounted for **~40,000 layoffs across 1,000 events**, with an average layoff rate of **15%**, reflecting mature firms’ large-scale adjustments. |
| **6️⃣ Event Frequency** | Finance industry had the highest event count at 284, suggesting widespread layoff activity across multiple companies. |
| **7️⃣ Monthly Peak** | Layoffs peaked in April 2020 with 26,710 total across 270 events, a 3x surge from March’s 9,628, reflecting early pandemic impact. |

---

## 📋 Methodology
- Used MySQL Workbench for SQL queries to explore, clean, and analyze data.
- Applied techniques like NULL handling, duplicate removal, and standardization.
- Exported cleaned data as `cleaned_layoffs.csv` for transparency.

---

## 💡 Key Takeaways
This project strengthened my understanding of:
- **SQL data cleaning & transformation** (handling NULLs, duplicates, and inconsistent data).  
- **Query design** for aggregation, ranking, and analytical insights.  
- **Storytelling with data** — transforming raw queries into digestible insights.  

---

## 🗂️ Folder Structure
##Data Folder##
This folder contains the raw and processed versions of the dataset.

##raw_layoffs.csv:## The original dataset with NULLs and inconsistencies (2,361 rows). Used as the starting point for analysis.
cleaned_layoffs.csv: The cleaned version after SQL processing, including NULL handling, duplicate removal, and standardization (approximately 2,355 rows). This is ready for further analysis or visualization.

##SQL Folder##
This folder holds the SQL scripts for each phase of the project.

##data_cleaning.sql:## Handles NULL values, duplicates removal, and standardization of text fields like industry and country names.
exploratory_analysis.sql: Performs initial data overview, such as counting unique industries and top countries by events.
key_insights_queries.sql: Focuses on trend analysis, including yearly and monthly layoffs, industry impacts, and funding correlations.

##Root Files##

**README.md:** This file—project overview, insights, and instructions for replication.
---

## 👤 Author
**Jacob Olorundare**  
📍 Data Enthusiast | SQL Analyst in Training  
🔗 [https://github.com/Jakejhay](https://github.com/Jakejhay)
