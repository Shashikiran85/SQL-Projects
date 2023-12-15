CREATE DATABASE CUSTOMERS_ORDERS_PRODUCTS

CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(100)
);

INSERT INTO Customers (CustomerID, Name, Email)
VALUES
  (1, 'John Doe', 'johndoe@example.com'),
  (2, 'Jane Smith', 'janesmith@example.com'),
  (3, 'Robert Johnson', 'robertjohnson@example.com'),
  (4, 'Emily Brown', 'emilybrown@example.com'),
  (5, 'Michael Davis', 'michaeldavis@example.com'),
  (6, 'Sarah Wilson', 'sarahwilson@example.com'),
  (7, 'David Thompson', 'davidthompson@example.com'),
  (8, 'Jessica Lee', 'jessicalee@example.com'),
  (9, 'William Turner', 'williamturner@example.com'),
  (10, 'Olivia Martinez', 'oliviamartinez@example.com');

  SELECT * FROM Customers


  CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  ProductName VARCHAR(50),
  OrderDate DATE,
  Quantity INT
);

INSERT INTO Orders (OrderID, CustomerID, ProductName, OrderDate, Quantity)
VALUES
  (1, 1, 'Product A', '2023-07-01', 5),
  (2, 2, 'Product B', '2023-07-02', 3),
  (3, 3, 'Product C', '2023-07-03', 2),
  (4, 4, 'Product A', '2023-07-04', 1),
  (5, 5, 'Product B', '2023-07-05', 4),
  (6, 6, 'Product C', '2023-07-06', 2),
  (7, 7, 'Product A', '2023-07-07', 3),
  (8, 8, 'Product B', '2023-07-08', 2),
  (9, 9, 'Product C', '2023-07-09', 5),
  (10, 10, 'Product A', '2023-07-10', 1);


  CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(50),
  Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName, Price)
VALUES
  (1, 'Product A', 10.99),
  (2, 'Product B', 8.99),
  (3, 'Product C', 5.99),
  (4, 'Product D', 12.99),
  (5, 'Product E', 7.99),
  (6, 'Product F', 6.99),
  (7, 'Product G', 9.99),
  (8, 'Product H', 11.99),
  (9, 'Product I', 14.99),
  (10, 'Product J', 4.99);


  /* Task 1 :-
     
	 1.	Write a query to retrieve all records from the Customers table..*/

	     
		 SELECT * FROM Customers


/*  2.	Write a query to retrieve the names and email addresses of customers whose names start with 'J'. */

         SELECT Name, Email
		 FROM Customers
		 WHERE NAME LIKE 'J%'


/* 3.	Write a query to retrieve the order details (OrderID, ProductName, Quantity) for all orders..*/
 
  
         SELECT OrderID, ProductName, Quantity
		 FROM Orders


/* 4.	Write a query to calculate the total quantity of products ordered */

      SELECT SUM(QUANTITY) TOTAL_QTY_PRODUCTS_ORDERED
	  FROM Orders
	  

/* 5.	Write a query to retrieve the names of customers who have placed an order. */

      
	   
	   SELECT DISTINCT C.Name
	   FROM CUSTOMERS C LEFT JOIN
	   ORDERS O ON C.CustomerID = O.CustomerID
	   WHERE O.OrderID IS NOT NULL



 /* 6.	Write a query to retrieve the products with a price greater than $10.00 */

     
	     SELECT * 
		 FROM Products
		 WHERE PRICE > 10.00



/*  7.	Write a query to retrieve the customer name and order date for all orders placed on or after '2023-07-05'. */

        
		 SELECT C.Name, O.OrderDate
		 FROM Customers C JOIN 
		 Orders O ON O.CustomerID = C.CustomerID
		 WHERE OrderDate >= '2023-07-05'
         

/*  8.	Write a query to calculate the average price of all products  */

    
	     SELECT AVG(PRICE) AVERAGE_PRICE
		 FROM Products



/* 9.	Write a query to retrieve the customer names along with the total quantity of products they have ordered. */

             SELECT C.Name, SUM(O.Quantity) TOTAL_QTY_PRODUCTS
			 FROM Customers C JOIN
			 Orders O ON O.CustomerID =C.CustomerID
			 GROUP BY C.Name

			 

/*  10.	Write a query to retrieve the products that have not been ordered.*/
		

		   
			
			SELECT P.ProductName
			FROM PRODUCTS P LEFT JOIN
			Orders O ON O.ProductName = P.ProductName
			WHERE O.OrderID IS NULL
---------------------------------------------------------------
			 SELECT P.ProductName
			 FROM PRODUCTS P LEFT JOIN
			 ORDERS O ON O.OrderID = P.ProductID
			 WHERE P.ProductName <> O.ProductName


/* Task 2 :-

      1.	Write a query to retrieve the top 5 customers who have placed the highest total quantity of orders. */

           SELECT TOP 5 C.Name, O.ProductName, O.Quantity
		   FROM CUSTOMERS C JOIN
		   ORDERS O ON O.CustomerID = C.CustomerID
		   GROUP BY C.Name, O.ProductName, O.Quantity
		   ORDER BY O.Quantity DESC
		 


