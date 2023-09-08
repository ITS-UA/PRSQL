create or replace procedure del_employee(p_employee_id NUMBER) is
v_count NUMBER;
begin
	
	select COUNT(*)
	into v_count
	from srv.employees em 
	where em.employee_id = p_employee_id;
	
	case when v_count != 0 then
		delete from srv.employees em where em.employee_id = p_employee_id;
		commit;
	else 
		їraise_application_error(-20004, 'переданий employee_id='||p_employee_id||' не існує');
	end case;

end;