CREATE OR REPLACE PACKAGE lib_pck_user_action
IS
  
  PROCEDURE new_borrowing( p_user_id NUMBER
                          ,p_document_id NUMBER
                         ); 

END lib_pck_user_action;
/
