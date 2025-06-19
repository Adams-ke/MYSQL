## EXPLORATORY DATA ANALYSIS
SELECT *
FROM layoffs_staging1;

SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging1;
# WHAT COMPANYLAID OFF ALL ITS WORKERS
SELECT *
FROM layoffs_staging1
WHERE percentage_laid_off = 1
ORDER BY 4 DESC;

# WHAT COMPANY WAS TOTALY SHUT DOWN AND HAD THE HIGHEST FUNDS RAISED 
SELECT *
FROM layoffs_staging1
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;
# WHAT COMPANY LAID OFF THE MOST WORKERS?
SELECT company, SUM(total_laid_off) total_layoffs
FROM layoffs_staging1
GROUP BY  company
ORDER BY 2 DESC;
# WHAT IS THE DATE RANGE OF OUR DATA?
SELECT MIN(`date`),MAX(`date`)
FROM layoffs_staging;

## WHAT INDUSTRY GOT HIT HARD?
SELECT industry, SUM(total_laid_off) total_layoffs
FROM layoffs_staging1
WHERE industry IS NOT NULL
GROUP BY industry
ORDER BY 2 DESC;
 
 # WHAT COIUNTRY HAD THE MOST TOTAL LAYOFFS?
SELECT country, SUM(total_laid_off) total_layoffs
FROM layoffs_staging1
GROUP BY country
ORDER BY 2 DESC;

# WHAT WAS THE YEARLY PROGRESSION OF THE TOOAL LAYOFFS ?
SELECT YEAR(`date`), SUM(total_laid_off) total_layoffs
FROM layoffs_staging1
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;

# 
SELECT STAGE, SUM(total_laid_off) total_layoffs
FROM layoffs_staging1
GROUP BY STAGE
ORDER BY 2 DESC;

## ROLLING TOTAL BASED OFF OF THE MONTH 
 SELECT  SUBSTRING( `date`, 1,7) AS `month`, SUM(total_laid_off) total_layoffs
 FROM layoffs_staging1
 WHERE SUBSTRING( `date`, 1,7) IS NOT NULL
 GROUP BY `month`
 ORDER BY 1 ASC
 ;
 
 WITH rolling_total AS 
 (
 SELECT  SUBSTRING( `date`, 1,7) `month`, SUM(total_laid_off) total_layoffs
 FROM layoffs_staging1
 WHERE SUBSTRING( `date`, 1,7) IS NOT NULL
 GROUP BY `month`
 ORDER BY 1 ASC
 )
 SELECT  `month`, total_layoffs,
 SUM(total_layoffs)OVER(ORDER BY `month`) sum_total
 FROM rolling_total;
 
 ## 
SELECT company, SUM(total_laid_off) total_layoffs
FROM layoffs_staging1
GROUP BY  company
ORDER BY 2 DESC;
 
SELECT company,YEAR(`date`) years, SUM(total_laid_off) total_layoffs
FROM layoffs_staging1
GROUP BY  company ,YEAR(`date`)
ORDER BY 3 DESC;
 
 WITH company_year AS 
 (
SELECT company,YEAR(`date`) years, SUM(total_laid_off) total_layoffs
FROM layoffs_staging1
GROUP BY  company ,YEAR(`date`)
ORDER BY 3 DESC
 ), RANK_COMPANIES AS
 (
 SELECT *, 
 DENSE_RANK()OVER(PARTITION BY years ORDER BY total_layoffs DESC) Ranking 
 FROM company_year
 WHERE years IS NOT NULL
 )
SELECT *
FROM RANK_COMPANIES
WHERE Ranking <= 5



























