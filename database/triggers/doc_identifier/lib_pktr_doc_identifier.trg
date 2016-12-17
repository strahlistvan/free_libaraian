CREATE OR REPLACE TRIGGER lib_pktr_doc_identifier
BEFORE INSERT ON lib_t_doc_identifier
FOR EACH ROW  
BEGIN
  :NEW.id := lib_sq_doc_identifier.NEXTVAL; 
END lib_pktr_doc_identifier;
