create view srv.more_one_transport_v1 as 
  select cl.client_id,
       cl.first_name,
       cl.last_name,
       nvl(tmp.count_cars1, 0) as count_cars
from srv.clients cl
left outer join (select c.client_id, count(c.car_id) as count_cars1
            from srv.cars c
            group by c.client_id) tmp 
on cl.client_id = tmp.client_id
order by cl.client_id asc;


