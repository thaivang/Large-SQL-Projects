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

CREATE PROCEDURE dbo.uspGETTotalBookbyPerson 
AS
SELECT BA.AuthorName, LB.BranchName, BO.Title, COUNT (BO.Title) AS 'Total Books'
FROM Book_Loans AS BL
FULL OUTER JOIN Books AS BO ON BO.BookID = BL.BookID
FULL OUTER JOIN Book_Authors AS BA ON BA.BookID = BO.BookID
FULL OUTER JOIN Library_Branch AS LB ON LB.BranchID = BL.BranchID
Where BA.AuthorName = 'Stephen King'
AND LB.BranchName = 'Central'
GROUP BY  BA.AuthorName, BO.Title, LB.BranchName;

EXECUTE dbo.uspGETTotalBookbyPerson