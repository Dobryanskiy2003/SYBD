/* Создадим для базы данных Book DML-триггер, который при добавлении 
новой записи в таблицу Orders автоматически вычитает число заказанных книг 
из их общего количества в таблице Books */


USE Book; 
GO
CREATE TRIGGER real_quantity1323123 ON Orders
AFTER INSERT
AS
UPDATE Books
SET b_count = b_count - inserted.o_number 
FROM inserted
WHERE Books.book_ID = inserted.o_book_ID; 
GO