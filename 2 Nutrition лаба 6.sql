/* Если использовать курсор, то можно проверять содержимое записей, 
а также выполнять различные операции с использованием содержимого полей */


USE Nutrition;
GO
-- Определяем переменные
DECLARE @Product_ID INT, @Product_name VARCHAR(100), @message VARCHAR (50);
PRINT 'Список продуктов, весящих 100 кг'; 
-- Объявляем курсор
DECLARE cur CURSOR LOCAL FOR
	SELECT Product_ID, Product_name
	FROM Product
	WHERE Product_unit_of_measurement = 100;
-- Открываем курсор
OPEN cur;
-- Переход на начало курсора
FETCH NEXT FROM cur INTO @Product_ID, @Product_name; -- Двигаемся по курсору и печатаем строки
WHILE @@FETCH_STATUS = 0
BEGIN
	SELECT @message =  @Product_name;
	PRINT @message;
-- Переход к следующему клиенту
	FETCH NEXT FROM cur INTO @Product_ID, @Product_name;
END;
-- Закрываем курсор
CLOSE cur;
-- Удаляем курсор
DEALLOCATE cur;