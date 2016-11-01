DROP TABLE lib_user CASCADE CONSTRAINTS;

CREATE TABLE lib_user (
  user_id   NUMBER,
  name      VARCHAR2(100 CHAR) NOT NULL,
  email     VARCHAR2(200 CHAR),
  birthdate DATE,
  id_number VARCHAR2(30 CHAR) UNIQUE,
  
  modified_by     VARCHAR2(100 CHAR),
  dml_flag        VARCHAR2(1),
  mod_date        DATE,
  version_no      NUMBER
);

ALTER TABLE lib_user ADD CONSTRAINT lib_pk_user 
PRIMARY KEY (user_id);

COMMENT ON TABLE lib_user IS 'User of the library. It can be member, librarian, or system administrator';

COMMENT ON COLUMN lib_user.user_id IS 'Unique user library identifier.';
COMMENT ON COLUMN lib_user.name IS 'Library user''s natural name. Required.';
COMMENT ON COLUMN lib_user.email IS 'Library user''s e-mail address.';
COMMENT ON COLUMN lib_user.birthdate IS 'Library user''s date of birth.';
COMMENT ON COLUMN lib_user.id_number IS 'Personal identifier number.';
