-- SQL - Data Cleaning (2022-2023)
-- Dataset: layoffs_staging (2361 rows, 9 columns: company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions)
-- Goal: Clean data by handling NULLs, duplicates, inconsistencies, and outliers.

-- === Handle NULLs in Total Laid Off ===
/* 1. Replace NULLs in total_laid_off with 0 */
UPDATE layoffs_staging
SET total_laid_off = 0
WHERE total_laid_off IS NULL;

-- === Handle NULLs in Percentage Laid Off ===
/* 2. Replace NULLs in percentage_laid_off with 0 or average */
UPDATE layoffs_staging
SET percentage_laid_off = COALESCE(percentage_laid_off, (SELECT AVG(percentage_laid_off) FROM (SELECT percentage_laid_off FROM layoffs_staging WHERE percentage_laid_off IS NOT NULL) AS temp))
WHERE percentage_laid_off IS NULL;
/* Verifying fixed nulls in percentage_laid off
SELECT COUNT(*) AS total_rows, 
       COUNT(percentage_laid_off) AS non_null_rows, 
       COUNT(CASE WHEN percentage_laid_off IS NULL THEN 1 END) AS null_rows
FROM layoffs_staging;

-- === Standardize Industry Text ===
/* 3. Trim and Uppercase Industry for Consistency */
UPDATE layoffs_staging
SET industry = UPPER(TRIM(industry))
WHERE industry IS NOT NULL;

-- === Standardize Company Text ===
/* 4. Trim and Capitalize Company Names */
UPDATE layoffs_staging
SET company = TRIM(CONCAT(UCASE(LEFT(company, 1)), SUBSTRING(company, 2)))
WHERE company IS NOT NULL;

-- === Handle NULLs and Inconsistencies in Stage ===
/* 5. Replace NULL stage with 'Unknown' and Standardize */
UPDATE layoffs_staging
SET stage = COALESCE(TRIM(UPPER(stage)), 'UNKNOWN')
WHERE stage IS NOT NULL OR stage IS NULL;

-- === Remove Duplicates ===
/* 6. Identify and Delete Duplicate Rows (based on all columns) */
WITH DuplicateCTE AS (
    SELECT id,
           ROW_NUMBER() OVER (
               PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions
               ORDER BY id
) AS row_num
    FROM layoffs_staging)
DELETE FROM layoffs_staging
WHERE id IN (
    SELECT id FROM DuplicateCTE WHERE row_num > 1);

-- === Validate Numerical Fields ===
/* 7. Set Invalid total_laid_off (negative) to 0 */
UPDATE layoffs_staging
SET total_laid_off = 0
WHERE total_laid_off < 0;

-- === Standardize Country Names ===
/* 8. Trim and Uppercase Country for Consistency */
UPDATE layoffs_staging
SET country = UPPER(TRIM(country))
WHERE country IS NOT NULL;

-- === Verify Cleaning ===
/* 9. Check Remaining NULLs, Row Count, and Data Integrity */
SELECT 
    COUNT(*) AS total_rows,
    COUNT(CASE WHEN total_laid_off IS NULL THEN 1 END) AS null_laid_off,
    COUNT(CASE WHEN percentage_laid_off IS NULL THEN 1 END) AS null_percentage,
    COUNT(CASE WHEN industry IS NULL THEN 1 END) AS null_industry,
    COUNT(CASE WHEN stage IS NULL THEN 1 END) AS null_stage,
    COUNT(CASE WHEN country IS NULL THEN 1 END) AS null_country,
    MIN(total_laid_off) AS min_laid_off,
    MAX(total_laid_off) AS max_laid_off,
    MIN(funds_raised_millions) AS min_funds,
    MAX(funds_raised_millions) AS max_funds
FROM layoffs_staging;