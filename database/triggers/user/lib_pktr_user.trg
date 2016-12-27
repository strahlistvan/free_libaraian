CREATE OR REPLACE TRIGGER lib_pktr_user
BEFORE INSERT ON lib_t_user
FOR EACH ROW  
BEGIN
  IF :NEW.user_id IS NULL 
  THEN  
	  :NEW.user_id := lib_sq_user.NEXTVAL; 
  END IF;
  
  IF :NEW.is_deleted IS NULL
  THEN  
	  :NEW.is_deleted := 0;
  END IF;
END lib_pktr_user;
/
