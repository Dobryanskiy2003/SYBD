/* —оздадим хранимую процедуру, записывающую в новую таблицу February
все заказы, сделанные в феврале 2014 г. ѕредварительно необходимо создать 
пустую таблицу February со структурой, аналогичной таблице Orders  */


USE Book;
CREATE TABLE February(
	f_order_ID INT NOT NULL,
	f_o_user_ID INT NOT NULL,
	f_o_book_ID INT NOT NULL, 
	f_o_time DATETIME NOT NULL,
	f_o_number INT NOT NULL, 
	PRIMARY KEY(f_order_ID));
GO