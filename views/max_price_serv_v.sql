

create or replace force editionable view "srv"."max_price_serv_v" ("service_id", "service_type", "service_description", "price_of_repair_without_spares") as
select *
from services sv
where sv.price_of_repair_without_spares =
                                        (select max(sv.price_of_repair_without_spares)
                                         from services sv);

