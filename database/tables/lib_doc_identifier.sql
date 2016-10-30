DROP TABLE lib_doc_identifier CASCADE CONSTRAINTS;

CREATE TABLE lib_doc_identifier (
  id                     NUMBER,
  doc_identifier_type_id NUMBER,
  content                VARCHAR2(50 CHAR),
  
  modified_by        VARCHAR2(100 CHAR),
  dml_flag           VARCHAR2(1),
  mod_date           DATE,
  version_no         NUMBER
);

ALTER TABLE lib_doc_identifier ADD CONSTRAINT lib_pk_doc_identifier
PRIMARY KEY(id);

COMMENT ON TABLE lib_doc_identifier IS 'This table contains unique document identifiers. (Type, not instance!)';

COMMENT ON COLUMN lib_doc_identifier.id IS 'Primary key of the table.';
COMMENT ON COLUMN lib_doc_identifier.doc_identifier_type_id IS 'Identifier type (ISBN, ISSN, ...) identifier, foreign key.';
COMMENT ON COLUMN lib_doc_identifier.content IS 'Identifier value.';
