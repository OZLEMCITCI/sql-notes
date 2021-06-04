                -- WARMUP 10 Minutes

--1) If you have "suppliers" table in your schema, drop it
--2) Create "suppliers" table whose fields are "supplier_id", "supplier_name", "contact_name"
--3) "supplier_id"s should be 1, 2, 3, 4
--4) "supplier_name"s should be IBM, APPLE, SAMSUNG, IBM
--5) "contact_name"s should be "Jhon Walker", "Tom Hanks", "Tae Shaun", "Chris Tien"

--How to create PRIMARY KEY by using multiple fields
CREATE TABLE suppliers(

    supplier_id NUMBER(10),
    supplier_name VARCHAR2(30),
    contact_name VARCHAR2(30),
    CONSTRAINT suppliers_pk PRIMARY KEY(supplier_id, supplier_name)

);

INSERT INTO suppliers VALUES(1, 'IBM', 'Jhon Walker');
INSERT INTO suppliers VALUES(2, 'APPLE', 'Tom Hanks');
INSERT INTO suppliers VALUES(3, 'SAMSUNG', 'Tae Shaun');
INSERT INTO suppliers VALUES(4, 'IBM', 'Chris Tien');
INSERT INTO suppliers VALUES(4, 'IBMX', 'Ali Can');
INSERT INTO suppliers VALUES(5, 'IBMX', 'Ali Can');
INSERT INTO suppliers VALUES(5, 'IBMX', 'Ali Can');

DROP TABLE suppliers;

-- How to update data in a table (DML)
UPDATE suppliers
SET supplier_name = 'GOOGLE'
WHERE supplier_id = 5;

--How to update multiple data in a table
--1.Example
UPDATE suppliers
SET contact_name = 'Veli Han'
WHERE supplier_id < 3;

--2.Example
UPDATE suppliers
SET supplier_name = 'YAHOO'
WHERE contact_name = 'Veli Han';

--3.Example
UPDATE suppliers
SET supplier_name = 'HONDA',
    contact_name = 'Angie Sun'
WHERE supplier_id = 3;

--Create "my_employees1" table with employee_id, employee_name, employee_salary then insert 3 records 
CREATE TABLE my_employees1(
    employee_id CHAR(3),
    employee_name VARCHAR2(30),
    employee_salary NUMBER(7,2)
);

INSERT INTO my_employees1 VALUES('101', 'Tom Hanks', 3000.00);
INSERT INTO my_employees1 VALUES('102', 'Angelina Julie', 3500.75);
INSERT INTO my_employees1 VALUES('103', 'Brad Pitt', 4500.75);

SELECT * FROM my_employees1;

DROP TABLE my_employees1;

--Create "my_positions" table with position_id, position_name, position_salary then insert 3 records 
CREATE TABLE my_positions(
    position_id CHAR(3),
    position_name VARCHAR2(20),
    position_salary NUMBER(7,2)
);

SELECT * FROM my_positions;

INSERT INTO my_positions VALUES('901', 'Junior Worker', 2000.50);
INSERT INTO my_positions VALUES('902', 'Senior Worker', 5000.00);
INSERT INTO my_positions VALUES('902', 'Manager', 10000.00);

--How to update a data by getting data from another table
UPDATE my_employees1
SET employee_salary = (
                        SELECT position_salary
                        FROM my_positions
                        WHERE position_name = 'Manager'
                       )
WHERE employee_name = 'Angelina Julie';


--Update the Brad Pitt's name to Brad Pitt Julie and Brad Pitt's salary to Senior Worker's salary
UPDATE my_employees1
SET employee_name = 'Brad Pitt Julie',
    employee_salary = (
                        SELECT position_salary
                        FROM my_positions
                        WHERE position_name = 'Senior Worker'
                       )
WHERE employee_name = 'Brad Pitt';

--We need to make %10 discount for Senior position and Manager position salaries for the employees 
UPDATE my_employees1
SET employee_salary = (
                        SELECT position_salary
                        FROM my_positions
                        WHERE position_name = 'Senior Worker'
                       )*0.90
