# SQL Layoffs Analysis Report

## Project Overview
This project analyzes layoff trends across industries, companies, and countries using a dataset of 2361 layoff events from 2020 to 2023.

## File Structure
- `Data Exploration.sql`: Initial exploration of the dataset.
- `Data Cleaning.sql`: Cleaning steps to handle NULLs, duplicates, and inconsistencies.
- `Data Analysis.sql`: Queries for trend analysis (yearly, monthly, etc.).
- `layoffs.csv`: The original dirty dataset (2,361 rows with NULLs).
- `cleaned_layoffs.csv`: The cleaned dataset (after cleaning and duplicate removal).

## Analysis Approach
1. **Data Exploration**: See ( Data Exploration.sql ) for initial insights.
2. **Data Cleaning**: See ( Data Cleaning.sql ) for data preparation.
3. **Data Analysis**: See ( Data Analysis.sql ) for trends and insights.

## Analysis Summaries
- **Yearly Trends**: Layoffs peaked in 2022 with 160,661 total across 1,211 events, up 2x from 2020’s 80,998, with an average percentage peaking at 40.2% in 2021. See(Data Analysis.sql).
- **Monthly Trends**: Highlights a spike in Q1 2023.
- **Industry Impact**: The Consumer and Retail industries led with over 43,000 layoffs each, while Travel had the highest average percentage (31.9%), suggesting deeper cuts per event. Finance showed the highest event count (284), reflecting widespread activity.

## Key Findings
- Highest layoffs in 2020 with 80,998 total.
- Consumer and Retail industries led with 44,782 and 43,613 layoffs respectively.
- Monthly trends show a spike in Q1 2023.
