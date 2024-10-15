# SQL Data Cleaning Project: Hospital Data Analysis
In this project, I worked on cleaning and preparing hospital data for further analysis in Tableau. The dataset consisted of hospital records, and my goal was to ensure the data was clean, properly formatted, and ready for visualization.

# Key Steps in the Data Cleaning Process:


 Handling Inconsistent Data Formats:
Used the LPAD function to standardize the length of the provider_ccn and facility_id fields, ensuring that all IDs are padded with leading zeros if necessary. This ensured consistent formatting for these identifier columns.

 Date Format Conversion:
Applied the TO_DATE function to convert string-based dates (in MM/DD/YYYY format) into proper date formats for fields like fiscal_year_begin_date and fiscal_year_end_date. This was essential for accurate analysis and filtering of records based on fiscal years.

 Dealing with Duplicate and Multiple Records:
To address potential duplicate records, I used the ROW_NUMBER() function with a PARTITION BY clause to identify multiple records per provider (provider_ccn) and ensure that only the most recent records (based on fiscal_year_end_date) were considered for analysis.

 Final Clean Data Table:
Created a new table, Tableau_file, to store the cleaned and prepped data, which is ready to be imported into Tableau for further analysis and visualization.

 Tools & Techniques:
SQL Functions: LPAD, TO_DATE, ROW_NUMBER()
Data Cleaning Operations: Format standardization, duplicate record handling, and preparation of clean data for visualization.

This project demonstrates my ability to clean and prepare data for analysis, ensuring data integrity and consistency, to ensure accurate reporting and visualization.
