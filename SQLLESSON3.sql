-- WARMUP 10 Minutes
--Answer the following questions and share the answers on live channel
--1) What is the difference between “TRUNCATE” and “DELETE”?
--2) What is the script to sort records in ascending or descending order? ASC ==> ORDER BY <field name> ASC  -  DSC ==> ORDER BY <field name> DESC
--3) What is the script to skip first 3 records? ==> OFFSET 3 ROW
--4) What is the script to get just first 2 records? ==> FETCH NEXT 2 ROW ONLY
--5) How to remove a table from schema in such a way that it cannot be rolled back? ==> DROP TABLE <table name> PURGE
​
--"IN" condition
CREATE TABLE customers_products
( 
  product_id number(10),
  customer_name varchar2(50),
  product_name varchar2(50)
);
INSERT INTO customers_products VALUES (10, 'Mark', 'Orange');
INSERT INTO customers_products VALUES (10, 'Mark', 'Orange');
INSERT INTO customers_products VALUES (20, 'John', 'Apple');
INSERT INTO customers_products VALUES (30, 'Amy', 'Palm');
INSERT INTO customers_products VALUES (20, 'Mark', 'Apple');
INSERT INTO customers_products VALUES (10, 'Adem', 'Orange');
INSERT INTO customers_products VALUES (40, 'John', 'Apricot');
INSERT INTO customers_products VALUES (20, 'Eddie', 'Apple');
​
DROP TABLE customers_products;
​
SELECT*FROM customers_products;
--Select all records whose product names are "Orange" or "Apple" or "Apricot"
--1.way
SELECT*
FROM customers_products
WHERE product_name = 'Orange' OR product_name = 'Apple' OR product_name = 'Apricot';
​
--2:way
SELECT*
FROM customers_products
WHERE product_name IN ('Orange','Apple','Apricot');
​
--"BETWEEN" Condition
--Select all records whose product id's are greater than or equal to 10 and less than or equal to 30
​
--1.way
SELECT*
FROM customers_products
WHERE product_id >= 10 AND product_id <= 30;
​
--2.way
SELECT*
FROM customers_products
WHERE product_id BETWEEN 10 AND 30; -- ==> If you use "BETWEEN" borders are inclusive
​
--"NOT BETWEEN" Condition
--Select all records whose product id's are less than 20 OR greater than 30
--1.way
SELECT*
FROM customers_products
WHERE product_id < 20 OR product_id > 30;
​
--2.way
SELECT*
FROM customers_products
WHERE product_id  NOT BETWEEN 20 AND 30; --In "NOT BETWEEN" borders are inclusive
​
--"EXISTS" condition
--"EXISTS" is used before "SUBQUERIES"
CREATE TABLE customers_likes
( 
  product_id number(10),
  customer_name varchar2(50),
  liked_product varchar2(50)
);
​
INSERT INTO customers_likes VALUES (10, 'Mark', 'Orange');
INSERT INTO customers_likes VALUES (50, 'Mark', 'Pineapple');
INSERT INTO customers_likes VALUES (60, 'John', 'Avocado');
INSERT INTO customers_likes VALUES (30, 'Lary', 'Cherries');
INSERT INTO customers_likes VALUES (20, 'Mark', 'Apple');
INSERT INTO customers_likes VALUES (10, 'Adem', 'Orange');
INSERT INTO customers_likes VALUES (40, 'John', 'Apricot');
INSERT INTO customers_likes VALUES (20, 'Eddie', 'Apple');
​
--Select customer names whose product id's are same in customers_likes and cuctomer_products table
SELECT customer_name
FROM customers_products
WHERE EXISTS (
                SELECT product_id
                FROM customers_likes
                WHERE customers_products.product_id = customers_likes.product_id
             );
             
SELECT * FROM customers_products;
​
DROP TABLE my_employees1;
--"SUBQUERIES" in "SELECT" statement 
CREATE TABLE my_employees1(
    id number(9),
    name VARCHAR2(50),
    state VARCHAR2(50),
    salary NUMBER(20),
    company VARCHAR2(20));
    
INSERT INTO my_employees1 VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO my_employees1 VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO my_employees1 VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO my_employees1 VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO my_employees1 VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO my_employees1 VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO my_employees1 VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');
​
CREATE TABLE companies 
(  
  company_id number(9), 
  company varchar2(20),
  number_of_employees number(20)
);
​
INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(100, 'APPLE', 21000);
​
--Find the employee names and company names whose company has more than 15000 employees
SELECT name, company
FROM my_employees1
WHERE company In(
                     SELECT company
                     FROM companies
                     WHERE number_of_employees > 15000
                     );
                     
             
--Find the state names, company names that company has the least employees
SELECT state, company
FROM my_employees1
WHERE company IN (
                    SELECT company
                    FROM companies
                    WHERE number_of_employees = (
                                                 SELECT MIN(number_of_employees)
                                                 FROM companies
                                                 )
                );
                
--Find the employees names of the company whose number of employees is maximum
SELECT name
FROM my_employees1
WHERE company IN (
                    SELECT company
                    FROM companies
                    WHERE number_of_employees = (
                                                    SELECT MAX(number_of_employees)
                                                    FROM companies
                                                )   )                                             
               
--Find the average salary of the employees whose companies more than 15000 employees
SELECT AVG(salary) AS average_salary
FROM my_employees1
WHERE company IN (
                SELECT company
                FROM companies
                WHERE number_of_employees > 15000
                );
--Find the number of employees and average salary for every company
SELECT company, number_of_employees,(
                                        SELECT AVG(salary)
                                        FROM my_employees1
                                        WHERE companies.company = my_employees1.company
                                    ) AS average_salary_per_company
FROM companies
ORDER BY number_of_employees;



















