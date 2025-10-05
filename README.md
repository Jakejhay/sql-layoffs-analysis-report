# SQL Layoffs Analysis Report

## Project Overview
This project analyzes layoff trends across industries, companies, and countries using a dataset of 2361 layoff events from 2020 to 2023.

## Goals
- Analyze layoff trends from 2020 to 2023 to identify patterns across industries, companies, and countries.
- Clean and preprocess a raw dataset of 2,361 records to ensure data quality for reliable insights.
- Provide actionable insights through SQL-based exploration and analysis, focusing on yearly, monthly, and industry impacts.
- Document the workflow and findings to serve as a reusable template for similar data projects.

## File Structure
- `Data Exploration.sql`: Initial exploration of the dataset.
- `Data Cleaning.sql`: Cleaning steps to handle NULLs, duplicates, and inconsistencies.
- `Data Analysis.sql`: Queries for trend analysis (yearly, monthly, etc.).
- `layoffs.csv`: The original dirty dataset (2,361 rows with NULLs).
- `cleaned_layoff.csv`: The cleaned dataset (after cleaning and duplicate removal).

## Analysis Approach
1. **Data Exploration**: See ( Data Exploration.sql ) for initial insights.
2. **Data Cleaning**: See ( Data Cleaning.sql ) for data preparation.
3. **Data Analysis**: See ( Data Analysis.sql ) for trends and insights.

## Analysis Summaries
- **Yearly Trends**: Layoffs peaked in 2022 with 160,661 total across 1,211 events, up 2x from 2020’s 80,998, with an average percentage peaking at 40.2% in 2021. See(Data Analysis.sql).
- **Monthly Trends**: Highlights a spike in Q1 2023.
- **Industry Impact**: The Consumer and Retail industries led with over 43,000 layoffs each, while Travel had the highest average percentage (31.9%), suggesting deeper cuts per event. Finance showed the highest event count (284), reflecting widespread activity.

## Key Findings
- Highest Layoffs: Highest total layoffs occurred in 2022 with 160,661 across 1,211 events, a significant 2x increase from 2020’s 80,998 layoffs.
- Industry Leaders: Consumer and Retail industries led with 44,782 and 43,613 layoffs respectively, while Travel recorded the highest average layoff percentage at 31.9%, indicating severe per-event cuts.
Monthly Peak: Layoffs peaked in April 2020 with 26,710 total across 270 events, a 3x surge from March’s 9,628, reflecting early pandemic impact.
- Event Frequency: Finance industry had the highest event count at 284, suggesting widespread layoff activity across multiple companies.
Percentage Variability: The average layoff percentage ranged from 22.4% in 2023 to a peak of 40.2% in 2021, highlighting fluctuating severity per event over the years.
- Funding Correlation: After cleaning, NULLs in funds_raised_millions were replaced with 0, potentially underestimating funding impact, with total layoffs highest in industries like Consumer despite low average funding.
- Data Coverage: The dataset covers 2,356 cleaned records, with a slight event count discrepancy (2355 vs. 2361), possibly due to date filtering or incomplete entries.
- Consumer and Retail industries led with 44,782 and 43,613 layoffs respectively.
- Monthly trends show a spike in Q1 2023.
