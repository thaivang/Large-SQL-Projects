----Create Database
Create database [Libary Management System] 
----Create tables
USE Library

CREATE TABLE Library_Branch (
	BranchID INT PRIMARY KEY NOT NULL,
	BranchName VARCHAR(50) NOT NULL,
	[Address] VARCHAR(50) NOT NULL -- Use [] to avoid reserved words or space
);

CREATE TABLE Publisher(
	PublisherName VARCHAR (50) PRIMARY KEY NOT NULL,
	[Address] VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

CREATE TABLE Books(
	BookID INT PRIMARY KEY NOT NULL,
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR (50) NOT NULL CONSTRAINT FK_PublisherName FOREIGN KEY REFERENCES Publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Book_Authors(
	BookID INT NOT NULL CONSTRAINT FK_BookID FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50) NOT NULL,
);

CREATE TABLE Book_Copies(
	BookID INT NOT NULL CONSTRAINT FK_CopiesBookID FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT FK_BranchID FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL
);

create TABLE Borrower(
	CardNo INT NOT NULL PRIMARY KEY,
	Name VARCHAR (50) NOT NULL,
	[Address] VARCHAR (50) NOT NULL,
	Phone VARCHAR (50) NOT NULL
);

CREATE TABLE Book_Loans(
	BookID INT NOT NULL CONSTRAINT FK_LoanBookID FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT FK_LoanBranchID FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT FK_CardNo FOREIGN KEY REFERENCES Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL, --date mm/dd/year
	DateDue DATE NOT NULL
);

---- INSERT DATA----
INSERT INTO Library_Branch 
	(BranchID, BranchName, [Address])
	VALUES
	(1, 'Sharpstown', '40 NE Tillamook st'),
	(2, 'Central', '10 SE Cesar Ave'),
	(3, 'Stars', '36 NE 155th Ave' ),
	(4, 'Downtown', '75 NW Charleston Ave')
;

INSERT INTO Publisher 
	(PublisherName, [Address], Phone)
	VALUES
	('Scribner', '44 NE Tillamook st', '748-939-5542' ), 
	('Disney Publishing Worldwide', '10 SE Cesar Ave', '719-645-2082'), 
	('Chatto & Windus', '36 NE 155th Ave', '578-810-4678'),
	('Tor Books', '75 NW Charleston Ave', '937-474-2251'), 
	('Viking Press', '23 SW Princeton Ave', '701-860-3575'),
	('Dell Publishing', '77 SW Chance st', '593-337-9443'),
	('Secker & Warbug', '5 SE Burnside Blvd', '908-699-2264'),
	('Picador USA', '1 88th Ave', '564-942-2756'),--ML
	('Doubleday', '11 78th Ave', '514-902-2056')
;

INSERT INTO Books --20 Books --
	(BookID, Title, PublisherName)
	VALUES
	(100, 'The Outsider', 'Scribner'), --SK
	(200, 'The Body', 'Scribner'), --SK
	(300, 'The Stand', 'Doubleday'), --Sk
	(400, 'The Shining','Doubleday'), --SK
	(500, 'IT','Viking Press'), --SK
	(600, 'Misery', 'Viking Press'), --SK
	(700, 'The Lightning Thief', 'Disney Publishing WorldWide'), --RR
	(800, 'Brave New World', 'Chatto & Windus'), --AH
	(900, 'The Doors of Perception', 'Chatto & Windus'), --AH
	(1000, 'Ender''s Game', 'Tor Books'), --OC
	(1100, 'The Great Gatsby', 'Scribner'), --FF
	(1200, 'Tinder is The Night', 'Scribner'), --FF
	(1300, 'To Kill a Mockingbird', 'Viking Press'),--JS
	(1400, 'The Old Man and the Sea', 'Scribner'),--EH
	(1500, 'A Farewell to Arms', 'Scribner'),--EH
	(1600, 'THe Sun also Rises', 'Scribner'), --EH
	(1700, 'Slaughter House-Five', 'Dell Publishing'), --KV
	(1800, 'Animal Farm', 'Secker & Warbug'), --GO
	(1900, '1984', 'Secker & Warbug'), --GO
	(2000, 'The Lost Tribe', 'Picador USA')--ML
;

INSERT INTO Book_Authors -- 10 Authors --
(BookID, AuthorName)
VALUES
	(100, 'Stephen King'),--'Scribner' -- 1,2
	(200, 'Stephen King'),
	(300, 'Stephen King'),
	(400, 'Stephen King'),
	(500, 'Stephen King'),
	(600, 'Stephen King'),
	(700, 'Rick Riordan'),-- 'Disney Publishing Worldwide' --3
	(800, 'Aldous Huxley'),-- 'Chatto and Windus'), --4
	(900, 'Aldous Huxley'),
	(1000, 'Orson Scott Card'),-- 'Tor Books' --5 
	(1100, 'F. Scott Fitzgerald'),-- 'Scribner' --6
	(1200, 'F. Scott Fitzgerald'),
	(1300, 'John Steinbeck'),-- 'Viking Press' --7
	(1400, 'Ernest Hemingway'),-- 'Scribner' -- 8
	(1500, 'Ernest Hemingway'),
	(1600, 'Ernest Hemingway'),
	(1700, 'Kurt Vonnegut'),-- 'Dell Publishing' -- 9 
	(1800, 'George Orwell'),-- 'Secker & Warbug' -- 10
	(1900, 'George Orwell'),
	(2000, 'Mark Lee')-- 'Picador USA' --11
