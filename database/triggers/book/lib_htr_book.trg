CREATE OR REPLACE TRIGGER lib_htr_book
AFTER INSERT OR UPDATE OR DELETE ON lib_t_book
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
    FROM lib_ht_book t
   WHERE t.instance_id = :NEW.instance_id; 
  
  INSERT INTO lib_ht_book(instance_id,
                          author,
                          title,
                          doc_identifier_id,
                          pages,
                          publish_year,
                          short_description,
                          eto_number_id,
                          cutter_number_id,
                          is_borrowable,
                          modified_by,
                          dml_flag,
                          mod_date,
                          version_no)
	VALUES( :NEW.instance_id,
	        :NEW.author,
					:NEW.doc_identifier_id,
					:NEW.doc_identifier_id,
					:NEW.pages,
					:NEW.publish_year,
					:NEW.short_description,
					:NEW.eto_number,
					:NEW.cutter_number,
					1,
					(SELECT user FROM dual),
					v_dml_flag,
					SYSDATE,
					v_version_no );
 

ELSE
  SELECT NVL(MAX(t.version_no), 0)+1
  INTO v_version_no
  FROM lib_ht_book t
  WHERE t.instance_id = :OLD.instance_id; 
  
  INSERT INTO lib_ht_book(instance_id,
                          author,
                          title,
                          doc_identifier_id,
                          pages,
                          publish_year,
                          short_description,
                          eto_number_id,
                          cutter_number_id,
                          is_borrowable,
                          modified_by,
                          dml_flag,
                          mod_date,
                          version_no)
  VALUES( :OLD.instance_id,
          :OLD.author,
          :OLD.doc_identifier_id,
          :OLD.doc_identifier_id,
          :OLD.pages,
          :OLD.publish_year,
          :OLD.short_description,
          :OLD.eto_number,
          :OLD.cutter_number,
          1,
          (SELECT user FROM dual),
          v_dml_flag,
          SYSDATE,
          v_version_no );
END IF;
END lib_htr_book;
/
