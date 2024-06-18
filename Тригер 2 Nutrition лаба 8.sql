--�������� ��� ���� ������ Nutrition DML-�������, ������� ��� ���������� 
--����� ������� � ������� Menu ��������� �������� ���� �� ������ ���� ����
USE Nutrition;
GO
CREATE TRIGGER restrict_user21321 ON Menu
AFTER INSERT
AS
UPDATE Menu
SET dish_name = LEFT (inserted.dish_name, 7) 
FROM inserted
WHERE Menu.dish_ID = inserted.dish_ID; 
GO