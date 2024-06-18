


/* Создание таблицы menu*/

USE Nutrition;
GO
IF EXISTS (SELECT * FROM sys.tables WHERE NAME = 'Menu')
DROP TABLE Menu;
CREATE TABLE Menu
	(dish_ID INT NOT NULL,
	dish_name VARCHAR(100) NOT NULL,
	dish_price INT NOT NULL,
	CONSTRAINT PK_Menu PRIMARY KEY (dish_ID) ) ;
GO

/* Создание таблицы product*/

USE Nutrition;
GO
IF EXISTS (SELECT * FROM sys.tables WHERE NAME = 'Product')
DROP TABLE Product;
CREATE TABLE Product
	(Product_ID INT NOT NULL,
	Product_name VARCHAR(100) NOT NULL,
	Product_unit_of_measurement INT NOT NULL,
	CONSTRAINT PK_Product PRIMARY KEY (Product_ID) ) ;
GO

/* Создание таблицы request_warehouse*/

USE Nutrition;
GO
IF EXISTS (SELECT * FROM sys.tables WHERE NAME = 'Request_warehouse')
DROP TABLE Request_warehouse;
CREATE TABLE Request_warehouse
	(Request_warehouse_ID INT NOT NULL,
	Request_warehouse_date DATETIME NOT NULL,
	CONSTRAINT PK_Request_warehouse PRIMARY KEY (Request_warehouse_ID) ) ;
GO

/* Создание таблицы customer_service */
USE Nutrition;
GO
IF EXISTS (SELECT * FROM sys.tables WHERE NAME = 'Сustomer_service')
DROP TABLE Сustomer_service;
CREATE TABLE Сustomer_service
(receipt_ID INT NOT NULL,
number_dishes_receipt INT NOT NULL,
CS_dish_ID INT NOT NULL,
		CONSTRAINT PK_Customer_service PRIMARY KEY (receipt_ID),
	CONSTRAINT FK_Request_warehouse_Menu
FOREIGN KEY (CS_dish_ID) REFERENCES Menu (dish_ID)
ON UPDATE CASCADE ON DELETE CASCADE );
GO

/* Создание таблицы products dishes */
USE Nutrition;
GO
IF EXISTS (SELECT * FROM sys.tables WHERE NAME = 'Products_dishes')
DROP TABLE Products_dishes;
CREATE TABLE Products_dishes
	(PD_Product_ID INT NOT NULL,
	 PD_dish_ID INT NOT NULL,
	 quantity_goods_dish INT NOT NULL,
	 CONSTRAINT PK_Products_dishes PRIMARY KEY (PD_Product_ID),
	 CONSTRAINT FK_Products_dishes_Product
	 FOREIGN KEY (PD_Product_ID) REFERENCES Product (Product_ID)
	 ON UPDATE CASCADE ON DELETE CASCADE ,
	 CONSTRAINT FK_Products_dishes_Menu
	 FOREIGN KEY (PD_dish_ID) REFERENCES Menu(dish_ID)
	 ON UPDATE CASCADE ON DELETE CASCADE);
GO

/* Создание таблицы Invoice for the delivery of goods */
USE Nutrition;
GO
IF EXISTS (SELECT * FROM sys.tables WHERE NAME = 'Invoice_delivery_goods')
DROP TABLE Invoice_delivery_goods;
CREATE TABLE Invoice_delivery_goods
	(Invoice_delivery_goods_ID INT NOT NULL,
	 IDG_Product_ID INT NOT NULL,
	 Quantity_goods_delivery INT NOT NULL,
	 Delivery_invoice_date DATETIME NOT NULL,
	 Date_time_delivery_goods DATETIME NOT NULL,
	 CONSTRAINT PK_Invoice_delivery_goods PRIMARY KEY (Invoice_delivery_goods_ID),
	 CONSTRAINT FK_Invoice_delivery_goods_Product
	 FOREIGN KEY (IDG_Product_ID) REFERENCES Product (Product_ID)
	 ON UPDATE CASCADE ON DELETE CASCADE);
GO

/* Создание таблицы Products in the application */
USE Nutrition;
GO
IF EXISTS (SELECT * FROM sys.tables WHERE NAME = 'Products_application')
DROP TABLE Products_application;
CREATE TABLE Products_application
	(PA_Invoice_delivery_goods_ID INT NULL,
	 PA_Request_warehouse_ID INT NOT NULL,
	 PA_Product_ID INT NOT NULL,
	 PA_Quantity_goods_request INT NOT NULL,
	 CONSTRAINT PK_Products_application PRIMARY KEY (PA_Invoice_delivery_goods_ID),
	 CONSTRAINT FK_Products_application_Invoice_delivery_goods
	 FOREIGN KEY (PA_Invoice_delivery_goods_ID) REFERENCES Invoice_delivery_goods (Invoice_delivery_goods_ID)
	 ON UPDATE CASCADE ON DELETE CASCADE ,
	 CONSTRAINT FK_Products_application_Request_warehouse
	 FOREIGN KEY (PA_Request_warehouse_ID) REFERENCES Request_warehouse (Request_warehouse_ID)
	 ON UPDATE CASCADE ON DELETE CASCADE ,
	 CONSTRAINT FK_Products_application_Product
	 FOREIGN KEY (PA_Product_ID) REFERENCES Product(Product_ID)
	 ON UPDATE NO ACTION ON DELETE NO ACTION);
GO
