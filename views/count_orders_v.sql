create view count_orders_v as
select cl.first_name,
       cl.last_name,
       tmp.count_orders
from srv.clients cl
right join (select o.client_id,
                   count(o.order_id) as count_orders
            from srv.orders o
            group by o.client_id) tmp 
on cl.client_id = tmp.client_id
order by tmp.count_orders desc;