CREATE DATABASE IF NOT EXISTS SCA;

USE SCA;

CREATE TABLE IF NOT EXISTS
    student (
        student_id INT PRIMARY KEY,
        first_name VARCHAR(50) NOT NULL,
        last_name VARCHAR(50) NOT NULL,
        age INT,
        marks INT
    );

INSERT INTO
    student (student_id, first_name, last_name, age, marks)
VALUES
    (1, 'John', 'Doe', 18, 85),
    (2, 'Jane', 'Smith', 19, 92),
    (3, 'Alice', 'Johnson', 20, 78),
    (4, 'Bob', 'Williams', 18, 95);

SELECT
    *
FROM
    student;