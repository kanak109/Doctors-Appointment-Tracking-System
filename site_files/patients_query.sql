-- If a patient id is given as input, it will show the doctors list to whom he/she is appointed to ---

SET SERVEROUTPUT ON;
SET VERIFY OFF;
ACCEPT X NUMBER PROMPT 'ENTER Patient ID: '


declare	
	a number := &X;

	K varchar2(30);
	L varchar2(30);
	
	
begin
	for R in (Select dname from Doctors where d_id in (Select d_id from Appointment where pid=a)) loop
		K:= R.dname;
		DBMS_OUTPUT.PUT_LINE('DNAME: '||K);
	end loop;
	
	for S in(Select pname from Patient where pid=a) loop
		L:= S.pname;
	    DBMS_OUTPUT.PUT_LINE('PNAME: '|| L);
	end loop;
	
	
end;
/
show errors;
