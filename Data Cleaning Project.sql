-- Finished just need to import to  tableau 48:18
create table "postgres"."Hospital_Data".Tableau_file as
/*
SELECT *
FROM "postgres"."Hospital_Data".hcahps_data;
*/

/*
-- used to determine if their are mulitple provider_ccn
SELECT provider_ccn,count(*) as count_of_rows
FROM hosiptal_beds_prep
WHERE number_of_records = 1
GROUP BY provider_ccn
ORDER BY count(*) desc;
*/

WITH hospital_beds_prep as
(
SELECT 
-- Lpad function  
      lpad(cast(provider_ccn as text),6,'0') as provider_ccn
      ,hospital_name
-- to date function has been used to convert the date format
      ,to_date(fiscal_year_begin_date,'MM/DD/YYYY') as fiscal_year_begin_date
	  ,to_date(fiscal_year_end_date,'MM/DD/YYYY') as fiscal_year_end_date
	  ,number_of_beds
-- Partition to label mulitple records 	
	  ,row_number () over  (partition by provider_ccn order by to_date(fiscal_year_end_date,'MM/DD/YYYY')desc) as nth_row
	FROM "postgres"."Hospital_Data".hospital_beds
)

SELECT lpad(cast(facility_id as text),6,'0') as  facility_id
      ,to_date(start_date,'MM/DD/YYYY') as start_date_converted
	  ,to_date(end_date,'MM/DD/YYYY') as end_date_converted
	  ,hcahps.*
	  ,beds.number_of_beds
	  ,beds.fiscal_year_begin_date as beds_start_report_period
	  ,beds.fiscal_year_end_date as beds_end_report_period
FROM "postgres"."Hospital_Data".hcahps_data as hcahps
LEFT JOIN hospital_beds_prep as beds 
ON lpad(cast(facility_id as text),6,'0') = beds.provider_ccn
-- This condition ensures that the database will pull the most up-to-date records
AND beds.nth_row = 1;