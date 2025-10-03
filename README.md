# sql-layoffs-analysis-report
# Layoff Trends Analysis for Staffing Strategy (2022-2023)

## Business Case
A staffing agency needs insights into global layoff patterns to help tech clients plan hiring and mitigate risks post-2022 economic shifts.

## Dataset
- File**: [layoffs.csv](https://github.com/user-attachments/files/22688626/layoffs.csv) 185 rows, 9 columns (e.g., `industry`, `total_laid_off`).
- Source: publicly available provided CSV on 2022-2023 tech layoffs.
- Initial Findings: 185 events, ~740 NULLs in `total_laid_off`.

## Analysis Approach
I used SQLite to explore the data, focusing on industry, country, and time-based trends. Below are key queries with explanations and results.

### 1. Total Layoffs by Industry
-- Identifying industries with the highest layoff volumes to pinpoint vulnerable sectors
```sql
SELECT industry, 
       SUM(total_laid_off) AS total_laid_off,
       AVG(percentage_laid_off) AS avg_percentage_laid_off
FROM layoffs
GROUP BY industry
ORDER BY total_laid_off DESC
LIMIT 5;
