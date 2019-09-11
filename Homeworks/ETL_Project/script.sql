create table MotorVehicle_Incidents (
	DateOfIncident date,
	Manufacturer text, 
	Crash text,
	NumberOfInjured int,
	Make text
);
copy MotorVehicle_Incidents from 'C:/Resources/MotorvehicleIncidents.csv' with (format CSV, header True);
select * from MotorVehicle_Incidents;

create table GM_data (
	Market_Date date,
	Market_Open decimal,
	Market_High decimal,
	Market_Low decimal,
	Market_Close decimal,
	Market_AdjClose decimal,
	Market_Vol bigint
);
copy GM_data from 'C:/Resources/GM.csv' with (format CSV, header True);
select * from GM_data;


CREATE TEMPORARY TABLE dataset(SELECT * FROM GM_data
LEFT JOIN MotorVehicle_Incidents 
ON
GM_data.Market_data = MotorVehicle_Incidents.DateOfIncident);

COPY dataset TO 'C:/Resources/GM_Incidents.csv' DELIMITER ',' CSV;