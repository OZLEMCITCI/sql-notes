--Create  "my_employees1" table 

​
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
​
--Create  "companies" table
DROP TABLE companies PURGE;
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
SELECT * FROM my_employees1;
​
SELECT * FROM companies;
​
--Find the name of the companies, company ids, and the number of states( COUNT(<field name>) ) for every company
--Farkli bi tablodan bilgi alip onu column olarak yapacaksin sonunda as eklemeyi unutma.
​
SELECT company, company_id, (
                             SELECT COUNT(state) 
                             FROM my_employees1
                             WHERE companies.company = my_employees1.company
                            ) AS num_of_states_per_company
FROM companies;
​
--Find the name of the companies, company ids, maximum and minimum salaries per company.
SELECT company, company_id, (
                               SELECT MAX(salary)
                               FROM my_employees1
                               WHERE companies.company = my_employees1.company
                             ) AS max_salary,
                             
                             (
                               SELECT MIN(salary)
                               FROM my_employees1
                               WHERE companies.company = my_employees1.company
                             ) AS min_salary
FROM companies;
​
--Find the distinct state names
SELECT DISTINCT(state)
FROM my_employees1;
​
--Find the distinct employee names
SELECT DISTINCT(name)
FROM my_employees1;
​
--Find the number of distinct state names and number of distinct employee names.
SELECT COUNT(DISTINCT(state)) AS distinct_states, COUNT(DISTINCT(name)) AS distinct_names
FROM my_employees1;
​
--LIKE Condition
--LIKE is used with "Wildcard"
--"Wildcard" s are 1)% ==> Means zero or more characters
--                 2)_ ==> Means single character   
--                 3)REGEXP_LIKE 
​
​
--1)% ==> Means zero or more characters
--Find state names whose initial is "F"
SELECT state
FROM my_employees1
WHERE state LIKE 'F%';
​
--Find company names whose last character is 'E'
SELECT company
FROM my_employees1
WHERE company LIKE '%E';
​
--Find distinct company names starts with 'G' ends with 'E'
SELECT DISTINCT(company)
FROM my_employees1
WHERE company LIKE 'G%E';
​
--Find records whose company names have 'OS' in any position
SELECT *
FROM my_employees1
WHERE company LIKE '%OS%';
​
​
--2)_ ==> Means single character
​
--Find the state names whose second character is 'e' 
SELECT state
FROM my_employees1
WHERE state LIKE '_e%';
​
--Find the state names whose length is 7 and third character is 'o' 
SELECT state
FROM my_employees1
WHERE state LIKE '__o____';
​
--Find the state names whose length is 5 and second character is 'e' and fourth character is 'a'
SELECT state
FROM my_employees1
WHERE state LIKE '_e_a_';
​
--Find the state names whose length is at least 5 and second character is 'e'
SELECT state
FROM my_employees1
WHERE state LIKE '_e___%';
​
--Find the employee names starting with any character followed by 'ra'
SELECT name
FROM my_employees1
WHERE name LIKE '_ra%';
​
--3)REGEXP_LIKE
CREATE TABLE words
( 
  word_id number(10) UNIQUE,
  word varchar2(50) NOT NULL,
  number_of_letters number(6)
);

truncate table words
​
INSERT INTO words VALUES (1001, 'hot', 3);
INSERT INTO words VALUES (1002, 'hat', 3);
INSERT INTO words VALUES (1003, 'hit', 3);
INSERT INTO words VALUES (1004, 'hbt', 3);
INSERT INTO words VALUES (1008, 'hct', 3);
INSERT INTO words VALUES (1005, 'adem', 4);
INSERT INTO words VALUES (1006, 'selena', 6);
INSERT INTO words VALUES (1007, 'yusuf', 5);
​
SELECT * FROM words;
​
--Find the words whose first character is 'h', third character is 't' and second character is 'o' or 'a'
SELECT word
FROM words
WHERE REGEXP_LIKE(word, 'h[oa]t');
​
--Find the words whose first character is 'h', third character is 't' and second character from 'a' to 'i'
--1. Way: Not recommended
SELECT word
FROM words
WHERE REGEXP_LIKE(word, 'h[abcdefghi]t');
​
--2. Way:
SELECT word
FROM words
WHERE REGEXP_LIKE(word, 'h[a-i]t');














