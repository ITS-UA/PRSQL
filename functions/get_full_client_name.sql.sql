create or replace function get_full_client_name(p_client_id in number) return varchar2 is 
v_full_name varchar2(200); 
v_count number;

begin
 
    select count(*)
	into v_count
	from srv.clients cl 
	where cl.client_id = p_client_id;
   
    IF v_count = 0 then
       RAISE_APPLICATION_ERROR(-20004, 'CLIENT_ID = ' || p_client_id || ' не існує');
    end IF;
    
      
    select first_name || ' ' || last_name into v_full_name
    from srv.clients cl
    where cl.client_id = p_client_id;

  
  return v_full_name; 
  end get_full_client_name;
