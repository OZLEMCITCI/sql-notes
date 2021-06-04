--Create a table called “suppliers” that stores “supplier_ID”, “name”, address information which
--has “street”, “city”, “state”, and “zip_code” columns separately.
CREATE TABLE suppliers(
supplier_id number(2),
name varchar2(10),
street VARCHAR2(10),
city varchar(10));

--Create a table called “suppliers_id_name” that stores “supplier ID”, “name” by using “suppliers” table

Create TABLE suppliers_id_name 
AS SELECT supplier_id,
name From suppliers;

--Create a table called “cities” that stores “area code”, “name”, “population”, “state”
--The “area code” will be “primary key”
--Add “primary key” by using first method.

CREATE TABLE cities(
area_code VARCHAR2(5),
name VARCHAR2(20),
population number(10),
state CHAR(2), 
CONSTRAINT area_code_pk PRIMARY KEY (area_code));

--Create a table called “supplier” that stores “supplier_id”, “supplier_name”, “contact_name” and make the
--combination of “supplier_id” and “supplier_name” as primary key.
--Create another table called “products” that stores “supplier_id” and “product_id” and make the
--combination of “supplier_id” and “supplier_name” as foreign key.
--supplier_id between 1000 and 10
--supplier_name is all uppercase


CREATE TABLE supplier(
supplier_id NUMBER(10),
supplier_name VARCHAR2(20),
contact_name VARCHAR2(20),
CONSTRAINT supplier_pk PRIMARY KEY(supplier_id ,supplier_name),
CONSTRAINT supplier_id_check CHECK (SUPPLIER_ID BETWEEN 1000 AND 10),
CONSTRAINT supplier_name_check CHECK (supplier_name=UPPER(supplier_name)));



CREATE TABLE product(
supplier_id NUMBER(10),
supplier_name VARCHAR2(20),
CONSTRAINT supplier_fk FOREIGN KEY(supplier_id ,supplier_name) REFERENCES supplier(supplier_id ,supplier_name)
);

--created a check constraint on the suppliers table called check_supplier_id.
--This constraint ensures that the supplier_id field contains values between 100 and 9999.

--insert data to cties table
INSERT INTO CITIES (area_code,name) values(123,'malatya');
INSERT INTO CITIES (area_code,name) values(124,'malatya');
INSERT INTO CITIES (area_code,name) values(125,'malatya');
INSERT INTO CITIES (area_code,name) values(126,'malatya');

--update city_name id area code is lett than 125

UPDATE cities 
SET name= 'ELAZIG'
WHERE area_code<125;

SELECT*FROM cities;


--Create a table called “students” that stores “student_id”, “student_name”, “student_grade”, “school_name”
--b) Insert 5 different data with 2.6, 1.9, 3.2, 3.8, 3.5 GPA scores.

--e) Update the student names in the students table with the parent name in the parents table when the school name in
--the students table matches the school name in the parents table.
--c) Create a table called “parents” that stores “student_id”, “parent_name”, “school_name”
--d) Insert 5 different data with at least 2 same school names with the students table.


























































