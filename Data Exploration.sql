-- SQL - Data Exploration (2022-2023)
-- Dataset: layoffs.csv (2361 rows, 9 columns: company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions)
-- Goal: Initial exploration to understand layoff patterns and dataset characteristics.

-- === Initial Overview ===
/* 1. Total Events and Basic Stats */
SELECT 
    COUNT(*) AS total_events,
    COUNT(DISTINCT industry) AS unique_industries,
    COUNT(DISTINCT country) AS unique_countries,
    COUNT(DISTINCT company) AS unique_companies
FROM layoffs;

-- === Industry Distribution ===
/* 2. Unique Industries Count and Sample */
SELECT COUNT(DISTINCT industry) AS unique_industries,
       GROUP_CONCAT(DISTINCT industry) AS sample_industries
FROM layoffs
LIMIT 1;  -- SQLite workaround for GROUP_CONCAT

-- === Country Distribution ===
/* 3. Top Countries by Events and Layoffs */
SELECT country, 
       COUNT(*) AS event_count,
       SUM(total_laid_off) AS total_laid_off
FROM layoffs
GROUP BY country
ORDER BY event_count DESC
LIMIT 10;  -- Top 10 countries by event frequency

/* 4. Monthly Layoff Trends */
SELECT 
    CONCAT(SUBSTR(`date`, 1, 4), '-', SUBSTR(`date`, 6, 2)) AS month_year,
    COUNT(*) AS monthly_events,
    SUM(COALESCE(total_laid_off, 0)) AS monthly_total_laid_off,
    AVG(COALESCE(percentage_laid_off, 0)) AS avg_percentage_laid_off
FROM layoffs_staging
WHERE `date` IS NOT NULL AND `date` != ''
GROUP BY CONCAT(SUBSTR(`date`, 1, 4), '-', SUBSTR(`date`, 6, 2))
ORDER BY month_year;

-- === Company-Level Exploration ===
/* 5. Top Companies by Layoffs */
SELECT company, 
       SUM(total_laid_off) AS total_laid_off_by_company,
       AVG(percentage_laid_off) AS avg_percentage_by_company
FROM layoffs
GROUP BY company
HAVING SUM(total_laid_off) IS NOT NULL
ORDER BY total_laid_off_by_company DESC
LIMIT 10;  
-- Showing Top 10 companies and exclude companies with no data

-- === Funding Impact Exploration ===
/* 6. Layoffs vs Funding Raised */
SELECT 
    CASE 
        WHEN funds_raised_millions < 100 THEN 'Low (<100M)'
        WHEN funds_raised_millions BETWEEN 100 AND 500 THEN 'Medium (100-500M)'
        WHEN funds_raised_millions > 500 THEN 'High (>500M)'
        ELSE 'Unknown'
    END AS funding_category,
    COUNT(*) AS event_count,
    SUM(total_laid_off) AS total_laid_off
FROM layoffs
GROUP BY funding_category
ORDER BY total_laid_off DESC;

-- === Stage Distribution ===
/* 7. Layoffs by Company Stage */
SELECT stage, 
       COUNT(*) AS event_count,
       SUM(total_laid_off) AS total_laid_off
FROM layoffs
GROUP BY stage
ORDER BY total_laid_off DESC
LIMIT 10;  
-- Top 10 stages by layoff volume

-- === Location-Based Exploration ===
/* 8. Top Locations by Layoffs */
SELECT location, 
       SUM(total_laid_off) AS total_laid_off_by_location
FROM layoffs
GROUP BY location
ORDER BY total_laid_off_by_location DESC
LIMIT 10;  
-- Showing Top 10 locations