/* Хранимая процедура ord_nov ( ) использует курсор cur, который в цикле 
читает данные из таблицы Request_warehouse и добавляет их в таблицу November. */


USE Nutrition;
GO
IF OBJECT_ID('ord_nov', 'P') IS NOT NULL
	DROP PROCEDURE ord_nov;
GO
CREATE PROCEDURE ord_nov
AS
BEGIN
	DECLARE @Request_warehouse_ID INT, @Request_warehouse_date DATETIME;
	DECLARE cur CURSOR LOCAL FOR
		SELECT * FROM Request_warehouse
		WHERE Request_warehouse_date BETWEEN '01/11/2023' AND '30/11/2023';
	OPEN cur;
	FETCH NEXT FROM cur
	INTO @Request_warehouse_ID, @Request_warehouse_date; 
	WHILE @@FETCH_STATUS = 0
		BEGIN
			INSERT INTO November VALUES
				(@Request_warehouse_ID, @Request_warehouse_date); 
			FETCH NEXT FROM cur INTO @Request_warehouse_ID, @Request_warehouse_date;
		END;
	CLOSE cur;
	DEALLOCATE cur;
END;
GO