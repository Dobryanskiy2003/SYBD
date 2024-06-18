-- Заполняем таблицу Car
USE TransportBD;
GO
SET NOCOUNT ON;
DELETE FROM Car;
INSERT INTO Car (Car_ID, Brand, Model, Year_of_Manufacture, VIN)
VALUES (1, 'Toyota', 'Corolla', 2018, '1234ABCD'),
       (2, 'Honda', 'Civic', 2019, '5678EFGH'),
       (3, 'Ford', 'Fiesta', 2017, '1122AAZZ'),
       (4, 'Chevrolet', 'Cruze', 2020, '3344BBYY'),
       (5, 'Hyundai', 'Elantra', 2021, '5566CCXX'),
       (6, 'Nissan', 'Sentra', 2022, '7788DDWW'),
       (7, 'Volkswagen', 'Jetta', 2023, '9900EEVV');
GO

-- Заполняем таблицу Mileage
USE TransportBD;
GO
SET NOCOUNT ON;
DELETE FROM Mileage;
INSERT INTO Mileage (Mileage_ID, Car_ID, Date, Distance_Covered)
VALUES (1, 1, '2023-01-01', 100.0),
       (2, 2, '2023-01-02', 150.0),
       (3, 3, '2023-01-03', 200.0),
       (4, 4, '2023-01-04', 250.0),
       (5, 5, '2023-01-05', 300.0),
       (6, 6, '2023-01-06', 350.0),
       (7, 7, '2023-01-07', 400.0);
GO

-- Заполняем таблицу Scheduled_Maintenance
USE TransportBD;
GO
SET NOCOUNT ON;
DELETE FROM Scheduled_Maintenance;
INSERT INTO Scheduled_Maintenance (Maintenance_ID, Car_ID, Maintenance_Date, Maintenance_Type, Maintenance_Status)
VALUES (1, 1, '2023-01-10', 'Engine Check', 'Completed'),
       (2, 2, '2023-01-15', 'Tire Change', 'Scheduled'),
       (3, 3, '2023-01-20', 'Oil Change', 'Scheduled'),
       (4, 4, '2023-01-25', 'Brake Check', 'Completed'),
       (5, 5, '2023-01-30', 'Battery Check', 'Scheduled'),
       (6, 6, '2023-02-04', 'Transmission Check', 'Completed'),
       (7, 7, '2023-02-09', 'Coolant Check', 'Scheduled');
GO

-- Заполняем таблицу Driver
USE TransportBD;
GO
SET NOCOUNT ON;
DELETE FROM Driver;
INSERT INTO Driver (Driver_ID, Name, Address, License_Number)
VALUES (1, 'John Doe', '123 Main St', 'A123456'),
       (2, 'Jane Smith', '456 Elm St', 'B789101'),
       (3, 'Bob Johnson', '789 Pine St', 'C345678'),
       (4, 'Alice Williams', '1012 Oak St', 'D9101112'),
       (5, 'Charlie Brown', '1314 Maple St', 'E13141516'),
       (6, 'David Davis', '1516 Cedar St', 'F17181920'),
       (7, 'Eve Evans', '1718 Birch St', 'G21222324');
GO

-- Заполняем таблицу Task
USE TransportBD;
GO
SET NOCOUNT ON;
DELETE FROM Task;
INSERT INTO Task (Task_ID, Car_ID, Driver_ID, Start_Date, End_Date, Distance_Covered)
VALUES (1, 1, 1, '2023-01-01', '2023-01-02', 100.0),
       (2, 2, 2, '2023-01-02', '2023-01-03', 150.0),
       (3, 3, 3, '2023-01-03', '2023-01-04', 200.0),
       (4, 4, 4, '2023-01-04', '2023-01-05', 250.0),
       (5, 5, 5, '2023-01-05', '2023-01-06', 300.0),
       (6, 6, 6, '2023-01-06', '2023-01-07', 350.0),
       (7, 7, 7, '2023-01-07', '2023-01-08', 400.0);
GO
