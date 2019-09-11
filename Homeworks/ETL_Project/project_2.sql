create table MotorVehicle_Incidents (
	DateOfIncident date,
	Manufacturer text, 
	Crash text,
	NumberOfInjured int,
	Make text
);
copy MotorVehicle_Incidents from 'C:\Users\zackf\Documents\GitHub\Projects\MotorVehicleIncidents.csv' with (format CSV, header True);
select * from MotorVehicle_Incidents;