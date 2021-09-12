clear screen;
set line 200;
-- dropping tables

DROP TABLE Doctors CASCADE CONSTRAINTS;
DROP TABLE Patient CASCADE CONSTRAINTS;
DROP TABLE Appointment CASCADE CONSTRAINTS;


--Doctors TABLE
CREATE TABLE Doctors
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
insert into Doctors values(1, 'Dr. QAMRUL ISLAM', 'CARDIOLOGY','MBBS, FCPS, FICS','5 PM-7 PM, Closed: THURSDAY,FRIDAY',1000);
insert into Doctors values(2, 'Dr. MANABENDRA NATH', 'MEDICINE','MBBS DHAKA),FCPS (MEDICINE)','5 PM-8 PM, Closed: Sunday',800);
insert into Doctors values(3, 'Dr. MD JAHANGIR', 'MEDICINE','MBBS,FACP(USA),FRCP(EDIN)','3 PM-7 PM, Closed: FRIDAY',1200);
insert into Doctors values(4, 'Dr. RAJASHISH CHAKRABORTY', 'MEDICINE','MBBS, FCPS,FCCP(USA)','4 PM- 7 PM, Closed: NONE',1200);
insert into Doctors values(5, 'Dr. DELWAR HOSSAIN', 'Cardiology','MBBS, FCPS, FICS','7 PM-10 PM, Closed: TUESDAY,FRIDAY',1500);
insert into Doctors values(6, 'Dr. MUHAMMAD SHAHIDUZZAMAN', 'ORTHOPAEDIC SURGERY','MBBS, FCPS, FICS,FACC, FSGC, FRCP','11 AM -1 PM, Closed:FRIDAY',1500);
insert into Doctors values(7, 'PROF. DR. MD. MONIMUL HOQUE', 'PEDIATRIC','MBBS, FCPS, FICS','9 AM-1 PM, Closed:FRIDAY',1100);
insert into Doctors values(8, 'DR. MD. MUZIBAR RAHMAN', 'GENERAL SURGEON','MBBS, FCPS,FRCS (GLASGOW), FELLOW WHO(URO)','6:00 PM-10.00 PM, Closed: FRIDAY',1500);
insert into Doctors values(9, 'DR. SYED SERAJUL KARIM', 'GENERAL SURGEON','MBBS, FCPS, FICS','5 PM-7 PM, Closed: THURSDAY,FRIDAY',1400);
insert into Doctors values(10, 'Dr. DR. KANAK KANTI BARUA', 'NEUROSURGERY','MBBS, FCPS (Surgery), MS (Neurosurgery), PhD, FICS','06 PM-09 PM, Closed: FRIDAY',1500);
insert into Doctors values(11, 'Dr. DR. SAUMITRA SARKER', 'NEUROSURGERY','MBBS, FCPS (Surgery), MS (Neurosurgery)','06:00 PM-08:00 PM, Closed: FRIDAY',1500);


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
insert into Appointment values(1,101);
insert into Appointment values(1,102);
insert into Appointment values(1,109);
insert into Appointment values(1,104);
insert into Appointment values(2,101);
insert into Appointment values(2,102);
insert into Appointment values(3,105);
insert into Appointment values(5,106);
insert into Appointment values(6,107);


	
	

commit;

select * from Doctors;   
--select * from Patient;
--select * from Appointment;