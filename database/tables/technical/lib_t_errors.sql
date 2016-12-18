DROP TABLE lib_t_errors CASCADE CONSTRAINT
/

CREATE TABLE lib_t_errors (
  err_id      NUMBER,
  err_text    VARCHAR2(1000 CHAR) NOT NULL,
  call_proc   VARCHAR2(121 CHAR) NOT NULL,
  sql_code    NUMBER,
  sql_errm    VARCHAR2(200 CHAR),
  debug_point NUMBER,
  err_time    DATE NOT NULL )
/

ALTER TABLE lib_t_errors
ADD CONSTRAINT lib_pk_errors
PRIMARY KEY(err_id)
/
