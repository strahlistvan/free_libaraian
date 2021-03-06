DROP TABLE lib_ht_document CASCADE CONSTRAINTS
/

CREATE TABLE lib_ht_document (
   instance_id        NUMBER
  ,doc_type_id        NUMBER
  ,doc_identifier_id  NUMBER
  ,is_borrowable      NUMBER(1) 
  ,modified_by        VARCHAR2(100 CHAR)
  ,dml_flag           VARCHAR2(1)
  ,mod_date           DATE
  ,version_no         NUMBER
)
/

COMMENT ON TABLE lib_ht_document
IS 'History table of lib_t_document.'
/
