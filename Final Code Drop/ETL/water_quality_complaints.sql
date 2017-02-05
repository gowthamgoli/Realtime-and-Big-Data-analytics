-- Water Quality Complaints

create external table water_quality_complaints (id BIGINT, created_date string, closed_date string, agency string, agency_name string, complaint_type string, descriptor string, location_type string, incident_zip int, incident_address string, street_name string, cross_street_1 string, cross_street_2 string, intersection_street_1 string, intersection_street_2 string, address_type string, city string, landmark string, facility_type string, status string, due_date string, resolution_action string, community_board string, borough string, x_coordinate string, y_coordinate string, park string, park_borough string, school string, school_number_1 string, school_region string, school_code string, school_number string, school_address string, school_city string, school_state string, school_zip string, school_nf string, scwc string, vehicle string, taxicb string, tpl string, bhn string, bhd string, rr string, bhs string, gln string, fd string, ftn string, lattitude string, longtitude string, location string) row format delimited fields terminated by ','; 

LOAD DATA INPATH '/user/cloudera/project/Water_Quality_complaints.csv' OVERWRITE INTO TABLE water_quality_complaints;

CREATE TABLE water_quality_complaints_filtered as SELECT created_date, borough FROM water_quality_complaints;

-- ////////////////////////////////////////////////