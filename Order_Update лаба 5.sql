/* Обновление данных (процедура Order_Update) */

USE Book;
GO
IF OBJECT_ID('Order_Update','P') IS NOT NULL
DROP PROCEDURE Order_Update;
GO

CREATE PROCEDURE Order_Update (
	@order_ID INT,
	@user_ID INT,
	@book_ID INT,
	@o_time DATETIME,
	@o_number INT )
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Orders
	SET
		order_ID = @order_ID, o_user_ID = @user_ID,
		o_book_ID = @book_ID, o_time = @o_time, 
		o_number = @o_number
	WHERE order_ID = @order_ID;
	RETURN @@ERROR
END
GO

EXECUTE Order_Update 6, 1, 3, '2014-004-01 17:36:12', 2
GO