-- OATH Case Status

create external table oath_case_status (a string, violation_date string, b string, issuing_agency string, c string, d string, e string, borough string, f string, g string, h string, i string, j string, k string, l string, m string, n string, o string, p string, q string, r string, s string, t string, u string, v string, w string, x string, y string, z string, aa string, ab string, ac string, ad string, ae string, af string, ag string, ah string, ai string, aj string, ak string, al string, am string, an string, ao string, ap string, aq string, ar string, as string, at string, au string, av string, aqsd string, ax string, ay string, az string, ba string, bb string, bc string, bd string, be string, bf string, bg string, bh string, adasd string, asa string, asasa string, qwqw string, wrfdv string, sasx string, gg string, dfdeg string, efdfdfvrg string, thyjyuju string, dvscsxa string, vfbgngnb string, gnjhmuj string, dcscxsxs string, cbvnbnn string) row format delimited fields terminated by ','; 

LOAD DATA INPATH '/user/cloudera/project/OATH_ECB_Hearings_Case_Status.csv' OVERWRITE INTO TABLE oath_case_status;

CREATE TABLE oath_case_status_filtered as SELECT violation_date, issuing_agency, borough FROM oath_case_status;

--//////////////////////////////////////////////