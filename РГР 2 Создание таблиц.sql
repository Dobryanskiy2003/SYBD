USE Transport2;
GO
IF EXISTS (SELECT * FROM sys.tables WHERE NAME = 'Car')
DROP TABLE Car;
CREATE TABLE Car (
    Car_ID INT PRIMARY KEY,
    Brand VARCHAR(50),
    Model VARCHAR(50),
    Year_of_Manufacture INT,
    VIN VARCHAR(50)
);
GO

USE Transport2;
GO
IF EXISTS (SELECT * FROM sys.tables WHERE NAME = 'Mileage')
DROP TABLE Mileage;
CREATE TABLE Mileage (
    Mileage_ID INT PRIMARY KEY,
    Car_ID INT FOREIGN KEY REFERENCES Car(Car_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    Date DATE,
    Distance_Covered FLOAT
);
GO

USE Transport2;
GO
IF EXISTS (SELECT * FROM sys.tables WHERE NAME = 'Scheduled_Maintenance')
DROP TABLE Scheduled_Maintenance;
CREATE TABLE Scheduled_Maintenance (
    Maintenance_ID INT PRIMARY KEY,
    Car_ID INT FOREIGN KEY REFERENCES Car(Car_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    Maintenance_Date DATE,
    Maintenance_Type VARCHAR(50),
    Maintenance_Status VARCHAR(50)
);
GO

USE Transport2;
GO
IF EXISTS (SELECT * FROM sys.tables WHERE NAME = 'Driver')
DROP TABLE Driver;
CREATE TABLE Driver (
    Driver_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Address VARCHAR(100),
    License_Number VARCHAR(50)
);
GO

USE Transport2;
GO
IF EXISTS (SELECT * FROM sys.tables WHERE NAME = 'Task')
DROP TABLE Task;
CREATE TABLE Task (
    Task_ID INT PRIMARY KEY,
    Car_ID INT FOREIGN KEY REFERENCES Car(Car_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    Driver_ID INT FOREIGN KEY REFERENCES Driver(Driver_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    Start_Date DATE,
    End_Date DATE,
    Distance_Covered FLOAT
);
GO
