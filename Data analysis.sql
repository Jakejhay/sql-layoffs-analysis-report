-- SQL - Data Analysis (2022-2023)
-- Dataset: layoffs_staging (2361 rows, 9 columns: company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions)
-- Goal: Analyze cleaned data to identify trends, patterns, and insights.
-- Note: Dates remain text (MM/DD/YYYY); conversion deferred.

-- === Yearly Layoff Trends ===
/* 1. Total Layoffs and Events by Year */
SELECT 
    COALESCE(
        CASE 
            WHEN LENGTH(`date`) = 10 AND `date` LIKE '____-__-__' THEN SUBSTR(`date`, 1, 4)  -- "YYYY-MM-DD" e.g., "2023-01-10" -> "2023"
        END, 'Unknown'
    ) AS year,
    COUNT(*) AS yearly_events,
    SUM(COALESCE(total_laid_off, 0)) AS yearly_total_laid_off,
    AVG(COALESCE(percentage_laid_off, 0)) AS avg_percentage_laid_off
FROM layoffs_staging
WHERE `date` IS NOT NULL AND `date` != ''
GROUP BY COALESCE(
    CASE 
        WHEN LENGTH(`date`) = 10 AND `date` LIKE '____-__-__' THEN SUBSTR(`date`, 1, 4)
    END, 'Unknown'
)
ORDER BY year;

-- === Industry Impact Analysis ===
/* 2. Top 10 Industries by Total Layoffs */
SELECT 
    industry,
    COUNT(*) AS event_count,
    SUM(total_laid_off) AS total_laid_off,
    AVG(percentage_laid_off) AS avg_percentage_laid_off
FROM layoffs_staging
GROUP BY industry
ORDER BY total_laid_off DESC
LIMIT 10;

-- === Country Comparison ===
/* 3. Top 10 Countries by Layoff Impact */
SELECT 
    country,
    COUNT(*) AS event_count,
    SUM(total_laid_off) AS total_laid_off,
    AVG(funds_raised_millions) AS avg_funds_raised
FROM layoffs_staging
GROUP BY country
ORDER BY total_laid_off DESC
LIMIT 10;

-- === Company Performance Analysis ===
/* 4. Top 10 Companies by Layoff Volume and Percentage */
SELECT company,
    SUM(total_laid_off) AS total_laid_off,
    AVG(percentage_laid_off) AS avg_percentage_laid_off,
    COUNT(*) AS event_count
FROM layoffs_staging
GROUP BY company
HAVING SUM(total_laid_off) > 0
ORDER BY total_laid_off DESC
LIMIT 10;

-- === Stage-Based Analysis ===
/* 5. Layoff Trends by Company Stage */
SELECT stage,
    COUNT(*) AS event_count,
    SUM(total_laid_off) AS total_laid_off,
    AVG(percentage_laid_off) AS avg_percentage_laid_off
FROM layoffs_staging
GROUP BY stage
ORDER BY total_laid_off DESC;

-- (Stages with layoff impact) */
-- === Funding vs Layoff Correlation ===
/* 6. Layoffs by Funding Category */
SELECT 
    CASE 
        WHEN funds_raised_millions < 100 THEN 'Low (<100M)'
        WHEN funds_raised_millions BETWEEN 100 AND 500 THEN 'Medium (100-500M)'
        WHEN funds_raised_millions > 500 THEN 'High (>500M)'
        ELSE 'Unknown'
    END AS funding_category,
    COUNT(*) AS event_count,
    SUM(total_laid_off) AS total_laid_off,
    AVG(percentage_laid_off) AS avg_percentage_laid_off
FROM layoffs_staging
GROUP BY funding_category
ORDER BY total_laid_off DESC;