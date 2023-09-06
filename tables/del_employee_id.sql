create or replace procedure del_employee(p_employee_id NUMBER) is
v_employee_id NUMBER;
begin
select COUNT(*)
into v_employee_id
from srv.employees em where em.employee_id = p_employee_id;
case when v_employee_id != 0 then
delete from srv.employees em where em.employee_id = p_employee_id;
commit;
else raise_application_error(-20004, '????????? employee_id ?? ?????');
end case;
end;