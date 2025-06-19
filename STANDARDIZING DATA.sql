-- STANDARDIZING DATA 
# FINDING ISSUES IN YOUR DATA AND FIXING IT
SELECT  DISTINCT company 
FROM layoffs_staging1;

SELECT  DISTINCT company, TRIM(company)
FROM layoffs_staging1;

UPDATE layoffs_staging1
SET company = TRIM(company);

SELECT DISTINCT  industry
FROM layoffs_staging1
ORDER BY 1;

SELECT *
FROM layoffs_staging1
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_staging1
SET industry = 'crypto'
WHERE industry LIKE 'crypto%';


SELECT DISTINCT country
FROM layoffs_staging1
ORDER BY 1;

UPDATE layoffs_staging1
SET country = 'united states of america'
WHERE country LIKE 'united states%';
 
 -- ALTERNATIVELY YOU CAN USE TRIM TO GET RID OF THE TRAILING  PEROID 
 
 SELECT  country, TRIM(TRAILING '.' FROM country)
 FROM layoffs_staging1
 ORDER BY 1;
 
 UPDATE layoffs_staging1
 SET country = TRIM(TRAILING '.' FROM country)
 WHERE country LIKE 'united states%';
 
SELECT `date`,
STR_TO_DATE ( `date`, '%m/%d/%Y')
FROM layoffs_staging1;

 
 UPDATE layoffs_staging1
 SET `date` = STR_TO_DATE ( `date`, '%m/%d/%Y');
 
ALTER TABLE layoffs_staging1
MODIFY COLUMN `date` DATE;

SELECT `date`
FROM layoffs_staging1;














