clear screen;
set line 200;
-- dropping tables

DROP TABLE Doctors1 CASCADE CONSTRAINTS;
DROP TABLE Patient CASCADE CONSTRAINTS;
DROP TABLE Appointment CASCADE CONSTRAINTS;


--Doctors TABLE
CREATE TABLE Doctors1
(
	d_id number PRIMARY KEY,
	dname varchar2(30),
	speciality varchar2(30),
	degree varchar2(50),
	visiting_hr varchar2(50),
	fees number);
	
-- Patient TABLE
create table Patient(
	pid number PRIMARY KEY,
	pname varchar2(20),
	age integer
);	

-- Appointment TABLE
create table Appointment(
	d_id number,
	pid number,
		FOREIGN KEY(d_id) REFERENCES Doctors(d_id),
		FOREIGN KEY(pid) REFERENCES Patient(pid));
	
	
-- insert data in Doctors table	

insert into Doctors1 values(9, 'DR. SYED SERAJUL KARIM', 'GENERAL SURGEON','MBBS, FCPS, FICS','5 PM-7 PM, Closed: THURSDAY,FRIDAY',1400);
insert into Doctors1 values(10, 'Dr. DR. KANAK KANTI BARUA', 'NEUROSURGERY','MBBS, FCPS (Surgery), MS (Neurosurgery), PhD, FICS','06 PM-09 PM, Closed: FRIDAY',1500);
insert into Doctors1 values(11, 'Dr. DR. SAUMITRA SARKER', 'NEUROSURGERY','MBBS, FCPS (Surgery), MS (Neurosurgery)','06:00 PM-08:00 PM, Closed: FRIDAY',1500);


--insert data into patient table	
insert into Patient values(100,'Rakin',25);
insert into Patient values(101,'Sami',32);
insert into Patient values(102,'Asad',18);
insert into Patient values(104,'Jahid',42);
insert into Patient values(105,'Masud',56);
insert into Patient values(106,'Rashed',68);
insert into Patient values(107,'Rafi',68);
insert into Patient values(108,'Rakesh',68);
insert into Patient values(109,'Wasif',68);
insert into Patient values(110,'Daiyan',68);


--insert data into appointment table	
insert into Appointment values(1,100);
insert into Appointment values(2,101);
insert into Appointment values(2,102);
insert into Appointment values(3,105);
insert into Appointment values(5,106);
insert into Appointment values(6,107);


	
	

commit;

--UNION--
select * from Doctors1 union
select * from Doctors@site1;







