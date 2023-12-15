CREATE TABLE EMPLOYEEDETAIL
(
EMPLOYEEID INT,
FIRSTNAME VARCHAR(155),
LASTNAME VARCHAR(155),
SALARY MONEY,
JOININGDATE DATETIME,
DEPARTMENT CHAR(155),
GENDER CHAR(155)
)

SELECT * FROM EMPLOYEEDETAIL

INSERT INTO EMPLOYEEDETAIL VALUES (1, 'VIKAS', 'AHLAWAT' , 600000 , '2013-02-12 11:16:00', 'IT', 'MALE') 
INSERT INTO EMPLOYEEDETAIL VALUES (2, 'NIKITA','JAIN', 530000 , '2013-02-14 11:16:00' , 'HR', 'FEMALE') 
INSERT INTO EMPLOYEEDETAIL VALUES (3, 'ASHISH','KUMAR', 1000000 , '2013-02-14 11:16:00' , 'IT', 'MALE') 
INSERT INTO EMPLOYEEDETAIL VALUES (4, 'NIKHIL','SHARMA', 480000 , '2013-02-15 11:16:00' , 'HR', 'MALE') 
INSERT INTO EMPLOYEEDETAIL VALUES (5, 'ANISH','KADIAN', 500000 , '2013-02-16 11:16:00' , 'PAROLL', 'MALE') 


/* 1) Write a query to get all employee detail from "EmployeeDetail" table */

     SELECT * FROM EMPLOYEEDETAIL


/* 2) Write a query to get only "FirstName" column from "EmployeeDetail" table */

     SELECT FIRSTNAME FROM EMPLOYEEDETAIL


/*3) Write a query to get FirstName in upper case as "First Name".*/

    SELECT UPPER(FIRSTNAME) "First Name"
	FROM EMPLOYEEDETAIL


/*4) Write a query to get FirstName in upper case as "First Name".*/

    SELECT UPPER(FIRSTNAME) "First Name"
	FROM EMPLOYEEDETAIL


/*5) Write a query for combine FirstName and LastName and display it as "Name" (also include white space between first name & last name)*/

SELECT CONCAT(FIRSTNAME,' ' ,LASTNAME) Name
FROM EMPLOYEEDETAIL


/*6) Select employee detail whose name is "Vikas*/

 SELECT * 
 FROM EMPLOYEEDETAIL
 WHERE FIRSTNAME = 'VIKAS'


 /*7) Get all employee detail from EmployeeDetail table whose "FirstName" start with latter 'a'*/

 SELECT * 
 FROM EMPLOYEEDETAIL
 WHERE FIRSTNAME LIKE 'a%'


 /*8) Get all employee detail from EmployeeDetail table whose "FirstName" start with latter 'a'.*/

 SELECT * 
 FROM EMPLOYEEDETAIL
 WHERE FIRSTNAME LIKE 'a%'


 /*9. Get all employee details from EmployeeDetail table whose "FirstName" end with 'h'*/

 SELECT * 
 FROM EMPLOYEEDETAIL
 WHERE FIRSTNAME LIKE '%H'


 /*10. Get all employee detail from EmployeeDetail table whose "FirstName" start with any single character between 'a-p'*/

 SELECT * 
 FROM EMPLOYEEDETAIL
 WHERE FIRSTNAME LIKE '[A-P]%'


 /*11)	 Get all employee detail from EmployeeDetail table whose "FirstName" not start with any single character between 'a-p'*/

 SELECT * 
 FROM EMPLOYEEDETAIL
 WHERE FIRSTNAME NOT LIKE '[A-P]%'


 /*Get all employee detail from EmployeeDetail table whose "Gender" end with 'le' and contain 4 letters. 
   The Underscore(_) Wildcard Character represents any single character*/

   SELECT * 
   FROM EMPLOYEEDETAIL
   WHERE GENDER LIKE '__LE%'


 /*13)	 Get all employee detail from EmployeeDetail table whose "FirstName" start with 'A' and contain 5 letters*/

 SELECT * 
 FROM EMPLOYEEDETAIL
 WHERE FIRSTNAME LIKE '%A____'


 /* Get all employee detail from EmployeeDetail table whose "FirstName" containing '%'. ex:-"Vik%as".*/

 SELECT * 
 FROM EMPLOYEEDETAIL
 WHERE FIRSTNAME LIKE '%[%]%'


 /*15)	 Get all unique "Department" from EmployeeDetail table*/

 SELECT  DISTINCT DEPARTMENT
 FROM EMPLOYEEDETAIL


 /*16)	 Get the highest "Salary" from EmployeeDetail table.*/

 SELECT MAX(SALARY) HIGHEST_SALARY
 FROM EMPLOYEEDETAIL


 /*17)	 Get the lowest "Salary" from EmployeeDetail table*/

 SELECT MIN(SALARY) LOWEST_SALARY
 FROM EMPLOYEEDETAIL


 /*18)	 Show "JoiningDate" in "dd mmm yyyy" format, ex- "15 Feb 2013*/

 SELECT  FIRSTNAME,
         FORMAT(JOININGDATE, 'dd MMM yyyy')  "Joining Date" 
         FROM EMPLOYEEDETAIL



