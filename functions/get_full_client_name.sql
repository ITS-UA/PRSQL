create or REPLACE FUNCTION get_full_client_name (p_client_id in number) return varchar2 is 
v_full_name varchar2(200); 
BEGIN

   SELECT first_name || ' ' || last_name INTO v_full_name
  FROM srv.clients cl
  WHERE cl.client_id = p_client_id;
  
  Case 
       when v_full_name IS NULL THEN  
       RAISE_APPLICATION_ERROR(-20004, 'CLIENT_ID = ' || p_client_id || ' не існує');
  END case;
 
  RETURN v_full_name; 
END get_full_client_name;
/
