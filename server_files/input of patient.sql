SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT X NUMBER PROMPT 'ID: '
ACCEPT Y CHAR PROMPT 'ENTER NAME: '
ACCEPT Z NUMBER PROMPT 'ENTER AGE: '

CREATE OR REPLACE PROCEDURE printInfo(A in Patient.pid%TYPE, B in Patient.pname%TYPE, C in Patient.age%TYPE)
IS
flag int;
BEGIN
	flag:= searchAccount(A,B,C);
	IF flag=1 THEN
		DBMS_OUTPUT.PUT_LINE('Account already exists!');
	ELSIF flag=0 THEN
		insert into Patient@site1 values(A,B,C);
		DBMS_OUTPUT.PUT_LINE('Patient info inserted.');
	END IF;
END printInfo;
/
show errors;

CREATE OR REPLACE FUNCTION searchAccount(A in Patient.pid%TYPE, B in Patient.pname%TYPE, C in Patient.age%TYPE)
RETURN int
IS
foundId int:=0;

BEGIN

	for r in(select * from Patient@site1 where pid=A and pname=B and age=C ) loop
		foundId:=1;
	end loop;


	return foundId;
END searchAccount;
/
show errors;


DECLARE
	id number;
	name varchar2(20);
	age integer;
BEGIN
	id:= &X;
	name:= '&Y';
	age:= &Z;
	
	printInfo(id,name,age);
	

END;
/
commit;

--select * from Patient@site1;

create or replace view view_patient as
select * from Patient@site1;

select * from view_patient;
commit;


--@"G:\4.1\DDS lab\project\appoint_doc.sql"

