USE TransportBD;
GO
-- �������������� ���� "�������������" ���������� �� ������� ������ �� ������� "Car"
GRANT SELECT ON Car TO Administrator;
-- ����� � ���������� �� ������� ������ �� ������� "Car" ��� ���� "������������"
DENY SELECT ON Car TO RegularRole;
GO
