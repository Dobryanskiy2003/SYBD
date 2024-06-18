/* Удаление данных (процедура Order_Delete) */

USE Book;
GO
IF OBJECT_ID ('Order_Delete','P') IS NOT NULL
DROP PROCEDURE Order_Delete;
GO
CREATE PROCEDURE Order_Delete (@order_ID INT = NULL)
AS
BEGIN
	SET NOCOUNT ON;
	DELETE FROM Orders
	WHERE order_ID = @order_ID;
	RETURN @@ERROR
END
GO

EXECUTE Order_Delete 6;
PRINT @@ERROR;
GO