WHERE employee_name = 'Brad Pitt Julie';

SELECT * FROM my_employees1;

UPDATE my_employees1
SET employee_salary = (
                        SELECT position_salary
                        FROM my_positions
                        WHERE position_name = 'Manager'
                       )*0.90
WHERE employee_name = 'Angelina Julie';

--Change the salary to 6000 if the salary is less than 5000
UPDATE my_employees1
SET employee_salary = 4000
WHERE employee_salary = 6000;

--Change the salary to 7000 if the salary is less than Senior Worker salary
UPDATE my_employees1
SET employee_salary = 7000
WHERE employee_salary < (
                          SELECT position_salary
                          FROM my_positions
                          WHERE position_name = 'Senior Worker'
                         );
--Note: Sub Queries can be used after "SET" or "WHERE" keyword

--"IS NULL" Condition
CREATE TABLE people
(
 ssn CHAR(9),
 name VARCHAR2(50),
 address VARCHAR2(50)
);

INSERT INTO people VALUES(123456789, 'Mark Star', 'Florida');
INSERT INTO people VALUES(234567890, 'Angie Way', 'Virginia');
INSERT INTO people VALUES(345678901, 'Maryy Tien', 'New Jersey');
INSERT INTO people(ssn, address) VALUES(456789012, 'Michigan');
INSERT INTO people(ssn, address) VALUES(567890123, 'California');
INSERT INTO people(ssn, name) VALUES(567890123, 'California');

SELECT *
FROM people
WHERE name IS NULL OR address IS NULL;

--How to update "null" to more understandable data
--1. Way
UPDATE people
SET name = 'Name is not inserted yet'
WHERE name IS NULL;

UPDATE people
SET address = 'Address is not inserted yet'
WHERE address IS NULL;

--2. Way
UPDATE people
SET name = COALESCE(name, 'Name is not inserted yet'),
    address = COALESCE(address, 'Address is not inserted yet');

DROP TABLE people;

--How to delete data from a table
--What is the difference between "DROP" and "DELETE"?
--DROP removes the table from schema completely that is, it removes table data and table structure
--DELETE does not touch the table structure, it removes just data inside the table

CREATE TABLE people
(
 ssn CHAR(9),
 name VARCHAR2(50),
 address VARCHAR2(50)
);

INSERT INTO people VALUES(123456789, 'Mark Star', 'Florida');
INSERT INTO people VALUES(234567890, 'Angie Way', 'Virginia');
INSERT INTO people VALUES(345678901, 'Maryy Tien', 'New Jersey');
INSERT INTO people(ssn, address) VALUES(456789012, 'Michigan');
INSERT INTO people(ssn, address) VALUES(567890123, 'California');
INSERT INTO people(ssn, name) VALUES(567890123, 'California');

SELECT * FROM people;

--1)How to delete all records from a table
DELETE FROM people;

--2)How to delete a specific record
DELETE FROM people
WHERE name = 'Mark Star';

--3)Delete all records whose names are null or addresses are null
DELETE FROM people
WHERE name IS NULL OR address IS NULL;

--4)Delete all records whose names are not null
DELETE FROM people
WHERE name IS NOT NULL;


--What is "TRUNCATE"?

--1)"TRUNCATE" is used to remove just "all" records. 
--  But "DELETE" is used to remove "all" and "specific" records
--2)If you use "TRUNCATE" you CANNOT roll the records back.
--  But when you use "DELETE" you CAN roll the records back.
--3)You CANNOT use "WHERE" clause in "TRUNCATE"
--  But in "DELETE" you can


TRUNCATE TABLE people;

--How to prevent to roll a table back after using "DROP"?
--If you use "PURGE" together with "DROP", the table will be removed from schema and to roll it back will be impossible
SELECT * FROM people;

DROP TABLE people PURGE;

