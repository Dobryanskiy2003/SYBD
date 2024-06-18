/* Процедура вызывается оператором EXECUTE. Для просмотра результата 
выполнения процедуры используем полную выборку из таблицы February */


USE Book; 
GO
EXECUTE ord_febr; 
SELECT * FROM February;
GO