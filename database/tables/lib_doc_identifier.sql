DROP TABLE lib_doc_identifier CASCADE CONSTRAINTS;

CREATE TABLE lib_doc_identifier (
  id                     NUMBER,
  doc_identifier_type_id NUMBER,
  content                NUMBER,
  
  modified_by        VARCHAR2(100 CHAR),
  dml_flag           VARCHAR2(1),
  mod_date           DATE,
  version_no         NUMBER
);

ALTER TABLE lib_doc_identifier ADD CONSTRAINT lib_pk_doc_identifier
PRIMARY KEY (id);
