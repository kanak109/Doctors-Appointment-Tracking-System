SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT X NUMBER PROMPT 'ENTER DOC ID: '
ACCEPT Y NUMBER PROMPT 'ENTER PATIENT ID: '


CREATE OR REPLACE TRIGGER placement
AFTER INSERT
ON Appointment
FOR EACH ROW
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('APPOINTMENT IS PLACED....');
END;
/

-----package-----
CREATE OR REPLACE PACKAGE p AS
	FUNCTION verifyInfo(Q in Appointment.d_id%TYPE)
	RETURN NUMBER;
	PROCEDURE insertInfo(Q in Appointment.d_id%TYPE, W in Appointment.pid%TYPE);  
	
END p;
/

-----body-----
CREATE OR REPLACE PACKAGE BODY p AS
	
	FUNCTION verifyInfo(Q in Appointment.d_id%TYPE)
	RETURN NUMBER
	IS
		Flag number:=0;
		BEGIN 
			IF Q>11 THEN
				Flag := 1;
			END IF;
			
		RETURN Flag;	
		END verifyInfo;
		

	PROCEDURE insertInfo(Q in Appointment.d_id%TYPE, W in Appointment.pid%TYPE)
	IS

		BEGIN

			insert into Appointment@site1 values(Q,W);
			commit;
		END insertInfo;
					
END p;
/ 




DECLARE
	A number:=&X; --doctor id
	B number:=&Y; --patient id
	flag number;
	founded EXCEPTION;
BEGIN
	flag:= p.verifyInfo(A);
	
	IF flag=0 THEN
		p.insertInfo(A,B);
	else
		RAISE founded;
	end if;
	
	EXCEPTION
		when founded THEN	
			DBMS_OUTPUT.PUT_LINE('NO SUCH DOCTOR ID FOUND IN THE DATABASE!');
	
	
END;
/

select * from Appointment@site1;