/* 2.	Write a query to calculate the average price of products for each product category. */


           SELECT ProductName, AVG(PRICE) AVERAGE_PRICE_OF_PROCUCTS
		   FROM Products
		   GROUP BY ProductName

		  
/* 3.	Write a query to retrieve the customers who have not placed any orders. */

        
		SELECT C.CustomerID, C.Name
		FROM Customers C LEFT JOIN
		ORDERS O ON O.CustomerID = C.CustomerID
		WHERE O.OrderID IS NULL
	    

/* 4.	Write a query to retrieve the order details (OrderID, ProductName, Quantity) for orders placed by customers whose names start with 'M'.*/

         
		 SELECT O.OrderID, O.ProductName, O.Quantity
		 FROM Customers C JOIN 
		 Orders O ON O.CustomerID = C.CustomerID
		 WHERE C.Name LIKE 'M%'

		

/* 5.	Write a query to calculate the total revenue generated from all orders. */

         
		 SELECT SUM(O.Quantity * P.Price) TOTAL_REVENUE_GENERATED
		 FROM Orders O JOIN
		 Products P ON P.ProductName = O.ProductName
		 
	

/* 6.	Write a query to retrieve the customer names along with the total revenue generated from their orders. */

     
	 SELECT  C.Name, SUM(O.Quantity * P.Price) TOTAL_REVENUE_GENERATED
	 FROM Customers C 
	 JOIN Orders O ON C.CustomerID = O.CustomerID
	 JOIN  Products P ON P.ProductName = O.ProductName
	 GROUP BY C.Name


/* 7.	Write a query to retrieve the customers who have placed at least one order for each product category. */

           
		   SELECT C.CustomerID, C.Name
		   FROM Customers C 
		   JOIN ORDERS O ON O.CustomerID = C.CustomerID
		   JOIN Products P ON P.ProductName = O.ProductName
		   GROUP BY C.CustomerID, C.Name
		   HAVING COUNT (DISTINCT P.ProductName) = (SELECT COUNT(DISTINCT PRODUCTNAME) FROM Products) 


/* 8.	Write a query to retrieve the customers who have placed orders on consecutive days */

       select * FROM Customers
	   SELECT * FROM Orders

	   WITH RANKED_ORDER AS
	   ( SELECT C.CUSTOMERID , C.NAME CUSTOMER_NAME,O.ORDERDATE,

	   ROW_NUMBER() OVER ( PARTITION BY C.CUSTOMERID ORDER BY O.ORDERDATE) AS ROW_NUM
	   FROM CUSTOMERS C JOIN ORDERS O 
	   ON O.CUSTOMERID = C.CUSTOMERID)

	   SELECT CUSTOMERID, CUSTOMER_NAME
	   FROM RANKED_ORDER
	   WHERE ROW_NUM = 2




/* 9.	Write a query to retrieve the top 3 products with the highest average quantity ordered. */

          
		   SELECT TOP 3 ProductName, AVG(Quantity) HIGHEST_AVG_QTY
           FROM Orders
		   GROUP BY ProductName
		   ORDER BY HIGHEST_AVG_QTY DESC



/* 10.	Write a query to calculate the percentage of orders that have a quantity greater than the average quantity. */
  

        WITH AVERAGE_QUANTITY 
		AS
		( SELECT AVG(QUANTITY) AVG_QTY
		FROM Orders
		)
		SELECT 
		(COUNT( CASE WHEN O.QUANTITY > A.AVG_QTY THEN 1 ELSE NULL END) *100.0) / COUNT(*)  as PERCENTAGE
		 FROM Orders O, AVERAGE_QUANTITY A

		 

 /*  Task 3:-
     1.	Write a query to retrieve the customers who have placed orders for all products. */

	   SELECT C.Name
	   FROM Customers C 
	   JOIN Orders O ON O.CustomerID = C.CustomerID
	   JOIN Products P ON P.ProductName = O.ProductName
	   GROUP BY C.NAME 
	   HAVING COUNT (DISTINCT P.ProductName)  = (SELECT COUNT (DISTINCT ProductName) FROM Products)


/* 2.	Write a query to retrieve the products that have been ordered by all customers */

   
   SELECT P.ProductName 
   FROM ORDERS O FULL JOIN
   Products P ON P.ProductName = O.ProductName
   GROUP BY P.ProductName
   HAVING COUNT (DISTINCT P.PRODUCTNAME) = (SELECT COUNT (DISTINCT CustomerID) FROM Customers)
   

/* 3.	Write a query to calculate the total revenue generated from orders placed in each month.*/

          SELECT   MONTH (O.OrderDate) ORDER_MOMTH , SUM (O.Quantity * P.Price ) TOTAL_REVENUE_GENRATED
		  FROM Orders O JOIN
		  Products P ON P.ProductName = O.ProductName
		  GROUP BY MONTH(O.OrderDate) 
		  

		  
