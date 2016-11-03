ALTER TABLE lib_t_borrowing ADD CONSTRAINT lib_fk_document_borrowing 
FOREIGN KEY (document_id) REFERENCES lib_t_document(instance_id);
