-- 311 Service Requests

-- Remove First Row
INSERT OVERWRITE TABLE 311_data_filtered  SELECT * FROM 311_data_filtered  WHERE created_date != "Created Date";

-- Get Date in Proper Format

INSERT OVERWRITE TABLE 311_data_filtered SELECT CONCAT(split(created_date,'/')[0],'/',split(split(created_date,'/')[2],' ')[0]), agency, complaint_type, borough from 311_data_filtered;

-- Get Boroughs is Proper Format (01 Manhattan => Manhattan)

Insert overwrite table 311_data_filtered select created_date, agency, complaint_type, case when borough like '%MANHATTAN%' then 'MANHATTAN' when borough like '%QUEENS%' then 'QUEENS' when borough like '%BROOKLYN%' then 'BROOKLYN' when borough like '%BRONX%' then 'BRONX' when borough like '%STATEN IS%' then 'STATEN ISLAND' else 'NA' end as borough from 311_data_filtered;

-- Remove "NA" Boroughs

Insert overwrite table 311_data_filtered select created_date, agency, complaint_type, borough from 311_data_filtered where borough != "NA";

-- Obtain Food Poisoning Data

Create table 311_data_food_poisoning as select created_date, borough from 311_data_filtered where complaint_type like '%Food Poisoning%';

-- Obtain Rodent Data

Create table 311_data_rodent as select created_date, borough from 311_data_filtered where complaint_type like '%Rodent%';

-- Obtain Indoor Air Quality Data

Create table 311_data_indoor_air as select created_date, borough from 311_data_filtered where complaint_type like '%Indoor Air Quality%';

--//////////////////////////////////////////////