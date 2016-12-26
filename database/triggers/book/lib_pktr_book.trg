CREATE OR REPLACE TRIGGER lib_pktr_book
BEFORE INSERT ON lib_t_book
FOR EACH ROW
BEGIN
  :NEW.instance_id := lib_sq_document.NEXTVAL;
END lib_pktr_book;
/
