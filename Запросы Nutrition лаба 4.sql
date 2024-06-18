/*�������� ������� ������ �� ������� � ������� Menu, ������� �������
������� �������� ���� �����*/

USE Nutrition;
GO
SELECT dish_name AS [�������], AVG(dish_price) AS [������� ����]
FROM Menu
GROUP BY dish_name;
GO

/*C������� ������� ������ �� ������� � ������� Menu, ������� �������
������������ � ����������� ���� �������� �������, ���������� �� �������������� 
���������� maximum � minimum*/

USE Nutrition;
GO
SELECT MAX(dish_price) AS maximum, MIN(dish_price) AS minimum
FROM Menu;
GO

/*�������� ������ �� ������� � ��������� ��������, ��������� ��������
����, ������� ������������ ������������ */

USE Nutrition;
GO
SELECT dish_ID, dish_name, dish_price FROM Menu
WHERE EXISTS ( SELECT * FROM �ustomer_service
	WHERE �ustomer_service.CS_dish_ID = Menu.dish_ID );
GO

/*�������� �������������� ������ �� �������, ������� ������� ������ ����, ������� �������� ����� ���� ���*/

USE Nutrition;
GO
SELECT Menu.dish_ID, COUNT(�ustomer_service.number_dishes_receipt) AS total
FROM Menu LEFT JOIN �ustomer_service
ON Menu.dish_ID = �ustomer_service.CS_dish_ID
GROUP BY Menu.dish_ID
HAVING COUNT(�ustomer_service.number_dishes_receipt) < 2
ORDER BY total DESC, Menu.dish_ID ASC;
GO