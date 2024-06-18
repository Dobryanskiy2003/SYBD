/* Создание таблицы Catalogs */

USE Book;
GO
IF EXISTS (SELECT * FROM sys.tables WHERE NAME = 'Catalogs')
DROP TABLE Catalogs;
CREATE TABLE Catalogs
	(cat_ID INT NOT NULL,
	cat_name VARCHAR(20) NOT NULL,
	CONSTRAINT PK_Catalogs PRIMARY KEY (cat_ID) ) ;
GO

/* Создание таблицы Books */
USE Book;
GO
IF EXISTS (SELECT * FROM sys.tables WHERE NAME = 'Books')
DROP TABLE Books;
CREATE TABLE Books
( book_ID int NOT NULL,
b_name VARCHAR(100) NOT NULL,
b_author VARCHAR(100) NOT NULL,
b_year INT NOT NULL,
b_price MONEY NOT NULL DEFAULT 0.00,
b_count INT NOT NULL DEFAULT 0,
b_cat_ID INT NOT NULL,
		CONSTRAINT PK_Books PRIMARY KEY (book_ID),
	CONSTRAINT FK_Books_Catalogs
FOREIGN KEY (b_cat_ID) REFERENCES Catalogs (cat_ID)
ON UPDATE CASCADE ON DELETE CASCADE );
GO

/* Создание таблицы Users */
USE Book;
GO
IF EXISTS (SELECT * FROM sys.tables WHERE NAME = 'Users')
DROP TABLE Users;
CREATE TABLE Users
	( user_ID INT NOT NULL,
	  u_name VARCHAR(20) NOT NULL,
	  u_patronymic VARCHAR(20) NOT NULL,
	  u_surname VARCHAR(20) NOT NULL,
	  u_phone VARCHAR(15),
	  u_email VARCHAR(20),
	  u_status VARCHAR(10) NOT NULL,
CONSTRAINT PK_Users PRIMARY KEY (user_ID),
CONSTRAINT CH_Users CHECK(u_status IN ('gold', 'lock', 'passive', 'active')) );
GO

/* Создание таблицы Orders */
USE Book;
GO
IF EXISTS (SELECT * FROM sys.tables WHERE NAME = 'Orders')
DROP TABLE Orders;
CREATE TABLE Orders
	(order_ID INT NOT NULL,
	 o_user_ID INT NOT NULL,
	 o_book_ID INT NOT NULL,
	 o_time DATETIME NOT NULL,
	 o_number INT NOT NULL DEFAULT 0,
	 CONSTRAINT PK_Orders PRIMARY KEY (order_ID),
	 CONSTRAINT FK_Orders_Books
	 FOREIGN KEY (o_book_ID) REFERENCES Books (book_ID)
	 ON UPDATE CASCADE ON DELETE CASCADE ,
	 CONSTRAINT FK_Orders_Users
	 FOREIGN KEY (o_user_ID) REFERENCES Users(user_ID)
	 ON UPDATE CASCADE ON DELETE CASCADE);
GO