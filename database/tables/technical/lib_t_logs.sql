DROP TABLE lib_t_trace_logs CASCADE CONSTRAINTS
/

CREATE TABLE lib_t_trace_logs ( 
  log_id       NUMBER,
	message      VARCHAR2(2000 CHAR),
	called_proc  VARCHAR2(92 CHAR),
	log_time     TIMESTAMP,
	call_user    VARCHAR2(30 CHAR)	
)
/

ALTER TABLE lib_t_trace_logs 
ADD CONSTRAINT lib_pk_trace_logs PRIMARY KEY (log_id)
/
