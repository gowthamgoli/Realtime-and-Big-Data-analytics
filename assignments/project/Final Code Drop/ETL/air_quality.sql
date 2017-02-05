-- Air Quality Complaints

create external table air_quality (id1 string, id2 string, name string, measure string, gtn string, gei string, gen string, year string, data float ) row format delimited fields terminated by ',';

LOAD DATA INPATH '/user/cloudera/project/Air_Quality.csv' OVERWRITE INTO TABLE air_quality;

CREATE TABLE air_quality_filtered as SELECT gei, year, data FROM air_quality;

--//////////////////////////////////////////////