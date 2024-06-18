--Создадим для базы данных Book DML-триггер, который при добавлении 
--новых записей в таблицу Users преобразует полные имена и отчества покупателей в инициалы

USE Book;
GO
CREATE TRIGGER restrict_user12312 ON Users
AFTER INSERT
AS
UPDATE Users
SET u_name = LEFT (inserted.u_name, 1) 
FROM inserted
WHERE Users.user_ID = inserted.user_ID; 
UPDATE Users
SET u_patronymic = LEFT (inserted.u_patronymic, 1)
FROM inserted
WHERE Users.user_ID = inserted.user_ID;
GO