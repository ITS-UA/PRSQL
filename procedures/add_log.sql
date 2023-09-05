create procedure add_log(p_app_proc in varchar2,
                         p_message in varchar2,
                         p_log_date in date) is
begin
    insert into srv.logs (appl_proc, message, log_date)
    values (p_app_proc, p_message, p_log_date);
    commit;
end;