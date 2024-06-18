-- ѕолучить список всех автомобилей марки СToyotaТ

USE TransportBD;
GO
SELECT * FROM Car WHERE Brand = 'Toyota';
GO


-- ѕолучить список всех заданий, выполненных водителем с именем СJohn DoeТ

USE TransportBD;
GO
SELECT Task.* 
FROM Task 
JOIN Driver ON Task.Driver_ID = Driver.Driver_ID 
WHERE Driver.Name = 'John Doe';
GO


-- ѕолучить список всех автомобилей марки СToyotaТ, выпущенных после 2010 года, которые не были в ремонте

USE TransportBD;
GO
SELECT * FROM Car 
WHERE Brand = 'Toyota' 
AND Year_of_Manufacture > 2010 
AND Car_ID NOT IN (SELECT Car_ID FROM Scheduled_Maintenance);
GO


-- ѕолучить список всех автомобилей марки СToyotaТ или СHondaТ, выпущенных после 2010 года

USE TransportBD;
GO
SELECT * FROM Car 
WHERE Year_of_Manufacture > 2010 
AND (Brand = 'Toyota' OR Brand = 'Honda');
GO


-- ѕолучить список всех автомобилей марки СToyotaТ, выпущенных после 2010 года, с VIN, начинающимс€ на С123Т

USE TransportBD;
GO
SELECT * FROM Car 
WHERE Brand = 'Toyota' 
AND Year_of_Manufacture > 2010 
AND VIN LIKE '123%';
GO


-- ѕолучить список всех заданий, выполненных водител€ми с именем СJohn DoeТ или СJane SmithТ, которые не включают автомобили марки СToyotaТ

USE TransportBD;
GO
SELECT Task.* 
FROM Task 
JOIN Driver ON Task.Driver_ID = Driver.Driver_ID 
JOIN Car ON Task.Car_ID = Car.Car_ID 
WHERE (Driver.Name = 'John Doe' OR Driver.Name = 'Jane Smith') 
AND Car.Brand <> 'Toyota';
GO

-- ѕолучить список всех заданий, выполненных водителем с именем СJohn DoeТ, на автомобил€х марки СToyotaТ

USE TransportBD;
GO
SELECT Task.* 
FROM Task 
JOIN Driver ON Task.Driver_ID = Driver.Driver_ID 
JOIN Car ON Task.Car_ID = Car.Car_ID 
WHERE Driver.Name = 'John Doe' 
AND Car.Brand = 'Toyota';

GO

-- ѕолучить список всех заданий, выполненных водителем с именем СJohn DoeТ, между датами С2023-01-01Т и С2023-12-31Т

USE TransportBD;
GO
SELECT Task.* 
FROM Task 
JOIN Driver ON Task.Driver_ID = Driver.Driver_ID 
WHERE Driver.Name = 'John Doe' 
AND Task.Start_Date BETWEEN '2023-01-01' AND '2023-12-31';
GO

-- ѕолучить список всех заданий, выполненных водителем с именем СJohn DoeТ, вне диапазона дат С2023-01-01Т и С2023-12-31Т

USE TransportBD;
GO
SELECT Task.* 
FROM Task 
JOIN Driver ON Task.Driver_ID = Driver.Driver_ID 
WHERE Driver.Name = 'John Doe' 
AND Task.Start_Date NOT BETWEEN '2023-01-01' AND '2023-12-31';
GO

-- ѕолучить список всех заданий, выполненных водител€ми с именами СJohn DoeТ, СJane SmithТ или СBob JohnsonТ

USE TransportBD;
GO
SELECT Task.* 
FROM Task 
JOIN Driver ON Task.Driver_ID = Driver.Driver_ID 
WHERE Driver.Name IN ('John Doe', 'Jane Smith', 'Bob Johnson');
GO

-- ѕолучить список всех заданий, выполненных водител€ми с именами, отличными от СJohn DoeТ, СJane SmithТ и СBob JohnsonТ

USE TransportBD;
GO
SELECT Task.* 
FROM Task 
JOIN Driver ON Task.Driver_ID = Driver.Driver_ID 
WHERE Driver.Name NOT IN ('John Doe', 'Jane Smith', 'Bob Johnson');
GO


-- ќбновить год выпуска автомобил€ с Car_ID равным 1 на 2020

USE TransportBD;
GO
UPDATE Car 
SET Year_of_Manufacture = 2020 
WHERE Car_ID = 1;
GO


-- ƒобавить новый автомобиль в таблицу Car с Car_ID равным 8, маркой СBMWТ, моделью СX5Т, годом выпуска 2023 и VIN С9988FFUUТ

USE TransportBD;
GO
INSERT INTO Car (Car_ID, Brand, Model, Year_of_Manufacture, VIN) 
VALUES (8, 'BMW', 'X5', 2023, '9988FFUU');
GO


-- ”далить автомобиль из таблицы Car, у которого Car_ID равен 8

USE TransportBD;
GO
DELETE FROM Car 
WHERE Car_ID = 8;
GO



-- ѕолучить средний пробег дл€ каждого автомобил€, отсортированный по возрастанию среднего пробега

USE TransportBD;
GO
SELECT Car_ID, AVG(Distance_Covered) as Average_Mileage 
FROM Mileage 
GROUP BY Car_ID 
ORDER BY Average_Mileage ASC;
GO


-- ѕолучить количество заданий дл€ каждого водител€, отсортированных по убыванию количества заданий

USE TransportBD;
GO
SELECT Driver_ID, COUNT(Task_ID) as Task_Count 
FROM Task 
GROUP BY Driver_ID 
ORDER BY Task_Count DESC;
GO


-- ѕолучить  пробег дл€ каждого автомобил€, который превышает 250 км 

USE TransportBD;
GO
SELECT Car_ID, SUM(Distance_Covered) as Total_Mileage 
FROM Mileage 
GROUP BY Car_ID 
HAVING SUM(Distance_Covered) > 250;
GO



-- ѕолучить список всех автомобилей, которые никогда не были на плановом ремонте

USE TransportBD;
GO
SELECT * FROM Car 
WHERE Car_ID NOT IN (SELECT Car_ID FROM Scheduled_Maintenance);
GO


-- ѕолучить список всех водителей, которые выполнили ровно одно задани€

USE TransportBD;
GO
SELECT * FROM Driver 
WHERE Driver_ID IN (
    SELECT Driver_ID FROM Task 
    GROUP BY Driver_ID 
    HAVING COUNT(Task_ID) = 1
);
GO


-- ѕолучить список всех автомобилей, которые проехали более 250 км

USE TransportBD;
GO
SELECT * FROM Car 
WHERE Car_ID IN (
    SELECT Car_ID FROM Mileage 
    GROUP BY Car_ID 
    HAVING SUM(Distance_Covered) > 250
);
GO