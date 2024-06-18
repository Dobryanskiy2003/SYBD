/* Заполнение таблицы menu */
USE Nutrition;
GO
SET NOCOUNT ON;
DELETE FROM Menu;
INSERT INTO Menu (dish_ID, dish_name, dish_price) VALUES (1, 'Суп', 70);
INSERT INTO Menu (dish_ID, dish_name, dish_price) VALUES (2, 'Плов', 150);
INSERT INTO Menu (dish_ID, dish_name, dish_price) VALUES (3, 'Гуляш', 130);
INSERT INTO Menu (dish_ID, dish_name, dish_price) VALUES (4, 'Молоко', 20);
INSERT INTO Menu (dish_ID, dish_name, dish_price) VALUES (5, 'Пицца', 400);
GO


/* Заполнение таблицы Product */
USE Nutrition;
GO
SET NOCOUNT ON;
DELETE FROM Product;
INSERT INTO Product (Product_ID, Product_name, Product_unit_of_measurement) VALUES (1, 'Помидоры', 100);
INSERT INTO Product (Product_ID, Product_name, Product_unit_of_measurement) VALUES (2, 'Рис', 10);
INSERT INTO Product (Product_ID, Product_name, Product_unit_of_measurement) VALUES (3, 'Картошка', 100);
INSERT INTO Product (Product_ID, Product_name, Product_unit_of_measurement) VALUES (4, 'Молоко', 100);
INSERT INTO Product (Product_ID, Product_name, Product_unit_of_measurement) VALUES (5, 'Мясо', 80);
GO

/* Заполнение таблицы Request_warehouse */
USE Nutrition;
GO
SET NOCOUNT ON;
DELETE FROM Request_warehouse;
INSERT INTO Request_warehouse (Request_warehouse_ID, Request_warehouse_date) VALUES (10, '11/11/2023 10:29:00');
INSERT INTO Request_warehouse (Request_warehouse_ID, Request_warehouse_date) VALUES (20, '21/11/2023 14:19:00');
INSERT INTO Request_warehouse (Request_warehouse_ID, Request_warehouse_date) VALUES (30, '12/11/2023 16:37:00');
INSERT INTO Request_warehouse (Request_warehouse_ID, Request_warehouse_date) VALUES (40, '23/11/2023 13:32:00');
INSERT INTO Request_warehouse (Request_warehouse_ID, Request_warehouse_date) VALUES (50, '10/11/2023 07:30:00');
GO

/* Заполнение таблицы customer_service */
USE Nutrition;
GO
SET NOCOUNT ON;
DELETE FROM Сustomer_service;
INSERT INTO Сustomer_service (receipt_ID, number_dishes_receipt, CS_dish_ID) VALUES (100, 8, 1);
INSERT INTO Сustomer_service (receipt_ID, number_dishes_receipt, CS_dish_ID) VALUES (200, 3, 2);
INSERT INTO Сustomer_service (receipt_ID, number_dishes_receipt, CS_dish_ID) VALUES (300, 1, 3);
INSERT INTO Сustomer_service (receipt_ID, number_dishes_receipt, CS_dish_ID) VALUES (400, 7, 4);
INSERT INTO Сustomer_service (receipt_ID, number_dishes_receipt, CS_dish_ID) VALUES (500, 3, 5);
GO

/* Заполнение таблицы products dishes */
USE Nutrition;
GO
SET NOCOUNT ON;
DELETE FROM Products_dishes;
INSERT INTO Products_dishes (PD_Product_ID, PD_dish_ID, quantity_goods_dish) VALUES (1, 1, 3);
INSERT INTO Products_dishes (PD_Product_ID, PD_dish_ID, quantity_goods_dish) VALUES (2, 2, 6);
INSERT INTO Products_dishes (PD_Product_ID, PD_dish_ID, quantity_goods_dish) VALUES (3, 3, 3);
INSERT INTO Products_dishes (PD_Product_ID, PD_dish_ID, quantity_goods_dish) VALUES (4, 4, 1);
INSERT INTO Products_dishes (PD_Product_ID, PD_dish_ID, quantity_goods_dish) VALUES (5, 5, 10);
GO

/* Заполнение таблицы Invoice for the delivery of goods */
USE Nutrition;
GO
SET NOCOUNT ON;
DELETE FROM Invoice_delivery_goods;
INSERT INTO Invoice_delivery_goods (Invoice_delivery_goods_ID, IDG_Product_ID, Quantity_goods_delivery, Delivery_invoice_date, Date_time_delivery_goods) VALUES (11, 1, 3, '11/11/2023 10:29:00', '13/11/2023 11:29:00');
INSERT INTO Invoice_delivery_goods (Invoice_delivery_goods_ID, IDG_Product_ID, Quantity_goods_delivery, Delivery_invoice_date, Date_time_delivery_goods) VALUES (21, 2, 6, '14/11/2023 14:29:00', '15/11/2023 15:29:00');
INSERT INTO Invoice_delivery_goods (Invoice_delivery_goods_ID, IDG_Product_ID, Quantity_goods_delivery, Delivery_invoice_date, Date_time_delivery_goods) VALUES (31, 3, 3, '12/11/2023 11:29:00', '14/11/2023 12:29:00');
INSERT INTO Invoice_delivery_goods (Invoice_delivery_goods_ID, IDG_Product_ID, Quantity_goods_delivery, Delivery_invoice_date, Date_time_delivery_goods) VALUES (41, 4, 1, '10/11/2023 12:29:00', '12/11/2023 13:29:00');
INSERT INTO Invoice_delivery_goods (Invoice_delivery_goods_ID, IDG_Product_ID, Quantity_goods_delivery, Delivery_invoice_date, Date_time_delivery_goods) VALUES (51, 5, 10, '17/11/2023 18:29:00', '19/11/2023 19:29:00');
GO

/* Заполнение таблицы Products in the application */
USE Nutrition;
GO
SET NOCOUNT ON;
DELETE FROM Products_application;
INSERT INTO Products_application (PA_Invoice_delivery_goods_ID, PA_Request_warehouse_ID, PA_Product_ID, PA_Quantity_goods_request) VALUES (11, 10, 1, 11);
INSERT INTO Products_application (PA_Invoice_delivery_goods_ID, PA_Request_warehouse_ID, PA_Product_ID, PA_Quantity_goods_request) VALUES (21, 20, 2, 100);
INSERT INTO Products_application (PA_Invoice_delivery_goods_ID, PA_Request_warehouse_ID, PA_Product_ID, PA_Quantity_goods_request) VALUES (31, 30, 3, 30);
INSERT INTO Products_application (PA_Invoice_delivery_goods_ID, PA_Request_warehouse_ID, PA_Product_ID, PA_Quantity_goods_request) VALUES (41, 40, 4, 361);
INSERT INTO Products_application (PA_Invoice_delivery_goods_ID, PA_Request_warehouse_ID, PA_Product_ID, PA_Quantity_goods_request) VALUES (51, 50, 5,27);
GO