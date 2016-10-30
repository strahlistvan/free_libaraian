ALTER TABLE lib_doc_identifier ADD CONSTRAINT lib_fk_doc_identifier_type_i 
FOREIGN KEY (doc_identifier_type_id) REFERENCES lib_doc_identifier_type(id);
