CREATE OR REPLACE PACKAGE lib_pck_user_action
AS
  co_package      CONSTANT VARCHAR2(30) := 'lib_pck_user_action';  
  co_max_renewals CONSTANT NUMBER       := 2;

  PROCEDURE new_borrowing( p_user_id     IN NUMBER
                          ,p_document_id IN NUMBER );
                          
  PROCEDURE elongation( p_user_id     IN NUMBER
                       ,p_document_id IN NUMBER );
                       
END lib_pck_user_action;
/
