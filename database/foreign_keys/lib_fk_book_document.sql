ALTER TABLE lib_t_book ADD CONSTRAINT lib_fk_book_document
FOREIGN KEY (instance_id) REFERENCES lib_t_document(instance_id)
/
