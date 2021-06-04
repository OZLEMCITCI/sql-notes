--3)REGEXP_LIKE
CREATE TABLE words
( 
  word_id number(10) UNIQUE,
  word varchar2(50) NOT NULL,
  number_of_letters number(6)
);
​
INSERT INTO words VALUES (1001, 'hot', 3);
INSERT INTO words VALUES (1002, 'hat', 3);
INSERT INTO words VALUES (1003, 'hit', 3);
INSERT INTO words VALUES (1004, 'hbt', 3);
INSERT INTO words VALUES (1008, 'hct', 3);
INSERT INTO words VALUES (1005, 'adem', 4);
INSERT INTO words VALUES (1006, 'selena', 6);
INSERT INTO words VALUES (1007, 'yusuf', 5);
INSERT INTO words VALUES (1009, 'aababbbbc', 9);
​
SELECT * FROM words;
​
--Find the words whose first character is 'h', third character is 't' and second character is 'o' or 'a'

​
--Find the words whose first character is 'h', third character is 't' and second character from 'a' to 'i'
--1. Way: Not recommended

--2. Way:

​
--Find the words starting with 'a' or 's' or 'y'

--Find the words ending with 'a' or 'm' or 'f'

--Note: ^ is for first character, $ is for last character
​
--Find the words starting with 'h' ending with 't' and has 3 characters

​
--Note: '.' in REGEXP_LIKE stands for single character
​
--Retrieve all words contain 'a'

--Note: 'i' in 3rd parameter means "case insensitive". 
--If you do not put 'i' in 3rd parameter PL/SQL works as case sensitive as default. 
​
--Retrieve all words contain 'at'

​
--Retrieve all words contain 'a', 'b', 'c', 'd' and followed by 't'

​
--Retrieve all words contain 'd' and followed by any character, followed by 'm'

--Retrieve all words contain 'u' and followed by any 2 characters, followed by 'f'

​
--Retrieve all words contain double 'b' in any position

--Note: {4} means same character is repeated 4 times side by side like bbbb or xxxx or eeee
​
​
--NOT LIKE
​
--Find all words not starting with 'h'

​
--Find all words not ending with 't'

​
--Find all words do not have 'e' in second position

​
--Find all words do not contain 'a' in any position position

​
--Find all words starting with any character, NOT followed by 'e' or 'a' or 'd'

​
--(*) means any character or any characters or nothing. It is similar with '%' in LIKE
​
--ORDER BY
--Instead of field names, you can use field numbers in 'ORDER BY'
SELECT *
FROM words
ORDER BY 3 DESC, 2 ASC;
​
SELECT *
FROM words
ORDER BY number_of_letters DESC, word ASC;
​
--ALIASES
DROP TABLE workers PURGE;
​
CREATE TABLE workers 
(  
  worker_id number(9), 
  worker_first_name varchar2(20),
  worker_last_name varchar2(20)
);
​
INSERT INTO workers VALUES(14, 'Chris', 'Tae');
INSERT INTO workers VALUES(11, 'John', 'Walker');
INSERT INTO workers VALUES(12, 'Amy', 'Star');
INSERT INTO workers VALUES(13, 'Brad', 'Pitt');
INSERT INTO workers VALUES(15, 'Chris', 'Way');
​
CREATE TABLE addresses 
(  
  employee_id number(9), 
  street varchar2(20),
  city varchar2(20),
  state char(2),
  zipcode char(5)
);
​
INSERT INTO addresses VALUES(11, '32nd Star 1234', 'Miami', 'FL', '33018');
INSERT INTO addresses VALUES(12, '23rd Rain 567', 'Jacksonville', 'FL', '32256');
INSERT INTO addresses VALUES(13, '5th Snow 765', 'Hialeah', 'VA', '20121');
INSERT INTO addresses VALUES(14, '3rd Man 12', 'Weston', 'MI', '12345');
INSERT INTO addresses VALUES(15, '11th Chris 12', 'St. Johns', 'FL', '32259');
​
--Retrieve worker's first name, last name, and city name
