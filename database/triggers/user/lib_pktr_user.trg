CREATE OR REPLACE TRIGGER lib_pktr_user
BEFORE INSERT ON lib_t_user
FOR EACH ROW
BEGIN
  IF :NEW.user_id IS NULL
  THEN
	  :NEW.user_id := lib_sq_user.NEXTVAL;
  END IF;
END lib_pktr_user;
/
