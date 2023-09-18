create procedure set_currency is
begin

    update srv.currency_history
    set end_date = sysdate
    where end_date is null;
    
    execute immediate 'truncate table srv.currency';
    
    insert all
        into srv.currency (currency_id, currency_txt, currency_value,  currency_date) 
        values (cur_id, cur_txt, cur_value, cur_date)
        into srv.currency_history (currency_id, currency_txt, currency_value, start_date, end_date, currency_date)
        values (cur_id, cur_txt, cur_value, sysdate, null, cur_date)   
    select cur.r030 as cur_id, 
           cur.cc as cur_txt, 
           cur.rate as cur_value,
           cur.exchangedate as cur_date
    from srv.currencies_v cur;
    commit;
    
end set_currency;