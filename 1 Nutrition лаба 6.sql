/* ������� ������ ���������, ��� ������� 100 ��. 
������ �������� ����� ������������� �������� ��������� SELECT, ������ ������� ���������� �������� � ������ ��������������� ������ ���������� */


USE Nutrition;
GO
BEGIN
SELECT Product_ID, Product_name, Product_unit_of_measurement
FROM Product
WHERE Product_unit_of_measurement = 100
END;
