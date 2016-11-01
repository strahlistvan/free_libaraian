DROP TABLE lib_document CASCADE CONSTRAINTS;

CREATE TABLE lib_document (
  instance_id        NUMBER,
  doc_type_id        NUMBER,
  is_borrowable      NUMBER(1),
  
  modified_by        VARCHAR2(100 CHAR),
  dml_flag           VARCHAR2(1),
  mod_date           DATE,
  version_no         NUMBER
  
);

COMMENT ON TABLE lib_document IS 'It contains general document instances.';

COMMENT ON COLUMN lib_document.instance_id IS 'Unique identifier of the current instance. It is always unique, even if you have multiple instances of the same document';
COMMENT ON COLUMN lib_document.is_borrowable IS 'Is this document instance borrowable? (0/1)';
