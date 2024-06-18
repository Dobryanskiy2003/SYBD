/*�������� ������� ������ �� ������� � ������� Books, ������� �������
������� �������� ���� ���� ��� ������� ��������*/

USE Book;
GO
SELECT b_cat_ID AS [�������], AVG(b_price) AS [������� ����]
FROM Books
GROUP BY b_cat_ID;
GO

/*C������� ������� ������ �� ������� � ������� Books, ������� �������
������������ � ����������� ���� �������� �������, ���������� �� �������������� 
���������� maximum � minimum*/

USE Book;
GO
SELECT MAX(b_price) AS maximum, MIN(b_price) AS minimum
FROM Books;
GO

/*�������� ������ �� ������� � ��������� ��������, ��������� ��������
����, ������� �� ������������ ������������ (����� �������)*/

USE Book;
GO
SELECT book_ID, b_price, b_name FROM Books
WHERE NOT EXISTS ( SELECT * FROM Orders
	WHERE Orders.o_book_ID = Books.book_ID );
GO

/*�������� �������������� ������ �� �������, ������� ������� ���� ����������� ��������, ��������� ����� ���� �������*/

USE Book;
GO
SELECT Users.user_ID, COUNT(Orders.order_ID) AS total
FROM Users LEFT JOIN Orders
ON Users.user_ID = Orders.o_user_ID
GROUP BY Users.user_ID
HAVING COUNT(Orders.order_ID) < 2
ORDER BY total DESC, Users.user_ID ASC;
GO