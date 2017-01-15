ALTER SESSION SET CURRENT_SCHEMA = free_librarian
/

-- Create sequences
prompt == Create sequence: sequences/lib_sq_borrowing.sql ==
@sequences/lib_sq_borrowing.sql
prompt ==  Create sequence: sequences/lib_sq_doc_identifier.sql ==
@sequences/lib_sq_doc_identifier.sql
prompt ==  Create sequence: sequences/lib_sq_doc_identifier_type.sql ==
@sequences/lib_sq_doc_identifier_type.sql
prompt ==  Create sequence: sequences/lib_sq_document.sql ==
@sequences/lib_sq_document.sql
prompt ==  Create sequence: sequences/lib_sq_user.sql ==
@sequences/lib_sq_user.sql
prompt ==  Create sequence: @sequences/lib_sq_errors.sql ==
@sequences/lib_sq_errors.sql

-- Create tables
prompt ==  Create table: @tables/book/lib_t_book.sql ==
@tables/book/lib_t_book.sql
prompt ==  Create table: @tables/book/lib_ht_book.sql ==
@tables/book/lib_ht_book.sql
prompt ==  Create table: @tables/borrowing/lib_t_borrowing.sql ==
@tables/borrowing/lib_t_borrowing.sql
prompt ==  Create table: @tables/borrowing/lib_ht_borrowing.sql ==
@tables/borrowing/lib_ht_borrowing.sql
prompt ==  Create table: @tables/doc_identifier/lib_t_doc_identifier.sql ==
@tables/doc_identifier/lib_t_doc_identifier.sql
prompt ==  Create table: @tables/doc_identifier/lib_ht_doc_identifier.sql ==
@tables/doc_identifier/lib_ht_doc_identifier.sql
prompt ==  Create table: @tables/doc_identifier_type/lib_t_doc_identifier_type.sql ==
@tables/doc_identifier_type/lib_t_doc_identifier_type.sql
prompt ==  Create table: @tables/doc_identifier_type/lib_ht_doc_identifier_type.sql ==
@tables/doc_identifier_type/lib_ht_doc_identifier_type.sql
prompt ==  Create table: @tables/document/lib_t_document.sql ==
@tables/document/lib_t_document.sql
prompt ==  Create table: @tables/document/lib_ht_document.sql ==
@tables/document/lib_ht_document.sql
prompt ==  Create table: @tables/user/lib_t_user.sql ==
@tables/user/lib_t_user.sql
prompt ==  Create table: @tables/user/lib_ht_user.sql ==
@tables/user/lib_ht_user.sql
prompt ==  Create table: @tables/technical/lib_t_errors.sql ==
@tables/technical/lib_t_errors.sql

-- Create foreign keys
prompt ==  Create foreign key: @foreign_keys/lib_fk_book_doc_identifier_b.sql ==
@foreign_keys/lib_fk_book_doc_identifier_b.sql
prompt ==  Create foreign key: @foreign_keys/lib_fk_book_document.sql ==
@foreign_keys/lib_fk_book_document.sql
prompt ==  Create foreign key: @foreign_keys/lib_fk_doc_identifier_type_i.sql ==
@foreign_keys/lib_fk_doc_identifier_type_i.sql
prompt ==  Create foreign key: @foreign_keys/lib_fk_document_borrowing.sql ==
@foreign_keys/lib_fk_document_borrowing.sql
prompt ==  Create foreign key: @foreign_keys/lib_fk_user_borrowing.sql ==
@foreign_keys/lib_fk_user_borrowing.sql

-- Create triggers
prompt == Create trigger @triggers/book/lib_htr_book.trg
@triggers/book/lib_htr_book.trg
prompt == Create trigger @triggers/book/lib_pktr_book.trg
@triggers/book/lib_pktr_book.trg
prompt == Create trigger @triggers/borrowing/lib_htr_borrowing.trg
@triggers/borrowing/lib_htr_borrowing.trg
prompt == Create trigger @triggers/borrowing/lib_pktr_borrowing.trg
@triggers/borrowing/lib_pktr_borrowing.trg
prompt == Create trigger @triggers/doc_ident_type/lib_htr_doc_ident_type.trg
@triggers/doc_ident_type/lib_htr_doc_ident_type.trg
prompt == Create trigger @triggers/doc_ident_type/lib_pktr_doc_ident_type.trg
@triggers/doc_ident_type/lib_pktr_doc_ident_type.trg
prompt == Create trigger @triggers/doc_identifier/lib_htr_doc_identifier.trg
@triggers/doc_identifier/lib_htr_doc_identifier.trg
prompt == Create trigger @triggers/doc_identifier/lib_pktr_doc_identifier.trg
@triggers/doc_identifier/lib_pktr_doc_identifier.trg
prompt == Create trigger @triggers/document/lib_htr_document.trg
@triggers/document/lib_htr_document.trg
prompt == Create trigger @triggers/document/lib_pktr_document.trg
@triggers/document/lib_pktr_document.trg
prompt == Create trigger @triggers/user/lib_htr_user.trg
@triggers/user/lib_htr_user.trg
prompt == Create trigger @triggers/user/lib_pktr_user.trg
@triggers/user/lib_pktr_user.trg

-- Create stored procedures
prompt == Create package @procedures/lib_prc_log_errors.
@procedures/lib_prc_log_errors.prc

-- Create packages
prompt == Create package @packages/lib_pck_user_action.spc
@packages/lib_pck_user_action.spc
prompt == Create package body @packages/lib_pck_user_action.bdy
@packages/lib_pck_user_action.bdy
prompt == Create package @packages/lib_pck_surcharge.spc
@packages/lib_pck_surcharge.spc
prompt == Create package body @packages/lib_pck_surcharge.bdy
@packages/lib_pck_surcharge.bdy
/
