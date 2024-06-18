



/* Выборка данных (процедура Order_Select). */

USE Nutrition;
GO
IF OBJECT_ID('Order_Select', 'P') IS NOT NULL
DROP PROCEDURE Order_Select;
GO
CREATE PROCEDURE Order_Select (
	@Product_ID INT = NULL,
	@Product_name VARCHAR(100) = NULL,
	@Product_unit_of_measurement INT = NULL )

AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		Product.Product_ID,
		Product.Product_name,
		Product.Product_unit_of_measurement

	FROM Product

	WHERE
	( @Product_ID IS NULL OR Product.Product_ID = @Product_ID ) AND
	( @Product_name IS NULL OR Product.Product_name = @Product_name ) AND
	( @Product_unit_of_measurement IS NULL OR Product.Product_unit_of_measurement = @Product_unit_of_measurement )
END
GO

EXEC Order_Select;
GO

EXEC Order_Select 1, DEFAULT, DEFAULT;
GO


EXEC Order_Select DEFAULT, 'Рис', DEFAULT;
GO


EXEC Order_Select DEFAULT, DEFAULT, 80;
GO


EXEC Order_Select DEFAULT, 'Молоко', 100;
GO
