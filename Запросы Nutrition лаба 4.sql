/*Создадим простой запрос на выборку к таблице Menu, который выводит
среднее значение цены блюда*/

USE Nutrition;
GO
SELECT dish_name AS [Каталог], AVG(dish_price) AS [Средняя цена]
FROM Menu
GROUP BY dish_name;
GO

/*Cоздадим простой запрос на выборку к таблице Menu, который выводит
максимальную и минимальную цены товарных позиций, присваивая им соответственно 
псевдонимы maximum и minimum*/

USE Nutrition;
GO
SELECT MAX(dish_price) AS maximum, MIN(dish_price) AS minimum
FROM Menu;
GO

/*Создадим запрос на выборку с вложенным запросом, выводящим перечень
блюд, которые заказывались покупателями */

USE Nutrition;
GO
SELECT dish_ID, dish_name, dish_price FROM Menu
WHERE EXISTS ( SELECT * FROM Сustomer_service
	WHERE Сustomer_service.CS_dish_ID = Menu.dish_ID );
GO

/*Создадим многотабличный запрос на выборку, который выводит номера блюд, которые заказали менее двух раз*/

USE Nutrition;
GO
SELECT Menu.dish_ID, COUNT(Сustomer_service.number_dishes_receipt) AS total
FROM Menu LEFT JOIN Сustomer_service
ON Menu.dish_ID = Сustomer_service.CS_dish_ID
GROUP BY Menu.dish_ID
HAVING COUNT(Сustomer_service.number_dishes_receipt) < 2
ORDER BY total DESC, Menu.dish_ID ASC;
GO