---- Doctor id will be given as input. Then the patients list under him/her will be shown. ----

SET SERVEROUTPUT ON;
SET VERIFY OFF;
ACCEPT X NUMBER PROMPT 'ENTER Doctor ID: '


declare	
	a number := &X;

	K varchar2(30);
	L varchar2(30);
	
	
begin
	for R in (select pname from Patient where pid in (select pid from Appointment where d_id=a)) loop
		K:= R.pname;
		DBMS_OUTPUT.PUT_LINE('PNAME: '||K);
	end loop;
	
	for S in(select dname from Doctors where d_id=a) loop
		L:= S.dname;
	    DBMS_OUTPUT.PUT_LINE('DNAME: '|| L);
	end loop;

	
end;
/
show errors;
