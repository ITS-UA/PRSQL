CREATE OR REPLACE FUNCTION get_full_client_name_1(p_client_id NUMBER)
RETURN VARCHAR2 AS
  v_full_name VARCHAR2(100); 
BEGIN
 
  SELECT first_name || ' ' || last_name INTO v_full_name
  FROM srv.clients cl
  WHERE cl.client_id = p_client_id;
  
   IF v_full_name IS NULL THEN
   RAISE_APPLICATION_ERROR(-20004, 'CLIENT_ID = ' || p_client_id || ' не існує');
 
   END IF;
  
  RETURN v_full_name; 
  
  END get_full_client_name_1;