CREATE OR REPLACE TRIGGER lib_pktr_user
BEFORE INSERT ON lib_t_user
FOR EACH ROW  
BEGIN
	:NEW.user_id := lib_sq_user.NEXTVAL; 
	:NEW.is_deleted := 0;
END lib_pktr_user;
/
