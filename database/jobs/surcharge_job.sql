BEGIN
  dbms_scheduler.create_job( 'upload_surcharge_job'
                             ,program_name=>'upload_surcharge' );


  dbms_scheduler.set_job_argument_value('upload_surcharge_job',1, lib_pck_surcharge.co_amount );

 DBMS_SCHEDULER.SET_ATTRIBUTE (
   name         =>  'upload_surcharge_job',
   attribute    =>  'repeat_interval',
   value        =>  'freq=weekly; byday=wed');
                            
  dbms_scheduler.enable('upload_surcharge_job');  
END;
