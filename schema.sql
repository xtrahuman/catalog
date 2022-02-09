CREATE TABLE books (
     id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
     genre_id INT,
     author_id INT,
     source_id INT,
     label_id INT,
     publish_date DATE,
     archived BOOLEAN,
     CONSTRAINT fk_genre FOREIGN KEY(genre_id) REFERENCES genre(id),
     CONSTRAINT fk_author FOREIGN KEY(author_id) REFERENCES author(id),
     CONSTRAINT fk_source FOREIGN KEY(source_id) REFERENCES source(id),
     CONSTRAINT fk_label FOREIGN KEY(label_id) REFERENCES label(id),
);

CREATE TABLE labels (
     id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
     title VARCHAR(500),
     color VARCHAR(500),
)

CREATE TABLE musicalbum (
     id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
     genre_id INT, REFERENCES genre(id)
     author_id INT, REFERENCES author(id)
     source_id INT, REFERENCES source(id)
     label_id INT,  REFERENCES label(id)
     publish_date DATE,
     archived BOOLEAN,
);

CREATE TABLE genre (
     id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
     name VARCHAR(500),
);

CREATE TABLE game (
     id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
     genre_id INT, REFERENCES genre(id)
     author_id INT, REFERENCES author(id)
     source_id INT, REFERENCES source(id)
     label_id INT,  REFERENCES label(id)
     publish_date DATE,
     archived BOOLEAN,
);

CREATE TABLE author (
     id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
     first_name VARCHAR(500),
     last_name VARCHAR(500),
);