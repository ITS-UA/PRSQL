
create or replace procedure del_job(p_job_id number) is
v_job_id number;
begin

    select count(*)
    into v_job_id 
    from srv.jobs j where j.job_id = p_job_id;
    
    case when v_job_id !=0 then
         delete from srv.jobs j where j.job_id = p_job_id;
         commit;
    else 
         raise_application_error(-20004, 'JOB_ID значення не існує');
    end case;

end;
