-- Создать роль “Администратор”, которая имеет полный доступ к базе данных, и пользователя “AdminUser”, который принадлежит к этой роли

USE TransportBD;
-- Создание роли "Администратор"
CREATE ROLE Administrator;
-- Создание логина "AdminLogin"
CREATE LOGIN AdminLogin WITH PASSWORD = 'password';
-- Создание пользователя "AdminUser" для логина "AdminLogin"
CREATE USER AdminUser FOR LOGIN AdminLogin;
-- Добавление пользователя "AdminUser" в роль "Администратор"
EXEC sp_addrolemember 'Administrator', 'AdminUser';

-- Создать роль “Пользователь”, которая имеет ограниченный доступ к базе данных, и пользователя “RegularUser”, который принадлежит к этой роли

USE TransportBD;
-- Создание роли "Пользователь"
CREATE ROLE RegularRole;
-- Создание логина "RegularLogin"
CREATE LOGIN RegularLogin WITH PASSWORD = 'password';
-- Создание пользователя "RegularUser" для логина "RegularLogin"
CREATE USER RegularUser FOR LOGIN RegularLogin;
-- Добавление пользователя "RegularUser" в роль "Пользователь"
EXEC sp_addrolemember 'RegularRole', 'RegularUser';
