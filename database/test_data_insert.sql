INSERT INTO lib_t_user(user_id,
                       name,
                       email,
                       birthdate,
                       id_number )
VALUES (1,
        'Teszt Elek',
        'teszt@elek.hu',
        ADD_MONTHS(SYSDATE, -240),
        '112233AA' );     

-- Add ISBN number as a document identifier   
INSERT INTO lib_t_doc_identifier_type(id,
                                      name,
                                      format)
VALUES (1, 'ISBN', '/\d{13}/');
 
-- New ISBN numbers
INSERT INTO lib_t_doc_identifier(id,
                                 doc_identifier_type_id,
                                 content)
VALUES (1,
        1,
        '1234567890000');

INSERT INTO lib_t_doc_identifier(id,
                                 doc_identifier_type_id,
                                 content)
VALUES (2,
        1,
        '1234567890001');
				
INSERT INTO lib_t_doc_identifier(id,
                                 doc_identifier_type_id,
                                 content)
VALUES (3,
        1,
        '1234567890002');								
				
-- New documents (with ISBN)				
INSERT INTO lib_t_document(instance_id,
                           doc_type_id,
                           doc_identifier_id,
                           is_borrowable)
values(1, 1, 1, 1);

INSERT INTO lib_t_document(instance_id,
                           doc_type_id,
                           doc_identifier_id,
                           is_borrowable)
values(2, 1, 1, 1);

INSERT INTO lib_t_document(instance_id,
                           doc_type_id,
                           doc_identifier_id,
                           is_borrowable)
values(3, 1, 1, 1);			
	
-- New books     
INSERT INTO lib_t_book( instance_id,
                       author,
                       title,
                       pages,
                       publish_year,
                       short_description,
                       eto_number,
                       cutter_number)        
VALUES ( 1,
         'G�rdonyi G�za',
         'A l�thatatlan ember',
         350,
         2001,
         'Vannak benne hunok meg r�maiak is',
         NULL,
         'G 11' );
                       
INSERT INTO lib_t_book( instance_id,
                       author,
                       title,
                       pages,
                       publish_year,
                       short_description,
                       eto_number,
                       cutter_number)        
VALUES ( 2,
         'G�rdonyi G�za',
         'Egri csillagok',
         300,
         2002,
         'Vannak benne t�r�k�k meg magyarok is',
         NULL,
         'G 11' );
        
INSERT INTO lib_t_book(instance_id,
                       author,
                       title,
                       pages,
                       publish_year,
                       short_description,
                       eto_number,
                       cutter_number)        
VALUES ( 3,
         'Moln�r Ferenc de nem Caramel',
         'P�l utcai fi�k',
         220,
         1987,
         'Vannak benne v�r�singesek.',
         NULL,
         'G 11' );

COMMIT;

select * FROM lib_t_book;
select * FROM lib_t_document;
