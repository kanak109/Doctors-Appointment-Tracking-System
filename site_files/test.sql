Select dname from Doctors where d_id = (Select d_id from Appointment where pid=100);
Select pname from Patient where pid=100;