--GROUP BY
DROP TABLE workers PURGE;
​
CREATE TABLE workers 
(  
  id number(9), 
  name varchar2(50), 
  state varchar2(50), 
  salary number(20),
  company varchar2(20)
);
​
INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');
​
SELECT * FROM workers;
​
--Find the total salary for every worker
Select sum(salary), name from workers group by name;
​
--Find the number of workers for every state
select count(name) as number_of_workers from workers group by state

SELECT COUNT(name) AS total_employee
FROM workers
GROUP BY state;
​
--Find the number of the workers whose salary is more than $2000 per company 
 Select company, count(name) as number_of_emp_morethan_2000 
 from workers 
 where salary>2000
 group by company

​
--Find the minimum and maximum salary for every company 
select company,count(name) as number_of_workers, max(salary) as max_salary
from workers group by company;
​
--"HAVING" clause: It is used after "GROUP BY" to filter
​
--Find the total salary if it is greater than 2500 for every worker
Select name, sum(salary) as total_salary
from workers
group by name 
having sum(salary)>2500;

--Note: After "WHERE", group functions(SUM(), COUNT(), MIN(), MAX(), AVG()) CANNOT be used.
--Note: After "GROUP BY",  "WHERE" CANNOT be used
--Note: After "GROUP BY", if you need to filter, you have to use "HAVING"
--Note: After "HAVING", you can use group functions or field names both work
​

​
--Find the total salary if the worker name is after 'Brad Pitt' in alphabet for every worker

​
--Find the number of employees if it is more than 1 per state
select count(name)
from workers 
group by state
having count(name)>1
​
--Find the minimum salary if it is more than 2000 for every company

​
--Find the maximum salary if it is less than 3000 for every state

​
--SET Operations in SQL
--UNION, UNION ALL, INTERSECT, MINUS
--SET Operations are used between 2 SELECT Queries
​
--Find the state OR employee names whose salary is greater than 3000, less than 2000 without duplication.




--Note: Expression must have same datatype as corresponding expression
--Note: Query blocks must have same number of result columns
​
​
                --UNION Example
--When you use UNION same records are displayed just one, NO DUPLICATION

​
                --UNION ALL Example
--When you use UNION ALL same records are displayed multiple times, DUPLICATION is allowed


​
​
                --INTERSECT Example
                
--Find all common worker names whose salary is greater than 1000, less than 2000



​
--Find all common employee names whose salary is greater than 2000 and company name is IBM, APPLE or GOOGLE

​
--MINUS Example
​
--Find the employee names whose salary is less than 3000 and not working in GOOGLE



