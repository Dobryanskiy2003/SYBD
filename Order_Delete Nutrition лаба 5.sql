/* Удаление данных (процедура Order_Delete) */

USE Nutrition;
GO
IF OBJECT_ID ('Order_Delete','P') IS NOT NULL
DROP PROCEDURE Order_Delete;
GO
CREATE PROCEDURE Order_Delete (@Product_ID INT = NULL)
AS
BEGIN
	SET NOCOUNT ON;
	DELETE FROM Product
	WHERE Product_ID = @Product_ID;
	RETURN @@ERROR
END
GO

EXECUTE Order_Delete 6;
PRINT @@ERROR;
GO