CREATE OR REPLACE TRIGGER lib_pktr_document
BEFORE INSERT ON lib_t_document
FOR EACH ROW  
BEGIN
  IF :NEW.instance_id IS NULL
  THEN  
    :NEW.instance_id := lib_sq_document.NEXTVAL;
  END IF; 
END lib_pktr_document;
/
