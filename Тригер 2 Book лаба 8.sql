--�������� ��� ���� ������ Book DML-�������, ������� ��� ���������� 
--����� ������� � ������� Users ����������� ������ ����� � �������� ����������� � ��������

USE Book;
GO
CREATE TRIGGER restrict_user12312 ON Users
AFTER INSERT
AS
UPDATE Users
SET u_name = LEFT (inserted.u_name, 1) 
FROM inserted
WHERE Users.user_ID = inserted.user_ID; 
UPDATE Users
SET u_patronymic = LEFT (inserted.u_patronymic, 1)
FROM inserted
WHERE Users.user_ID = inserted.user_ID;
GO