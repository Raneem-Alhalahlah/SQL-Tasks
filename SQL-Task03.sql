CREATE Database library_Task03;
GO 
USE library_Task03;
GO

create  table Author(
ID INT PRIMARY KEY IDENTITY(1,1),
AuthorName varchar(30),
bio varchar(30));


create  table Books(
ID INT PRIMARY KEY IDENTITY(1,1),
BooksName varchar(30),
AuthorID int, -- Foreign key 
foreign key(AuthorID)references Author(ID)ON DELETE CASCADE);


create  table section(
ID INT PRIMARY KEY IDENTITY(1,1),
sectionName varchar(30),
describtion varchar(100));


create  table Categoris(
ID INT PRIMARY KEY IDENTITY(1,1),
CategorisName varchar(30));

create  table employee(
ID INT PRIMARY KEY IDENTITY(1,1),
employeeName varchar(30),
position varchar(30));


create  table User_(
ID INT PRIMARY KEY IDENTITY(1,1),
UserName varchar(30),
Email varchar(100));



create  table Book_User(
BookID int, ---- Foreign key 
UserID int, ---- Foreign key 
foreign key(BookID)references Books(ID)ON DELETE CASCADE,
foreign key(UserID)references User_(ID)ON DELETE CASCADE);


INSERT INTO Author (AuthorName, bio) VALUES ('J.K. Rowling', 'British author');
INSERT INTO Author (AuthorName, bio) VALUES ('sam', 'American novelist');
INSERT INTO Author (AuthorName, bio) VALUES ('albert', 'English writer');

INSERT INTO Books (BooksName, AuthorID) VALUES ('Harry Potter', 1);
INSERT INTO Books (BooksName, AuthorID) VALUES ('A Game of Thrones', 2);
INSERT INTO Books (BooksName, AuthorID) VALUES ('The Hobbit', 3);
INSERT INTO Books (BooksName, AuthorID) VALUES ('alone', 1);



INSERT INTO section (sectionName, describtion) VALUES ('Fiction', 'Fictional books');
INSERT INTO section (sectionName, describtion) VALUES ('Non-Fiction', 'Non-fictional books');
INSERT INTO section (sectionName, describtion) VALUES ('Science', 'Books related to science');

INSERT INTO Categoris (CategorisName) VALUES ('Fantasy');
INSERT INTO Categoris (CategorisName) VALUES ('Adventure');
INSERT INTO Categoris (CategorisName) VALUES ('Biography');


INSERT INTO employee (employeeName, position) VALUES ('ayman', 'Manager');
INSERT INTO employee (employeeName, position) VALUES ('ali', 'Librarian');
INSERT INTO employee (employeeName, position) VALUES ('jana', 'Assistant');

INSERT INTO User_ (UserName, Email) VALUES ('raneem', 'raneem@example.com');
INSERT INTO User_ (UserName, Email) VALUES ('jana', 'jana@example.com');
INSERT INTO User_ (UserName, Email) VALUES ('heba', 'heba@example.com');
INSERT INTO User_ (UserName, Email) VALUES ('tasneem', 'tasneem@example.com');

INSERT INTO Book_User (BookID, UserID) VALUES (1, 2);
INSERT INTO Book_User (BookID, UserID) VALUES (2, 3);
INSERT INTO Book_User (BookID, UserID) VALUES (3, 1);



--join for one to many
SELECT Books.BooksName, Author.AuthorName
FROM Books
INNER JOIN Author ON Books.AuthorID = Author.ID;

SELECT Books.BooksName, Author.AuthorName
FROM Books
LEFT JOIN Author ON Books.AuthorID = Author.ID;


SELECT Books.BooksName, Author.AuthorName
FROM Books
RIGHT JOIN Author ON Books.AuthorID = Author.ID;

SELECT Books.BooksName, Author.AuthorName
FROM Books
FULL OUTER JOIN Author ON Books.AuthorID = Author.ID;


--join for many to many
SELECT Books.BooksName, User_.UserName
FROM Book_User
INNER JOIN Books ON Book_User.BookID = Books.ID
INNER JOIN User_ ON Book_User.UserID = User_.ID;

SELECT Books.BooksName, User_.UserName
FROM Books
LEFT JOIN Book_User ON Books.ID = Book_User.BookID
LEFT JOIN User_ ON Book_User.UserID = User_.ID;

SELECT Books.BooksName, User_.UserName
FROM User_
RIGHT JOIN Book_User ON User_.ID = Book_User.UserID
RIGHT JOIN Books ON Book_User.BookID = Books.ID;

SELECT Books.BooksName, User_.UserName
FROM Books
FULL OUTER JOIN Book_User ON Books.ID = Book_User.BookID
FULL OUTER JOIN User_ ON Book_User.UserID = User_.ID;