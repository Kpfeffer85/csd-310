DROP USER IF EXISTS 'whatabook_user'@'localhost';

CREATE USER 'whatabook_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MySQL8IsGreat!';

GRANT ALL PRIVILEGES ON whatabook.* TO'whatabook_user'@'localhost';

DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS wishlist;
DROP TABLE IF EXISTS store;


CREATE TABLE user (
    user_id     INT             NOT NULL        AUTO_INCREMENT,
    first_name  VARCHAR(75)     NOT NULL,
    Last_name   VARCHAR(75)     NOT NULL,
    PRIMARY KEY(user_id)
); 

CREATE TABLE book (
    book_id     INT             NOT NULL        AUTO_INCREMENT,
    book_name   VARCHAR(200)    NOT NULL,
    details     VARCHAR(500),
    author      VARCHAR(200)    NOT NULL,
    PRIMARY KEY(book_id)
);

CREATE TABLE wishlist (
    wishlist_id INT             NOT NULL        AUTO_INCREMENT,
    user_id     INT             NOT NULL,
    book_id     INT             NOT NULL,
    PRIMARY KEY(wishlist_id),
    FOREIGN KEY(user_id) 
        REFERENCES user(user_id),
    FOREIGN KEY(book_id)
        REFERENCES book(book_id)
);

CREATE TABLE store (
    store_id    INT             NOT NULL        AUTO_INCREMENT,
    locale      VARCHAR(500)    NOT NULL,
    PRIMARY KEY(store_id)
);


INSERT INTO store(locale)
    VALUES('2501 S. 90th St. #111');

INSERT INTO book(book_name, details, author) 
    VALUES('Lincoln Highway', 'A Gentleman in Moscow.', 'Amor Towles');

INSERT INTO book(book_name, details, author) 
    VALUES('Crying in H Mart', 'Powerful memoir about growing up Korean American.', 'Michelle Zauner');

INSERT INTO book(book_name, details, author) 
    VALUES('The Plot', 'A propulsive read about a story too good not to steal.', 'Jean Hanfe Korelitz');

INSERT INTO book(book_name, details, author) 
    VALUES('How the World Is Passed', 'A Reckoning with the History of Slavery Across America.', 'Clint Smith');

INSERT INTO book(book_name, details, author) 
    VALUES('The Four Winds', 'A powerful American epic about love and heroism and hope, set during the Great Depression.', 'Kristin Hannah');

INSERT INTO book(book_name, details, author) 
    VALUES('Empire Of Pain', 'The Secret History of the Sackler Dynasty .', 'Patrick Radden Keefe');

INSERT INTO book(book_name, details, author) 
    VALUES('Harlem Shuffle', 'About race, power and the history of Harlem all disguised as a thrill-ride crime novel.', 'Colson Whitehead');

INSERT INTO book(book_name, details, author) 
    VALUES('Great Circle', 'The unforgettable story of a daredevil female aviator determined to chart her own course in life, at any cost.', 'Maggie Shipstead');

INSERT INTO book(book_name, details, author) 
    VALUES('Project Hail Mary', 'A lone astronaut must save the earth from disaster .', 'Andy Weir');

INSERT INTO user(first_name, last_name) 
    VALUES('Kurt', 'Pfeffer');

INSERT INTO user(first_name, last_name)
    VALUES('Max', 'Pfeffer');

INSERT INTO user(first_name, last_name)
    VALUES('Alex', 'Pfeffer');

INSERT INTO wishlist(user_id, book_id) 
    VALUES((SELECT user_id FROM user WHERE first_name = 'Alex' AND last_name = 'Pfeffer'), (SELECT book_id FROM book WHERE book_name = 'Harlem Shuffle'));

INSERT INTO wishlist(user_id, book_id) 
    VALUES((SELECT user_id FROM user WHERE first_name = 'Max' AND last_name = 'Pfeffer'), (SELECT book_id FROM book WHERE book_name = 'Project Hail Mary'));

INSERT INTO wishlist(user_id, book_id)  
    VALUES((SELECT user_id FROM user WHERE first_name = 'Kurt' AND last_name = 'Pfeffer'), (SELECT book_id FROM book WHERE book_name = 'Empire Of Pain'));
