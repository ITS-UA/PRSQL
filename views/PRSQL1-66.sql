create view srv.students_status_v as
SELECT  username, trunc(created, 'dd') AS created, account_status, last_login 
from dba_users dba
WHERE dba.username not like 'IT_SKILLS%'
      and dba.username not like 'SRV%'
      and dba.username not like 'VMALINOVSKY%'
      and dba.username not like 'HR%'
      and dba.username not like 'SYS%'
      and dba.username not like 'OBI%'
      order by trunc(created, 'dd');
      
      
     
