CREATE OR REPLACE PACKAGE BODY lib_pck_user_action
AS

  FUNCTION is_user_exists( p_user_id IN NUMBER ) RETURN BOOLEAN 
  IS
    v_user_count PLS_INTEGER;
  BEGIN
     SELECT COUNT(*) 
      INTO v_user_count
      FROM lib_t_user u
     WHERE u.user_id = p_user_id;
    RETURN (v_user_count != 0);        
  END is_user_exists;
  
-------------------------------------------------------------------------------
 
  FUNCTION is_document_exists( p_document_id IN NUMBER ) RETURN BOOLEAN
  IS
    v_doc_count PLS_INTEGER;
  BEGIN
    SELECT COUNT(*)
    INTO v_doc_count
    FROM lib_t_document d
      WHERE d.instance_id = p_document_id; 
    RETURN (v_doc_count != 0);
  END is_document_exists;  

-------------------------------------------------------------------------------

  FUNCTION is_borrowing_exists( p_user_id     IN NUMBER
                               ,p_document_id IN NUMBER )
  RETURN BOOLEAN 
  IS
    v_borrowing_count NUMBER;
  BEGIN 
    SELECT COUNT(*)
      INTO v_borrowing_count
      FROM lib_t_borrowing bor
     WHERE bor.user_id = p_user_id
       AND bor.document_id = p_document_id; 
    RETURN (v_borrowing_count != 0); 
  END is_borrowing_exists;

-------------------------------------------------------------------------------

  PROCEDURE new_borrowing( p_user_id     IN NUMBER
                          ,p_document_id IN NUMBER )
  IS
    ex_borrowing_exists   EXCEPTION;
    v_debug_point         PLS_INTEGER;
    co_procedure CONSTANT VARCHAR2(30) := 'new_borrowing';
    v_borrowing_count     PLS_INTEGER;
  BEGIN
    
    v_debug_point := 0;

    v_debug_point := 2; 
    IF NOT is_user_exists(p_user_id)
       OR NOT is_document_exists(p_document_id)
    THEN
      RAISE NO_DATA_FOUND;
    END IF;
    
    IF v_borrowing_count > 0
    THEN
      RAISE ex_borrowing_exists;
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
    v_debug_point := 3;
    COMMIT;
    
  EXCEPTION
    WHEN OTHERS THEN 
     lib_prc_log_errors( p_err_text => dbms_utility.format_error_backtrace
                        ,p_err_msg => SQLERRM
                        ,p_sql_code => SQLCODE
                        ,p_call_proc => co_package||'.'||co_procedure
                        ,p_debug_point => v_debug_point );     
  END new_borrowing;

-------------------------------------------------------------------------------

  PROCEDURE elongation( p_user_id     IN NUMBER
                       ,p_document_id IN NUMBER )
  IS
    ex_borrowing_not_exists EXCEPTION;
    v_debug_point           PLS_INTEGER;
    v_renewal_count         NUMBER;
    co_procedure  CONSTANT  VARCHAR2(30) := 'elongation';
  BEGIN
    
    v_debug_point := 1; 
    IF NOT is_user_exists(p_user_id)
       OR NOT is_document_exists(p_document_id)
    THEN
      RAISE NO_DATA_FOUND;
    END IF;
    
    v_debug_point := 2;
    SELECT b.renewal_count
      INTO v_renewal_count
      FROM lib_t_borrowing b
     WHERE b.user_id = p_user_id
       AND b.document_id = p_document_id;
    
    v_debug_point := 3;
    
    IF v_renewal_count > co_max_renewals
    THEN  
      v_debug_point := 4;
      UPDATE lib_t_borrowing b
        SET b.end_date = ADD_MONTHS(SYSDATE, 1)
           ,b.renewal_count = b.renewal_count + 1
       WHERE b.user_id = p_user_id
         AND b.document_id = p_document_id;
    END IF;
    
  EXCEPTION
    WHEN OTHERS THEN 
     lib_prc_log_errors( p_err_text => dbms_utility.format_error_backtrace
                        ,p_err_msg => SQLERRM
                        ,p_sql_code => SQLCODE
                        ,p_call_proc => co_package||'.'||co_procedure
                        ,p_debug_point => v_debug_point );     
  END elongation;  
  
-------------------------------------------------------------------------------

END lib_pck_user_action;
/