-- Using "SELECT" statement (DQL)
--1)How to get all records from a table
SELECT *
FROM people;

--2)How to select specific records from a table
--1. Example
SELECT *
FROM people
WHERE name = 'Maryy Tien';

--3. Example
--Select records whose name lengths are less than 10
SELECT * 
FROM people
WHERE LENGTH(name) < 10;

CREATE TABLE workers
(
    id CHAR(5),
    name VARCHAR2(50),
    salary NUMBER(5),
    CONSTRAINT id4_pk PRIMARY KEY(id)
);

INSERT INTO workers VALUES(10001, 'Ali Can', 12000);
INSERT INTO workers VALUES(10002, 'Veli Han', 2000);
INSERT INTO workers VALUES(10003, 'Mary Star', 7000);
INSERT INTO workers VALUES(10004, 'Angie Ocean', 8500);

SELECT *
FROM workers;


--4)Example
--Select minimum salary from the workers table
SELECT MIN(salary) AS minimum_salary 
FROM workers;

--5)Example
--Select maximum salary from the workers table by using alias
SELECT MAX(salary) AS maximum_salary
FROM workers;

--6)Example
--Select maximum and minumum salary from the workers table by using alias
SELECT MAX(salary) AS maximum_salary,
       MIN(salary) AS minimum_salary
FROM workers;

--7) Example
--Select the record whose salary is maximum
SELECT *
FROM workers
WHERE salary = (
                 SELECT MAX(salary)
                 FROM workers
                );

--8) Example
--Select the record whose salary is minimum
SELECT *
FROM workers
WHERE salary = (
                 SELECT MIN(salary)
                 FROM workers
                );

--9) Example
--Select the record whose salary is minimum or maximum
SELECT *
FROM workers
WHERE salary = (SELECT MIN(salary) FROM workers) OR salary = (SELECT MAX(salary) FROM workers);


--10)Example
--Select second maximum salary from the workers table by using alias
SELECT MAX(salary) AS second_maximum_salary
FROM workers
WHERE salary < (SELECT MAX(salary) FROM workers);

--11)Example
--Select second minimum salary from the workers table by using alias
SELECT MIN(salary) AS second_minimum_salary
FROM workers
WHERE salary > (SELECT MIN(salary) FROM workers);

--12) Example
--Select the record whose salary is the second maximum
--1. Way
SELECT *
FROM workers
WHERE salary = (
                SELECT MAX(salary)
                FROM workers
                WHERE salary < (
                                 SELECT MAX(salary) 
                                 FROM workers
                                )
                );

--2. Way
--To sort records in SQL we use "ORDER BY" with field name. It puts the records in ascending order as default, if you want to put records in descending order
--you have to declare

--If you want to skip some records from the top use "OFFSET <number of rows> ROW"

--If you want to get some records from top use "FETCH NEXT <number of rows> ROW ONLY"
SELECT *
FROM workers
ORDER BY salary DESC
OFFSET 1 ROW
FETCH NEXT 1 ROW ONLY;

--13)Example
--Select the record whose salary is the second minimum
--1.Way
SELECT *
FROM workers
WHERE salary = (
                SELECT MIN(salary)
                FROM workers
                WHERE salary > (SELECT MIN(salary) 
                                FROM workers)
                );

--2.Way
SELECT *
FROM workers
ORDER BY salary ASC
OFFSET 1 ROW
FETCH NEXT 1 ROW ONLY;


--14)Example
--Select all data of the worker whose salary is the third maximum salary from the workers table by using alias
--1. Way
SELECT *
FROM workers
WHERE salary = (
                SELECT MAX(salary)
                FROM workers
                WHERE salary < (
                                SELECT MAX(salary)
                                FROM workers
                                WHERE salary < (
                                                SELECT MAX(salary)
                                                FROM workers
                                                )
                                )
                );
                
--2.Way
SELECT *
FROM workers
ORDER BY salary DESC
OFFSET 2 ROW
FETCH NEXT 1 ROW ONLY;