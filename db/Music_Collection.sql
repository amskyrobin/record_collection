DROP TABLE IF EXISTS album;
DROP TABLE IF EXISTS artist;


CREATE TABLE artist(
id SERIAL4 PRIMARY KEY, 
name VARCHAR(255)
);

CREATE TABLE album (
id SERIAL4 PRIMARY KEY,
title VARCHAR(255),
artist_id INT4 references artist(id)
);