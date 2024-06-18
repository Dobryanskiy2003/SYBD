/* Обновление данных (процедура Order_Update) */

USE Nutrition;
GO
IF OBJECT_ID('Order_Update','P') IS NOT NULL
DROP PROCEDURE Order_Update;
GO

CREATE PROCEDURE Order_Update (
	@Product_ID INT,
	@Product_name VARCHAR(100),
	@Product_unit_of_measurement INT )
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Product
	SET
		Product_ID = @Product_ID,
		Product_name = @Product_name,
		Product_unit_of_measurement = @Product_unit_of_measurement
	WHERE Product_ID = @Product_ID;
	RETURN @@ERROR
END
GO

EXECUTE Order_Update 6, 'Картошка', 70
GO