/*19)	Show "JoiningDate" in "yyyy/mm/dd" format, ex- "2013/02/15" */

SELECT FORMAT(JOININGDATE, 'yyyy/MM/dd') JOINING_DATE 
FROM EMPLOYEEDETAIL


/*20)	 Show only time part of the "JoiningDate"*/

SELECT FORMAT( JOININGDATE, 'hh:mm:ss') JOINING_DATE_TIME
FROM EMPLOYEEDETAIL


SELECT CONVERT( TIME,JOININGDATE) JOINING_DATE_TIME
FROM EMPLOYEEDETAIL


/*21)	Get only Year part of "JoiningDate"*/

SELECT FIRSTNAME ,YEAR(JOININGDATE) JOINING_DATE_YEAR
FROM EMPLOYEEDETAIL


/*22)	Get only Month part of "JoiningDate”*/

SELECT FIRSTNAME, MONTH(JOININGDATE) JOINING_MONTH
FROM EMPLOYEEDETAIL


/*23)	Get system date */

SELECT GETDATE() AS SYSTEM_DATE



/*24)	Get UTC date.*/

SELECT GETUTCDATE() UTC_DATE


/*a)	Get the first name, current date, joiningdate and diff between current date and joining date in months.*/

SELECT FIRSTNAME, 
       GETDATE() CURRENTDATE,
	   JOININGDATE,
	   DATEDIFF(MONTH, JOININGDATE, GETDATE()) DIFFERENCE_MONTH
       FROM EMPLOYEEDETAIL



/*25)	Get the first name, current date, joiningdate and diff between current date and joining date in days.*/

SELECT FIRSTNAME,
       GETDATE() CURRENTDATE,
	   JOININGDATE,
	   DATEDIFF(DAY, JOININGDATE, GETDATE()) DIFFERENCE_DAYS
       FROM EMPLOYEEDETAIL



/*26)	 Get all employee details from EmployeeDetail table whose joining year is 2013*/

SELECT * 
FROM EMPLOYEEDETAIL
WHERE YEAR(JOININGDATE) =2013



/*27)	Get all employee details from EmployeeDetail table whose joining month is Jan(1) */

   SELECT * 
   FROM EMPLOYEEDETAIL
   WHERE MONTH(JOININGDATE) = 01


   /*28)	Get all employee details from EmployeeDetail table whose joining month is Jan(1) */
    
	SELECT * 
	FROM EMPLOYEEDETAIL
	WHERE  MONTH(JOININGDATE) = 01


/*29)	Get how many employee exist in "EmployeeDetail" table */

     SELECT COUNT(DISTINCT FIRSTNAME) NO_OF_EMPLOYEE
	 FROM EMPLOYEEDETAIL
	

/* 31. Select only one/top 1 record from "EmployeeDetail" table */

SELECT TOP 1 *
FROM EMPLOYEEDETAIL


/* 32. Select all employee detail with First name "Vikas","Ashish", and "Nikhil".*/

    SELECT * 
	FROM EMPLOYEEDETAIL
	WHERE FIRSTNAME IN ('VIKAS','ASHISH','NIKHIL')



/*33. Select all employee detail with First name not in "Vikas","Ashish", and "Nikhil"*/

   SELECT *
   FROM EMPLOYEEDETAIL
   WHERE FIRSTNAME NOT IN ('VIKAS','ASHISH','NIKHIL')



/*34. Select first name from "EmployeeDetail" table after removing white spaces from right side*/

      SELECT RTRIM(FIRSTNAME) FIRST_NAME
	  FROM EMPLOYEEDETAIL


/*35. Select first name from "EmployeeDetail" table after removing white spaces from left side*/

    SELECT LTRIM(FIRSTNAME) FIRST_NAME
	FROM EMPLOYEEDETAIL


