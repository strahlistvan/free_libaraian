DROP TABLE lib_ht_doc_identifier CASCADE CONSTRAINTS;

CREATE TABLE lib_ht_doc_identifier (
   id                     NUMBER
  ,doc_identifier_type_id NUMBER
  ,content                VARCHAR2 (50 CHAR)
  
  ,modified_by        VARCHAR2(100 CHAR)
  ,dml_flag           VARCHAR2(1)
  ,mod_date           DATE
  ,version_no         NUMBER
);

COMMENT ON TABLE lib_ht_doc_identifier IS 'History table. It contains all previous version of the table. It can be useful at backup. For column comments, see the the top version table';
