# SQL Data Cleaning Project: Layoffs Dataset

## Project Overview

This project focuses on cleaning and preparing a real-world layoffs dataset using SQL. The objective is to transform raw, inconsistent data into a clean, analysis-ready dataset by applying industry-standard data cleaning techniques.

The project demonstrates practical SQL skills commonly used by Data Analysts, Business Intelligence Analysts, and Data Scientists during the data preprocessing stage.

---

## Dataset

**Dataset:** Layoffs Dataset

The dataset contains information about company layoffs around the world, including:

- Company
- Industry
- Country
- Location
- Total Employees Laid Off
- Percentage Laid Off
- Funding Raised
- Company Stage
- Date

---

## Project Objectives

- Create a staging table for safe data cleaning
- Remove duplicate records
- Standardize inconsistent text values
- Handle missing and NULL values
- Populate missing industries using existing records
- Convert inconsistent values into standardized formats
- Remove invalid records
- Produce a clean dataset ready for exploratory data analysis

---

## SQL Skills Demonstrated

- Common Table Expressions (CTEs)
- Window Functions
- ROW_NUMBER()
- PARTITION BY
- UPDATE with JOIN
- DELETE Statements
- CASE Statements
- NULL Handling
- Data Standardization
- String Functions
- TRIM()
- DELETE Duplicates
- Data Validation
- Staging Tables

---

## Data Cleaning Workflow

### 1. Create Staging Table

A duplicate of the original dataset was created to preserve the raw data.

```sql
CREATE TABLE layoffs_staging
LIKE layoffs;
```

---

### 2. Remove Duplicate Records

Duplicates were identified using the `ROW_NUMBER()` window function and removed.

```sql
ROW_NUMBER() OVER (
PARTITION BY company, location, industry, total_laid_off,
percentage_laid_off, date, stage, country, funds_raised_millions
)
```

---

### 3. Standardize Data

Several inconsistencies were fixed, including:

- Removing extra spaces
- Standardizing company names
- Cleaning country names
- Standardizing industry names

Example:

Before

```
Crypto Currency
CryptoCurrency
Crypto
```

After

```
Crypto
```

---

### 4. Handle Missing Values

Missing industries were populated using self joins.

Example:

Company A

```
Industry = NULL
```

↓

Updated from another record

```
Industry = Retail
```

---

### 5. Remove Invalid Records

Rows containing no layoff information were removed.

Example:

```
total_laid_off IS NULL
AND percentage_laid_off IS NULL
```

---

## SQL Concepts Used

- SELECT
- UPDATE
- DELETE
- ALTER TABLE
- JOIN
- SELF JOIN
- CTE
- Window Functions
- ROW_NUMBER()
- PARTITION BY
- ORDER BY
- TRIM()
- NULLIF()
- IFNULL()
- CASE
- WHERE

---

## Project Structure

```
SQL-Data-Cleaning-Layoffs/
│
├── SQLQuery.sql
├── layoffs.csv
├── README.md
```

---

## Before Cleaning

- Duplicate records
- Missing values
- Inconsistent industry names
- Extra spaces
- Invalid records
- Unstandardized country names

---

## After Cleaning

✔ Duplicate records removed

✔ Missing values handled

✔ Industry names standardized

✔ Country names cleaned

✔ Invalid rows deleted

✔ Dataset ready for analysis

---

## Business Value

Clean data is essential before performing any business analysis or building machine learning models.

This project demonstrates the ability to:

- Improve data quality
- Increase dataset consistency
- Prepare data for reporting
- Support accurate business insights
- Build reliable analytical workflows

---

## Technologies Used

- SQL
- MySQL

---

## Key Learning Outcomes

Through this project I learned how to:

- Clean real-world datasets
- Detect and remove duplicate records
- Handle NULL values efficiently
- Standardize inconsistent data
- Use window functions for data cleaning
- Apply SQL best practices for preprocessing

---

## Future Improvements

- Convert date columns into proper DATE format
- Add data validation rules
- Build an Exploratory Data Analysis (EDA) script
- Create dashboards using Power BI
- Automate cleaning with SQL procedures

---

## Author

**Mohammed Yasser Darwiesh**

Data Analyst | Data Scientist

GitHub:
https://github.com/darw-iesh

LinkedIn:
(https://www.linkedin.com/in/mohammed-yasser-darwiesh-31b82629a/)

---
