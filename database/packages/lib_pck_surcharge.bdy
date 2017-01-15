CREATE OR REPLACE PACKAGE BODY lib_pck_surcharge IS

  PROCEDURE raise_surcharge ( p_user_id NUMBER
                             ,p_amount  NUMBER )
  IS
    co_procedure CONSTANT VARCHAR2(61) := 'raise_surcharge.'||co_package;
    v_debug               NUMBER;
    v_surcharge           NUMBER;
    v_overdue_count       NUMBER;
  BEGIN
    v_debug := 10;
    
    SELECT COUNT(DISTINCT b.document_id)
      INTO v_overdue_count
      FROM lib_t_borrowing b
     WHERE b.user_id = p_user_id
       AND b.end_date > TRUNC(SYSDATE);
        
     v_debug := 20;
     SELECT u.surcharge
       INTO v_surcharge
       FROM lib_t_user u
     WHERE u.user_id = p_user_id;
      
     v_debug := 30;
     UPDATE lib_t_user u
       SET u.surcharge = v_surcharge + v_overdue_count*p_amount
      WHERE u.user_id = p_user_id;
     COMMIT; 
      
     v_debug := 40;
     dbms_output.put_line(p_user_id||': '||(v_surcharge+v_overdue_count*p_amount)||'$');
      
	EXCEPTION
		WHEN OTHERS THEN
			lib_prc_log_errors( p_err_text => dbms_utility.format_error_backtrace
												 ,p_err_msg => SQLERRM
												 ,p_sql_code => SQLCODE                         ,p_call_proc => co_procedure
												 ,p_debug_point => v_debug );
			dbms_output.put_line(co_procedure||' Error!');  
	END raise_surcharge;
	
  PROCEDURE raise_all_surcharge ( p_amount NUMBER )
	IS
	  co_procedure CONSTANT VARCHAR2(61) := 'raise_all_surcharge.'||co_package;
    v_debug               NUMBER;
	BEGIN
	  
		FOR cur IN (SELECT user_id FROM lib_t_user)
		LOOP
			raise_surcharge( p_user_id => cur.user_id
			                ,p_amount  => p_amount );
		END LOOP;	

	EXCEPTION
    WHEN OTHERS THEN
      lib_prc_log_errors( p_err_text => dbms_utility.format_error_backtrace
                         ,p_err_msg => SQLERRM
                         ,p_sql_code => SQLCODE                         ,p_call_proc => co_procedure
                         ,p_debug_point => v_debug );
      dbms_output.put_line(co_procedure||' Error!');	
	END raise_all_surcharge;
	  
END lib_pck_surcharge;
/
