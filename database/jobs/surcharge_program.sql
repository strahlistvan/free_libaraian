BEGIN
  DBMS_SCHEDULER.CREATE_PROGRAM ( program_name        => 'upload_surcharge',
                                  program_action      => 'lib_pck_surcharge.raise_all_surcharge',
                                  program_type        => 'STORED_PROCEDURE',
                                  number_of_arguments => 1,
                                  enabled             => FALSE );

  DBMS_SCHEDULER.DEFINE_PROGRAM_ARGUMENT( program_name=>'upload_surcharge',
                                          argument_position=>1,
                                          argument_type=>'NUMBER' );

  DBMS_SCHEDULER.ENABLE('upload_surcharge');
END;
/
