create view srv.finished_car_ussuid as 
select ord.order_id, ord.order_date, cln.first_name || ' ' || cln.last_name as name, ord.car_id, ord.service_id, ord.auto_service_id, s.description from srv.orders ord
inner join srv.status s on
ord.status_id = s.status_id
inner join srv.clients cln on
ord.client_id = cln.client_id
where s.status_id = 9 and cln.client_id = 10;
