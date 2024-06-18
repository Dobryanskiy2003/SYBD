/* Создадим хранимую процедуру, записывающую в новую таблицу November
все заявки, сделанные в ноябре 2023 г. Предварительно необходимо создать 
пустую таблицу November со структурой, аналогичной таблице Request_warehouse  */


USE Nutrition;
CREATE TABLE November(
	Request_warehouse_ID INT NOT NULL, 
	Request_warehouse_date DATETIME NOT NULL
	PRIMARY KEY(Request_warehouse_ID));
GO