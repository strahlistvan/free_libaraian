CREATE OR REPLACE TRIGGER lib_tr_user_hist
AFTER INSERT OR UPDATE OR DELETE ON lib_t_user
FOR EACH ROW
DECLARE  
  v_version_no NUMBER;
  v_dml_flag   CHAR(1) := 'D';
BEGIN 

IF INSERTING OR UPDATING 
THEN	
  IF INSERTING 
  THEN
    v_dml_flag := 'I';
  ELSE
		v_dml_flag := 'U';	
  END IF;  
  
  SELECT NVL(MAX(t.version_no), 0)+1
  INTO v_version_no
  FROM lib_ht_user t
  WHERE t.user_id = :NEW.user_id; 
	
  INSERT INTO lib_ht_user( user_id
                          ,name
                          ,email
                          ,birthdate
                          ,id_number
                          ,modified_by
                          ,dml_flag
                          ,mod_date
                          ,version_no
													)
  VALUES ( :NEW.user_id
          ,:NEW.name
					,:NEW.email
					,:NEW.birthdate
					,:NEW.id_number
					,(SELECT user FROM dual)
					,v_dml_flag
					,SYSDATE
					,v_version_no
	       )
  ;
ELSE
  SELECT NVL(MAX(t.version_no), 0)+1
  INTO v_version_no
  FROM lib_ht_user t
  WHERE t.user_id = :OLD.user_id; 
  
  INSERT INTO lib_ht_user( user_id
                          ,name
                          ,email
                          ,birthdate
                          ,id_number
                          ,modified_by
                          ,dml_flag
                          ,mod_date
                          ,version_no
                          )
  VALUES ( :OLD.user_id
          ,:OLD.name
          ,:OLD.email
          ,:OLD.birthdate
          ,:OLD.id_number
          ,(SELECT user FROM dual)
          ,v_version_no
          ,SYSDATE
          ,v_version_no
         )
  ;
END IF;
END lib_tr_user_hist;
/
