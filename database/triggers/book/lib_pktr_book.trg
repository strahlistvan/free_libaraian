CREATE OR REPLACE TRIGGER lib_pktr_book
BEFORE INSERT ON lib_t_book
FOR EACH ROW
BEGIN
  :NEW.instance_id := lib_sq_document.NEXTVAL;
	INSERT INTO lib_t_document(instance_id,
                            doc_type_id,
                            is_borrowable)
	VALUES (:NEW.instance_id,
	        'BOOK',
					1 );
END lib_pktr_book;
/