;

-- 10 books in each branch with 2 copies of each boBookok
INSERT INTO Book_Copies
(BookID, BranchID, Number_of_Copies)
VALUES
	(100, 1, 2), 
	(200, 1, 2),
	(300, 1, 2),
	(400, 1, 2), 
	(500, 1, 2),
	(600, 1, 2),
	(700, 1, 2), 
	(800, 1, 2),
	(900, 1, 2),
	(1000, 1, 2), 
	(1100, 1, 2),
	(1200, 1, 2),
	(1300, 1, 2),
	(1400, 1, 2),
	(1500, 1, 2),
	(1600, 1, 2),
	(1700, 1, 2),
	(1800, 1, 2),
	(1900, 1, 2),
	(2000, 1, 2), -- end Branch 1
	(100, 2, 2), 
	(200, 2, 2),
	(300, 2, 2),
	(400, 2, 2), 
	(500, 2, 2),
	(600, 2, 2),
	(700, 2, 2), 
	(800, 2, 2),
	(900, 2, 2),
	(1000, 2, 2), -- end Branch 2
	(1100, 3, 2), 
	(1200, 3, 2),
	(1300, 3, 2),
	(1400, 3, 2), 
	(1500, 3, 2),
	(1600, 3, 2),
	(1700, 3, 2), 
	(1800, 3, 2),
	(1900, 3, 2),
	(2000, 3, 2), -- end Branch 3
	(100, 4, 2),
	(200, 4, 2),
	(300, 4, 2),
	(400, 4, 2),
	(500, 4, 2),
	(600, 4, 2),
	(700, 4, 2),
	(800, 4, 2),
	(900, 4, 2),
	(1000, 4, 2)-- end Branch 4
;

-- 8 borrowers, 2 people with more than 5 books loaned
INSERT INTO Borrower
(CardNo, Name, [Address], Phone)
VALUES
	(1,'Bryan', '44 NE Shine st', '307- 682-8835'),
	(2, 'Billy', '49 SW Hansel st', '907-512-0639'),
	(3, 'Bob', '10 SE Tesla st', '907-522-7696'),
	(4, 'Joe', '59 SE Model S blvd', '901-324-3127'),
	(5, 'Sally', '90 SE Model 3  blvd', '901-324-3127'),
	(6, 'Timmy', '65 SE Model X blvd', '901-324-3127'),
	(7, 'Kenny', '99 SE Model Y blvd', '907-631-3885'),
	(8, 'Mary', '33 NW Pinestreet ave', '954-523-7425')
;

--50 book loans, 20 in branch 1 & 2, 5 in branch 3 & 4
INSERT INTO Book_Loans 
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(100, 1, 1, '12/1/18', '12/8/18'),--B1
	(200, 1, 1, '12/1/18', '12/8/18'),
	(300, 1, 1, '12/1/18', '12/8/18'),
	(400, 1, 1, '12/1/18', '12/8/18'),
	(500, 1, 1, '12/1/18', '12/8/18'),
	(600, 1, 1, '12/1/18', '12/8/18'),
	(700, 1, 1, '12/1/18', '12/8/18'),
	(800, 1, 1, '12/1/18', '12/8/18'),
	(900, 1, 1, '12/1/18', '12/8/18'),
	(1000, 1, 1, '12/1/18', '12/8/18'),-- B1 10 
	(1100, 1, 1, '12/1/18', '12/8/18'),
	(1200, 1, 1, '12/1/18', '12/8/18'),
	(1300, 1, 1, '12/1/18', '12/8/18'),
	(1400, 1, 1, '12/1/18', '12/8/18'),
	(1500, 1, 1, '12/1/18', '12/8/18'),
	(1600, 1, 1, '12/1/18', '12/8/18'),
	(1700, 1, 1, '12/1/18', '12/8/18'),
	(1800, 1, 1, '12/1/18', '12/8/18'),
	(1900, 1, 1, '12/1/18', '12/8/18'),
	(2000, 1, 1, '12/1/18', '12/8/18'),-- B1 20 
	(100, 2, 2, '12/1/18', '12/8/18'),-- B2
	(200, 2, 2, '12/1/18', '12/8/18'),
	(300, 2, 2, '12/1/18', '12/8/18'),
	(400, 2, 2, '12/1/18', '12/8/18'),
	(500, 2, 2, '12/1/18', '12/8/18'),
	(600, 2, 2, '12/1/18', '12/8/18'),
	(700, 2, 2, '12/1/18', '12/8/18'),
	(800, 2, 2, '12/1/18', '12/8/18'),
	(900, 2, 2, '12/1/18', '12/8/18'),
	(1000, 2, 2, '12/1/18', '12/8/18'),-- B2 10
	(1100, 3, 2, '12/1/18', '12/8/18'),-- B3
	(1200, 3, 2, '12/1/18', '12/8/18'),
	(1300, 3, 2, '12/1/18', '12/8/18'),
	(1400, 3, 2, '12/1/18', '12/8/18'),
	(1500, 3, 2, '12/1/18', '12/8/18'),
	(1600, 3, 2, '12/1/18', '12/8/18'),
	(1700, 3, 2, '12/1/18', '12/8/18'),
	(1800, 3, 2, '12/1/18', '12/8/18'),
	(1900, 3, 2, '12/1/18', '12/8/18'),
	(2000, 3, 2, '12/1/18', '12/8/18'),-- B3 10 
	(100, 4, 3, '12/1/18', '12/8/18'),
	(200, 4, 3, '12/1/18', '12/8/18'),
	(300, 4, 3, '12/1/18', '12/8/18'),
	(400, 4, 3, '12/1/18', '12/8/18'),
	(500, 4, 3, '12/1/18', '12/8/18'),-- 5 in branch 3
	(600, 4, 3, '12/1/18', '12/8/18'),
	(700, 4, 3, '12/1/18', '12/8/18'),
	(800, 4, 3, '12/1/18', '12/8/18'),
	(900, 4, 3, '12/1/18', '12/8/18'),
	(1000, 4, 3, '12/1/18', '12/8/18')-- 5 in branch 4 
