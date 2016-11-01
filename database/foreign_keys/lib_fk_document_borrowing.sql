ALTER TABLE lib_borrowing ADD CONSTRAINT lib_fk_document_borrowing 
FOREIGN KEY (document_id) REFERENCES lib_document(instance_id);
