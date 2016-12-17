--------------------------------------------------
-- Export file for user FREE_LIBRARIAN@XE       --
-- Created by OTTHONI on 12/17/2016, 9:29:32 PM --
--------------------------------------------------

set define off
spool install_db_objects.log

prompt
prompt Creating table LIB_HT_BOOK
prompt ==========================
prompt
create table FREE_LIBRARIAN.LIB_HT_BOOK
(
  instance_id       NUMBER,
  author            VARCHAR2(100 CHAR),
  title             VARCHAR2(300 CHAR),
  doc_identifier_id NUMBER,
  pages             NUMBER,
  publish_year      NUMBER,
  short_description VARCHAR2(2000 CHAR),
  eto_number_id     NUMBER,
  cutter_number_id  NUMBER,
  is_borrowable     NUMBER(1),
  modified_by       VARCHAR2(100 CHAR),
  dml_flag          VARCHAR2(1),
  mod_date          DATE,
  version_no        NUMBER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table FREE_LIBRARIAN.LIB_HT_BOOK
  is 'History table. It contains all previous version of the table. It can be useful at backup. For column comments, see the the top version table';

prompt
prompt Creating table LIB_HT_BORROWING
prompt ===============================
prompt
create table FREE_LIBRARIAN.LIB_HT_BORROWING
(
  id            NUMBER,
  user_id       NUMBER,
  document_id   NUMBER,
  end_date      DATE,
  renewal_count NUMBER,
  surcharge     NUMBER default 0,
  modified_by   VARCHAR2(100 CHAR),
  dml_flag      VARCHAR2(1),
  mod_date      DATE,
  version_no    NUMBER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table FREE_LIBRARIAN.LIB_HT_BORROWING
  is 'Contains borrowing (loan) details.';
comment on column FREE_LIBRARIAN.LIB_HT_BORROWING.id
  is 'Borrowing record identifier (technical field)';
comment on column FREE_LIBRARIAN.LIB_HT_BORROWING.user_id
  is 'Borrower library user identifier.';
comment on column FREE_LIBRARIAN.LIB_HT_BORROWING.document_id
  is 'Borrowed document''s identifier.';
comment on column FREE_LIBRARIAN.LIB_HT_BORROWING.end_date
  is 'Borrowing end date.';
comment on column FREE_LIBRARIAN.LIB_HT_BORROWING.renewal_count
  is 'How many times did the user renew this borrow record?';
comment on column FREE_LIBRARIAN.LIB_HT_BORROWING.surcharge
  is 'If you don''t bring the document back in time, you must pay.';

prompt
prompt Creating table LIB_HT_DOC_IDENTIFIER
prompt ====================================
prompt
create table FREE_LIBRARIAN.LIB_HT_DOC_IDENTIFIER
(
  id                     NUMBER,
  doc_identifier_type_id NUMBER,
  content                VARCHAR2(50 CHAR),
  modified_by            VARCHAR2(100 CHAR),
  dml_flag               VARCHAR2(1),
  mod_date               DATE,
  version_no             NUMBER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table FREE_LIBRARIAN.LIB_HT_DOC_IDENTIFIER
  is 'History table. It contains all previous version of the table. It can be useful at backup. For column comments, see the the top version table';

prompt
prompt Creating table LIB_HT_DOC_IDENTIFIER_TYPE
prompt =========================================
prompt
create table FREE_LIBRARIAN.LIB_HT_DOC_IDENTIFIER_TYPE
(
  id          NUMBER,
  name        VARCHAR2(100 CHAR),
  format      VARCHAR2(200 CHAR),
  modified_by VARCHAR2(100 CHAR),
  dml_flag    VARCHAR2(1),
  mod_date    DATE,
  version_no  NUMBER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table FREE_LIBRARIAN.LIB_HT_DOC_IDENTIFIER_TYPE
  is 'History table. It contains all previous version of the table. It can be useful at backup. For column comments, see the the top version table';

prompt
prompt Creating table LIB_HT_DOCUMENT
prompt ==============================
prompt
create table FREE_LIBRARIAN.LIB_HT_DOCUMENT
(
  instance_id   NUMBER,
  doc_type_id   NUMBER,
  is_borrowable NUMBER(1),
  modified_by   VARCHAR2(100 CHAR),
  dml_flag      VARCHAR2(1),
  mod_date      DATE,
  version_no    NUMBER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table LIB_HT_USER
prompt ==========================
prompt
create table FREE_LIBRARIAN.LIB_HT_USER
(
  user_id     NUMBER,
  name        VARCHAR2(100 CHAR),
  email       VARCHAR2(200 CHAR),
  birthdate   DATE,
  id_number   VARCHAR2(30 CHAR),
  modified_by VARCHAR2(100 CHAR),
  dml_flag    VARCHAR2(1),
  mod_date    DATE,
  version_no  NUMBER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table FREE_LIBRARIAN.LIB_HT_USER
  is 'User of the library. It can be member, librarian, or system administrator';
comment on column FREE_LIBRARIAN.LIB_HT_USER.user_id
  is 'Unique user library identifier.';
comment on column FREE_LIBRARIAN.LIB_HT_USER.name
  is 'Library user''s natural name. Required.';
comment on column FREE_LIBRARIAN.LIB_HT_USER.email
  is 'Library user''s e-mail address.';
comment on column FREE_LIBRARIAN.LIB_HT_USER.birthdate
  is 'Library user''s date of birth.';
comment on column FREE_LIBRARIAN.LIB_HT_USER.id_number
  is 'Personal identifier number.';

prompt
prompt Creating table LIB_T_DOC_IDENTIFIER
prompt ===================================
prompt
create table FREE_LIBRARIAN.LIB_T_DOC_IDENTIFIER
(
  id                     NUMBER not null,
  doc_identifier_type_id NUMBER,
  content                VARCHAR2(50 CHAR)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table FREE_LIBRARIAN.LIB_T_DOC_IDENTIFIER
  is 'This table contains unique document identifiers. (Type, not instance!)';
comment on column FREE_LIBRARIAN.LIB_T_DOC_IDENTIFIER.id
  is 'Primary key of the table.';
comment on column FREE_LIBRARIAN.LIB_T_DOC_IDENTIFIER.doc_identifier_type_id
  is 'Identifier type (ISBN, ISSN, ...) identifier, foreign key.';
comment on column FREE_LIBRARIAN.LIB_T_DOC_IDENTIFIER.content
  is 'Identifier value.';
alter table FREE_LIBRARIAN.LIB_T_DOC_IDENTIFIER
  add constraint LIB_PK_DOC_IDENTIFIER primary key (ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table LIB_T_DOCUMENT
prompt =============================
prompt
create table FREE_LIBRARIAN.LIB_T_DOCUMENT
(
  instance_id   NUMBER not null,
  doc_type_id   NUMBER not null,
  is_borrowable NUMBER(1)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table FREE_LIBRARIAN.LIB_T_DOCUMENT
  is 'It contains general document instances.';
comment on column FREE_LIBRARIAN.LIB_T_DOCUMENT.instance_id
  is 'Unique identifier of the current instance. It is always unique, even if you have multiple instances of the same document';
comment on column FREE_LIBRARIAN.LIB_T_DOCUMENT.is_borrowable
  is 'Is this document instance borrowable? (0/1)';
alter table FREE_LIBRARIAN.LIB_T_DOCUMENT
  add constraint LIB_FK_DOCUMENT primary key (INSTANCE_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table LIB_T_BOOK
prompt =========================
prompt
create table FREE_LIBRARIAN.LIB_T_BOOK
(
  instance_id       NUMBER not null,
  author            VARCHAR2(100 CHAR),
  title             VARCHAR2(300 CHAR),
  doc_identifier_id NUMBER,
  pages             NUMBER,
  publish_year      NUMBER,
  short_description VARCHAR2(2000 CHAR),
  eto_number        VARCHAR2(30 CHAR),
  cutter_number     VARCHAR2(5 CHAR)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table FREE_LIBRARIAN.LIB_T_BOOK
  is 'This table contains the main data of a ''Book'' type document instance.';
comment on column FREE_LIBRARIAN.LIB_T_BOOK.instance_id
  is 'Unique identifier of the current instance. It is always unique, even if you have multiple instances of the same document (Book)';
comment on column FREE_LIBRARIAN.LIB_T_BOOK.author
  is 'Author of the book.';
comment on column FREE_LIBRARIAN.LIB_T_BOOK.title
  is 'Title of the book.';
comment on column FREE_LIBRARIAN.LIB_T_BOOK.doc_identifier_id
  is 'Unique identifier of the document. Usually an ISBN number, but it can be anything else from ''lib_doc_identifier_type'' table';
comment on column FREE_LIBRARIAN.LIB_T_BOOK.pages
  is 'Number of pages in the book.';
comment on column FREE_LIBRARIAN.LIB_T_BOOK.short_description
  is 'Description/Content of the book.';
comment on column FREE_LIBRARIAN.LIB_T_BOOK.eto_number
  is 'ETO number of the book in the catalog. Used in non-literature books. If NULL, then Cutter-number is required.';
comment on column FREE_LIBRARIAN.LIB_T_BOOK.cutter_number
  is 'Cutter number of the book in the catalog. Used in literature books. If NULL, then ETO-number is required.';
alter table FREE_LIBRARIAN.LIB_T_BOOK
  add constraint LIB_PK_BOOK primary key (INSTANCE_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table FREE_LIBRARIAN.LIB_T_BOOK
  add constraint LIB_FK_BOOK_DOC_IDENTIFIER_B foreign key (DOC_IDENTIFIER_ID)
  references FREE_LIBRARIAN.LIB_T_DOC_IDENTIFIER (ID);
alter table FREE_LIBRARIAN.LIB_T_BOOK
  add constraint LIB_FK_BOOK_DOCUMENT foreign key (INSTANCE_ID)
  references FREE_LIBRARIAN.LIB_T_DOCUMENT (INSTANCE_ID);

prompt
prompt Creating table LIB_T_BORROWING
prompt ==============================
prompt
create table FREE_LIBRARIAN.LIB_T_BORROWING
(
  id            NUMBER not null,
  user_id       NUMBER not null,
  document_id   NUMBER not null,
  end_date      DATE not null,
  renewal_count NUMBER default 0,
  surcharge     NUMBER default 0
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table FREE_LIBRARIAN.LIB_T_BORROWING
  is 'Contains borrowing (loan) details.';
comment on column FREE_LIBRARIAN.LIB_T_BORROWING.id
  is 'Borrowing record identifier (technical field)';
comment on column FREE_LIBRARIAN.LIB_T_BORROWING.user_id
  is 'Borrower library user identifier.';
comment on column FREE_LIBRARIAN.LIB_T_BORROWING.document_id
  is 'Borrowed document''s identifier.';
comment on column FREE_LIBRARIAN.LIB_T_BORROWING.end_date
  is 'Borrowing end date.';
comment on column FREE_LIBRARIAN.LIB_T_BORROWING.renewal_count
  is 'How many times did the user renew this borrow record?';
comment on column FREE_LIBRARIAN.LIB_T_BORROWING.surcharge
  is 'If you don''t bring the document back in time, you must pay.';
alter table FREE_LIBRARIAN.LIB_T_BORROWING
  add constraint LIB_PK_BORROWING primary key (ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table LIB_T_USER
prompt =========================
prompt
create table FREE_LIBRARIAN.LIB_T_USER
(
  user_id    NUMBER not null,
  name       VARCHAR2(100 CHAR) not null,
  email      VARCHAR2(200 CHAR),
  birthdate  DATE,
  id_number  VARCHAR2(30 CHAR),
  is_deleted CHAR(1)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table FREE_LIBRARIAN.LIB_T_USER
  is 'User of the library. It can be member, librarian, or system administrator';
comment on column FREE_LIBRARIAN.LIB_T_USER.user_id
  is 'Unique user library identifier.';
comment on column FREE_LIBRARIAN.LIB_T_USER.name
  is 'Library user''s natural name. Required.';
comment on column FREE_LIBRARIAN.LIB_T_USER.email
  is 'Library user''s e-mail address.';
comment on column FREE_LIBRARIAN.LIB_T_USER.birthdate
  is 'Library user''s date of birth.';
comment on column FREE_LIBRARIAN.LIB_T_USER.id_number
  is 'Personal identifier number.';
alter table FREE_LIBRARIAN.LIB_T_USER
  add constraint LIB_PK_USER primary key (USER_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table FREE_LIBRARIAN.LIB_T_USER
  add unique (ID_NUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating sequence LIB_SQ_BORROWING
prompt ==================================
prompt
create sequence FREE_LIBRARIAN.LIB_SQ_BORROWING
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence LIB_SQ_DOC_IDENTIFIER
prompt =======================================
prompt
create sequence FREE_LIBRARIAN.LIB_SQ_DOC_IDENTIFIER
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence LIB_SQ_DOC_IDENTIFIER_TYPE
prompt ============================================
prompt
create sequence FREE_LIBRARIAN.LIB_SQ_DOC_IDENTIFIER_TYPE
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence LIB_SQ_DOCUMENT
prompt =================================
prompt
create sequence FREE_LIBRARIAN.LIB_SQ_DOCUMENT
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence LIB_SQ_USER
prompt =============================
prompt
create sequence FREE_LIBRARIAN.LIB_SQ_USER
minvalue 1
maxvalue 500000
start with 100000
increment by 1
cache 20;


spool off
