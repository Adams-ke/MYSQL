-- DATA CLEANING --
-- Removing Duplicates
-- Standardizing the data
--  Null values or blank values
-- Remove any columns 

SELECT *
FROM layoffs;

-- STAGING --
# this is done because we are going to drastically change the data.
# the data in the raw  table will nt be affected.

CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT *
FROM layoffs_staging;
 
INSERT layoffs_staging
SELECT *
FROM layoffs;

SELECT *
FROM layoffs_staging;

# DUPLICATES
# ADDING ROW NUMBERS 

SELECT * ,
ROW_NUMBER () OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`) AS row_num
FROM layoffs_staging;

# creating a cte 
WITH duplicate_cte AS
(
SELECT * ,
ROW_NUMBER () OVER(
PARTITION BY company, location, industry, total_laid_off,
 percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging
)
SELECT * 
FROM duplicate_cte
WHERE row_num > 1;


SELECT * 
FROM layoffs_staging
WHERE company = 'Casper';

CREATE TABLE `layoffs_staging1` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT * 
FROM layoffs_staging1;

INSERT INTO layoffs_staging1
SELECT * ,
ROW_NUMBER () OVER(
PARTITION BY company, location, industry, total_laid_off,
 percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging;

SELECT * 
FROM layoffs_staging1
WHERE row_num > 1;

DELETE 
FROM layoffs_staging1
WHERE row_num > 1;

SELECT * 
FROM layoffs_staging1;

















