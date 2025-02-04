CREATE DATABASE Library;
USE Library;

-- Create the Authors table
create table Authors(
  AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(255),
    BirthYear INT
);

-- Create the Books table
Create table Books(
    BookID INT PRIMARY KEY,
    Title VARCHAR(255),
    AuthorID INT,
    PublicationYear INT,
    Available BOOLEAN,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Task 1: Insert a new author into the Authors table
INSERT INTO Authors (AuthorID, AuthorName, BirthYear)
VALUES (201, 'Jane Smith', 1980);

-- Task 2: Update the publication year of the book with BookID 101 to 2020
UPDATE Books
SET PublicationYear = 2020
WHERE BookID = 101;

-- Task 3: Delete all books published before the year 2000
DELETE FROM Books
WHERE PublicationYear < 2000;

SET SQL_SAFE_UPDATES = 0;
