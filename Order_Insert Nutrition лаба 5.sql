


/* Вставка данных (процедура Order_Insert)  */

USE Nutrition;
GO
IF OBJECT_ID('Order_Insert','P') IS NOT NULL
DROP PROCEDURE Order_Insert;
GO

CREATE PROCEDURE Order_Insert (
	@Product_ID INT,
	@Product_name VARCHAR(100),
	@Product_unit_of_measurement INT )
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Product (
		Product_ID, Product_name, Product_unit_of_measurement)
	VALUES (
		@Product_ID, @Product_name ,
		@Product_unit_of_measurement) ;
	RETURN @@ERROR
END
GO

EXECUTE Nutrition.dbo.Order_Insert 6, 'Колбоса', 30
