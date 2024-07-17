create database task2;


create table Teachers(
ID INT PRIMARY KEY IDENTITY(1,1),
TeacherName varchar(30));


create table  TeacherDetails(
ID INT PRIMARY KEY IDENTITY(1,1),
TeacherID INT UNIQUE,  -- Foreign key 
TeacherPhone int ,age int,
foreign key(TeacherID)references Teachers(ID)ON DELETE CASCADE);


create TABLE Courses(
ID INT PRIMARY KEY IDENTITY(1,1),
CoursesName varchar(30),
TeacherID INT , -- Foreign key 
FOREIGN key (TeacherID)references Teachers (ID)ON DELETE CASCADE);


create TABLE Students(
ID INT PRIMARY KEY IDENTITY(1,1),
StudentName varchar(30));


create TABLE Students_Courses(
 StudentID INT, -- Foreign key 
 CourseID INT,  -- Foreign key 
 );


INSERT INTO Teachers (TeacherName)
VALUES ('raneem'),
       ('jana');

INSERT INTO TeacherDetails (TeacherID,TeacherPhone, age)
VALUES (1, 123456, 34),
       (2, 45364457, 32);

INSERT INTO Courses (CoursesName, TeacherID)
VALUES ('Math', 1),
       ('Science', 1),
       ('History', 2);

INSERT INTO Students (StudentName)
VALUES ('mohammed'),
       ('noor');

INSERT INTO Students_Courses (StudentID, CourseID)
VALUES (1, 2),
       (1, 1),
       (2, 3),
       (2, 1);


select * from Teachers;
select * from TeacherDetails;
select * from Courses;
select * from Students;
select * from Students_Courses;