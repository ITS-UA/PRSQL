create view srv.report_by_session_v as 
select dba.username,
       count(dba.sessionid) as count_session, 
       min(dba.timestamp) as min_timestamp, 
       tmp.max_timestamp,
       round((tmp.max_timestamp- min(dba.timestamp))*24,2) as hours_in_system
from dba_audit_trail dba
left join (select tba.username,
            max(tba.timestamp) as max_timestamp 
            from dba_audit_trail tba 
            where tba.timestamp between trunc(sysdate, 'dd') 
                  and trunc(sysdate, 'dd')+ interval '86399' second
            group by tba.username) tmp
on dba.username = tmp.username               
where 1=1 
    and dba.priv_used = 'CREATE SESSION'
    and (dba.timestamp between trunc(sysdate, 'dd') 
         and trunc(sysdate, 'dd')+ interval '86399' second)
group by dba.username, tmp.max_timestamp
having 1=1
    and dba.username not like 'OBI%' 
    and dba.username not like 'IT_SKILLS%'
    and dba.username not like 'SRV%'
    and dba.username not like 'VMALINOVSKY%'
    and dba.username not like 'HR%'
    and dba.username not like 'SYS%'
order by 3;