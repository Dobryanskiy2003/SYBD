-- Создать курсор, который проходит через каждый автомобиль и выводит информацию о нем

USE TransportBD;
GO
DECLARE @Car_ID INT, @Brand VARCHAR(50), @Model VARCHAR(50), @Year_of_Manufacture INT, @VIN VARCHAR(50)
DECLARE CarCursor CURSOR FOR 
SELECT Car_ID, Brand, Model, Year_of_Manufacture, VIN FROM Car
OPEN CarCursor
FETCH NEXT FROM CarCursor INTO @Car_ID, @Brand, @Model, @Year_of_Manufacture, @VIN
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Car ID: ' + CAST(@Car_ID AS VARCHAR) + ', Brand: ' + @Brand + ', Model: ' + @Model + ', Year of Manufacture: ' + CAST(@Year_of_Manufacture AS VARCHAR) + ', VIN: ' + @VIN
    FETCH NEXT FROM CarCursor INTO @Car_ID, @Brand, @Model, @Year_of_Manufacture, @VIN
END
CLOSE CarCursor
DEALLOCATE CarCursor
GO


-- Создать курсор, который проходит через каждого водителя и выводит информацию о нем

USE TransportBD;
GO
DECLARE @Driver_ID INT, @Name VARCHAR(50), @Address VARCHAR(100), @License_Number VARCHAR(50)
DECLARE DriverCursor CURSOR FOR 
SELECT Driver_ID, Name, Address, License_Number FROM Driver
OPEN DriverCursor
FETCH NEXT FROM DriverCursor INTO @Driver_ID, @Name, @Address, @License_Number
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Driver ID: ' + CAST(@Driver_ID AS VARCHAR) + ', Name: ' + @Name + ', Address: ' + @Address + ', License Number: ' + @License_Number
    FETCH NEXT FROM DriverCursor INTO @Driver_ID, @Name, @Address, @License_Number
END
CLOSE DriverCursor
DEALLOCATE DriverCursor
GO