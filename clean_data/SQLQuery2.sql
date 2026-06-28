USE Project_Two

-- HANDING NULL
select * from layoffs
WHERE UPPER(total_laid_off) = 'NULL'

select * from layoffs
WHERE UPPER(industry) = 'NULL'

select * from layoffs
WHERE UPPER(stage) = 'NULL'

select * from layoffs
WHERE UPPER(funds_raised_millions) = 'NULL'


SELECT company,
       location,
	   NULLIF(industry, 'NULL') AS industry,
       NULLIF(total_laid_off, 'NULL') AS total_laid_off,
       percentage_laid_off,
	   date,
       NULLIF(stage, 'NULL') AS stage,
	   country,
       NULLIF(funds_raised_millions, 'NULL') AS funds_raised_millions
FROM layoffs;

--Create new table 
SELECT company,
       location,
	   NULLIF(industry, 'NULL') AS industry,
       NULLIF(total_laid_off, 'NULL') AS total_laid_off,
       percentage_laid_off,
	   date,
       NULLIF(stage, 'NULL') AS stage,
	   country,
       NULLIF(funds_raised_millions, 'NULL') AS funds_raised_millions
	   INTO layoffs_staging
FROM layoffs;

-- TABLE WITHOUT Duplicates
WITH duple_cte AS
(
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY company,
                            location,
                            industry,
                            total_laid_off,
                            percentage_laid_off,
                            date,
                            stage,
                            country,
                            funds_raised_millions
               ORDER BY country
           ) AS row_num
    FROM layoffs_staging
)
SELECT *
INTO layoffs_staging2
FROM duple_cte
;

DELETE FROM layoffs_staging2
WHERE row_num>1 ;
 
-- Check Remove Duplicates
SELECT * FROM layoffs_staging2
WHERE row_num>1 ;

-- Standardizing data 
SELECT company , TRIM(company) FROM layoffs_staging2;

UPDATE layoffs_staging2
SET 
	company = TRIM(company);


SELECT *
FROM layoffs_staging2
WHERE industry LIKE 'Crypto%'

UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%'

SELECT DISTINCT country , TRIM(TRAILING '.' FROM country)
FROM layoffs_staging2
ORDER BY 1

UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%'

SELECT *
FROM layoffs_staging2 
WHERE total_laid_off IS NULL AND 
      percentage_laid_off IS NULL



SELECT *
FROM layoffs_staging2
WHERE industry IS NULL
      OR TRIM(industry) = ''
ORDER BY 1


 

SELECT t1.industry , t2.industry FROM layoffs_staging2 t1 
JOIN layoffs_staging2 t2
ON t1.company = t2.company
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

UPDATE t1
SET t1.industry = t2.industry
FROM layoffs_staging2 AS t1
JOIN layoffs_staging2 AS t2
    ON t1.company = t2.company
WHERE t1.industry IS NULL
  AND t2.industry IS NOT NULL;


SELECT * FROM layoffs_staging2
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL

DELETE 
FROM layoffs_staging2
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL

SELECT * FROM layoffs_staging2

ALTER TABLE layoffs_staging2 
DROP COLUMN row_num