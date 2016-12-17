DROP TABLE lib_t_user CASCADE CONSTRAINTS
/

CREATE TABLE lib_t_user (
   user_id    NUMBER
  ,name       VARCHAR2(100 CHAR) NOT NULL
  ,email      VARCHAR2(200 CHAR)
  ,birthdate  DATE
  ,id_number  VARCHAR2(30 CHAR) UNIQUE
  ,is_deleted CHAR(1)
)
/

ALTER TABLE lib_t_user ADD CONSTRAINT lib_pk_user 
PRIMARY KEY (user_id)
/

COMMENT ON TABLE lib_t_user 
IS 'User of the library. It can be member, librarian, or system administrator'
/

COMMENT ON COLUMN lib_t_user.user_id 
IS 'Unique user library identifier.'
/
COMMENT ON COLUMN lib_t_user.name 
IS 'Library user''s natural name. Required.'
/
COMMENT ON COLUMN lib_t_user.email 
IS 'Library user''s e-mail address.'
/
COMMENT ON COLUMN lib_t_user.birthdate 
IS 'Library user''s date of birth.'
/
COMMENT ON COLUMN lib_t_user.id_number 
IS 'Personal identifier number.'
/
