DROP TABLE IF EXISTS user;

CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(30) UNIQUE,
    password VARCHAR(20),
    name VARCHAR(20) UNIQUE
);