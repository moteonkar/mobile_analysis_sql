create database mobile_sales_analyis;
use mobile_sales_analyis;
CREATE TABLE mobile_sales (
Product VARCHAR(100),
Brand VARCHAR(100),
Product_Code VARCHAR(50),
Product_Specification VARCHAR(255),
Price INT,
Inward_Date DATE,
Dispatch_Date DATE,
Quantity_Sold INT,
Customer_Name VARCHAR(100),
Customer_Location VARCHAR(100),
Region VARCHAR(50),
Core_Specification VARCHAR(50),
Processor_Specification VARCHAR(100),
RAM VARCHAR(50),
ROM VARCHAR(50),
SSD VARCHAR(50)
);
SELECT * 
FROM mobile_sales
LIMIT 10;
SHOW TABLES;
DESCRIBE mobile_sales;
SET GLOBAL local_infile = 1;
LOAD DATA LOCAL INFILE 'C:/Users/onkar/Downloads/mobile_sales_data.csv'
INTO TABLE mobile_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SELECT * 
FROM mobile_sales;
/*total revenue generated*/
SELECT SUM(Price * Quantity_Sold) AS total_revenue
FROM mobile_sales;
/*avg price of mobiles*/
SELECT AVG(Price) AS avg_price
FROM mobile_sales;
/* heighest price of mobiles*/
SELECT MAX(Price) AS highest_price
FROM mobile_sales;
/* total sum of the quantities sold*/
SELECT SUM(Quantity_Sold) AS total_units
FROM mobile_sales;
/*Top Selling Brands*/
SELECT 
Brand,
SUM(Quantity_Sold) AS Total_Sales
FROM mobile_sales
GROUP BY Brand
ORDER BY Total_Sales DESC;
/* top selling products*/
SELECT 
Product,
SUM(Price * Quantity_Sold) AS Revenue
FROM mobile_sales
GROUP BY Product
ORDER BY Revenue DESC;
/*Sales by Region*/
SELECT 
Region,
SUM(Price * Quantity_Sold) AS Total_Revenue
FROM mobile_sales
GROUP BY Region
ORDER BY Total_Revenue DESC;
/*Most Popular Product Specification*/
SELECT 
Product_Specification,
SUM(Quantity_Sold) AS Units_Sold
FROM mobile_sales
GROUP BY Product_Specification
ORDER BY Units_Sold DESC
LIMIT 10;
/*RAM Demand Analysis*/
SELECT 
RAM,
SUM(Quantity_Sold) AS Total_Sold
FROM mobile_sales
GROUP BY RAM
ORDER BY Total_Sold DESC;