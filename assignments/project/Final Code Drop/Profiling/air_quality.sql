-- Air Quality Complaints

-- Remove First Row
INSERT OVERWRITE TABLE air_quality_filtered  SELECT * FROM air_quality_filtered  WHERE gen != "geo_entity_name";

Insert overwrite table air_quality_filtered
select	case
		when CAST(gei AS INT) == 1 then 'BRONX'
		when CAST(gei AS INT) == 2 then 'BROOKLYN'
		when CAST(gei AS INT) == 3 then 'MANHATTAN'
		when CAST(gei AS INT) == 4 then 'QUEENS'
		when CAST(gei AS INT) == 5 then 'STATEN ISLAND'
		when CAST(gei AS INT) > 100 and CAST(gei AS INT) < 200 then 'BRONX'
		when CAST(gei AS INT) > 200 and CAST(gei AS INT) < 300 then 'BROOKLYN'
		when CAST(gei AS INT) > 300 and CAST(gei AS INT) < 400 then 'MANHATTAN'
		when CAST(gei AS INT) > 400 and CAST(gei AS INT) < 500 then 'QUEENS'
		when CAST(gei AS INT) > 500 and CAST(gei AS INT) < 600 then 'STATEN ISLAND'
		else NULL end as gei, year, data
from air_quality_filtered;

Insert overwrite table air_quality_filtered
select * from air_quality_filtered
where year not like '%Bath Beach%'
and year not like '%Belmont%'
and year not like '%Briarwood%'
and year not like '%Brighton Beach%'
and year not like '%Broad Channel%'
and year not like '%Carroll Gardens%'
and year not like '%Chinatown%'
and year not like '%Clinton%'
and year not like '%Concourse Village%'
and year not like '%Crotona Park East%'
and year not like '%Douglastown%'
and year not like '%Dyker Heights%'
and year not like '%Flatlands%'
and year not like '%Fordham%'
and year not like '%Fort Greene%'
and year not like '%Gerritsen Beach%'
and year not like '%Glendale%'
and year not like '%Greenpoint%'
and year not like '%Hamilton Heights%'
and year not like '%Howard Beach%'
and year not like '%Inwood%'
and year not like '%Kingsbridge%'
and year not like '%Long Island City%'
and year not like '%Longwood%'
and year not like '%Midwood%'
and year not like '%Morris Park%'
and year not like '%Mott Haven%'
and year not like '%North Corona%'
and year not like '%Norwood%'
and year not like '%Ocean Hill%'
and year not like '%Ocean Parkway%'
and year not like '%Parkchester%'
and year not like '%Port Richmond%'
and year not like '%Rego Park%'
and year not like '%Richmond Hill%'
and year not like '%Rosedale%'
and year not like '%Rugby%'
and year not like '%SOHO%'
and year not like '%South Beach%'
and year not like '%South Corona%'
and year not like '%St. Albans%'
and year not like '%Starrett City%'
and year not like '%Tribeca%'
and year not like '%Turtle Bay%'
and year not like '%Upper West Side%'
and year not like '%Williamsbridge%'
and year not like '%Windsor Terrace%'
and year not like '%Wingate%'
and year not like '%Woodrow%'
and year not like '%Woodside%'
and year not like '%Co-op City%';

Insert overwrite table air_quality_filtered
select	gei, 
		case
		when year like '%2-Year Winter Average 2009-2010%' then '2009-2010'
		when year like '%Annual Average 2009-2010%' then '2009-2010'
		else year end as year, data
from air_quality_filtered;

Insert overwrite table air_quality_filtered select	gei, case when year like '%2010%' then '2010' when year like '%2011%' then '2011' else year end as year, data from air_quality_filtered;

Insert overwrite table air_quality_filtered select	gei, case when year like '2010' then '2010' when year like '2011' then '2011' when year like '2013' then '2013' else NULL end as year, data from air_quality_filtered;

Insert overwrite table air_quality_filtered select * from air_quality_filtered where year != "NULL";

--//////////////////////////////////////////////