; 


-- Stored procedure that queries for the quesitons below: --

--1. How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
 
 CREATE PROCEDURE dbo.uspGetBookCopies
 AS
 SELECT 
 LB.BranchName, BC.Number_of_copies, B.Title
 from Book_Copies as BC
 INNER JOIN Library_Branch as LB on 
 LB.BranchID = BC.BranchID 
 INNER JOIN Books as B on B.BookID = BC.BookID
 WHERE LB.BranchID = 1 
 AND B.Title = 'The Lost Tribe';

 EXECUTE dbo.uspGetBookCopies

 --2. How many copies of the book titled "The Lost Tribe" are owned by each library branch?

CREATE PROCEDURE dbo.uspGetBranchCopies @Title varchar(50) = NUll
AS
SELECT LB.BranchName, ISNULL(BC.Number_of_copies, 0) 'Copies of The Lost Tribe'
FROM Library_Branch AS LB
LEFT JOIN Book_Copies AS BC on BC.BranchID = LB.BranchID
INNER JOIN Books AS B on B.BookID = BC.BookID
Where B.Title = ISNULL(@title, B.title)

EXECUTE dbo.uspGetBranchCopies 'The Lost Tribe'

--3. Retrieve the names of all borrowers who do not have any books checked out.

CREATE PROCEDURE dbo.uspGetNameNoBurrower
AS
SELECT B.CardNo, B.Name
FROM Borrower AS B
LEFT JOIN Book_loans AS BL ON BL.CardNo = B.CardNo
Where B.CardNo NOT IN (1, 2, 3); -- 3 borrowers

EXECUTE dbo.uspGetNameNoBurrower

-- 4. For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.

CREATE PROCEDURE dbo.uspGetCheckedOutBranch 
AS
SELECT BL.Datedue, B.Title, BO.Name, BO.[Address]
FROM Borrower AS BO 
INNER JOIN Book_Loans AS BL on BL.CardNo = BO.CardNo
INNER JOIN Books AS B ON B.BookID = BL.BookID
WHERE BL.CardNo = 1;

EXECUTE dbo.uspGetCheckedOutBranch 

--5. For each library branch, retrieve the branch name and the total number of books loaned out from that branch.

CREATE PROCEDURE dbo.uspGetBranchTotal
AS
SELECT LB.BranchName, COUNT (*) AS 'Total Books'
FROM Library_Branch AS LB, Book_Loans AS BL
WHERE BL.BranchID = LB.BranchID
GROUP BY LB.BranchName;

EXECUTE dbo.uspGetBranchTotal

--6. Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than five books checked out.

CREATE PROCEDURE dbo.uspGETTotalBookbyPerson 
AS
SELECT BO.Name, BO.[Address], COUNT (BookID) AS 'Total Books'
FROM Borrower AS BO 
INNER JOIN Book_Loans AS BL ON BL.CardNo = BO.CardNo
GROUP BY BO.Name, BO.[Address]
HAVING COUNT(BookID) > 5;

EXECUTE dbo.uspGETTotalBookbyPerson 

--7. For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".

CREATE PROCEDURE dbo.uspGETTotalBookbyBranchName 
AS
SELECT BA.AuthorName, LB.BranchName, BO.Title, COUNT (BO.Title) AS 'Total Books'
FROM Book_Loans AS BL
FULL OUTER JOIN Books AS BO ON BO.BookID = BL.BookID
FULL OUTER JOIN Book_Authors AS BA ON BA.BookID = BO.BookID
FULL OUTER JOIN Library_Branch AS LB ON LB.BranchID = BL.BranchID
Where BA.AuthorName = 'Stephen King'
AND LB.BranchName = 'Central'
GROUP BY  BA.AuthorName, BO.Title, LB.BranchName;

EXECUTE dbo.uspGETTotalBookbyBranchName
