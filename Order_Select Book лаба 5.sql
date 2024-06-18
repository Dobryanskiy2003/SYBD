/* Выборка данных (процедура Order_Select). */

USE Book;
GO
IF OBJECT_ID('Order_Select', 'P') IS NOT NULL
DROP PROCEDURE Order_Select;
GO
CREATE PROCEDURE Order_Select (
	@order_ID INT = NULL,
	@user_ID INT = NULL,
	@book_ID INT = NULL )

AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		Orders.order_ID,
		Orders.o_user_ID,
		Users.u_name + ' ' + Users.u_surname AS 'user_full_name',
		Orders.o_book_ID,
		Books.b_name,
		Orders.o_time,
		Orders .o_number

	FROM Orders
	LEFT OUTER JOIN Users ON Users.user_ID = Orders.o_user_ID
	LEFT OUTER JOIN Books ON Books.book_ID = Orders.o_book_ID

	WHERE
	( @order_ID IS NULL OR Orders.order_ID = @order_ID ) AND
	( @user_ID IS NULL OR Orders.o_user_ID = @user_ID ) AND
	( @book_ID IS NULL OR Orders.o_book_ID = @book_ID )
END
GO

EXEC Order_Select;
GO

EXEC Order_Select 1, DEFAULT, DEFAULT;
GO


EXEC Order_Select DEFAULT, 3, DEFAULT;
GO


EXEC Order_Select DEFAULT, DEFAULT, 20;
GO


EXEC Order_Select DEFAULT, 3, 20;
GO