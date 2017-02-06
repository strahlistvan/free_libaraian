-- Create sequences
prompt === Create C:\Users\Istvan\Documents\PROGI\free_librarian\database\sequences\lib_sq_borrowing.sql === 
@C:\Users\Istvan\Documents\PROGI\free_librarian\database\sequences\lib_sq_borrowing.sql
prompt === Create C:\Users\Istvan\Documents\PROGI\free_librarian\database\sequences\lib_sq_document.sql === 
@C:\Users\Istvan\Documents\PROGI\free_librarian\database\sequences\lib_sq_document.sql
prompt === Create C:\Users\Istvan\Documents\PROGI\free_librarian\database\sequences\lib_sq_doc_identifier.sql === 
@C:\Users\Istvan\Documents\PROGI\free_librarian\database\sequences\lib_sq_doc_identifier.sql
prompt === Create C:\Users\Istvan\Documents\PROGI\free_librarian\database\sequences\lib_sq_doc_identifier_type.sql === 
@C:\Users\Istvan\Documents\PROGI\free_librarian\database\sequences\lib_sq_doc_identifier_type.sql
prompt === Create C:\Users\Istvan\Documents\PROGI\free_librarian\database\sequences\lib_sq_errors.sql === 
@C:\Users\Istvan\Documents\PROGI\free_librarian\database\sequences\lib_sq_errors.sql
prompt === Create C:\Users\Istvan\Documents\PROGI\free_librarian\database\sequences\lib_sq_trace_logs.sql === 
@C:\Users\Istvan\Documents\PROGI\free_librarian\database\sequences\lib_sq_trace_logs.sql
prompt === Create C:\Users\Istvan\Documents\PROGI\free_librarian\database\sequences\lib_sq_user.sql === 
@C:\Users\Istvan\Documents\PROGI\free_librarian\database\sequences\lib_sq_user.sql
-- Create foreign_keys
prompt === Create C:\Users\Istvan\Documents\PROGI\free_librarian\database\foreign_keys\lib_fk_book_document.sql === 
@C:\Users\Istvan\Documents\PROGI\free_librarian\database\foreign_keys\lib_fk_book_document.sql
prompt === Create C:\Users\Istvan\Documents\PROGI\free_librarian\database\foreign_keys\lib_fk_book_doc_identifier_b.sql === 
@C:\Users\Istvan\Documents\PROGI\free_librarian\database\foreign_keys\lib_fk_book_doc_identifier_b.sql
prompt === Create C:\Users\Istvan\Documents\PROGI\free_librarian\database\foreign_keys\lib_fk_document_borrowing.sql === 
@C:\Users\Istvan\Documents\PROGI\free_librarian\database\foreign_keys\lib_fk_document_borrowing.sql
prompt === Create C:\Users\Istvan\Documents\PROGI\free_librarian\database\foreign_keys\lib_fk_doc_identifier_type_i.sql === 
@C:\Users\Istvan\Documents\PROGI\free_librarian\database\foreign_keys\lib_fk_doc_identifier_type_i.sql
prompt === Create C:\Users\Istvan\Documents\PROGI\free_librarian\database\foreign_keys\lib_fk_user_borrowing.sql === 
@C:\Users\Istvan\Documents\PROGI\free_librarian\database\foreign_keys\lib_fk_user_borrowing.sql
-- Create triggers
prompt === Create C:\Users\Istvan\Documents\PROGI\free_librarian\database\triggers\book\lib_htr_book.trg === 
@C:\Users\Istvan\Documents\PROGI\free_librarian\database\triggers\book\lib_htr_book.trg
prompt === Create C:\Users\Istvan\Documents\PROGI\free_librarian\database\triggers\book\lib_pktr_book.trg === 
@C:\Users\Istvan\Documents\PROGI\free_librarian\database\triggers\book\lib_pktr_book.trg
prompt === Create C:\Users\Istvan\Documents\PROGI\free_librarian\database\triggers\borrowing\lib_htr_borrowing.trg === 
@C:\Users\Istvan\Documents\PROGI\free_librarian\database\triggers\borrowing\lib_htr_borrowing.trg
prompt === Create C:\Users\Istvan\Documents\PROGI\free_librarian\database\triggers\borrowing\lib_pktr_borrowing.trg === 
@C:\Users\Istvan\Documents\PROGI\free_librarian\database\triggers\borrowing\lib_pktr_borrowing.trg
prompt === Create C:\Users\Istvan\Documents\PROGI\free_librarian\database\triggers\document\lib_htr_document.trg === 
@C:\Users\Istvan\Documents\PROGI\free_librarian\database\triggers\document\lib_htr_document.trg
prompt === Create C:\Users\Istvan\Documents\PROGI\free_librarian\database\triggers\document\lib_pktr_document.trg === 
@C:\Users\Istvan\Documents\PROGI\free_librarian\database\triggers\document\lib_pktr_document.trg
prompt === Create C:\Users\Istvan\Documents\PROGI\free_librarian\database\triggers\doc_identifier\lib_htr_doc_identifier.trg === 
@C:\Users\Istvan\Documents\PROGI\free_librarian\database\triggers\doc_identifier\lib_htr_doc_identifier.trg
prompt === Create C:\Users\Istvan\Documents\PROGI\free_librarian\database\triggers\doc_identifier\lib_pktr_doc_identifier.trg === 
@C:\Users\Istvan\Documents\PROGI\free_librarian\database\triggers\doc_identifier\lib_pktr_doc_identifier.trg
prompt === Create C:\Users\Istvan\Documents\PROGI\free_librarian\database\triggers\doc_ident_type\lib_htr_doc_ident_type.trg === 
@C:\Users\Istvan\Documents\PROGI\free_librarian\database\triggers\doc_ident_type\lib_htr_doc_ident_type.trg
prompt === Create C:\Users\Istvan\Documents\PROGI\free_librarian\database\triggers\doc_ident_type\lib_pktr_doc_ident_type.trg === 
@C:\Users\Istvan\Documents\PROGI\free_librarian\database\triggers\doc_ident_type\lib_pktr_doc_ident_type.trg
prompt === Create C:\Users\Istvan\Documents\PROGI\free_librarian\database\triggers\user\lib_htr_user.trg === 
@C:\Users\Istvan\Documents\PROGI\free_librarian\database\triggers\user\lib_htr_user.trg
prompt === Create C:\Users\Istvan\Documents\PROGI\free_librarian\database\triggers\user\lib_pktr_user.trg === 
@C:\Users\Istvan\Documents\PROGI\free_librarian\database\triggers\user\lib_pktr_user.trg
-- Create procedure
prompt === Create C:\Users\Istvan\Documents\PROGI\free_librarian\database\procedures\lib_prc_log_errors.prc === 
@C:\Users\Istvan\Documents\PROGI\free_librarian\database\procedures\lib_prc_log_errors.prc
prompt === Create C:\Users\Istvan\Documents\PROGI\free_librarian\database\procedures\lib_prc_log_trace.prc === 
@C:\Users\Istvan\Documents\PROGI\free_librarian\database\procedures\lib_prc_log_trace.prc
-- Create package
prompt === Create C:\Users\Istvan\Documents\PROGI\free_librarian\database\packages\lib_pck_surcharge.spc === 
@C:\Users\Istvan\Documents\PROGI\free_librarian\database\packages\lib_pck_surcharge.spc
prompt === Create C:\Users\Istvan\Documents\PROGI\free_librarian\database\packages\lib_pck_user_action.spc === 
@C:\Users\Istvan\Documents\PROGI\free_librarian\database\packages\lib_pck_user_action.spc
-- Create package body
prompt === Create C:\Users\Istvan\Documents\PROGI\free_librarian\database\packages\lib_pck_surcharge.bdy === 
@C:\Users\Istvan\Documents\PROGI\free_librarian\database\packages\lib_pck_surcharge.bdy
prompt === Create C:\Users\Istvan\Documents\PROGI\free_librarian\database\packages\lib_pck_user_action.bdy === 
@C:\Users\Istvan\Documents\PROGI\free_librarian\database\packages\lib_pck_user_action.bdy
