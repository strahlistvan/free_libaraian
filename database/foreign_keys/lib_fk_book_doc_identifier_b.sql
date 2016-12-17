ALTER TABLE lib_t_book ADD CONSTRAINT lib_fk_book_doc_identifier_b
FOREIGN KEY (doc_identifier_id) REFERENCES lib_t_doc_identifier(id)
/
