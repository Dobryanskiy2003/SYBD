-- ������� ���� ��������������, ������� ����� ������ ������ � ���� ������, � ������������ �AdminUser�, ������� ����������� � ���� ����

USE TransportBD;
-- �������� ���� "�������������"
CREATE ROLE Administrator;
-- �������� ������ "AdminLogin"
CREATE LOGIN AdminLogin WITH PASSWORD = 'password';
-- �������� ������������ "AdminUser" ��� ������ "AdminLogin"
CREATE USER AdminUser FOR LOGIN AdminLogin;
-- ���������� ������������ "AdminUser" � ���� "�������������"
EXEC sp_addrolemember 'Administrator', 'AdminUser';

-- ������� ���� ��������������, ������� ����� ������������ ������ � ���� ������, � ������������ �RegularUser�, ������� ����������� � ���� ����

USE TransportBD;
-- �������� ���� "������������"
CREATE ROLE RegularRole;
-- �������� ������ "RegularLogin"
CREATE LOGIN RegularLogin WITH PASSWORD = 'password';
-- �������� ������������ "RegularUser" ��� ������ "RegularLogin"
CREATE USER RegularUser FOR LOGIN RegularLogin;
-- ���������� ������������ "RegularUser" � ���� "������������"
EXEC sp_addrolemember 'RegularRole', 'RegularUser';
