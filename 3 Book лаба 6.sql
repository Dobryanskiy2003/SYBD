/* �������� �������� ���������, ������������ � ����� ������� February
��� ������, ��������� � ������� 2014 �. �������������� ���������� ������� 
������ ������� February �� ����������, ����������� ������� Orders  */


USE Book;
CREATE TABLE February(
	f_order_ID INT NOT NULL,
	f_o_user_ID INT NOT NULL,
	f_o_book_ID INT NOT NULL, 
	f_o_time DATETIME NOT NULL,
	f_o_number INT NOT NULL, 
	PRIMARY KEY(f_order_ID));
GO