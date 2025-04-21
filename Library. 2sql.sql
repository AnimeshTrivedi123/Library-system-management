SELECT*FROM Books;
SELECT*FROM Branch;
SELECT*FROM Employees;
SELECT*FROM Issued_Status;
SELECT*FROM Return_Status;
SELECT*FROM Members;


--Project Task.
--Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"
INSERT INTO Books(isbn,book_title, category, rental_price, status, author, publisher)
VALUES('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');
SELECT*FROM books;


--Task 2: Update an Existing Member's Address
UPDATE Members
SET member_address='125 Main St'
WHERE member_id='C102';

--Task 3: Delete a Record from the Issued Status Table -- Objective: Delete the record with issued_id = 'IS127' from the issued_status table.
SELECT * FROM issued_status;
DELETE FROM issued_status
WHERE issued_id='IS127'


--Task 4: Retrieve All Books Issued by a Specific Employee -- Objective: Select all books issued by the employee with emp_id = 'E101'.
SELECT *FROM issued_status
WHERE issued_emp_id='E101';


--Task 5: List Members Who Have Issued More Than One Book -- Objective: Use GROUP BY to find members who have issued more than one book.
SELECT issued_emp_id, COUNT(issued_id)
FROM issued_status
GROUP BY issued_emp_id
HAVING COUNT(issued_id)>1


--CTAS
--Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**
SELECT*FROM books as b
JOIN issued_status as ist
ON ist.issued_book_isbn=b.isbn


