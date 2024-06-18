-- Создать хранимую процедуру, которая возвращает общий пробег для заданного автомобиля

USE TransportBD;
GO
CREATE PROCEDURE GetTotalMileage
    @Car_ID INT
AS
BEGIN
    SELECT SUM(Distance_Covered) as Total_Distance
    FROM Mileage
    WHERE Car_ID = @Car_ID;
END;
GO