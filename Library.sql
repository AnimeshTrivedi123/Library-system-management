--Project--Library Management System Project 2
--Creating a Branch Table--
DROP TABLE IF EXISTS Branch;
CREATE TABLE Branch(
	branch_id VARCHAR(10) PRIMARY KEY,	
	manager_id	VARCHAR(10),
	branch_address varchar(55),
	contact_no INT
);

DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees(
	emp_id	VARCHAR(25) PRIMARY KEY,
	emp_name VARCHAR(25),
	position VARCHAR(25),
	salary INT,
	branch_id VARCHAR (25) --FK

);

DROP TABLE IF EXISTS Books;
CREATE TABLE Books(
	isbn VARCHAR(20) PRIMARY KEY,
	book_title	VARCHAR(75),
	category VARCHAR(50),
	rental_price FLOAT,
	status VARCHAR(15),
	author	VARCHAR(30),
	publisher VARCHAR(55)

);

DROP TABLE IF EXISTS Members;
CREATE TABLE Members(
	member_id VARCHAR(15) PRIMARY KEY,
	member_name	VARCHAR(20),
	member_address VARCHAR(50),
	reg_date DATE
);

DROP TABLE IF EXISTS Issued_Status;
CREATE TABLE Issued_Status(
	issued_id VARCHAR(10) PRIMARY KEY,	
	issued_member_id VARCHAR(10), --FK
	issued_book_name VARCHAR(75),
	issued_date DATE,
	issued_book_isbn VARCHAR(75), --FK
	issued_emp_id VARCHAR(10) --FK

);


DROP TABLE IF EXISTS Return_Status;
CREATE TABLE Return_Status(
	return_id VARCHAR(10) PRIMARY KEY,
	issued_id	VARCHAR(10),
	return_book_name VARCHAR(75),
	return_date DATE,
	return_book_isbn VARCHAR(10)

);

--FORIGN KEY--
ALTER TABLE Issued_status
ADD CONSTRAINT fk_members
FOREIGN KEY (issued_member_id)
REFERENCES Members(member_id);

ALTER TABLE Issued_status
ADD CONSTRAINT fk_books
FOREIGN KEY (issued_book_isbn)
REFERENCES Books(isbn);

ALTER TABLE Issued_status
ADD CONSTRAINT fk_Employees
FOREIGN KEY (issued_emp_id)
REFERENCES Employees(emp_id);

ALTER TABLE Employees
ADD CONSTRAINT fk_branch
FOREIGN KEY (branch_id)
REFERENCES branch(branch_id);

ALTER TABLE Return_status
ADD CONSTRAINT fk_Issued_Status
FOREIGN KEY (issued_id)
REFERENCES Issued_status(issued_id);