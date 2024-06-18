/*Создадим вертикальное представление list_user_view, 
которое будет отображать фамилию и инициалы покупателей, скрывая другие поля*/

USE Book;
GO
IF OBJECT_ID('list_user_view', 'V') IS NOT NULL
    DROP VIEW list_user_view;
GO

CREATE VIEW list_user_view
AS
SELECT CONCAT(u_surname, ' ',
SUBSTRING(u_name, 1, 1), '.',
SUBSTRING(u_patronymic, 1, 1), '.')
AS [ФИО]
FROM Users;
GO

SELECT * FROM list_user_view
ORDER BY [ФИО];
GO

/*Создадим представление price_view, отображающее общую стоимость книг
по каждому каталогу, и обратимся к этому представлению*/


USE Book;
GO
IF OBJECT_ID('price_view', 'V') IS NOT NULL
    DROP VIEW price_view;
GO

CREATE VIEW price_view
AS
SELECT b_cat_ID, SUM(b_price * b_count) AS price
FROM Books
GROUP BY b_cat_ID;

GO
SELECT * FROM price_view;
GO

/* Сформируем запрос к таблице Catalogs и представлению price_view: */

SELECT Catalogs.cat_name, price_view.price
FROM price_view, Catalogs
WHERE price_view.b_cat_ID = Catalogs.cat_ID
ORDER BY Catalogs.cat_ID;
GO

/*Запрос к представлению price_view (получение минимального и максимального значений общей стоимости книг в каталогах и общей стоимости всех книг)*/

SELECT MIN(price) AS MIN,
MAX(price) AS MAX, SUM(price) AS SUM
FROM price_view;
GO
