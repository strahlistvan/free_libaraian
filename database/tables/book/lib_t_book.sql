DROP TABLE lib_t_book CASCADE CONSTRAINTS;

CREATE TABLE lib_t_book (
  instance_id        NUMBER,
  author             VARCHAR2(100 CHAR),
  title              VARCHAR2(300 CHAR),
  doc_identifier_id  NUMBER,
  pages              NUMBER,
  publish_year       NUMBER,
  short_description  VARCHAR2(2000 CHAR),
  eto_number         VARCHAR2(30 CHAR), 
  cutter_number      VARCHAR2(5 CHAR), 
  
);

ALTER TABLE lib_t_book ADD CONSTRAINT lib_pk_book 
PRIMARY KEY (instance_id);

COMMENT ON TABlE lib_t_book IS 'This table contains the main data of a ''Book'' type document instance.';

COMMENT ON COLUMN lib_t_book.instance_id IS 'Unique identifier of the current instance. It is always unique, even if you have multiple instances of the same document (Book)';
COMMENT ON COLUMN lib_t_book.author IS 'Author of the book.';
COMMENT ON COLUMN lib_t_book.title IS 'Title of the book.';
COMMENT ON COLUMN lib_t_book.doc_identifier_id IS 'Unique identifier of the document. Usually an ISBN number, but it can be anything else from ''lib_doc_identifier_type'' table';
COMMENT ON COLUMN lib_t_book.pages IS 'Number of pages in the book.';
COMMENT ON COLUMN lib_t_book.short_description IS 'Description/Content of the book.';
COMMENT ON COLUMN lib_t_book.eto_number IS 'ETO number of the book in the catalog. Used in non-literature books. If NULL, then Cutter-number is required.';
COMMENT ON COLUMN lib_t_book.cutter_number IS 'Cutter number of the book in the catalog. Used in literature books. If NULL, then ETO-number is required.';
