ALTER TABLE lib_book ADD CONSTRAINT lib_fk_book_document
FOREIGN KEY (instance_id) REFERENCES lib_document(instance_id);