/*36. Display first name and Gender as M/F.(if male then M, if Female then F) */

  SELECT FIRSTNAME, 
          CASE
		       WHEN GENDER = 'MALE' THEN  'M'
			   WHEN GENDER = 'FEMALE' THEN 'F'
			   ELSE GENDER
			   END GENDER_DETAILS
  FROM EMPLOYEEDETAIL
  


  /*37. Select first name from "EmployeeDetail" table prifixed with "Hello */


  SELECT CONCAT( 'HELLO',' ', FIRSTNAME) FIRSTNAME
  FROM EMPLOYEEDETAIL



  /*38. Get employee details from "EmployeeDetail" table whose Salary greater than 600000*/


    SELECT * 
	FROM EMPLOYEEDETAIL
	WHERE SALARY > 600000



/*39. Get employee details from "EmployeeDetail" table whose Salary less than 700000*/

 SELECT * 
 FROM EMPLOYEEDETAIL
 WHERE SALARY < 700000


 /*40. Get employee details from "EmployeeDetail" table whose Salary between 500000 than 600000 */

       SELECT * 
	   FROM EMPLOYEEDETAIL
	   WHERE SALARY BETWEEN 500000 AND 600000


---------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE ProjectDetail
(
ProjectDetailD INT,
EmployeeDetailD INT,
ProjectName VARCHAR(155)
)

SELECT * FROM ProjectDetail

INSERT INTO ProjectDetail VALUES ( 1 , 1 , 'TASK TRACK')
INSERT INTO ProjectDetail VALUES ( 2 , 1 , 'CLP')
INSERT INTO ProjectDetail VALUES ( 3 , 1 , 'SURVEY MANAGEMENT')
INSERT INTO ProjectDetail VALUES ( 4 , 2 , 'HR MANAGEMENT')
INSERT INTO ProjectDetail VALUES ( 5 , 3 , 'TASK TRACK')
INSERT INTO ProjectDetail VALUES ( 6 , 3 , 'GRS')
INSERT INTO ProjectDetail VALUES ( 7 , 3 , 'DDS')
INSERT INTO ProjectDetail VALUES ( 8 , 4 , 'HR MANAGEMENT')
INSERT INTO ProjectDetail VALUES ( 9 , 6 , 'GL MANAGEMENT')


/*41. Give records of ProjectDetail table*/

    SELECT * FROM ProjectDetail


/*42. Write the query to get the department and department wise total(sum) salary from "EmployeeDetail" table*/

SELECT DEPARTMENT, SUM(SALARY )  TOTAL_SALARY
FROM EMPLOYEEDETAIL
GROUP BY DEPARTMENT


/*43. Write the query to get the department and department wise total(sum) salary, display it in ascending order according to salary.*/

SELECT DEPARTMENT, SUM(SALARY) TOTAL_SALARY
FROM EMPLOYEEDETAIL
GROUP BY DEPARTMENT
ORDER BY TOTAL_SALARY ASC


/*44. Write the query to get the department and department wise total(sum) salary, display it in descending order according to salary*/


SELECT DEPARTMENT, SUM(SALARY) TOTAL_SALARY
FROM EMPLOYEEDETAIL
GROUP BY DEPARTMENT
ORDER BY TOTAL_SALARY DESC


/*45. Write the query to get the department, total no. of departments, total(sum) salary with respect to department from "EmployeeDetail" table.*/

SELECT DEPARTMENT,
      COUNT (DEPARTMENT) TOTAL_NO_OF_DEPT,
	  SUM(SALARY) TOTAL_SALARY
      FROM EMPLOYEEDETAIL
	  GROUP BY DEPARTMENT

	  SELECT * FROM EMPLOYEEDETAIL


/*46. Get department wise average salary from "EmployeeDetail" table order by salary ascending*/

SELECT   DEPARTMENT,
        AVG(SALARY) AVG_SALARY
        FROM EMPLOYEEDETAIL
		GROUP  BY DEPARTMENT
		ORDER BY AVG_SALARY ASC


/*47 . Get department wise maximum salary from "EmployeeDetail" table order by salary ascending */

SELECT DEPARTMENT,
      MAX(SALARY) MAXIMUM_SALARY
       FROM EMPLOYEEDETAIL
	   GROUP BY DEPARTMENT
	   ORDER BY MAXIMUM_SALARY ASC


