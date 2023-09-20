BEGIN
  DBMS_SCHEDULER.CREATE_JOB (
   job_name            => 'UPDATE_CURRENCY',
   job_type            => 'PLSQL_BLOCK',
   job_action          => 'begin srv.set_currency(); end;',
   start_date          => TO_DATE('19-09-2023 00:00:00', 'dd-mm-yyyy hh24:mi:ss'),
   repeat_interval     => 'FREQ=DAILY;BYHOUR=07',
   end_date            => TO_DATE('31.12.2999 23:59:59', 'DD.MM.YYYY HH24:MI:SS'),
   job_class           => 'DEFAULT_JOB_CLASS',
   enabled             => TRUE,
   auto_drop           => FALSE,
   comments            => 'Джоб для оновлення курсів валют');
END;
/