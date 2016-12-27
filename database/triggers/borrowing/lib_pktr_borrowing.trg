CREATE OR REPLACE TRIGGER lib_pktr_borrowing
BEFORE INSERT ON lib_t_borrowing
FOR EACH ROW
BEGIN
  IF :NEW.id IS NULL
  THEN  
    :NEW.id := lib_sq_borrowing.NEXTVAL;
  END IF;
END lib_pktr_borrowing;
/
