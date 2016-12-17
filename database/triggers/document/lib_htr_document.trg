CREATE OR REPLACE TRIGGER lib_htr_document
AFTER INSERT OR UPDATE OR DELETE ON lib_t_document
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
			FROM lib_ht_document t
		 WHERE t.instance_id = :NEW.instance_id; 
	 
		INSERT INTO lib_ht_document(instance_id,
															 doc_type_id,
															 is_borrowable,
															 modified_by,
															 dml_flag,
															 mod_date,
															 version_no)
		VALUES (:NEW.instance_id
						,:NEW.doc_type_id
						,:NEW.is_borrowable
						,(SELECT user FROM dual)
						,v_dml_flag
						,SYSDATE
						,v_version_no
					 );
		
	ELSE
		SELECT NVL(MAX(t.version_no), 0)+1
			INTO v_version_no
			FROM lib_ht_document t
		 WHERE t.instance_id = :OLD.instance_id; 
	  
		INSERT INTO lib_ht_document(instance_id,
															 doc_type_id,
															 is_borrowable,
															 modified_by,
															 dml_flag,
															 mod_date,
															 version_no)
		VALUES ( :OLD.instance_id
						,:OLD.doc_type_id
						,:OLD.is_borrowable
						,(SELECT user FROM dual)
						,v_dml_flag
						,SYSDATE
						,v_version_no
					 );
	END IF;
END lib_htr_document;
/
