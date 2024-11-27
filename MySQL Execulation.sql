USE practice;
-- SQL stands for Structured Query Language. SQL is a standard language for storing, manipulating and retrieving data in databases.
-- The SELECT statement is used to select data from a database.
-- If you want to return all columns, without specifying every column name, you can use the SELECT * syntax:
SELECT * FROM orders;
-- The SELECT DISTINCT statement is used to return only distinct (different) values.
SELECT * FROM pizzas;
SELECT distinct pizza_type_id from pizzas;
-- The WHERE clause is used to filter records. The WHERE clause is used to filter records.
-- The WHERE clause is not only used in SELECT statements, it is also used in UPDATE, DELETE, etc.!
SELECT * FROM order_details
WHERE order_id =2;
-- Math in SQL does follow PEMDAS which stands for Parenthesis, Exponent, Multiplication, Division, Addition, subtraction 
-- it's the order of operation for math
SELECT order_id,quantity,quantity+2 FROM order_details;
-- #WHERE Clause: The WHERE clause is used to filter records (rows of data). It's going to extract only those records that fulfill 
-- a specified condition.
-- There are four types of SQL commands: DDL, DML, DCL, TCL.
-- Data Definition Language (DDL) - DDL changes the structure of the table like creating a table, deleting a table, altering a table, etc

-- CREATE :- CREATE command is used to create a table, schema or an index.
Create table Employee (
EmployeeID int,
JobTitle varchar(100),
Salary int
);
INSERT INTO Employee VALUES (1,'Business Analyst', 100000),(2,'Data Analyst', 100000),(3,'Quality Specialst', 200000);
SELECT * FROM Employee;

-- ALTER:- ALTER command is used to add, modify or delete columns or constraints from the database table.
 -- To add a column in a table, use the following syntax:
 ALTER TABLE Employee
 ADD Email_ID VARCHAR(255);
 SELECT * FROM Employee
 
 -- TRUNCATE :- TRUNCATE command is used to delete the data present in the table but this will not delete the table.
 TRUNCATE TABLE Employee;
 
 -- DROP:- DROP command is used to delete the table along with its data.
 DROP TABLE Employee;
 
 -- RENAME: - RENAME command is used to rename the table name.
 RENAME TABLE Employee2 TO Employee3;
 SELECT * FROM Employee3;
 
 -- DML Commands:- 1. INSERT; 2.SELECT; 3.UPDATE; 4.DELETE
 -- INSERT:- INSERT Statement is used to insert new records into the database table.
 INSERT INTO Employee3 VALUES (4, 'CRM' , 250000);
 
 -- SELECT:- Select statement is used to select data from database tables.
 SELECT * FROM Employee3;
 
 -- UPDATE:- UPDATE statement is used to modify the existing values of records present in the database table. 
 -- Be careful when updating records in a table! Notice the WHERE clause in the UPDATE statement. 
 -- The WHERE clause specifies which record(s) that should be updated. If you omit the WHERE clause, all records in the table will be updated!
-- safe update mode requires key to update/delete with where clause, you can use below code
  SET SQL_SAFE_UPDATES=0;
UPDATE Employee3
SET JobTitle = 'Client Relation' WHERE EmployeeID = '3'

-- DELETE:- The DELETE statement is used to delete existing records in a table.
-- --Be careful when deleting records in a table! Notice the WHERE clause in the DELETE statement. 
-- The WHERE clause specifies which record(s) should be deleted. If you omit the WHERE clause, all records in the table will be deleted!
DELETE FROM Employee3 WHERE JobTitle = 'Client Relation'
SELECT * FROM Employee3;

-- DCL Commands: - GRANT and REVOKE
-- GRANT: - GRANT statement is used to provide access privileges to users to access the database.
-- Privileges can be SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER, CREATE, ALL. 
-- You can also specify combination of these privileges in a statement.
Grant ALL ON schema1.orders to 'user1'@'localhost';

-- REVOKE :- REVOKE statement is used to withdraw the access priviliges given to a user by GRANT statement
revoke ALL ON schema1.orders from 'user1'@'localhost';

