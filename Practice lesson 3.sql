--Answer the following questions and share the answers on live channel
​
--1) What is the difference between "TRUNCATE" and "DELETE"?
--2) What is the script to sort records in ascending or descending order? ASC ==> ORDER BY <field name> ASC  -  DSC ==> ORDER BY <field name> DESC
--3) What is the script to skip first 3 records? ==> OFFSET 3 ROW
--4) What is the script to get just first 2 records? ==> FETCH NEXT 2 ROW ONLY
--5) How to remove a table from schema in such a way that it cannot be rolled back? ==> DROP TABLE <table name> PURGE
​
--"IN" Condition
CREATE TABLE customers_products
( 
  product_id number(10),
  customer_name varchar2(50),
  product_name varchar2(50)
);
​
INSERT INTO customers_products VALUES (10, 'Mark', 'Orange');
INSERT INTO customers_products VALUES (10, 'Mark', 'Orange');
INSERT INTO customers_products VALUES (20, 'John', 'Apple');
INSERT INTO customers_products VALUES (30, 'Amy', 'Palm');
INSERT INTO customers_products VALUES (20, 'Mark', 'Apple');
INSERT INTO customers_products VALUES (10, 'Adem', 'Orange');
INSERT INTO customers_products VALUES (40, 'John', 'Apricot');
INSERT INTO customers_products VALUES (20, 'Eddie', 'Apple');
INSERT INTO customers_products VALUES (70, 'ozlem', 'Applek');
​
SELECT * FROM customers_products;
​
--Select all records whose product names are "Orange" or "Apple" or "Apricot"
--1. WAY
SELECT * FROM customers_products WHERE product_name = 'Orange' OR  product_name='Apple' OR  product_name='Apricot';



--2.WAY

SELECT * FROM customers_products WHERE product_name IN('Apple','Orange');

--"bETWEEN CONDITION'
--Select all records whose product id's are greater than AND equal 10 and less than 30
--1.WAY

SELECT * FROM customers_products WHERE  product_id not between 20 and 40;

-- NOT BETWEEN



--"Exists" Condition
--"exist" Conditions is used before subqueries

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
INSERT INTO customers_likes VALUES (60, 'ozlem', 'Applek');

--select  customer names whose product id's are same in customer_like and customer _products table
Select customer_name from customers_products where exists
(Select product_id from customers_likes where customers_products.product_id=customers_likes.product_id);


SELECT customer_name
FROM customers_products
WHERE product_id in (
                SELECT product_id
                FROM customers_likes
                WHERE customers_products.product_id = customers_likes.product_id
             );

SELECT customer_name
FROM customers_products
WHERE Exists (
                SELECT product_id
                FROM customers_likes
                WHERE customers_products.product_id = customers_likes.product_id
             );
             
 SELECT customer_name
FROM customers_products;           

--"SUBQUERIES IN SELECT STATEMENT; 
CREATE TABLE my_employees1 
(  
  id number(9), 
  name varchar2(50), 
  state varchar2(50), 
  salary number(20),
  company varchar2(20)
);


​
INSERT INTO my_employees1 VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO my_employees1 VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO my_employees1 VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO my_employees1 VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO my_employees1 VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO my_employees1 VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO my_employees1 VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

CREATE TABLE companies 
(  
  company_id number(9), 
  company varchar2(20),
  number_of_employees number(20)
);

INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(100, 'APPLE', 21000);
--fIND THE EMPLOYEE NAME AND COMPANY IF COMPANY HAS MORE THAN 15000 number of employees
 
SELECT name, company
FROM my_employees1
WHERE company IN(
                     SELECT company
                     FROM companies
                     WHERE number_of_employees > 15000
                     );
                     
SELECT name, company
FROM my_employees1
WHERE Exists(
                     SELECT company
                     FROM companies
                     WHERE number_of_employees > 15000
                     );                     
----Find the state names, company names that company has the least employees
Select state, company from my_employees1 where company In( 
                                                           SELECT company 
                                                           from companies
                                                           where number_of_employees=(select min(number_of_employees)
                                                                                      from companies 
                                                                                      
                                                           ))


--Find the employees names of the company whose number of employees is maximum

Select name from my_employees1 where company In(select company 
                                                from companies
                                                where number_of_employees=(Select max(number_of_employees)
                                                                            from companies
                                                                             ))



 --Find the average salary of the employees whose companies more than 15000 employees                                                                        
select  avg(salary) as avarage_salary
from my_employees1
where company in(select company 
                 from companies
                 where number_of_employees>10000 )


----Find the number of employees and average salary for every company
Select company,number_of_employees,(SELECT AVG(SALARY) as avarage_salary
                                    FROM my_employees1
                                    where companies.company=my_employees1.company  )
from companies order by number_of_employees;                                 

  