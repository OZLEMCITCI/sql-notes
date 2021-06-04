--JOINS: 
--1)INNER JOIN     2)LEFT JOIN     3)RIGHT JOIN        4)FULL JOIN       5)SELF JOIN
​DROP TABLE COMPANIES;

CREATE TABLE my_companies 
(  
  company_id number(9), 
  company_name varchar2(20)
);
​
INSERT INTO my_companies VALUES(100, 'IBM');
INSERT INTO my_companies VALUES(101, 'GOOGLE');
INSERT INTO my_companies VALUES(102, 'MICROSOFT');
INSERT INTO my_companies VALUES(103, 'APPLE');
​
SELECT * FROM my_companies;
​
CREATE TABLE orders 
(  
  order_id number(9),
  company_id number(9), 
  order_date date
);
​
INSERT INTO orders VALUES(11, 101, '17-Apr-2020');
INSERT INTO orders VALUES(22, 102, '18-Apr-2020');
INSERT INTO orders VALUES(33, 103, '19-Apr-2020');
INSERT INTO orders VALUES(44, 104, '20-Apr-2020');
INSERT INTO orders VALUES(55, 105, '21-Apr-2020');
​
SELECT * FROM orders;
​
--1)INNER JOIN (JOIN): You will get common records from two tables
SELECT m.company_id, m.company_name, o.order_id FROM my_companies m 
JOIN orders o ON o.company_id=m.company_id;
​
--2)LEFT JOIN: You will get records from the left-hand table
SELECT m.company_id, m.company_name, o.order_id
FROM my_companies m LEFT JOIN orders o
ON o.company_id = m.company_id;
​
--3)RIGHT JOIN: You will get records from the right-hand table
SELECT o.company_id, m.company_name, o.order_id
FROM my_companies m RIGHT JOIN orders o
ON o.company_id = m.company_id;
​
--4)FULL JOIN: You will get all records from the right-hand table and left-hand table
SELECT o.company_id, m.company_name, o.order_id
FROM my_companies m FULL JOIN orders o
ON o.company_id = m.company_id;
​
--5)SELF JOIN: We join a table with itself
CREATE TABLE workers 
(  
  id number(2), 
  name varchar2(20),
  title varchar2(60),
  manager_id number(2) 
);
​
INSERT INTO workers VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO workers VALUES(2, 'John Walker', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'QA Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);
​
SELECT * FROM workers;

Drop table workers;
​
--Create a report which displays the workers and their managers

​
​
--HOW TO CHANGE TABLE STRUCTURE
​
--ALTER TABLE: It is used to 1)Add Fields 2)Modify Fields 3)Delete Fields
​
--ADD address column into workers table

​
--Add citizenship column into workers table with default value 'USA'

​
--Change the name of address field to student_address

​
--Change the name of student_address field to worker_address

​
--Change the table name to my_workers

​
--Make the id field 'NOT NULL'

​
--DELETE a Column
