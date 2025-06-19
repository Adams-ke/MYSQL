## DELETING RECORDS 
## YOU SHOULD ONLY DELETE ROWS WHEN YOU ARE 100% SURE YOU ARE NOT GOING TO NEED THEM 
## IN OUR CASE WE DO NOT HAVE THE VALUES IN BOTH TOTAL AND THA PERCENTAGE LAID OFF  SO WE ARE SURE THAT THE NULL RECORDS WILL BE OF NO HELPSO WE DELETE 
SELECT * 
FROM layoffs_staging1
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

DELETE
FROM layoffs_staging1
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

# since we do not ned the row_num column anymore we have to drop it 
SELECT * 
FROM layoffs_staging1;

ALTER TABLE layoffs_staging1
DROP COLUMN row_num;
