create procedure add_employee(p_first_name in varchar2, 
                              p_last_name in varchar2, 
                              p_job_id in number, 
                              p_auto_service_id in number, 
                              p_phone_number in varchar2,  
                              p_salary in number,
                              p_hire_date in date default trunc(sysdate, 'dd')) is
    v_employee_id number := 1;
    v_max_employee_id number;
    v_count_job_id  number;
    v_count_auto_service number;
    
begin
    srv.check_work_time;

    select max(em.employee_id)
    into v_max_employee_id
    from srv.employees em;
    
    if v_max_employee_id is not null then 
    v_employee_id := v_max_employee_id + 1;
    end if;
    
    select count(j.job_id)
    into v_count_job_id
    from srv.jobs j
    where j.job_id = p_job_id;
    
    select count(avs.auto_service_id)
    into v_count_auto_service
    from srv.auto_service avs
    where avs.auto_service_id = p_auto_service_id;
        
    case
        when v_count_job_id = 0 then 
        raise_application_error(-20003,'Значення job_id = ' || p_job_id || ' не знайдено');
        when v_count_auto_service = 0 then 
        raise_application_error(-20004,'Значення auto_service_id = ' || p_auto_service_id || ' не знайдено');
    else
        insert into srv.employees
        values (v_employee_id, 
                p_first_name, 
                p_last_name, 
                p_job_id, 
                p_auto_service_id, 
                p_phone_number, 
                p_hire_date, 
                p_salary);
        commit;
    end case;
    
    srv.add_log('add_employee', 'Cпівробітника успішно додано', SYSDATE);
    
end add_employee;