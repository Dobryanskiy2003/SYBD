/* Хранимая процедура ord_febr ( ) использует курсор cur, который в цикле 
читает данные из таблицы orders и добавляет их в таблицу February. */


USE Book;
GO
IF OBJECT_ID('ord_febr', 'P') IS NOT NULL
	DROP PROCEDURE ord_febr;
GO
CREATE PROCEDURE ord_febr
AS
BEGIN
	DECLARE @order_ID INT, @o_user_ID INT, @o_book_ID INT, @o_time DATETIME, @o_number INT;
	DECLARE cur CURSOR LOCAL FOR
		SELECT * FROM Orders
		WHERE o_time BETWEEN '01/02/2014' AND '28/02/2014';
	OPEN cur;
	FETCH NEXT FROM cur
	INTO @order_ID, @o_user_ID, @o_book_ID, @o_time, @o_number; 
	WHILE @@FETCH_STATUS = 0
		BEGIN
			INSERT INTO February VALUES
				(@order_ID, @o_user_ID, @o_book_ID, @o_time, @o_number); 
			FETCH NEXT FROM cur INTO @order_ID, @o_user_ID, @o_book_ID, @o_time, @o_number;
		END;
	CLOSE cur;
	DEALLOCATE cur;
END;
GO