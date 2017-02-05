-- 311 Service Requests

create external table 311_data (a string, created_date string, b string, agency string, complaint_type string, d string, e string, jsjsjsjsj string, f string, g string, h string, i string, j string, k string, l string, m string, n string, o string, p string, q string, r string, s string, t string, u string, borough string, w string, x string, y string, z string, aa string, ab string, ac string, ad string, ae string, af string, ag string, ah string, ai string, aj string, ak string, al string, am string, an string, ao string, ap string, aq string, ar string, as string, at string, au string, av string, aqq string, ax string) row format delimited fields terminated by ',';

LOAD DATA INPATH '/user/cloudera/project/311_Service_Requests_from_2010_to_Present.csv' OVERWRITE INTO TABLE 311_data; 

CREATE TABLE 311_data_filtered as SELECT created_date, agency, complaint_type, borough FROM 311_data;

--////////////////////////////////////////
