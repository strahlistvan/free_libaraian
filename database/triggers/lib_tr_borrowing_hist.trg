CREATE OR REPLACE TRIGGER lib_htr_borrowing_hist
AFTER INSERT OR UPDATE OR DELETE ON lib_t_borrowing
FOR EACH ROW
DECLARE  
  v_version_no  NUMBER;
  v_dml_flag    CHAR(1) := 'D';
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
		INTO  v_version_no
		FROM lib_ht_borrowing t
		WHERE t.id = :NEW.id; 
		
		INSERT INTO lib_ht_borrowing
			(id
			,user_id
			,document_id
			,end_date
			,renewal_count
			,surcharge
			,modified_by
			,dml_flag
			,mod_date
			,version_no)
		VALUES
			(:NEW.id
			,:NEW.user_id
			,:NEW.document_id
			,:NEW.end_date
			,:NEW.renewal_count
			,:NEW.surcharge
			,(SELECT user FROM dual)
			,v_dml_flag
			,SYSDATE
			,v_version_no
			)
	;  

	ELSE
		SELECT NVL(MAX(t.version_no), 0)+1
		INTO  v_version_no
		FROM lib_ht_borrowing t
		WHERE t.id = :OLD.id; 
	  
		INSERT INTO lib_ht_borrowing
			(id
			,user_id
			,document_id
			,end_date
			,renewal_count
			,surcharge
			,modified_by
			,dml_flag
			,mod_date
			,version_no
			)
		VALUES
			(:OLD.id
			,:OLD.user_id
			,:OLD.document_id
			,:OLD.end_date
			,:OLD.renewal_count
			,:OLD.surcharge
			,(SELECT user FROM dual)
			,v_dml_flag
			,SYSDATE
			,v_version_no
			)
	;
	END IF;
END lib_htr_user_hist;
/
