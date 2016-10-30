ALTER TABLE lib_book ADD CONSTRAINT lib_fk_book_doc_identifier_b
FOREIGN KEY (doc_identifier_id) REFERENCES lib_doc_identifier(id);