-- TCL Commands :- COMMIT,ROLLBACK. Note: In MySql all commads are by defult Auto-commint trasaction. 
-- Before running TCL uncheck the 'Auto-commint trasaction  
-- COMMIT:- COMMIT statement is used to save all the changes made to the database in the current transaction.

COMMIT;
-- ROLLBACK:-ROLLBACK statement is used to revert the changes made to a database table in the current transaction
ROLLBACK;
 
 -- Joins:- A JOIN clause is used to combine rows from two or more tables, based on a related column between them.
 -- Joins are used along with SELECT statement when ever there is a need to retrieve data from multiple tables.
 -- Commonly used Joins in MySQL are 1.INNER JOIN, 2.LEFT JOIN, 3.RIGHT JOIN, 4.CROSS JOIN
 CREATE DATABASE JOINS
 USE JOINS;
 CREATE table TABLE2
 (A VARCHAR (8),
 Z INT);
 INSERT INTO TABLE2 VALUES ('a',10), ('e', 17),('d',30);
 select * FROM TABLE2
 
 -- INNER JOIN:- INNER JOIN selects records that have matching values in both tables.
 -- The INNER JOIN keyword selects all rows from both tables as long as there is a match between the columns. 
 -- If there are records in the "TABLE1" table that do not have matches in "TABLE2", these records will not be shown.
 SELECT *
 FROM TABLE1
 INNER JOIN TABLE2
 ON TABLE1.A = TABLE2.A;
 
 -- LEFT JOIN:- The LEFT JOIN keyword returns all records from the left table (table1), and the matching records from the right table (table2). 
 -- The result is 0 records from the right side, if there is no match.

-- The LEFT JOIN keyword returns all records from the left table (table1), even if there are no matches in the right table (table2).
SELECT * 
FROM TABLE1
LEFT JOIN TABLE2
ON TABLE1.A = TABLE2.A

-- RIGHT JOIN:- The RIGHT JOIN keyword returns all records from the right table (table2), and the matching records from the left table (table1). 
-- The result is 0 records from the left side, if there is no match.
SELECT *
FROM TABLE1
RIGHT JOIN TABLE2
ON TABLE1.Z = TABLE2.Z

-- CROSS JOIN:- CROSS JOIN is used to combine all possibilities of the two or more tables and returns the result 
-- that contains every row from all contributing tables. 
-- The CROSS JOIN is also known as CARTESIAN JOIN, which provides the Cartesian product of all associated tables. 
-- The Cartesian product can be explained as all rows present in the first table multiplied by all rows present in the second table
SELECT * 
FROM TABLE1
CROSS JOIN TABLE2
CREATE TABLE contacts (College_ID int, cellphone int, homephone int);
INSERT INTO contacts values (1,123456789,213456789),(2,321456789,412356789),(3,512346789,612345789),(4,712345689,812345679);
SELECT * FROM contacts
DELETE students, contacts FROM students  
INNER JOIN contacts ON students.student_id=contacts.college_id   
WHERE students.student_id = 4;
SET SQL_SAFE_UPDATES=0
SELECT * FROM students
DELETE from students
where student_ID = '3';

-- MySQL Clauses:- WHERE, DISTINCT, FROM, ORDERBY, GROUP BY, Having

-- WHERE: - WHERE Clause is used with SELECT, INSERT, UPDATE and DELETE clause to filter the results.
-- It specifies a specific position where you have to do the operation
SELECT stud_Iname from students
WHERE stud_Iname = 'Arun'
SELECT * from students
WHERE stud_Iname = 'Arun'
OR city = 'France';
SELECT * from contacts
WHERE College_ID = 1
AND cellphone > 123;

-- Distinct Clause:- DISTINCT clause is used to remove duplicate records from the table and fetch only the unique records. 
-- The DISTINCT clause is only used with the SELECT statement
use practice
SELECT * FROM employee3
SELECT DISTINCT Salary
FROM employee3

SELECT  DISTINCT Salary 
FROM employee3

