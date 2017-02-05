CREATE OR REPLACE PROCEDURE lib_prc_log_trace(p_trace_text IN VARCHAR2) 
IS
  co_procedure    VARCHAR2(30) := 'lib_prc_log_trace';
  co_max_length   NUMBER;
	v_trace_message VARCHAR2(4000 CHAR);
	v_debug         NUMBER;
BEGIN
 v_debug := 10;
 SELECT char_length 
   INTO co_max_length
   FROM user_tab_columns
  WHERE table_name = 'LIB_T_TRACE_LOGS' 
    AND column_name = 'MESSAGE';	
 
  v_debug:= 20;
  v_trace_message := SUBSTR( str1 => p_trace_text || chr(13) || chr(10)
	                                   || dbms_utility.format_call_stack
                             ,pos  => 1 
                             ,len  => co_max_length );

  v_debug := 30;
	INSERT INTO lib_t_trace_logs( log_id
                               ,message
                               ,called_proc
                               ,log_time
                               ,call_user )
	VALUES( lib_sq_trace_logs.NEXTVAL
	       ,v_trace_message
				 ,$$PLSQL_UNIT
				 ,SYSDATE 
				 ,USER );
	COMMIT;
	
EXCEPTION
  WHEN OTHERS THEN
    lib_prc_log_errors( p_err_text => dbms_utility.format_error_backtrace
                       ,p_err_msg => SQLERRM
                       ,p_sql_code => SQLCODE                        
											 ,p_call_proc => co_procedure
                       ,p_debug_point => v_debug );
    dbms_output.put_line(co_procedure||' Error!'); 				 
END lib_prc_log_trace;
/
