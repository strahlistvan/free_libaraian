DROP TABLE lib_t_document CASCADE CONSTRAINTS;

CREATE TABLE lib_t_document (
  instance_id        NUMBER,
  doc_type_id        NUMBER,
  is_borrowable      NUMBER(1)
  
);

ALTER TABLE lib_t_document ADD CONSTRAINT lib_fk_document 
PRIMARY KEY (instance_id);

COMMENT ON TABLE lib_t_document IS 'It contains general document instances.';

COMMENT ON COLUMN lib_t_document.instance_id IS 'Unique identifier of the current instance. It is always unique, even if you have multiple instances of the same document';
COMMENT ON COLUMN lib_t_document.is_borrowable IS 'Is this document instance borrowable? (0/1)';
