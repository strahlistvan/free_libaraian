DROP TABLE lib_t_doc_identifier_type CASCADE CONSTRAINTS;

CREATE TABLE lib_t_doc_identifier_type (
  id     NUMBER
  ,name   VARCHAR2(100 CHAR) UNIQUE
  ,format VARCHAR2(200 CHAR) UNIQUE
  
);

ALTER TABLE lib_t_doc_identifier_type ADD CONSTRAINT lib_pk_identifier_type
PRIMARY KEY (id);

COMMENT ON TABLE lib_t_doc_identifier_type IS 'It contains all elements from the range of document identifiers types (ISBN, ISSN, ...)';

COMMENT ON COLUMN lib_t_doc_identifier_type.id IS 'Primary key of the table';
COMMENT ON COLUMN lib_t_doc_identifier_type.name IS 'Doucument identifier name.';
COMMENT ON COLUMN lib_t_doc_identifier_type.format IS 'Document identifier format. (Regexp pattern.';
