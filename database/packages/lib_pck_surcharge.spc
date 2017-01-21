CREATE OR REPLACE PACKAGE lib_pck_surcharge IS
	
  co_package CONSTANT VARCHAR2(30) := 'lib_pck_surcharge';
	co_amount  CONSTANT NUMBER       := 20;
	co_period  CONSTANT VARCHAR2(30) := 'DAILY';
	
	PROCEDURE raise_surcharge ( p_user_id NUMBER
                             ,p_amount  NUMBER );
	
	PROCEDURE raise_all_surcharge;

END lib_pck_surcharge;
/
