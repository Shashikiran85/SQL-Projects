CREATE TABLE regions (
	region_id INT IDENTITY(1,1) PRIMARY KEY,
	region_name VARCHAR (25) DEFAULT NULL
);

CREATE TABLE countries (
	country_id CHAR (2) PRIMARY KEY,
	country_name VARCHAR (40) DEFAULT NULL,
	region_id INT NOT NULL,
	FOREIGN KEY (region_id) REFERENCES regions (region_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE locations (
	location_id INT IDENTITY(1,1) PRIMARY KEY,
	street_address VARCHAR (40) DEFAULT NULL,
	postal_code VARCHAR (12) DEFAULT NULL,
	city VARCHAR (30) NOT NULL,
	state_province VARCHAR (25) DEFAULT NULL,
	country_id CHAR (2) NOT NULL,
	FOREIGN KEY (country_id) REFERENCES countries (country_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE jobs (
	job_id INT IDENTITY(1,1) PRIMARY KEY,
	job_title VARCHAR (35) NOT NULL,
	min_salary DECIMAL (8, 2) DEFAULT NULL,
	max_salary DECIMAL (8, 2) DEFAULT NULL
);

CREATE TABLE departments (
	department_id INT IDENTITY(1,1) PRIMARY KEY,
	department_name VARCHAR (30) NOT NULL,
	location_id INT DEFAULT NULL,
	FOREIGN KEY (location_id) REFERENCES locations (location_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE employees (
	employee_id INT IDENTITY(1,1) PRIMARY KEY,
	first_name VARCHAR (20) DEFAULT NULL,
	last_name VARCHAR (25) NOT NULL,
	email VARCHAR (100) NOT NULL,
	phone_number VARCHAR (20) DEFAULT NULL,
	hire_date DATE NOT NULL,
	job_id INT NOT NULL,
    salary DECIMAL (8, 2) NOT NULL,
	manager_id INT DEFAULT NULL,
	department_id INT DEFAULT NULL,
	FOREIGN KEY (job_id) REFERENCES jobs (job_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (department_id) REFERENCES departments (department_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (manager_id) REFERENCES employees (employee_id)
);
            
CREATE TABLE dependents (
	dependent_id INT IDENTITY(1,1) PRIMARY KEY,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	relationship VARCHAR (25) NOT NULL,
	employee_id INT NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES employees (employee_id) ON DELETE CASCADE ON UPDATE CASCADE
)

select * from regions

/*Data for the table regions */
INSERT INTO regions(region_name) 
VALUES ('Europe');
INSERT INTO regions(region_name) 
VALUES ('Americas');
INSERT INTO regions(region_name) 
VALUES ('Asia');
INSERT INTO regions(region_name) 
VALUES ('Middle East and Africa');

select * from regions

/*Data for the table countries */
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('AR','Argentina',2);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('AU','Australia',3);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('BE','Belgium',1);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('BR','Brazil',2);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('CA','Canada',2);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('CH','Switzerland',1);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('CN','China',3);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('DE','Germany',1);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('DK','Denmark',1);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('EG','Egypt',4);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('FR','France',1);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('HK','HongKong',3);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('IL','Israel',4);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('IN','India',3);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('IT','Italy',1);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('JP','Japan',3);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('KW','Kuwait',4);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('MX','Mexico',2);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('NG','Nigeria',4);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('NL','Netherlands',1);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('SG','Singapore',3);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('UK','United Kingdom',1);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('US','United States of America',2);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('ZM','Zambia',4);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('ZW','Zimbabwe',4);

select * from countries

/*Data for the table locations */

     SET IDENTITY_INSERT LOCATIONS ON

INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
 VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
 VALUES (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
 VALUES (1700,'2004 Charade Rd','98199','Seattle','Washington','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) 
VALUES (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) 
VALUES (2400,'8204 Arthur St',NULL,'London',NULL,'UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) 
VALUES (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
 VALUES (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');


  SET IDENTITY_INSERT LOCATIONS OFF
 SELECT * FROM LOCATIONS

 /*Data for the table jobs */

   SET IDENTITY_INSERT jobs ON

INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (1,'Public Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (2,'Accounting Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (3,'Administration Assistant',3000.00,6000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (4,'President',20000.00,40000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (5,'Administration Vice President',15000.00,30000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (6,'Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (7,'Finance Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (8,'Human Resources Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (9,'Programmer',4000.00,10000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (10,'Marketing Manager',9000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (11,'Marketing Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (12,'Public Relations Representative',4500.00,10500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (13,'Purchasing Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (14,'Purchasing Manager',8000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (15,'Sales Manager',10000.00,20000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (16,'Sales Representative',6000.00,12000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (17,'Shipping Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (18,'Stock Clerk',2000.00,5000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (19,'Stock Manager',5500.00,8500.00);
  
  SET IDENTITY_INSERT jobs off

  select * from jobs

  /*Data for the table departments */

  SET IDENTITY_INSERT DEPARTMENTS ON

INSERT INTO departments(department_id,department_name,location_id)
 VALUES (1,'Administration',1700);
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (2,'Marketing',1800);
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (3,'Purchasing',1700);
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (4,'Human Resources',2400);
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (5,'Shipping',1500);
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (6,'IT',1400);
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (7,'Public Relations',2700);
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (8,'Sales',2500);
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (9,'Executive',1700);
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (10,'Finance',1700);
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (11,'Accounting',1700);


SET IDENTITY_INSERT DEPARTMENTS OFF
SELECT * FROM DEPARTMENTS

 /*Data for the table employees */

  SET IDENTITY_INSERT EMPLOYEES ON

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
 VALUES (100,'Steven','King','steven.king@sqltutorial.org','515.123.4567','1987-06-17',4,24000.00,NULL,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (101,'Neena','Kochhar','neena.kochhar@sqltutorial.org','515.123.4568','1989-09-21',5,17000.00,100,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (102,'Lex','De Haan','lex.de haan@sqltutorial.org','515.123.4569','1993-01-13',5,17000.00,100,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (103,'Alexander','Hunold','alexander.hunold@sqltutorial.org','590.423.4567','1990-01-03',9,9000.00,102,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (104,'Bruce','Ernst','bruce.ernst@sqltutorial.org','590.423.4568','1991-05-21',9,6000.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (105,'David','Austin','david.austin@sqltutorial.org','590.423.4569','1997-06-25',9,4800.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (106,'Valli','Pataballa','valli.pataballa@sqltutorial.org','590.423.4560','1998-02-05',9,4800.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (107,'Diana','Lorentz','diana.lorentz@sqltutorial.org','590.423.5567','1999-02-07',9,4200.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (108,'Nancy','Greenberg','nancy.greenberg@sqltutorial.org','515.124.4569','1994-08-17',7,12000.00,101,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (109,'Daniel','Faviet','daniel.faviet@sqltutorial.org','515.124.4169','1994-08-16',6,9000.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (110,'John','Chen','john.chen@sqltutorial.org','515.124.4269','1997-09-28',6,8200.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (111,'Ismael','Sciarra','ismael.sciarra@sqltutorial.org','515.124.4369','1997-09-30',6,7700.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (112,'Jose Manuel','Urman','jose manuel.urman@sqltutorial.org','515.124.4469','1998-03-07',6,7800.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (113,'Luis','Popp','luis.popp@sqltutorial.org','515.124.4567','1999-12-07',6,6900.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (114,'Den','Raphaely','den.raphaely@sqltutorial.org','515.127.4561','1994-12-07',14,11000.00,100,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (115,'Alexander','Khoo','alexander.khoo@sqltutorial.org','515.127.4562','1995-05-18',13,3100.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (116,'Shelli','Baida','shelli.baida@sqltutorial.org','515.127.4563','1997-12-24',13,2900.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (117,'Sigal','Tobias','sigal.tobias@sqltutorial.org','515.127.4564','1997-07-24',13,2800.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (118,'Guy','Himuro','guy.himuro@sqltutorial.org','515.127.4565','1998-11-15',13,2600.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (119,'Karen','Colmenares','karen.colmenares@sqltutorial.org','515.127.4566','1999-08-10',13,2500.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (120,'Matthew','Weiss','matthew.weiss@sqltutorial.org','650.123.1234','1996-07-18',19,8000.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (121,'Adam','Fripp','adam.fripp@sqltutorial.org','650.123.2234','1997-04-10',19,8200.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (122,'Payam','Kaufling','payam.kaufling@sqltutorial.org','650.123.3234','1995-05-01',19,7900.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (123,'Shanta','Vollman','shanta.vollman@sqltutorial.org','650.123.4234','1997-10-10',19,6500.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (126,'Irene','Mikkilineni','irene.mikkilineni@sqltutorial.org','650.124.1224','1998-09-28',18,2700.00,120,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (145,'John','Russell','john.russell@sqltutorial.org',NULL,'1996-10-01',15,14000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (146,'Karen','Partners','karen.partners@sqltutorial.org',NULL,'1997-01-05',15,13500.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (176,'Jonathon','Taylor','jonathon.taylor@sqltutorial.org',NULL,'1998-03-24',16,8600.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (177,'Jack','Livingston','jack.livingston@sqltutorial.org',NULL,'1998-04-23',16,8400.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (178,'Kimberely','Grant','kimberely.grant@sqltutorial.org',NULL,'1999-05-24',16,7000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (179,'Charles','Johnson','charles.johnson@sqltutorial.org',NULL,'2000-01-04',16,6200.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (192,'Sarah','Bell','sarah.bell@sqltutorial.org','650.501.1876','1996-02-04',17,4000.00,123,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (193,'Britney','Everett','britney.everett@sqltutorial.org','650.501.2876','1997-03-03',17,3900.00,123,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (200,'Jennifer','Whalen','jennifer.whalen@sqltutorial.org','515.123.4444','1987-09-17',3,4400.00,101,1);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (201,'Michael','Hartstein','michael.hartstein@sqltutorial.org','515.123.5555','1996-02-17',10,13000.00,100,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (202,'Pat','Fay','pat.fay@sqltutorial.org','603.123.6666','1997-08-17',11,6000.00,201,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (203,'Susan','Mavris','susan.mavris@sqltutorial.org','515.123.7777','1994-06-07',8,6500.00,101,4);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (204,'Hermann','Baer','hermann.baer@sqltutorial.org','515.123.8888','1994-06-07',12,10000.00,101,7);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (205,'Shelley','Higgins','shelley.higgins@sqltutorial.org','515.123.8080','1994-06-07',2,12000.00,101,11);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (206,'William','Gietz','william.gietz@sqltutorial.org','515.123.8181','1994-06-07',1,8300.00,205,11);

 SET IDENTITY_INSERT EMPLOYEES OFF
 select * from EMPLOYEES

 /*Data for the table dependents */

 SET IDENTITY_INSERT dependents ON

INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (1,'Penelope','Gietz','Child',206);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (2,'Nick','Higgins','Child',205);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (3,'Ed','Whalen','Child',200);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (4,'Jennifer','King','Child',100);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (5,'Johnny','Kochhar','Child',101);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (6,'Bette','De Haan','Child',102);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (7,'Grace','Faviet','Child',109);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (8,'Matthew','Chen','Child',110);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (9,'Joe','Sciarra','Child',111);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (10,'Christian','Urman','Child',112);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (11,'Zero','Popp','Child',113);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (12,'Karl','Greenberg','Child',108);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (13,'Uma','Mavris','Child',203);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (14,'Vivien','Hunold','Child',103);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (15,'Cuba','Ernst','Child',104);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
 VALUES (16,'Fred','Austin','Child',105);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (17,'Helen','Pataballa','Child',106);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
 VALUES (18,'Dan','Lorentz','Child',107);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (19,'Bob','Hartstein','Child',201);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (20,'Lucille','Fay','Child',202);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
 VALUES (21,'Kirsten','Baer','Child',204);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (22,'Elvis','Khoo','Child',115);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (23,'Sandra','Baida','Child',116);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
 VALUES (24,'Cameron','Tobias','Child',117);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (25,'Kevin','Himuro','Child',118);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (26,'Rip','Colmenares','Child',119);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (27,'Julia','Raphaely','Child',114);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (28,'Woody','Russell','Child',145);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (29,'Alec','Partners','Child',146);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (30,'Sandra','Taylor','Child',176);


SET IDENTITY_INSERT DEPENDENTS OFF
SELECT * FROM dependents

/*TASK 1:
         A.	To get data from all the rows and columns in the employees table*/

		 SELECT * FROM employees


 /*B.	select data from the employee id, first name, last name, and hire date of all rows in the employees table:*/


        SELECT employee_id,first_name, last_name, hire_date 
		FROM employees


  /* C.	to get the first name, last name, salary, and new salary:*/

         SELECT first_name,last_name, salary 
		 FROM EMPLOYEES


 /*  D.	Increase the salary two times and named as New_SALARY from employees table */

          
		    SELECT first_name, salary * 2 AS NEW_SALARY

		    FROM employees


/* 2- A.returns the data from the employee id, first name, last name, hire date, and salary column of the employees table:*/
  

        SELECT employee_id , first_name, last_name,hire_date,salary
		FROM employees
  
  
 /* B.	to sort employees by first names in alphabetical order: */

	   SELECT *
	   FROM employees
	   ORDER BY first_name ASC
	   

 /*C.	to sort the employees by the first name in ascending order and the last name in descending order:*/

         SELECT EMPLOYEE_ID, FIRST_NAME, lAST_NAME, Salary
		 FROM  employees
		 ORDER BY first_name ASC,
		          LAST_NAME DESC


	/* D.	to sort employees by salary from high to low: */

	         select employee_id,first_name,last_name,salary,hire_date
			 from employees
			 order by salary desc

/*	E.	to sort the employees by values in the hire_date column from:  */

            select employee_id,first_name,last_name,hire_date,salary
			from employees
			order by hire_date asc

	
/*   F.	sort the employees by the hire dates in descending order: */

           select employee_id,first_name,last_name,salary,hire_date
		   from employees
		   order by hire_date desc


 /* 3)WRITE A QUERY FOR DISTINCT  STATEMENTS :-
     A.	selects the salary data from the salary column of the employees table and sorts them from high to low:*/

	       Select distinct salary as Salary_data
		   from employees
		   order by Salary_data desc


/*  B.	select unique values from the salary column of the employees table: */

          Select distinct salary
		  from employees

  /* C.	selects the job id and salary from the employees table */

          Select  job_id, salary
		   from employees 
		   

/*	D.	to remove the duplicate values in job id and salary: */


          select distinct job_id,salary
		  from employees


/*	E.	returns the distinct phone numbers of employees: */

           Select distinct phone_number 
		   from employees


/*	4)WRITE A QUERY FOR TOP N  STATEMENTS :- 
       A.	returns all rows in the employees table sorted by the first_name column. */

	        Select * 
			from employees
			order by first_name

			
 /* B.	to return the first 5 rows in the result set returned by the SELECT clause:*/
          
		  Select Top 5*
		  from employees
		 
		 
/*	C.	to return five rows starting from the 4th row: */

           Select Top 5 *
		   from
		   (
		   select *, ROW_NUMBER() over (order by employee_id) as Row_num 
		   from employees)  as five_row
		   where Row_num >=4


/* D.	gets the top five employees with the highest salaries. */

           select top 5 *
		   from
		   ( select  distinct salary, first_name 
		   from employees) as distinct_salaries
		   order by  salary desc

		   select  Top 5 salary, first_name
		   from employees
		   order by salary desc


/*	 E.	to get employees who have the 2nd highest salary in the company */

          select Top 1*
		            From 
	               (select top 2 salary, employee_id
		            from employees
			        order by salary desc) as SecondndHighest_salary
			         order by salary asc


 /* 5)WRITE A QUERY FOR WHERE  CLAUSE and COMPARISON OPERATORS :-
    A. query finds employees who have salaries greater than 14,000 and sorts the results sets based on the salary in descending order.*/


	     select employee_id, first_name, salary 
		 from employees
		 where salary > 14000
		 order by salary desc


		
/*	B.	query finds all employees who work in the department id 5. */

          
		  select employee_id, first_name, last_name, department_id
		  from employees
		  where department_id = 5


/*	C.	query finds the employee whose last name is Chen */

          select *
		  from employees
		  where last_name = 'chen'


/*	D.	To get all employees who joined the company after January 1st, 1999 */


           select *
		   from employees
		   where hire_date > '1999-01-01'


/*	E.	to find the employees who joined the company in 1999,*/

     
	       Select * 
		   from employees
		   where year(hire_date) = 1999


/*	F.	statement finds the employee whose last name is Himuro */

         
		  select * 
		  from employees
		  where last_name = 'himuro'


/*	G.	the query searches for the string Himuro in the last_name column of the employees table */

         Select * 
		 from employees
		 where last_name like '%himuro%'


/*	H.	to find all employees who do not have phone numbers: */

           select *
		   from employees
		   where phone_number is null


/*	I.	returns all employees whose department id is not 8. */

            select * 
			from employees
			where department_id <> 8


/*	J.	finds all employees whose department id is not eight and ten. */


            select * 
			from employees
			where  department_id   not in (8 ,10)
			

/*	K.	to find the employees whose salary is greater than 10,000, */

            select * 
			from employees
			where salary > 10000



/*	L.	finds employees in department 8 and have the salary greater than 10,000: */

           select * 
		   from employees
		   where department_id = 8 and salary > 10000


 /* M.	the statement below returns all employees whose salaries are less than 10,000 */

          select *
		  from employees
		  where salary < 10000


/*.	finds employees whose salaries are greater than or equal 9,000: */

        Select * 
		from employees
		where salary  >= 9000


/*.	finds employees whose salaries are less than or equal to 9,000:*/

       select *
	   from employees
	   where salary <= 9000


 /* 6- WRITE A QUERY FOR:-*/

       Create table Courses
	   (
	    Course_id int,
		Course_name varchar(155)
		)

		select * from Courses

/* A.	adds a new column named credit_hours to the courses table.*/

       Alter table Courses
	   Add credit_hours decimal(6,2)

	  select * from Courses


/*B.	adds the fee and max_limit columns to the courses table and places these columns after the course_name column.*/

          Alter Table Courses
		  Add Fee Money, Max_limit int

		  Create Table Courses1
		  (
	    Course_id int,
		Course_name varchar(155),
		Fee money,
		 Max_limit int,
		 Credit_hours decimal(6,2)
		)
		 drop table Courses
		  
		Exec  sp_rename 'courses1', 'Courses'


		select * from Courses


/*C.	changes the attribute of the fee column to NOT NULL.*/
   
          Alter table courses
		  Alter column Fee money not null


/* D.	to remove the fee column of the courses table */

   
          Alter Table courses
		  Drop column Fee

		  Select * from Courses

/* E.	removes the max_limit and credit_hours of the courses table */

        Alter Table Courses
		Drop Column Max_limit, Credit_hours


/* 6)WRITE A QUERY FOR:- SQL foreign key constraint*/

     CREATE  TABLE  projects (
    project_id  INT  PRIMARY KEY,
    project_name  VARCHAR(255),
    start_date  DATE  NOT NULL,
    end_date  DATE  NOT NULL
);
    CREATE  TABLE  project_milestones(
    milestone_id  INT  PRIMARY KEY,
    project_id   INT,
    milestone_name VARCHAR(100)
);


/* A.	to add an SQL FOREIGN KEY constraint to the project_milestones table to enforce the relationship between the projects and project_milestones tables.*/

       Alter Table project_milestones
	   Add Constraint Foreign_key
	   Foreign Key (project_id) References Projects (Project_id)


/* B.	Suppose the project_milestones already exists without any predefined foreign key and you want to define a FOREIGN KEY constraint 
for the project_id column so write a Query to add a FOREIGN KEY constraint to existing table */ 

         Alter Table project_milestones
	   Add Constraint Foreign_key
	   Foreign Key (project_id) References Projects (Project_id)


/* 1)WRITE A QUERY FOR  LOGICAL OPERATORS and OTHER ADVANCED OPERATORS:-
Part 1:-
     A.	finds all employees whose salaries are greater than 5,000 and less than 7,000: */

	      Select *
		  from employees
		  where salary > 5000 and salary < 7000

/*B.	finds employees whose salary is either 7,000 or 8,000: */

           Select * 
		   from employees
		   where salary =7000 or salary = 8000

/*C.	finds all employees who do not have a phone number: */

          Select *
		  from employees
		  where phone_number is Null


/* D.	finds all employees whose salaries are between 9,000 and 12,000 */

         Select * 
		 from employees
		 where Salary between  9000 and 12000


/*E.	finds all employees who work in the department id 8 or 9.*/

         Select * 
		 from Employees
		 Where department_id in (8 , 9)


/*F.	finds all employees whose first name starts with the string jo*/

        Select * 
		from employees
		where first_name like 'jo%'


/* H.	finds all employees whose salaries are greater than all salaries of employees in the department 8: */
 
      select *
	   from employees
	   where salary > (select max(salary)
	                   from employees
					   where department_id =8)
		                  
		  
		  

   /* Part 2:- 
A.	finds all employees whose salaries are greater than the average salary of every department: */

         
		 select e.*
		 from employees e
		 where e.salary >
		( Select AVG(salary)
		  from employees
		  where department_id = e.department_id)


	/*B.	finds all employees who have dependents */

	       

			select * 
			from employees
			where employee_id in 
			(select employee_id
			from dependents)


	/* C.	to find all employees whose salaries are between 2,500 and 2,900: */

	               select *
				   from employees
				   where salary between 2500 and 2900


	/* D.	to find all employees whose salaries are not in the range of 2,500 and 2,900: */

	            Select * 
				from employees
				where salary not between 2500 and 2900


  /* E.	to find all employees who joined the company between January 1, 1999, and December 31, 2000: */

                 Select * 
				 from employees
				 where hire_date between'1999-01-01'and'2000-12-31'


	/*F.	to find employees who have not joined the company from January 1, 1989 to December 31, 1999:*/


	             Select *
				 From employees
				 where hire_date not between'1989-01-01'and ' 1999-12-31'



/* G.	to find employees who joined the company between 1990 and 1993*/

                Select * 
				From employees
				where year(hire_date) between 1990 and 1993



	/* Part 3:-
A.	to find all employees whose first names start with Da  */

               Select * 
			   from employees
			   where first_name like 'da%'

/* B.	to find all employees whose first names end with er*/

           Select * 
		   From employees
		   where first_name like '%er'


/*  C.	to find employees whose last names contain the word an: */


           Select *
		   from employees
		   where last_name like '%an%'


/* D.	retrieves employees whose first names start with Jo and are followed by at most 2 characters: */

             
			Select *
			from employees
			where first_name like 'jo__%'



/* E.	to find employees whose first names start with any number of characters and are followed by at most one character:*/


             Select *
			 from employees
			 where first_name like '_%'



/* F.	to find all employees whose first names start with the letter S but not start with Sh: */

           select *
		   from employees
		   where first_name like 's%' and first_name not like 'sh%'



	/* Part 4:-
A.	retrieves all employees who work in the department id 5.  */

             select *
			 from employees
			 where department_id = 5



/* B.	To get the employees who work in the department id 5 and with a salary not greater than 5000. */

            select * 
			from employees
			where department_id = 5 and salary <=5000


/* C.	statement gets all the employees who are not working in the departments 1, 2, or 3. */

           Select *
		   From employees
		   where department_id not in (1 ,2 ,3)



/* D.	retrieves all the employees whose first names do not start with the letter D. */



                Select * 
				from employees
				where first_name not like 'd%'



/* E.	to get employees whose salaries are not between 5,000 and 1,000. */

                
				 Select *
				 from  employees
				 where salary not between  1000 and 5000



	/*   Part 5:- A.	Write a query to get the employees who do not have any dependents by above image */

	        
			Select e.*
			from employees e
			where e.employee_id not in ( select employee_id
			                             from dependents)


	/*B.	To find all employees who do not have the phone numbers */

	       select * 
		   from employees
		   where phone_number is null



/* C.	To find all employees who have phone numbers */

          Select *
		  from employees
		  where phone_number is not null



	/*	TASK 3:
       1)	Write a Query to 
A.	To get the information of the department id 1,2, and 3  */


       
		select *
		from departments
		where department_id in (1,2,3)


/*B.	To get the information of employees who work in the department id 1, 2 and 3*/

             Select E.* 
			 from employees E 
			 Inner join departments D on 
			 D.department_id = E.department_id
			 where E.department_id in (1,2,3)


/* Write a Query to get the first name, last name, job title, and department name of employees who work in department id 1, 2, and 3. */

             Select E.first_name,  E.last_name, J.job_title , D.department_name 

			 from employees E inner join departments D on D.department_id = E.department_id
			                  inner join  jobs J on J.job_id = E.job_id

              where E.department_id in (1,2,3)
			  


/* Write a Query :--
A.	To query the country names of US, UK, and China */

               Select c.country_name
			   from locations L
			left   join countries C on C.country_id = l.country_id
			   where C.country_id in ( 'US', 'UK', 'CHINA')
			     

				 ------------W/0 USING LEFT JOIN--------------------

				 SELECT country_name
				 FROM countries
				 WHERE country_id IN ('US','UK','CHINA')




	/* B.	query retrieves the locations located in the US, UK and China: */
	   
	           Select location_id
			   from locations l left join
			   countries C on  C.country_id = l.country_id
			   where c.country_id in ('US', 'UK', 'CHINA')

			-----   ---------OR--------------------------

			   select location_id
			   from locations
			   where country_id in ( 'US', 'UK', 'CHINA' )


	/* C.	To join the countries table with the locations table */

	     
		  SELECT * 
		  FROM locations L LEFT JOIN
		  COUNTRIES C ON C.country_id = L.country_id


	/*D.	to find the country that does not have any locations in the locations table */

	      
		    SELECT C.COUNTRY_NAME, C.country_id
			FROM COUNTRIES C
			LEFT JOIN locations L ON L.country_id = C.country_id
			WHERE L.location_id IS NULL
			

  /*    Write a query to join 3 tables: regions, countries, and locations */


              SELECT * 
			  FROM regions R LEFT JOIN countries C ON C.region_id = R.region_id
			                 LEFT JOIN LOCATIONS L ON L.country_id= C.country_id


/*       SQL self-join
       Questions:-
       The manager_id column specifies the manager of an employee. Write a query  statement to  joins the employees table to itself 
     to query the information of who reports to whom.*/


                SELECT EMP.first_name + ' '+ EMP.last_name AS EMP_NAME,
				       MGR.first_name+ ' ' + MGR.last_name AS MGR_NAME
				FROM employees EMP 
				INNER JOIN employees MGR
				 ON EMP.manager_id = MGR.employee_id


	/*  Now write a Query To include the president in the result set:-  the row that contains the president is NULL.*/

	                 

	              
				         SELECT EMP.first_name + ' '+ EMP.last_name AS EMP_NAME,
				          Case
						 when MGR.first_name + ' '+ MGR.last_name is null then 'PRESIDENT'
						 ELSE MGR.first_name + ' '+ MGR.last_name
						 END AS MGR_NAME
                         FROM employees EMP 
				         LEFT JOIN  employees MGR 
				         ON EMP.manager_id = MGR.employee_id

				  



/* SQL FULL OUTER JOIN clause */

                  CREATE  TABLE  fruits (
	                fruit_id  INT PRIMARY KEY,
	                fruit_name  VARCHAR (255) NOT NULL,
	                 basket_id  INTEGER
                      );
                   CREATE TABLE baskets (
	                           basket_id  INT PRIMARY KEY,
	                           basket_name  VARCHAR (255) NOT NULL
                                      );


 INSERT  INTO  baskets  (basket_id, basket_name)
VALUES
	(1, 'A'),
	(2, 'B'),
	(3, 'C');


INSERT  INTO  fruits (
	fruit_id,
	fruit_name,
	basket_id
)
VALUES
	(1, 'Apple', 1),
	(2, 'Orange', 1),
	(3, 'Banana', 2),
	(4, 'Strawberry', NULL);


	/* A.	Write a query to  returns each fruit that is in a basket and each basket that has a fruit,
	        but also returns each fruit that is not in any basket and each basket that does not have any fruit. */


			SELECT * 
			FROM baskets B FULL OUTER JOIN
			fruits F ON F.basket_id = B.basket_id


			SELECT * FROM baskets
			SELECT * FROM FRUITS


	/* B.	Write a query to find the empty basket, which does not store any fruit */


	       SELECT B.basket_id, B.basket_name 
		   FROM baskets B FULL OUTER JOIN
		   fruits F ON F.basket_id = B.basket_id
		   WHERE F.fruit_id IS NULL


	/* C.	Write a query  which fruit is not in any basket */

	       SELECT fruit_name 
		   FROM baskets B FULL OUTER JOIN 
		   fruits F ON F.basket_id = B.basket_id
		   WHERE B.basket_id IS NULL


	/* SQL CROSS JOIN clause*/

	CREATE  TABLE  sales_organization (
	sales_org_id  INT PRIMARY KEY,
	sales_org  VARCHAR (255)
);

 CREATE  TABLE  sales_channel (
	channel_id  INT PRIMARY KEY,
	channel  VARCHAR (255)
);

INSERT INTO sales_organization (sales_org_id, sales_org)
VALUES
	(1, 'Domestic'),
	(2, 'Export');


INSERT INTO sales_channel (channel_id, channel)
VALUES
	(1, 'Wholesale'),
	(2, 'Retail'),
	(3, 'eCommerce'),
	(4, 'TV Shopping');


	/* Write a Query To find the all possible sales channels that a sales organization */

	        

			SELECT * FROM sales_channel
			CROSS JOIN
			sales_organization


			/* TASK 4:   SQL GROUP BY clause*/

	/*Write a  Query 
                   A.	to group the values in department_id column of the employees table:*/


				   SELECT  department_id, COUNT(*) EMPLOYEE_COUNT
				   FROM employees
				   GROUP BY department_id


	/*        B.	to count the number of employees by department */

	         SELECT D.department_id , D.department_name, COUNT(*) AS EMPLOYEES_COUNT
			 FROM employees E LEFT JOIN 
			 departments D ON D.department_id = E.department_id
			 GROUP BY D.department_id , D.department_name
			 

	/*    C.	returns the number of employees by department   */

               SELECT E.department_id, D.department_name, COUNT(*) NO_OF_EMPLOYEE
			   FROM EMPLOYEES E LEFT JOIN 
			   DEPARTMENTS D ON D.department_id = E.department_id
			   GROUP BY E.department_id , D.department_name
			   ORDER BY department_id


	/*    D.	to sort the departments by headcount:  */

	             
			    SELECT E.department_id, D.department_name, COUNT(*) HEAD_COUNT
			   FROM EMPLOYEES E LEFT JOIN 
			   DEPARTMENTS D ON D.department_id = E.department_id
			   GROUP BY E.department_id , D.department_name
			   ORDER BY HEAD_COUNT DESC
			   

	/* E.	to find departments with headcounts are greater than 5: */

	       SELECT E.department_id, D.department_name, COUNT(*) HEAD_COUNT
			   FROM EMPLOYEES E LEFT JOIN 
			   DEPARTMENTS D ON D.department_id = E.department_id
			   GROUP BY E.department_id , D.department_name
			   HAVING COUNT(*) > 5
			   ORDER BY HEAD_COUNT DESC


/* F.	returns the minimum, maximum and average salary of employees in each department.*/

               SELECT   E.department_id , D.DEPARTMENT_NAME,
			           MAX(SALARY) MAXIMUM_SALARY, MIN(SALARY) MINIMUM_SALARY, AVG(SALARY) AVERAGE_SALARY
			   FROM EMPLOYEES  E LEFT JOIN 
			   departments D ON E.department_id = D.department_id
			   GROUP BY E.department_id, D.department_name
			   ORDER BY department_id 


/*  G.	To get the total salary per department */

      SELECT E.department_id, D.department_name, SUM(SALARY) TOTAL_SALARY
	  FROM employees E LEFT JOIN 
	  DEPARTMENTS D ON D.department_id = E.department_id
	  GROUP BY E.department_id, D.department_name
	  ORDER BY department_id

/* H.	groups rows with the same values both department_id and job_id columns in the same group then return the rows for each of these groups */

         SELECT E.job_id, COUNT(E.JOB_ID) JOB_COUNT, D.department_id,COUNT(D.DEPARTMENT_ID) AS DEPARTMENT_COUNT
		 FROM employees E LEFT JOIN
		 DEPARTMENTS D ON D.department_id= E.department_id
		 GROUP BY E.job_id, D.department_id



   /*      SQL HAVING clause    
   A.	To get the managers and their direct reports, and  to group employees by the managers and to count the direct reports. */

   SELECT M.employee_id MANAGER_ID, M.first_name+' '+ M.last_name MANGER_NAME,
          COUNT(*) DIRECT_REPORT_COUNT
   FROM EMPLOYEES M LEFT JOIN 
   employees E ON M.employee_id = E.manager_id
   GROUP BY M.employee_id, M.first_name+' '+ M.last_name
   
     
	 /*B.	To find the managers who have at least five direct reports*/

	           SELECT  M.employee_id MANAGER_ID, M.first_name+' '+M.last_name MANAGER_NAME,
			           COUNT(*) DIRECT_REPORT_COUNT
			           FROM employees M LEFT JOIN 
			           employees E ON M.employee_id = E.manager_id
					   GROUP BY M.employee_id , M.first_name+' '+M.last_name
					   HAVING COUNT(*) >=5



	/*C.	calculates the sum of salary that the company pays for each department and 
	       selects only the departments with the sum of salary between 20000 and 30000.  */

		   SELECT department_id, SUM(SALARY) COMPANY_PAY
		   FROM employees
		   GROUP BY department_id
		   HAVING SUM(SALARY) BETWEEN  20000 AND 30000
		   

		   SELECT  * FROM employees
		   SELECT * FROM dependents


	/* D.	To find the department that has employees with the lowest salary greater than 10000  */

	      SELECT E.department_id, MIN(SALARY) LOWEST_SALARY
		  FROM employees E LEFT JOIN 
		  dependents D ON E.employee_id = D.employee_id		  
		  GROUP BY E.department_id
		  HAVING MIN(SALARY) > 10000
		  ORDER BY LOWEST_SALARY


		  
/*	E.	To find the departments that have the average salaries of employees between 5000 and 7000 */

   SELECT E.department_id , AVG(E.SALary) AVERAGE_SALARY
   FROM employees E LEFT JOIN
   dependents D ON E.employee_id = D.employee_id
   GROUP BY E.department_id
   HAVING AVG(E.salary) BETWEEN 5000 AND 7000



/* TASK 5 (Other Queries)
   
   Write a Query to combine the first name and last name of employees and dependents */

    SELECT CONCAT(FIRST_NAME,' ',last_name) EMPLOYEE_NAME
    FROM employees
	UNION 
   SELECT CONCAT(FIRST_NAME,' ',last_name) EMPLOYEE_NAME
   FROM dependents

   /* Question :-
   Write a Query to  Applies the INTERSECT operator to the A and B tables and sorts the combined result set by the id column in descending order.*/

   CREATE TABLE A
   ( ID INT)

   CREATE TABLE B
   (ID INT)

   INSERT INTO A VALUES (1) , (2) ,(3)
   INSERT INTO B VALUES  (2) , (3) ,(4)

   
  
   SELECT * FROM A
   INTERSECT
   SELECT * FROM B
   ORDER BY ID DESC

   /* 3)SQL EXISTS operator
       A.	finds all employees who have at least one dependent. */

	   
		SELECT employee_id, first_name, last_name
		FROM employees E
		WHERE EXISTS (SELECT * FROM dependents D
		               WHERE E.employee_id = D.employee_id)

					   SELECT * FROM employees


/* . finds employees who do not have any dependents: */

   

  SELECT E.employee_id, E.first_name, E.last_name
  FROM EMPLOYEES E
  WHERE NOT EXISTS ( SELECT * FROM dependents D
                    WHERE D.employee_id = E.employee_id)


	/* 4) SQL CASE expression
	      A.	Suppose the current year is 2000. How to  use the simple CASE expression to get the work anniversaries of employees by */

		  SELECT employee_id, first_name, last_name,
		          CASE 
				  WHEN YEAR(HIRE_DATE) = 2000 THEN  'WORK ANNIVERSARIES IN 2000'
				  ELSE 'NO WORK ANNIVERSARY'
				  END AS ANNIVERSARIES_STATUS
		  FROM employees



	/*B.	Write a Query  If the salary is less than 3000, the CASE expression returns “Low”. If the salary is between 3000 and 5000, 
	        it returns “average”. When the salary is greater than 5000, the CASE expression returns “High”.  */

			SELECT employee_id, first_name, last_name,
			       CASE
				   WHEN salary < 3000 THEN 'LOW' 
                   WHEN SALARY > 5000 THEN 'HIGH' ELSE 'AVERAGE'
				   END AS SALARY_STATUS
			FROM EMPLOYEES

	/*  SQL UPDATE statement
	    Write a Query to update Sarah’s last name from  Bell to Lopez */

		SELECT * FROM employees

		UPDATE employees
		SET last_name = 'LOPEZ'
		WHERE employee_id =192


/* How to  make sure that the last names of children are always matched with the last name of parents in the  employees table, */



/* FINAL TASK  (Advanced Queries)
    SQL SUBQUERY           */

	/*A.	Combine Above two queries using subquery inorder find all departments located at the location whose id is 1700 and 
	find all employees that belong to the location 1700 by using the department id list of the previous query*/

	
	SELECT employee_id, first_name, last_name 
	FROM  employees
	WHERE department_id IN 
   (
	SELECT department_id
	FROM departments
	WHERE location_id = 1700)


	/*B.	to find all employees who do not locate at the location 1700:*/

	       SELECT employee_id, first_name, last_name 
		   FROM employees
		   WHERE department_id NOT IN 
		   (
	       SELECT department_id 
		    FROM departments
			WHERE location_id = 1700)



	/* C.	finds the employees who have the highest salary: */

	      SELECT employee_id, first_name, last_name,salary
		  FROM employees
		   WHERE SALARY =
		  (SELECT MAX(SALARY)
		    FROM employees)
		  

	/*D.	finds all employees who salaries are greater than the average salary of all employees:*/

	       SELECT employee_id,first_name,last_name,salary
		   FROM employees
		   WHERE SALARY >
		   (
		   SELECT AVG(SALARY)
			FROM employees)


	/* E.	finds all departments which have at least one employee with the salary is greater than 10,000:*/

	      
		   
          SELECT department_id,department_name
		  FROM departments
		  WHERE department_id IN 
		  (
		   SELECT department_id
		   FROM employees
		   WHERE SALARY >10000)


/* F.	finds all departments that do not have any employee with the salary greater than 10,000: */

         SELECT department_id,department_name
		 FROM departments
		 WHERE department_id NOT IN 
		 (
         SELECT department_id
		 FROM employees
		 WHERE salary > 10000)


	/* G.	to find the lowest salary by department:*/

	      SELECT D.department_id , D.DEPARTMENT_NAME,  
		                      (SELECT MIN(E.SALARY )
							  FROM employees E
							  WHERE E.department_id = D.department_id)

							   FROM departments D
		                      
		  
/*H.	finds all employees whose salaries are greater than the lowest salary of every department:*/

      


		SELECT employee_id, first_name,last_name, salary
		FROM EMPLOYEES E
		WHERE SALARY > ALL
		(SELECT MIN(SALARY) LOWEST_SALARY
		FROM employees E
		WHERE department_id = E.department_id)
		

/* I.	finds all employees whose salaries are greater than or equal to the highest salary of every department*/

         SELECT E.employee_id, E.first_name, E.last_name,E.salary
		 FROM employees E
		 WHERE salary >= ALL
		 (SELECT MAX(SALARY) HIGHEST_SALARY
		  FROM employees E
		  WHERE department_id = E.department_id)

		  
/*J.	returns the average salary of every department */

         SELECT department_id, AVG(SALARY) AVERAGE_SALARY
		 FROM EMPLOYEES
		 GROUP BY department_id


/* K.	to calculate the average of average salary of departments  */
    

	       SELECT AVG(AVERAGE_SALARY) AS OVERALL_AVERAGE_SALARIES
		   FROM (
           SELECT department_id, AVG(SALARY) AVERAGE_SALARY 
		   FROM employees
		   GROUP BY department_id)
		   AS DEPARTMENT_AVG


		  
  /*L.finds the salaries of all employees, their average salary, and the difference between the salary of each employee and the average salary.*/


   SELECT employee_id, first_name, last_name, salary,
          AVG(SALARY) OVER () AVERAGE_SALARY,
		  salary - AVG(SALARY) OVER () AS SALARY_DIFFERENCE
   FROM employees