DROP TABLE lib_doc_identifier_type_h CASCADE CONSTRAINTS;

CREATE TABLE lib_doc_identifier_type_h (
  id     NUMBER, 
  name   VARCHAR2(100 CHAR) UNIQUE,
  format VARCHAR2(200 CHAR) UNIQUE,
  
  modified_by        VARCHAR2(100 CHAR),
  dml_flag           VARCHAR2(1),
  mod_date           DATE,
  version_no         NUMBER
);

COMMENT ON TABLE lib_doc_identifier_type_h IS 'History table. It contains all previous version of the table. It can be useful at backup. For column comments, see the the top version table';
