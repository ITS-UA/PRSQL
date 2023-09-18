create or replace procedure set_currency is
begin

    update srv.currency_history
    set end_date = sysdate
    where end_date = TO_DATE('31.12.2999 23:59:59', 'DD.MM.YYYY HH24:MI:SS');

    execute immediate 'truncate table srv.currency';
    
    
    insert all
        into srv.currency (currency_id, currency_txt, currency_value,  currency_date) 
        values (cur_id, cur_txt, cur_value, cur_date)
        into srv.currency_history (currency_id, currency_txt, currency_value, start_date, end_date, currency_date)
        values (cur_id, cur_txt, cur_value, sysdate, TO_DATE('31.12.2999 23:59:59', 'DD.MM.YYYY HH24:MI:SS'), cur_date)   
    select cur.r030 as cur_id, 
           cur.cc as cur_txt, 
           cur.rate as cur_value,
           cur.exchangedate as cur_date
    from srv.currencies_v cur
    where cur.cc in (select value_list FROM TABLE(it_skills.own_func.table_from_list(get_param('LIST_CUR'))));
    commit;
    
end set_currency;