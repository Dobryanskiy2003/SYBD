/*�������� ������������ ������������� list_menu_view, 
������� ����� ���������� �������� ����, ������� ������ ����*/

USE Nutrition;
GO
IF OBJECT_ID('list_menu_view', 'V') IS NOT NULL
    DROP VIEW list_menu_view;
GO

CREATE VIEW list_menu_view
AS
SELECT CONCAT(dish_name, ' ')
AS [�����]
FROM Menu;
GO

SELECT * FROM list_menu_view
ORDER BY [�����];
GO

/*�������� ������������� price_view, ������������ ��������� �����
�� ������� ������ ID, � ��������� � ����� �������������*/


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

/* ���������� ������ � ������� Menu � ������������� price_view: */

SELECT Menu.dish_name, price_view.price
FROM price_view, Menu
WHERE price_view.dish_ID = Menu.dish_ID
ORDER BY Menu.dish_ID;
GO

/*������ � ������������� price_view (��������� ������������ � ������������� �������� ��������� ���� � ���� � ����� ��������� ���� ����)*/

SELECT MIN(price) AS MIN,
MAX(price) AS MAX, SUM(price) AS SUM
FROM price_view;
GO