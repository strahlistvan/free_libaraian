DROP TABLE lib_user_h CASCADE CONSTRAINTS;

CREATE TABLE lib_user_h (
  user_id   NUMBER,
  name      VARCHAR2(100 CHAR),
  email     VARCHAR2(200 CHAR),
  birthdate DATE,
  id_number VARCHAR2(30 CHAR),
  
  modified_by     VARCHAR2(100 CHAR),
  dml_flag        VARCHAR2(1),
  mod_date        DATE,
  version_no      NUMBER
);

COMMENT ON TABLE lib_user_h IS 'User of the library. It can be member, librarian, or system administrator';

COMMENT ON COLUMN lib_user_h.user_id IS 'Unique user library identifier.';
COMMENT ON COLUMN lib_user_h.name IS 'Library user''s natural name. Required.';
COMMENT ON COLUMN lib_user_h.email IS 'Library user''s e-mail address.';
COMMENT ON COLUMN lib_user_h.birthdate IS 'Library user''s date of birth.';
COMMENT ON COLUMN lib_user_h.id_number IS 'Personal identifier number.';
