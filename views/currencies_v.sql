CREATE VIEW currencies_v AS SELECT r030, txt, rate, cc, TO_DATE(exchangedate, 'DD.MM.YYYY') AS exchangedate
FROM (
  SELECT sys.get_nbu_currencies AS json_value 
  FROM dual
)
CROSS JOIN json_table ( 
  json_value, '$[*]' 
  COLUMNS(
    r030 NUMBER PATH '$.r030',
    txt  VARCHAR2(100) PATH '$.txt',
    rate NUMBER PATH '$.rate',
    cc   VARCHAR2(100) PATH '$.cc',
    exchangedate VARCHAR2(100) PATH '$.exchangedate'
  )
) TT;