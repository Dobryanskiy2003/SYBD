-- Создать тригер, который будет отслеживать изменения в таблице Scheduled_Maintenance

USE TransportBD;
GO
CREATE TRIGGER LogMaintenanceInserts123123
ON Scheduled_Maintenance
AFTER INSERT
AS
BEGIN
    DECLARE @MaintenanceID INT, @CarID INT, @MaintenanceDate DATE, @MaintenanceType NVARCHAR(50), @MaintenanceStatus NVARCHAR(50);

    SELECT @MaintenanceID = Maintenance_ID, @CarID = Car_ID, @MaintenanceDate = Maintenance_Date, @MaintenanceType = Maintenance_Type, @MaintenanceStatus = Maintenance_Status FROM inserted;

    PRINT 'New maintenance scheduled: Maintenance ID = ' + CAST(@MaintenanceID AS NVARCHAR(10)) + ', Car ID = ' + CAST(@CarID AS NVARCHAR(10)) + ', Maintenance Date = ' + CONVERT(NVARCHAR(10), @MaintenanceDate, 120) + ', Maintenance Type = ' + @MaintenanceType + ', Maintenance Status = ' + @MaintenanceStatus;
END;
GO
