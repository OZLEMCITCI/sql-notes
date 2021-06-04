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
----Farkli bi tablodan bilgi alip onu column olarak yapacaksin sonunda as eklemeyi unutma.
​
--Find the name of the companies, company ids, maximum and minimum salaries per company.
----Farkli bi tablodan bilgi alip onu column olarak yapacaksin sonunda as eklemeyi unutma.


​
--Find the distinct state names
Select distinct(state)
from my_employees1;


​
--Find the distinct employee names

​
--Find the number of distinct state names and number of distinct employee names.

 
--LIKE Condition
--LIKE is used with "Wildcard"
--"Wildcard" s are 1)% ==> Means zero or more characters
--                 2)_ ==> Means single character   
--                 3)REGEXP_LIKE 
​
​
--1)% ==> Means zero or more characters
--Find state names whose initial is "F"

select state 
from my_employees1
Where state like'F%';

--Find company names whose last character is 'E'
SELECT COMPANY 
FROM COMPANIES
WHERE COMPANY LIKE '%E';
​
--Find distinct company names starts with 'G' ends with 'E'

SELECT DISTINCT(COMPANY)
FROM COMPANIES
wHERE COMPANY LIKE 'G%E'

--Find records whose company names have 'OS' in any position

​
​
--2)_ ==> Means single character
​
--Find the state names whose second character is 'e' 

​
--Find the state names whose length is 7 and third character is 'o'
Select state
from my_employees1
where state like '__o____'


--Find the state names whose length is 5 and second character is 'e' and fourth character is 'a'

--Find the state names whose length is at least 5 and second character is 'e'

--Find the employee names starting with any character followed by 'ra'
Select name
from my_employees1
where name like '_ra%'
​
--3)REGEXP_LIKE

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

--Find the words whose first character is 'h', third character is 't' and second character from 'a' to 'i'
--1. Way: Not recommended

​
--2. Way:
