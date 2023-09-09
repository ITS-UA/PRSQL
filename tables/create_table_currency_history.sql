create table currency_history (currency_id number, 
                       currency_txt varchar2(3), 
                       currency_value number, 
                       start_date date,
                       end_date date,
                       currency_date date default sysdate);
