INSERT INTO lib_t_user(user_id,
                       name,
                       email,
                       birthdate,
                       id_number,
                       is_deleted)
VALUES (1,
        'Teszt Elek',
        'teszt@elek.hu',
        ADD_MONTHS(SYSDATE, -240),
        '112233AA',
        0);     
   
INSERT INTO lib_t_doc_identifier_type(id,
                                      name,
                                      format)
VALUES (1, 'ISBN', '/\d{13}/');

INSERT INTO lib_t_doc_identifier(id,
                                 doc_identifier_type_id,
                                 content)
VALUES (1,
        1,
        '1234567890000');
               
INSERT INTO lib_t_document(instance_id,
                           doc_type_id,
                           is_borrowable)
VALUES(1,1,1); 
                
INSERT INTO lib_t_book(
                       author,
                       title,
                       pages,
                       publish_year,
                       short_description,
                       eto_number,
                       cutter_number)        
VALUES ( 'Gárdonyi Géza',
         'A láthatatlan ember',
         300,
         2002,
         'Vannak benne hunok meg rómaiak is',
         NULL,
         'G 11' );
COMMIT;

select * FROM lib_t_book;
select * FROM lib_t_document;
