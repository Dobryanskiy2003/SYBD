USE TransportBD;
GO
-- Предоставление роли "Администратор" разрешение на выборку данных из таблицы "Car"
GRANT SELECT ON Car TO Administrator;
-- Отказ в разрешении на выборку данных из таблицы "Car" для роли "Пользователь"
DENY SELECT ON Car TO RegularRole;
GO
