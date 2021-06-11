--********************************************************************************************
--Title: Assignment01DB_LuisValderrama
--Desc: This file details the creation of 4 tables (Customer, Products, Sales, SalesLineItems) 
--Change Log: 2021.04.08, Luis Valderrama, Created/updated tables
--********************************************************************************************

--[Data Design]--
/*
--Objective: Create all the tables needed to hold the the following data;

--Products, Price, Units, Customer Address, Date;
--Apples, $0.89, 12, Bob Smith, 123 Main Bellevue WA, 5/5/2006;
--Milk, $1.59, 2 Bob Smith, 123 Main Bellevue WA, 5/5/2006;
--Bread, $2.28, 1, Bob Smith, 123 Main Bellevue WA, 5/5/2006;

--Using Common SQL Statements: CREATE, INSERT, SELECT--
--Using Normalization Rules:
Normalization Rule 1: Every Column in table must be atomic (single value).
Normalization Rule 2: Normalization Rule 1 must be met, and all fields must depend on entire set of canidate keys (if there is a set).
Normalization Rule 3: Normalization Rule 2 must be met, and all fields in table must depend on the primary key. 

--Primary Key is generally added to the beginning of the table;
*/

/*
--Table 1: Products
--Attributes (Columns): ProductID INT (PK), ProductName VARCHAR (100), ProductPrice MONEY
--Records (tuples): VALUE (1, Apples, $0.89); (2, Milk, $1.59); (3, Bread, $2.28);
*/

CREATE TABLE Products 
(ProductID INT PRIMARY KEY, ProductName VARCHAR(100), ProductPrice MONEY);
GO

INSERT INTO Products
VALUES (1, 'Apples', 0.89);
GO

INSERT INTO Products
VALUES (2, 'Milk', 1.59);
GO

INSERT INTO Products
VALUES (3, 'Bread', 2.28);
GO

SELECT * FROM Products
GO

/*
--Table 2: Customer
--Attributes (Columns): CustomerID INT (PK), FirstName VARCHAR (50), LastName VARCHAR (50), Address VARCHAR (100);
--Attributes continued: City VARCHAR (50), State CHAR (2), Zip CHAR (5);
--Records (tuples): VALUE (Bob, Smith, 123 Main, Bellevue, WA, 98501);
--Note: Name and Address are considered multi-part fields. Best practice is to break it into 2 and 4 respectively
*/

CREATE TABLE dbo.Customer
(
CustomerID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Address VARCHAR (100),
City VARCHAR(50),
State CHAR(2),
Zip CHAR(5)
);
GO

INSERT INTO dbo.Customer
VALUES (101,'Bob','Smith','123 Main', 'Bellevue', 'WA', '98501');
GO

SELECT * FROM Customer
GO

/*
--Table 3: Sales
--Attributes (Columns): SalesID INT (PK), CustomerID INT, SalesDate DATE;
--Records (tuples): VALUE (1001, 101, 5/5/2006);
*/

CREATE TABLE dbo.Sales
(SalesID INT PRIMARY KEY, CustomerID INT, SalesDate DATE);
GO

INSERT INTO dbo.Sales 
VALUES (1001, 101, '2006.05.05');
GO

/*
--Table 4: SalesLineItems
--Attributes (Columns): SalesID INT (PK), LineItemID INT (PK), ProductID, Qty INT;
--Records (tuples): VALUE (1001, 1, 1(=Apples), 12);
                    VALUE (1001, 2, 2(=Milk), 2);
                    VALUE (1001, 3, 3(=Bread), 1);
--Notes: (SalesID and LineItemID) are Composite Primary Key;
*/

CREATE TABLE dbo.SalesLineItems
(SalesID INT, LineItemID INT, ProductID INT, Qty INT,
PRIMARY KEY (SalesID, LineItemID)  --<Note: Composite Primary Key
);
GO

INSERT INTO dbo.SalesLineItems
VALUES (1001, 1, 1, 12),
(1001, 2, 2, 2),
(1001, 3, 3, 1);
GO

SELECT * FROM Customer;
SELECT * FROM Sales;
SELECT * FROM SalesLineItems;
SELECT * FROM Products;
GO

