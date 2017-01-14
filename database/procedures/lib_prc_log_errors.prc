CREATE OR REPLACE PROCEDURE lib_prc_log_errors( p_err_text    VARCHAR2
                                               ,p_err_msg     VARCHAR2   DEFAULT 'NULL'
                                               ,p_sql_code    NUMBER     DEFAULT 0
                                               ,p_call_proc   VARCHAR2   DEFAULT 'NULL'
                                               ,p_debug_point NUMBER     DEFAULT 0
                                              )
IS
  PRAGMA AUTONOMOUS_TRANSACTION;
  v_err_msg  VARCHAR2(200 CHAR)  := SUBSTR(p_err_msg, 1, 200);
  v_err_text VARCHAR2(1000 CHAR) := SUBSTR(p_err_text, 1, 1000);
BEGIN
  INSERT INTO lib_t_errors(err_id,
                           err_text,
                           call_proc,
                           sql_code,
                           sql_errm,
                           debug_point,
                           err_time)
  VALUES( lib_sq_errors.NEXTVAL,
          v_err_text,
          p_call_proc,
          p_sql_code,
          v_err_msg,
          p_debug_point,
          SYSDATE ) ;
  COMMIT;
END lib_prc_log_errors;
/
