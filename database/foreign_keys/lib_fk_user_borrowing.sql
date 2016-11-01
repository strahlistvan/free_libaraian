ALTER TABLE lib_borrowing ADD CONSTRAINT lib_fk_user_borrowing
FOREIGN KEY (user_id) REFERENCES lib_user(user_id);
