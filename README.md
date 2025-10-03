# Layoff Trends Analysis for Staffing Strategy (2022-2023)

## Business Case
A staffing agency needs insights into global layoff patterns to help tech clients plan hiring and mitigate risks post-2022 economic shifts. This analysis explores 2361 layoff events to identify key trends.

## Dataset
- **File**: [layoffs.csv](layoffs.csv) – 2361 rows, 9 columns (e.g., `industry`, `total_laid_off`).
- **Source**: Tutor-provided CSV on 2022-2023 tech layoffs.
- **Initial Findings**: 2361 events, 34 unique industries (e.g., 'Other', 'Media'), ~[740 Nulls in `total_laid_off`, ~ 31 Nulls in `percentage_laid_off`.

## Analysis Approach
I used SQL to explore the data, focusing on industry, country, and time-based trends. Below are key queries with explanations and results.

### 1. Total Layoffs by Industry
-- Identifying industries with the highest layoff volumes to pinpoint vulnerable sectors
```sql
SELECT industry, 
       SUM(total_laid_off) AS total_laid_off,
       AVG(percentage_laid_off) AS avg_percentage_laid_off
FROM layoffs
GROUP BY industry
ORDER BY total_laid_off DESC
```
### 1. Total Layoffs by Industry
| Industry  | Total Laid Off |
|-----------|----------------|
| Consumer  | 18234          |
| Other     | 11694          |
| Finance   | 5181           |

total_laid_off.jpg

## 2. Layoffs by Country
-- Assessing geographic impact to target regional recovery efforts
```sql
SELECT country, 
       SUM(total_laid_off) AS total_laid_off
FROM layoffs
GROUP BY country
ORDER BY total_laid_off DESC
LIMIT 5;
```

## 3. Monthly Layoff Trends
-- Tracking time patterns to predict future risks
```sql
SELECT date AS month, 
 SUM(total_laid_off) AS monthly_laid_off
FROM layoffs
WHERE date IS NOT NULL
GROUP BY month
ORDER BY month;
```











