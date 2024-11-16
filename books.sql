CREATE TABLE IF NOT EXISTS books(
    book_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    author INTEGER UNSIGNED,
    title VARCHAR(100) NOT NULL,
    year INTEGER UNSIGNED NOT NULL DEFAULT 1900,
    language VARCHAR(2) NOT NULL DEFAULT 'es' COMMENT 'ISO 639-1',
    cover_url VARCHAR(500),
    price DOUBLE(6, 2) NOT NULL DEFAULT 10.0,
    sellable TINYINT(1) DEFAULT 1,
    copies INTEGER NOT NULL DEFAULT 1,
    description TEXT
);

CREATE TABLE IF NOT EXISTS authors(
    author_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    nationality VARCHAR(3)
);

INSERT INTO authors(AUTHOR_ID, NAME, NATIONALITY)
VALUES('','Gabriel García','CO');

INSERT INTO authors(name, nationality)
VALUES('Julio Cortazar','ARG'),
      ('Isabele Allande', 'CH'),
      ('Octavio Paz','MX'),
      ('Luis Enrique', 'CO');



INSERT INTO books (title,author, year)
VALUES ('Vuelta al laberinto de la soledad',
        (SELECT author_id FROM authors
        WHERE name = 'Octavio Paz' LIMIT 1),1960);

INSERT INTO books (title, author, year)
VALUES ('100 AÑOS DE SOLEDAD', (SELECT authors.author_id from authors where name = 'Luis Enrique'), 1945)