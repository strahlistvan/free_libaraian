CREATE OR REPLACE TRIGGER lib_pktr_book
BEFORE INSERT ON lib_t_book
FOR EACH ROW
DECLARE
  v_id NUMBER;
BEGIN
  IF :NEW.instance_id IS NULL
  THEN  
  SELECT lib_sq_document.NEXTVAL
    INTO v_id
    FROM dual;
  :NEW.instance_id := v_id;
  ELSE
    v_id := :NEW.instance_id;
  END IF;
 
END lib_pktr_book;
/
