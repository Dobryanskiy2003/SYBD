/* Получим список продуктов, вес которых 100 кг. 
Задача решается путем использования простого оператора SELECT, однако никакие дальнейшие действия с полями результирующего набора невозможны */


USE Nutrition;
GO
BEGIN
SELECT Product_ID, Product_name, Product_unit_of_measurement
FROM Product
WHERE Product_unit_of_measurement = 100
END;
