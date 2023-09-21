create procedure add_job (p_job_title  varchar2,
                          p_min_salary number,
                          p_max_salary number) is
begin
srv.check_work_time;

    case 
    when p_min_salary < 5000 then
      raise_application_error (-20003,'розмір зарплати менший за 5000');
    when p_max_salary > 90000 then
      raise_application_error (-20004,'розмір зарплати  більший за  90000'); 
    else
      insert into srv.jobs (job_title,min_salary,max_salary) 
      values (p_job_title,p_min_salary,p_max_salary);
      commit;
    end case;

end add_job;