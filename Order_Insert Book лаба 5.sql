/* Вставка данных (процедура Order_Insert)  */

USE Book;
GO
IF OBJECT_ID('Order_Insert','P') IS NOT NULL
DROP PROCEDURE Order_Insert;
GO

CREATE PROCEDURE Order_Insert (
	@order_ID INT,
	@user_ID INT,
	@book_ID INT,
	@o_time DATETIME,
	@o_number INT )
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Orders (
		order_ID, o_user_ID, o_book_ID,
		o_time, o_number )
	VALUES (
		@order_ID, @user_ID, @book_ID ,
		@o_time, @o_number) ;
	RETURN @@ERROR
END
GO

EXECUTE Book.dbo.Order_Insert 6, 1, 3, '2014-04-01 17:36:12', 1
GO