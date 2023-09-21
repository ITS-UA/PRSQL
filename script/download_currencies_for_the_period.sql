declare
    start_date date;
    end_date date;
begin
    start_date := TO_DATE('10.09.2023 07:00:00', 'DD.MM.YYYY HH24:MI:SS');
     
    while start_date <= TO_DATE('18.09.2023 07:00:00', 'DD.MM.YYYY HH24:MI:SS')
    loop
        end_date := start_date + interval '1' day;
        
        insert all
            into srv.currency_history (currency_id, currency_txt, currency_value, start_date, end_date, currency_date)
            values (r030, cc,  rate, start_date, end_date, exchangedate) 
        select r030, txt, rate, cc, to_date(exchangedate, 'DD.MM.YYYY') as exchangedate
        from (
          select sys.get_nbu_currencies(start_date) as json_value 
          from dual
        )
        cross join json_table ( 
          json_value, '$[*]' 
          columns(
            r030 number path '$.r030',
            txt  varchar2(100) path '$.txt',
            rate number path '$.rate',
            cc   varchar2(100) path '$.cc',
            exchangedate varchar2(100) path '$.exchangedate')
        ) tt
        where cc in (select value_list from table(it_skills.own_func.table_from_list(get_param('LIST_CUR'))));
        
        start_date := end_date;
    end loop;
    commit;
end;
/