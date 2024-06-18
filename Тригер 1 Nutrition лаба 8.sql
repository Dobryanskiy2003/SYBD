/* �������� ��� ���� ������ Nutrition DML-�������, ������� ��� ���������� 
����� ������ � ������� Products_application ������������� �������� ����� ������ � �������� 
�� �� ������ ���������� ������ � ������� Invoice_delivery_goods */


USE Nutrition; 
GO
CREATE TRIGGER real_quantity123123 ON Products_application
AFTER INSERT
AS
UPDATE Invoice_delivery_goods
SET Quantity_goods_delivery = Quantity_goods_delivery - inserted.PA_Quantity_goods_request 
FROM inserted
WHERE Invoice_delivery_goods.Invoice_delivery_goods_ID = inserted.PA_Invoice_delivery_goods_ID; 
GO