/* Если использовать курсор, то можно проверять содержимое записей, 
а также выполнять различные операции с использованием содержимого полей */


USE Book;
GO
-- Определяем переменные
DECLARE @name VARCHAR(20), @surname VARCHAR(20), @message VARCHAR (50);
PRINT 'Список клиентов, имеющих статус active:'; 
-- Объявляем курсор
DECLARE cur CURSOR LOCAL FOR
	SELECT u_name, u_surname
	FROM Users
	WHERE u_status = 'active';
-- Открываем курсор
OPEN cur;
-- Переход на начало курсора
FETCH NEXT FROM cur INTO @name, @surname; -- Двигаемся по курсору и печатаем строки
WHILE @@FETCH_STATUS = 0
BEGIN
	SELECT @message = @name + ' ' + @surname;
	PRINT @message;
-- Переход к следующему клиенту
	FETCH NEXT FROM cur INTO @name, @surname;
END;
-- Закрываем курсор
CLOSE cur;
-- Удаляем курсор
DEALLOCATE cur;
PRINT @name;