/* ���� ������������ ������, �� ����� ��������� ���������� �������, 
� ����� ��������� ��������� �������� � �������������� ����������� ����� */


USE Nutrition;
GO
-- ���������� ����������
DECLARE @Product_ID INT, @Product_name VARCHAR(100), @message VARCHAR (50);
PRINT '������ ���������, ������� 100 ��'; 
-- ��������� ������
DECLARE cur CURSOR LOCAL FOR
	SELECT Product_ID, Product_name
	FROM Product
	WHERE Product_unit_of_measurement = 100;
-- ��������� ������
OPEN cur;
-- ������� �� ������ �������
FETCH NEXT FROM cur INTO @Product_ID, @Product_name; -- ��������� �� ������� � �������� ������
WHILE @@FETCH_STATUS = 0
BEGIN
	SELECT @message =  @Product_name;
	PRINT @message;
-- ������� � ���������� �������
	FETCH NEXT FROM cur INTO @Product_ID, @Product_name;
END;
-- ��������� ������
CLOSE cur;
-- ������� ������
DEALLOCATE cur;