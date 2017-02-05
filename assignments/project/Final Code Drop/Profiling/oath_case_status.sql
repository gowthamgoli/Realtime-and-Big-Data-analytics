-- OATH Case Status

-- Remove First Row
INSERT OVERWRITE TABLE oath_case_status_filtered  SELECT * FROM oath_case_status_filtered  WHERE violation_date != "Violation Date";

-- Get Date in Proper Format

INSERT OVERWRITE TABLE oath_case_status_filtered SELECT CONCAT(split(violation_date,'/')[0],'/',split(split(violation_date,'/')[2],' ')[0]), issuing_agency, borough from oath_case_status_filtered;

-- Get Boroughs is Proper Format (01 Manhattan => Manhattan)

Insert overwrite table oath_case_status_filtered select violation_date, issuing_agency, case when borough like '%MANHATTAN%' then 'MANHATTAN' when borough like '%QUEENS%' then 'QUEENS' when borough like '%BROOKLYN%' then 'BROOKLYN' when borough like '%BRONX%' then 'BRONX' when borough like '%STATEN IS%' then 'STATEN ISLAND' else borough end as borough from oath_case_status_filtered;

-- Drop Unwanted Agencies (Keep only %sanitation%)

Insert overwrite table oath_case_status_filtered select * from oath_case_status_filtered where issuing_agency like '%SANITATION%';

-- Create new table by dropping issuing_agency column as it is no longer needed

CREATE TABLE oath_case_status_filtered_clean as SELECT violation_date, borough FROM oath_case_status_filtered;

-- Select Proper Boroughs

Insert overwrite table oath_case_status_filtered_clean select violation_date, case when borough like 'MANHATTAN' then 'MANHATTAN' when borough like 'QUEENS' then 'QUEENS' when borough like 'BROOKLYN' then 'BROOKLYN' when borough like 'BRONX' then 'BRONX' when borough like '%STATEN IS%' then 'STATEN ISLAND' end as borough from oath_case_status_filtered_clean;

-- Drop "NULL" Boroughs

Insert overwrite table oath_case_status_filtered_clean select violation_date, borough from oath_case_status_filtered_clean where borough != "NULL";

--//////////////////////////////////////////////
