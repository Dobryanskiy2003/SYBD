/* ���� ������������ ������, �� ����� ��������� ���������� �������, 
� ����� ��������� ��������� �������� � �������������� ����������� ����� */


USE Book;
GO
-- ���������� ����������
DECLARE @name VARCHAR(20), @surname VARCHAR(20), @message VARCHAR (50);
PRINT '������ ��������, ������� ������ active:'; 
-- ��������� ������
DECLARE cur CURSOR LOCAL FOR
	SELECT u_name, u_surname
	FROM Users
	WHERE u_status = 'active';
-- ��������� ������
OPEN cur;
-- ������� �� ������ �������
FETCH NEXT FROM cur INTO @name, @surname; -- ��������� �� ������� � �������� ������
WHILE @@FETCH_STATUS = 0
BEGIN
	SELECT @message = @name + ' ' + @surname;
	PRINT @message;
-- ������� � ���������� �������
	FETCH NEXT FROM cur INTO @name, @surname;
END;
-- ��������� ������
CLOSE cur;
-- ������� ������
DEALLOCATE cur;
PRINT @name;