/*  4.	Write a query to retrieve the products that have been ordered by more than 50% of the customers. */

         SELECT ProductName
		 FROM Orders
		 GROUP BY ProductName
		 HAVING COUNT (DISTINCT CUSTOMERID) >  (SELECT COUNT(*)* 0.5 FROM Customers)


/* 5.	Write a query to retrieve the top 5 customers who have spent the highest amount of money on orders */

          SELECT TOP 5 C.Name, SUM(O.Quantity * P.Price) HIGHEST_AMT_MONEY_0N_ORDER
		  FROM Customers C 
		  JOIN  Orders O ON O.CustomerID = C.CustomerID
		  JOIN Products P ON P.ProductName = O.ProductName
		  GROUP BY C.Name
		  ORDER BY HIGHEST_AMT_MONEY_0N_ORDER DESC

		  
/* 6.	Write a query to calculate the running total of order quantities for each customer. */


  SELECT C.Name, C.CustomerID, O.Quantity,
  SUM(O.QUANTITY) OVER (PARTITION BY C.CUSTOMERID ORDER BY O.ORDERID) RUNNING_TOTAL
  FROM Orders O 
  JOIN CUSTOMERS C ON C.CustomerID = O.CustomerID
  ORDER BY C.Name, C.CustomerID



/*7.	Write a query to retrieve the top 3 most recent orders for each customer */

           WITH RANKED_ORDER AS
		   (
		     SELECT  OrderID, CustomerID, ProductName,Quantity,
			 ROW_NUMBER () OVER (PARTITION BY CUSTOMERID ORDER BY ORDERDATE DESC) ROW_NUM
            FROM Orders )

			SELECT  RO.OrderID,RO.CustomerID,RO.ProductName,RO.Quantity
             FROM RANKED_ORDER RO
			 WHERE ROW_NUM <= 3
			 ORDER BY RO.OrderID,RO.CustomerID



/* 8.	Write a query to calculate the total revenue generated by each customer in the last 30 days. */
  
          
			SELECT O.OrderID,C.CustomerID,C.Name, P.ProductName,O.OrderDate,
			      SUM(O.Quantity * P.Price) TOTAL_REVENUE_GENRATED
			FROM Customers  C 
			JOIN Orders O ON O.CustomerID = C.CustomerID
			JOIN PRODUCTS P ON P.ProductName = O.ProductName
			WHERE O.ORDERDATE >= DATEADD(DAY,-30, GETDATE())
			GROUP BY O.OrderID,C.CustomerID,C.Name, P.ProductName,O.OrderDate
			ORDER BY O.OrderID, C.CustomerID 


/* 9.	Write a query to retrieve the customers who have placed orders for at least two different product categories. */

         SELECT C.CustomerID, C.Name
		 FROM Orders O JOIN 
		 CUSTOMERS C ON C.CustomerID = O.CustomerID
		 GROUP BY C.CustomerID, C.Name
		HAVING COUNT(DISTINCT O.ProductName) >= 2

--------------------------------------------------
		SELECT C.Name 
		FROM Customers C
		WHERE 
		( SELECT COUNT(DISTINCT O.ProductName)
		FROM Orders O JOIN Products P
		ON P.ProductName = O.ProductName
		WHERE O.CustomerID = C.CustomerID)
		>=2



/* 10.	Write a query to calculate the average revenue per order for each customer*/



  SELECT C.CustomerID,O.OrderID,C.Name,P.ProductName,
            SUM(O.Quantity * P.Price)/ COUNT(O.ORDERID) AVERAGE_REVENUE
  FROM Customers C
  JOIN ORDERS O ON O.CustomerID = C.CustomerID
  JOIN Products P ON P.ProductName = O.ProductName
  GROUP BY C.CustomerID,O.OrderID,C.Name,P.ProductName


  /* 11.	Write a query to retrieve the customers who have placed orders for every month of a specific year. */

    SELECT C.CustomerID,C.Name 
	FROM Customers C JOIN
	Orders O ON O.CustomerID = C.CustomerID
	WHERE YEAR(O.OrderDate) = 2023
	GROUP BY C.CustomerID,C.Name
	HAVING COUNT(DISTINCT MONTH(O.OrderDate))= 12



/* 12.	Write a query to retrieve the customers who have placed orders for a specific product in consecutive months.*/

  SELECT C.Name, O.OrderID, O.ProductName
  FROM CUSTOMERS C JOIN
  Orders O ON O.CustomerID = C.CustomerID
  GROUP BY C.Name, O.OrderID, O.ProductName
  HAVING COUNT(DISTINCT MONTH(O.OrderDate)) >=2






  /* 13.	Write a query to retrieve the products that have been ordered by a specific customer at least twice.      */


   SELECT C.Name, O.ProductName
   FROM Customers C JOIN
   ORDERS O ON C.CustomerID = O.CustomerID
   GROUP BY C.Name, O.ProductName
   HAVING COUNT(DISTINCT PRODUCTNAME) >= 2