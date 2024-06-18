/*Создадим простой запрос на выборку к таблице Books, который выводит
среднее значение цены книг для каждого каталога*/

USE Book;
GO
SELECT b_cat_ID AS [Каталог], AVG(b_price) AS [Средняя цена]
FROM Books
GROUP BY b_cat_ID;
GO

/*Cоздадим простой запрос на выборку к таблице Books, который выводит
максимальную и минимальную цены товарных позиций, присваивая им соответственно 
псевдонимы maximum и minimum*/

USE Book;
GO
SELECT MAX(b_price) AS maximum, MIN(b_price) AS minimum
FROM Books;
GO

/*Создадим запрос на выборку с вложенным запросом, выводящим перечень
книг, которые не заказывались покупателями (вывод оборван)*/

USE Book;
GO
SELECT book_ID, b_price, b_name FROM Books
WHERE NOT EXISTS ( SELECT * FROM Orders
	WHERE Orders.o_book_ID = Books.book_ID );
GO

/*Создадим многотабличный запрос на выборку, который выводит коды покупателей магазина, сделавших менее двух покупок*/

USE Book;
GO
SELECT Users.user_ID, COUNT(Orders.order_ID) AS total
FROM Users LEFT JOIN Orders
ON Users.user_ID = Orders.o_user_ID
GROUP BY Users.user_ID
HAVING COUNT(Orders.order_ID) < 2
ORDER BY total DESC, Users.user_ID ASC;
GO