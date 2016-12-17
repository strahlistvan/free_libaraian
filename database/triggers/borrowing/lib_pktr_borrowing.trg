CREATE OR REPLACE TRIGGER lib_pktr_borrowing
BEFORE INSERT ON lib_t_borrowing
FOR EACH ROW  
BEGIN
  :NEW.id := lib_sq_borrowing.NEXTVAL; 
END lib_pktr_borrowing;
