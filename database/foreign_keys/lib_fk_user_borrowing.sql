ALTER TABLE lib_t_borrowing ADD CONSTRAINT lib_fk_user_borrowing
FOREIGN KEY (user_id) REFERENCES lib_t_user(user_id);
