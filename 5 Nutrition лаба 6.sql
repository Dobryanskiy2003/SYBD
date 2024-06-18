/* Процедура вызывается оператором EXECUTE. Для просмотра результата 
выполнения процедуры используем полную выборку из таблицы November */


USE Nutrition; 
GO
EXECUTE ord_nov; 
SELECT * FROM November;
GO