-- FROM Clause:- FROM Clause is used to select some records from a table. 
-- It can also be used to retrieve records from multiple tables using JOIN condition.
SELECT * FROM employee3

-- ORDER BY Clause :- ORDER BY Clause is used to sort the records in ascending or descending order.
SELECT * FROM employee3
ORDER BY Salary DESC
SELECT * FROM employee3
ORDER BY Salary ASC

-- GROUP BY Clause:-GROUP BY Clause is used to collect data from multiple records and group the result by one or more column. 
-- It is generally used in a SELECT statement.

-- You can also use some aggregate functions like COUNT, SUM, MIN, MAX, AVG etc. on the grouped column.
SELECT DEPARTMENT_ID, SUM(SALARY)
FROM employees
GROUP BY DEPARTMENT_ID

-- HAVING Clause:-HAVING Clause is used with GROUP BY clause. It always returns the rows where condition is TRUE.
-- Note:- The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.

SELECT DEPARTMENT_ID, SUM(SALARY)
FROM employees
GROUP BY DEPARTMENT_ID
HAVING SUM(SALARY) > 20000
ORDER BY SUM(SALARY) DESC

-- KEYS:- Unique Key, Primary Key, Foreign Key, CHECK, DEFULT, NOT NULL
-- Unique Key:- A  unique key in MySQL is a single field or combination of fields that ensure all values going to store into the column will be unique.
--  It means a column cannot stores duplicate values. For example, the email addresses and roll numbers of students in the "student_info" 
-- table or contact number of employees in the "Employee" table should be unique.

-- MySQL allows us to use more than one column with UNIQUE constraint in a table. It can accept a null value, but MySQL allowed only one null value
-- per column. It ensures the integrity of the column or group of columns to store different values into a table

CREATE TABLE employees3 (emp_ID int NOT NULL UNIQUE, Salary int)
INSERT INTO employees3 VALUES (1,10000),(2,50000);
SELECT * FROM employees3

-- Primary Key:- MySQL primary key is a single or combination of the field, which is used to identify each record in a table uniquely. 
-- If the column contains primary key constraints, then it cannot be null or empty. A table may have duplicate columns, 
-- but it can contain only one primary key. It always contains unique value into a column.

-- When you insert a new row into the table, the primary key column can also use the AUTO_INCREMENT attribute to generate a sequential number 
-- for that row automatically. MySQL automatically creates an index named "Primary" after defining a primary key into the table.
--  Since it has an associated index, we can say that the primary key makes the query performance fast.

-- Foreign Key:- The foreign key is used to link one or more than one table together. It is also known as the referencing key. 
-- A foreign key matches the primary key field of another table. It means a foreign key field in one table refers to the primary key 
-- field of the other table. It identifies each row of another table uniquely that maintains the referential integrity in MySQL.

-- A foreign key makes it possible to create a parent-child relationship with the tables. In this relationship, the parent table holds 
-- the initial column values, and column values of child table reference the parent column values. MySQL allows us to define 
-- a foreign key constraint on the child table.

CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

-- CHECK Constraint:- The CHECK constraint is used to limit the value range that can be placed in a column.
-- If you define a CHECK constraint on a column it will allow only certain values for this column.
-- If you define a CHECK constraint on a table it can limit the values in certain columns based on values in other columns in the row.
-- The following SQL creates a CHECK constraint on the "Age" column when the "Persons" table is created. 
-- The CHECK constraint ensures that the age of a person must be 18, or older
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CHECK (Age>=18)
);
-- DEFAULT Constraint:- The DEFAULT constraint is used to set a default value for a column.
-- The default value will be added to all new records, if no other value is specified.
-- The following SQL sets a DEFAULT value for the "City" column when the "Persons" table is created:
CREATE TABLE Orders (
    ID int NOT NULL,
    OrderNumber int NOT NULL,
    OrderDate date DEFAULT GETDATE()
);

 -- INDEX :- The CREATE INDEX statement is used to create indexes in tables.
