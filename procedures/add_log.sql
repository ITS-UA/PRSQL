create or replace procedure add_log(p_app_proc in varchar2,
                         p_message in varchar2,
                         p_log_date in date,
                         p_change_user in varchar2 default user) is
begin
    insert into srv.logs (appl_proc, message, log_date, change_user)
    values (p_app_proc, p_message, p_log_date, p_change_user);
    commit;
end;