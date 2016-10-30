DROP TABLE lib_book CASCADE CONSTRAINTS;

CREATE TABLE lib_book (
  instance_id        NUMBER,
  author             VARCHAR2(100 CHAR),
  title              VARCHAR2(300 CHAR),
  doc_identifier_id  NUMBER,
  pages              NUMBER,
  publish_year       NUMBER,
  short_description  VARCHAR2(2000 CHAR),
  eto_number_id      NUMBER, 
  cutter_number_id   NUMBER, 
  is_borrowable      NUMBER(1),
  
  modified_by        VARCHAR2(100 CHAR),
  dml_flag           VARCHAR2(1),
  mod_date           DATE,
  version_no         NUMBER
);

ALTER TABLE lib_book ADD CONSTRAINT lib_pk_book 
PRIMARY KEY (instance_id);
