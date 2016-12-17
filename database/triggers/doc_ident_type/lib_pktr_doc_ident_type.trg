CREATE OR REPLACE TRIGGER lib_pktr_doc_ident_type
BEFORE INSERT ON lib_t_doc_identifier_type
FOR EACH ROW  
BEGIN
  :NEW.id := lib_sq_doc_identifier_type.NEXTVAL; 
END lib_pktr_doc_ident_type;
/
