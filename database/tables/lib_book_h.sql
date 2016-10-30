
DROP TABLE lib_book_h CASCADE CONSTRAINTS;

CREATE TABLE lib_book_h (
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

COMMENT ON TABLE lib_book_h IS 'History table. It contains all previous version of the table. It can be useful at backup. For column comments, see the the top version table';
