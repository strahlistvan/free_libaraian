CREATE OR REPLACE TRIGGER lib_htr_doc_identifier
  AFTER INSERT OR UPDATE OR DELETE ON lib_t_doc_identifier
  FOR EACH ROW
DECLARE
  v_version_no NUMBER;
  v_dml_flag   CHAR(1) := 'D';
BEGIN

  IF INSERTING
     OR UPDATING
  THEN
    IF INSERTING
    THEN
      v_dml_flag := 'I';
    ELSE
      v_dml_flag := 'U';
    END IF;
  
    SELECT NVL(MAX(t.version_no), 0) + 1
      INTO v_version_no
      FROM lib_ht_doc_identifier t
     WHERE t.id = :NEW.id;
    
     INSERT INTO lib_ht_doc_identifier(id,
                                       doc_identifier_type_id,
                                       content,
                                       modified_by,
                                       dml_flag,
                                       mod_date,
                                       version_no)
		 VALUES (v_version_no,
		         :NEW.doc_identifier_type_id,
						 :NEW.content,
						 (SELECT user FROM dual),
						 v_dml_flag,
						 SYSDATE,
						 v_version_no
						);
		
  ELSE
    SELECT NVL(MAX(t.version_no), 0) + 1
      INTO v_version_no
      FROM lib_ht_doc_identifier t
     WHERE t.id = :OLD.id;
  
     INSERT INTO lib_ht_doc_identifier(id,
                                       doc_identifier_type_id,
                                       content,
                                       modified_by,
                                       dml_flag,
                                       mod_date,
                                       version_no)
     VALUES (v_version_no,
             :OLD.doc_identifier_type_id,
             :OLD.content,
             (SELECT user FROM dual),
             v_dml_flag,
             SYSDATE,
             v_version_no
            );   
  END IF;
END lib_htr_doc_identifier;
/
