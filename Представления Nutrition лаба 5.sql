/*Создадим вертикальное представление list_menu_view, 
которое будет отображать название блюд, скрывая другие поля*/

USE Nutrition;
GO
IF OBJECT_ID('list_menu_view', 'V') IS NOT NULL
    DROP VIEW list_menu_view;
GO

CREATE VIEW list_menu_view
AS
SELECT CONCAT(dish_name, ' ')
AS [Блюдо]
FROM Menu;
GO

SELECT * FROM list_menu_view
ORDER BY [Блюдо];
GO

/*Создадим представление price_view, отображающее стоимость блюда
по каждому номеру ID, и обратимся к этому представлению*/


USE Nutrition;
GO
IF OBJECT_ID('price_view', 'V') IS NOT NULL
    DROP VIEW price_view;
GO

CREATE VIEW price_view
AS
SELECT dish_ID, SUM(dish_price) AS price
FROM Menu
GROUP BY dish_ID;

GO
SELECT * FROM price_view;
GO

/* Сформируем запрос к таблице Menu и представлению price_view: */

SELECT Menu.dish_name, price_view.price
FROM price_view, Menu
WHERE price_view.dish_ID = Menu.dish_ID
ORDER BY Menu.dish_ID;
GO

/*Запрос к представлению price_view (получение минимального и максимального значений стоимости блюд в меню и общей стоимости всех блюд)*/

SELECT MIN(price) AS MIN,
MAX(price) AS MAX, SUM(price) AS SUM
FROM price_view;
GO