/*48.Get department wise minimum salary from "EmployeeDetail" table order by salary ascending.*/

      SELECT DEPARTMENT,
	        MIN(SALARY) MINIMUM_SALARY
	        FROM EMPLOYEEDETAIL
			GROUP BY DEPARTMENT
			ORDER BY MINIMUM_SALARY ASC


/*49. Get department wise minimum salary from "EmployeeDetail" table order by salary ascending*/

SELECT DEPARTMENT,
	        MIN(SALARY) MINIMUM_SALARY
	        FROM EMPLOYEEDETAIL
			GROUP BY DEPARTMENT
			ORDER BY MINIMUM_SALARY ASC



/*50. Join both the table that is Employee and ProjectDetail based on some common paramter*/

  SELECT *
  FROM EMPLOYEEDETAIL E  JOIN
  ProjectDetail P ON P.EmployeeDetailD = E.EMPLOYEEID
  

  

/*51. Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" 
      for those employee which have assigned project already.*/

	  SELECT * FROM EMPLOYEEDETAIL
      SELECT * FROM ProjectDetail

	  SELECT E.FIRSTNAME, P.ProjectName
	  FROM EMPLOYEEDETAIL E JOIN
	  ProjectDetail P ON P.EmployeeDetailD = E.EMPLOYEEID
	  ORDER BY E.FIRSTNAME


/*52. Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" 
      for all employee even they have not assigned project.*/

	  SELECT E.FIRSTNAME, P.ProjectName
	  FROM EMPLOYEEDETAIL E 
	  LEFT JOIN ProjectDetail P 
	  ON P.EmployeeDetailD = E.EMPLOYEEID
	  ORDER BY E.FIRSTNAME



/*53) Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee
      if project is not assigned then display "-No Project Assigned"*/

	  SELECT E.FIRSTNAME, COALESCE(P.ProjectName, 'No Project Assigned') PROJECT_NAME 
	  FROM EMPLOYEEDETAIL E LEFT JOIN
	  ProjectDetail P ON P.EmployeeDetailD = E.EMPLOYEEID
	  ORDER BY E.FIRSTNAME


/*54.Get all project name even they have not matching any employeeid, in left table, order by firstname from "EmployeeDetail" and "ProjectDetail*/

SELECT E.FIRSTNAME, P.ProjectName 
FROM EMPLOYEEDETAIL E RIGHT JOIN
ProjectDetail P ON P.EmployeeDetailD = E.EMPLOYEEID
ORDER BY E.FIRSTNAME


/*55. Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]),
      if no match found in any table then show NULL */

	  SELECT E.FIRSTNAME, P.ProjectName 
	  FROM EMPLOYEEDETAIL E
	  FULL OUTER JOIN ProjectDetail P
	  ON P.EmployeeDetailD = E.EMPLOYEEID



/*56. Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), 
     if no match found in any table then show NULL*/

	 SELECT E.FIRSTNAME, P.ProjectName 
	  FROM EMPLOYEEDETAIL E
	  FULL OUTER JOIN ProjectDetail P
	  ON P.EmployeeDetailD = E.EMPLOYEEID



/*58.Write down the query to fetch EmployeeName & Project who has assign more than one project*/

     
	 SELECT E.FIRSTNAME EmployeeName
	 ,P.ProjectName
	 FROM EMPLOYEEDETAIL E 
	 JOIN ProjectDetail P ON P.EmployeeDetailD = E.EMPLOYEEID
	 WHERE E.FIRSTNAME IN 
	 (  SELECT E.FIRSTNAME
	    FROM EMPLOYEEDETAIL E 
	    JOIN ProjectDetail P ON P.EmployeeDetailD = E.EMPLOYEEID
	     GROUP BY E.FIRSTNAME
	     HAVING  COUNT( P.ProjectName) >1 )

	

/*59. Write down the query to fetch ProjectName on which more than one employee are working along with EmployeeName*/


SELECT  E.FIRSTNAME EmployeeName ,p.ProjectName
FROM EMPLOYEEDETAIL E JOIN
ProjectDetail P ON P.EmployeeDetailD = E.EMPLOYEEID
WHERE P.ProjectName IN
(
SELECT  P.ProjectName
FROM EMPLOYEEDETAIL E JOIN
ProjectDetail P ON P.EmployeeDetailD = E.EMPLOYEEID
GROUP BY P.ProjectName
HAVING COUNT (E.FIRSTNAME) >1)



/*60. Apply Cross Join in Both the tables*/

   SELECT *  
   FROM EMPLOYEEDETAIL  
   CROSS JOIN 
   ProjectDetail
	 
