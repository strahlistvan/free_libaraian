DROP TABLE lib_book CASCADE CONSTRAINTS;

CREATE TABLE lib_book (
  instance_id        NUMBER,
  author             VARCHAR2(100 CHAR),
  title              VARCHAR2(300 CHAR),
  doc_identifier_id  NUMBER,
  pages              NUMBER,
  publish_year       NUMBER,
  short_description  VARCHAR2(2000 CHAR),
  eto_number         VARCHAR2(30 CHAR), 
  cutter_number      VARCHAR2(5 CHAR), 
  is_borrowable      NUMBER(1),
  
  modified_by        VARCHAR2(100 CHAR),
  dml_flag           VARCHAR2(1),
  mod_date           DATE,
  version_no         NUMBER
);

ALTER TABLE lib_book ADD CONSTRAINT lib_pk_book 
PRIMARY KEY (instance_id);

COMMENT ON TABlE lib_book IS 'This table contains the main data of a ''Book'' type document instance.';

COMMENT ON COLUMN lib_book.instance_id IS 'Unique identifier of the current instance. It is always unique, even if you have multiple instances of the same document (Book)';
COMMENT ON COLUMN lib_book.author IS 'Author of the book.';
COMMENT ON COLUMN lib_book.title IS 'Title of the book.';
COMMENT ON COLUMN lib_book.doc_identifier_id IS 'Unique identifier of the document. Usually an ISBN number, but it can be anything else from ''lib_doc_identifier_type'' table';
COMMENT ON COLUMN lib_book.pages IS 'Number of pages in the book.';
COMMENT ON COLUMN lib_book.short_description IS 'Description/Content of the book.';
COMMENT ON COLUMN lib_book.eto_number IS 'ETO number of the book in the catalog. Used in non-literature books. If NULL, then Cutter-number is required.';
COMMENT ON COLUMN lib_book.cutter_number IS 'Cutter number of the book in the catalog. Used in literature books. If NULL, then ETO-number is required.';
COMMENT ON COLUMN lib_book.is_borrowable IS 'Is this book instance borrowable? (0/1)';
