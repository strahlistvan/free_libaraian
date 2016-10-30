DROP TABLE lib_doc_identifier_type CASCADE CONSTRAINTS;

CREATE TABLE lib_doc_identifier_type (
  id     NUMBER, 
  name   VARCHAR2(100 CHAR),
  format VARCHAR2(200 CHAR),
  
  modified_by        VARCHAR2(100 CHAR),
  dml_flag           VARCHAR2(1),
  mod_date           DATE,
  version_no         NUMBER
);

ALTER TABLE lib_doc_identifier_type ADD CONSTRAINT lib_pk_identifier_type
PRIMARY KEY (id);