-- Indexes are used to retrieve data from the database more quickly than otherwise. The users cannot see the indexes, they are just used 
-- to speed up searches/queries. 
-- Note: Updating a table with indexes takes more time than updating a table without (because the indexes also need an update). 
-- So, only create indexes on columns that will be frequently searched against.
CREATE INDEX idx_lastname
ON Persons (LastName);
-- DROP INDEX statement to remove the existing index from the table. To delete an index from a table, we can use the following query:
DROP INDEX idx_lastname;
ON Persons (LastName);

-- VIEWS:- In SQL, a view is a virtual table based on the result-set of an SQL statement. A view contains rows and columns, just like a real table. 
-- The fields in a view are fields from one or more real tables in the database. You can add SQL statements and functions to a view 
-- and present the data as if the data were coming from one single table.
SELECT * FROM employees
CREATE VIEW `hIGH_SALARY` AS
SELECT EMPLOYEE_ID, SALARY
FROM employees
WHERE SALARY > 6500;
 SELECT * FROM hIGH_SALARY
 
 -- stored procedure:- A stored procedure in SQL is a group of SQL queries that can be saved and reused multiple times. 
 -- It is very useful as it reduces the need for rewriting SQL queries. It enhances efficiency, reusability, and security in database management.
-- Users can also pass parameters to stored procedures so that the stored procedure can act on the passed parameter values.
DELIMITER $$
CREATE PROCEDURE salaries (employee_id_param INT)
BEGIN
SELECT EMPLOYEE_ID, SALARY FROM employees
WHERE SALARY >= 10000
AND employee_id_param = EMPLOYEE_ID;
END $$

DELIMITER ;
CALL salaries(201);

ALTER TABLE employees
RENAME COLUMN COMMISSION_PCT TO CTC;
SET SQL_SAFE_UPDATES=0;
DELETE FROM employees
WHERE CTC = '-';
SELECT * FROM employees;
ALTER TABLE employees
DROP COLUMN CTC
ALTER TABLE employees
ADD COLUMN CTC int
SELECT SALARY, Vari_Salary FROM employees
WHERE Vari_Salary is null;
UPDATE employees
SET Vari_Salary = 10000;
SELECT SALARY, Vari_Salary, SALARY + Vari_Salary as Total_Salary
FROM employees;
SELECT * FROM employees;
UPDATE employees
SET CTC = SALARY + Vari_Salary; 

-- Window functions in SQL perform calculations across a set of table rows related to the current row.
-- Unlike aggregate functions which return a single value for a group of rows, window functions return a result for each row in the result set.
-- These functions are highly useful for tasks such as ranking, calculating running totals, and finding moving averages while still retaining 
-- individual row details. 
-- A window function performs an aggregate-like operation on a set of query rows. However, 
-- whereas an aggregate operation groups query rows into a single result row, a window function produces a result for each query row:


-- EX:- ROW_NUMBER(),RANK(), DENSE_RANK(), LEAD() and LAG()
SELECT DEPARTMENT_ID, SALARY,
SUM(SALARY) OVER (PARTITION BY DEPARTMENT_ID) TOTAL_SALARY
FROM employees;
SELECT * FROM employees;

-- CASE Statement:- The CASE statement goes through conditions and return a value when the first condition is met (like an IF-THEN-ELSE statement). 
-- So, once a condition is true, it will stop reading and return the result.If no conditions are true, it will return the value in the ELSE clause.
-- If there is no ELSE part and no conditions are true, it returns NULL.

SELECT EMPLOYEE_ID, SALARY,
CASE
    WHEN SALARY > 7000 THEN 'High Salary Employee'
    WHEN SALARY < 7000 THEN 'Low Salary Employee'
    ELSE 'employee column with null salary'
END AS Salary_index
FROM employees;


-- Trigger
-- a Trigger is a block of code that executes automatically executes when an event takes place in a table.

-- EVENTS:- Events are task or block of code that gets executed according to a schedule. These are fantastic for so many reasons. 
-- Importing data on a schedule. 
-- Scheduling reports to be exported to files and so many other things
-- you can schedule all of this to happen every day, every monday, every first of the month at 10am. Really whenever you want
SELECT * FROM employees;


