CREATE OR REPLACE PACKAGE BODY lib_pck_user_action
AS
  co_package CONSTANT VARCHAR2(30) := 'lib_pck_user_action';  

  PROCEDURE new_borrowing( p_user_id NUMBER
                          ,p_document_id NUMBER )
  IS
    v_user_count  PLS_INTEGER;
    v_doc_count   PLS_INTEGER;
    v_debug_point PLS_INTEGER;
    co_procedure  VARCHAR2(30) := 'new_borrowing';
  BEGIN
    
    v_debug_point := 0;
    SELECT COUNT(*) 
      INTO v_user_count
      FROM lib_t_user u
     WHERE u.user_id = p_user_id;
     
    v_debug_point := 1;
    SELECT COUNT(*)
      INTO v_doc_count
      FROM lib_t_book b
     WHERE b.instance_id = p_document_id;
     
    v_debug_point := 2; 
    IF v_doc_count = 0 OR v_user_count = 0
    THEN
      RAISE NO_DATA_FOUND;
    END IF;
      
    INSERT INTO lib_t_borrowing(user_id,
                                document_id,
                                end_date,
                                renewal_count,
                                surcharge)
    VALUES( p_user_id,
            p_document_id,
            ADD_MONTHS(SYSDATE, 1),
            0,
            0 );
    COMMIT;
    
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      
     lib_prc_log_errors( p_err_text => 'Error !!!!'
                        ,p_err_msg => SQLERRM
                        ,p_sql_code => SQLCODE
                        ,p_call_proc => co_package||'.'||co_procedure
                        ,p_debug_point => v_debug_point );
      
      
      dbms_output.put_line('No data found...');
  END new_borrowing;

END lib_pck_user_action;
/
