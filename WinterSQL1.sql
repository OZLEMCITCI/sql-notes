												Class 1 & 2:

--How to create table
CREATE TABLE my_students (
student_id CHAR(3), 
student_name VARCHAR2(30),
student_age NUMBER(3,0),
date_of_birth DATE,
CONSTRAINT student_id_fk FOREIGN KEY(student_id) REFERENCES my_employees(employee_id)
);

--Create a table, name it as employees. Fields are id, name, salary, state, company name 
CREATE TABLE my_employees(
    employee_id CHAR(5),
    employee_name VARCHAR2(30) UNIQUE,--UNIQUE is a "constraint" means no repeated values, multiple null is allowed
    employee_salary number(10,2) NOT NULL,--NOT NULL is a "constraint" means null values are not accepted
    employee_state CHAR(2),
    company_name VARCHAR2(40),
    CONSTRAINT employee_id_pk PRIMARY KEY(employee_id) 
);

--How to drop a table
DROP TABLE my_employees;

--How to check values in a field
CREATE TABLE suppliers(
    supplier_id NUMBER(3),-- Check if the id is between 200 and 500
    supplier_name VARCHAR2(30),
    supplier_date DATE,
    CONSTRAINT supplier_id_check CHECK(supplier_id BETWEEN 200 AND 500)
);


CREATE TABLE my_suppliers(
    supplier_id NUMBER(3),
    supplier_name VARCHAR2(30),--Create a constraint to check if all names are in uppercases
    supplier_date DATE,
    CONSTRAINT supplier_name_check CHECK(supplier_name = UPPER(supplier_name))
);

--Constraints: 1)Primary Key 2)Unique 3)Not Null 4)Foreign Key 5)Check


                                        --How to insert data into a table
--1.Way

INSERT INTO my_suppliers VALUES(101, 'ALI CAN', '07-Apr-21');
INSERT INTO my_suppliers VALUES(102, 'VELI HAN', '07-Apr-21');


--How to see table on the output console
SELECT * FROM my_suppliers;

CREATE TABLE my_employees(
    employee_id CHAR(5),
    employee_name VARCHAR2(30) UNIQUE,
    employee_salary number(10,2) NOT NULL,
    employee_state CHAR(2),
    company_name VARCHAR2(40),
    CONSTRAINT employee_id_pk PRIMARY KEY(employee_id) 
);

INSERT INTO my_employees VALUES('12345', 'Ali Can', 123000.00, 'FL', 'Google');
INSERT INTO my_employees VALUES('12346', 'Aliye Can', 123000.00, 'VA', 'Google');
INSERT INTO my_employees VALUES('12347', 'Veli Han', 146000.25, null, 'Apple');


SELECT * FROM my_employees;

--2. Way
CREATE TABLE my_suppliers(
    supplier_id NUMBER(3),
    supplier_name VARCHAR2(30),--Create a constraint to check if all names are in uppercases
    supplier_date DATE,
    CONSTRAINT supplier_name_check CHECK(supplier_name = UPPER(supplier_name))
);

INSERT INTO my_suppliers(supplier_name, supplier_id) VALUES('KEMAL KOC', 124);

SELECT * FROM my_suppliers;