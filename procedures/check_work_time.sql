CREATE PROCEDURE check_work_time IS
BEGIN
    CASE 
    WHEN TO_CHAR(SYSDATE, 'DY') IN ('СБ.', 'НД.') THEN
      raise_application_error (-20001,'Ви не можете вносити зміни в суботу та неділю');
    WHEN TO_CHAR (SYSDATE, 'HH24:MI') NOT BETWEEN '08:00' AND '18:00' THEN
        raise_application_error (-20002,'Ви можете вносити зміни тільки з 8 по 18 годину');
    ELSE
      NULL;
    END CASE;
END check_work_time;
/