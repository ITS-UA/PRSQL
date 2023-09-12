create view report_service_odessa_v as
select s.*, 'м.' || autos.city || ', ' || autos.street || ',' || autos.address as full_address_auto_sevice
from auto_service autos
join orders o on autos.auto_service_id = o.auto_service_id
join services s on o.service_id = s.service_id
where o.auto_service_id = 3;