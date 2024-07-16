CREATE database Library_;
CREATE table Books  (BookID int, Title varchar(30), AuthorID int,PublishedYear int, CopiesAvailable int,BookCategory varchar (30));
CREATE table Authors  (AuthorID  int, FirstName varchar(30),  LastName varchar(30),BirthYear int);

insert into Books 
values (1,'Clean Code',1,2010,7,'Educational'),
(2,'You Do not Know',2,2012,5,'Educational'),
(3,'Pragmatic Programmer',3,2011,6,'Educational'),
(4,'Design Patterns',4,2024,16,'Educational'),
(5,'C# Complete',5,2021,12,'Educational');

insert into Authors
values (1,'Jana','Hamdan',2000),
(2,'heba','obidat',2000),
(3,'tasneem','alawneh',1994),
(4,'sara','shorman',2001),
(5,'rahaf','Duhamesh',2000);


select * FROM Books;  --to print tabel1
select * FROM Authors; --to print tabel2

select MAX(CopiesAvailable)as CopiesAvailable , MIN(CopiesAvailable)as CopiesAvailable
From Books;


select AVG(PublishedYear)
From Books;


select count(BookID)
From Books;


truncate Table Books; --to remove all records


drop table Authors ; --to delate table