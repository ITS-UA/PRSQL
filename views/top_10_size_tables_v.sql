create view srv.top_10_size_tables_v as 
select tmp.table_name,
       tmp.megabyte,
       tmp.gigabyte
from (select dt.table_name, 
       ds.bytes*power(10,-6) as megabyte,
       ds.bytes*power(10,-9) as gigabyte
from dba_tables dt
left outer join dba_segments ds
on dt.table_name = ds.segment_name 
and dt.owner = ds.owner
where dt.owner in ('SRV', 'SUPERMARKET')
order by ds.bytes desc) tmp
where rownum <=10;