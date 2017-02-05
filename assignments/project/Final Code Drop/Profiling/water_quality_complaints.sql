-- Water Quality Complaints

-- Remove First Row
INSERT OVERWRITE TABLE water_quality_complaints_filtered  SELECT * FROM water_quality_complaints_filtered  WHERE created_date!="Created Date";

-- Get Date in Proper Format

INSERT OVERWRITE TABLE water_quality_complaints_filtered SELECT CONCAT(split(created_date,'/')[0],'/',split(split(created_date,'/')[2],' ')[0]), borough from water_quality_complaints_filtered;

-- Get Boroughs in Proper Format (01 Manhattan => Manhattan)

Insert overwrite table water_quality_complaints_filtered select created_date, case when borough like '%MANHATTAN%' then 'MANHATTAN' when borough like '%QUEENS%' then 'QUEENS' when borough like '%BROOKLYN%' then 'BROOKLYN' when borough like '%BRONX%' then 'BRONX' when borough like '%STATEN IS%' then 'STATEN ISLAND' else borough end as borough from water_quality_complaints_filtered;

--//////////////////////////////////////////////