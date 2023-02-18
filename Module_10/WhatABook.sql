DROP USER IF EXISTS 'whatabook_user'@'localhost';

CREATE USER 'whatabook_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MySQL8IsGreat!';

GRANT ALL PRIVILEGES ON whatabook.* TO'whatabook_user'@'localhost';

ALTER TABLE wishlist DROP FOREIGN KEY fk_book;
ALTER TABLE wishlist DROP FOREIGN KEY fk_user;

DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS wishlist;
DROP TABLE IF EXISTS user;

CREATE TABLE store (
    store_id    INT             NOT NULL    AUTO_INCREMENT,
    locale      VARCHAR(500)    NOT NULL,
    PRIMARY KEY(store_id)
);

CREATE TABLE book (
    book_id     INT             NOT NULL    AUTO_INCREMENT,
    book_name   VARCHAR(200)    NOT NULL,
    author      VARCHAR(200)    NOT NULL,
    details     VARCHAR(500),
    PRIMARY KEY(book_id)
);

CREATE TABLE user (
    user_id         INT         NOT NULL    AUTO_INCREMENT,
    first_name      VARCHAR(75) NOT NULL,
    last_name       VARCHAR(75) NOT NULL,
    PRIMARY KEY(user_id) 
);

CREATE TABLE wishlist (
    wishlist_id     INT         NOT NULL    AUTO_INCREMENT,
    user_id         INT         NOT NULL,
    book_id         INT         NOT NULL,
    PRIMARY KEY (wishlist_id),
    CONSTRAINT fk_book
    FOREIGN KEY (book_id)
        REFERENCES book(book_id),
    CONSTRAINT fk_user
    FOREIGN KEY (user_id)
        REFERENCES user(user_Id)
);

INSERT INTO store(locale)
    VALUES('1111 Real st, Boise, Idaho, 83648');

INSERT INTO book(book_name, author, details)
    VALUES('Physics', 'Isaac Newton', 'How it works!');

INSERT INTO book(book_name, author, details)
    VALUES('Basket Weaving', 'Lola Maui', 'Tips and tricks!');

INSERT INTO book(book_name, author, details)
    VALUES('Algebra', 'Matthews Angle', "Formulas and such!");

INSERT INTO book(book_name, author)
    VALUES('English composistion', 'John Grammer');

INSERT INTO book(book_name, author)
    VALUES('Pyschology', 'Rose Pew');

INSERT INTO book(book_name, author)
    VALUES('Public Speaking', 'Timothy Speaks');

INSERT INTO book(book_name, author)
    VALUES('Computer Science', 'Gary Keys');

INSERT INTO book(book_name, author)
    VALUES('Cybersecurity', 'Cynthia Hats');

INSERT INTO book(book_name, author)
    VALUES('Masonry', 'Tom Stone');

INSERT INTO user(first_name, last_name) 
    VALUES('John', 'Deemer');

INSERT INTO user(first_name, last_name)
    VALUES('Miranda', 'Tylers');

INSERT INTO user(first_name, last_name)
    VALUES('Myles', 'Adams');

INSERT INTO wishlist(user_id, book_id) 
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'John'), 
        (SELECT book_id FROM book WHERE book_name = 'English composistion')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Miranda'),
        (SELECT book_id FROM book WHERE book_name = 'Computer Science')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Myles'),
        (SELECT book_id FROM book WHERE book_name = 'Basket Weaving')
    );
