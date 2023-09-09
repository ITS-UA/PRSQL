create or replace function get_param(p_param_name in varchar2) return varchar2 is
v_logic_params_select varchar2(2000);
begin
select lp.param_value
into v_logic_params_select
from srv.logic_params lp
where lp.param_name = p_param_name;
return v_logic_params_select;
end get_param;
