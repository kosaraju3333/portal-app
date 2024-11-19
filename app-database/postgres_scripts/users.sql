CREATE TABLE users (
    id serial not null primary key,
    name varchar(225) not null,
    email varchar(225) not null unique,
    password varchar(225) not null
);