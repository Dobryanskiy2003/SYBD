-- �������� ������ ���� ����������� ����� �Toyota�

USE TransportBD;
GO
SELECT * FROM Car WHERE Brand = 'Toyota';
GO


-- �������� ������ ���� �������, ����������� ��������� � ������ �John Doe�

USE TransportBD;
GO
SELECT Task.* 
FROM Task 
JOIN Driver ON Task.Driver_ID = Driver.Driver_ID 
WHERE Driver.Name = 'John Doe';
GO


-- �������� ������ ���� ����������� ����� �Toyota�, ���������� ����� 2010 ����, ������� �� ���� � �������

USE TransportBD;
GO
SELECT * FROM Car 
WHERE Brand = 'Toyota' 
AND Year_of_Manufacture > 2010 
AND Car_ID NOT IN (SELECT Car_ID FROM Scheduled_Maintenance);
GO


-- �������� ������ ���� ����������� ����� �Toyota� ��� �Honda�, ���������� ����� 2010 ����

USE TransportBD;
GO
SELECT * FROM Car 
WHERE Year_of_Manufacture > 2010 
AND (Brand = 'Toyota' OR Brand = 'Honda');
GO


-- �������� ������ ���� ����������� ����� �Toyota�, ���������� ����� 2010 ����, � VIN, ������������ �� �123�

USE TransportBD;
GO
SELECT * FROM Car 
WHERE Brand = 'Toyota' 
AND Year_of_Manufacture > 2010 
AND VIN LIKE '123%';
GO


-- �������� ������ ���� �������, ����������� ���������� � ������ �John Doe� ��� �Jane Smith�, ������� �� �������� ���������� ����� �Toyota�

USE TransportBD;
GO
SELECT Task.* 
FROM Task 
JOIN Driver ON Task.Driver_ID = Driver.Driver_ID 
JOIN Car ON Task.Car_ID = Car.Car_ID 
WHERE (Driver.Name = 'John Doe' OR Driver.Name = 'Jane Smith') 
AND Car.Brand <> 'Toyota';
GO

-- �������� ������ ���� �������, ����������� ��������� � ������ �John Doe�, �� ����������� ����� �Toyota�

USE TransportBD;
GO
SELECT Task.* 
FROM Task 
JOIN Driver ON Task.Driver_ID = Driver.Driver_ID 
JOIN Car ON Task.Car_ID = Car.Car_ID 
WHERE Driver.Name = 'John Doe' 
AND Car.Brand = 'Toyota';

GO

-- �������� ������ ���� �������, ����������� ��������� � ������ �John Doe�, ����� ������ �2023-01-01� � �2023-12-31�

USE TransportBD;
GO
SELECT Task.* 
FROM Task 
JOIN Driver ON Task.Driver_ID = Driver.Driver_ID 
WHERE Driver.Name = 'John Doe' 
AND Task.Start_Date BETWEEN '2023-01-01' AND '2023-12-31';
GO

-- �������� ������ ���� �������, ����������� ��������� � ������ �John Doe�, ��� ��������� ��� �2023-01-01� � �2023-12-31�

USE TransportBD;
GO
SELECT Task.* 
FROM Task 
JOIN Driver ON Task.Driver_ID = Driver.Driver_ID 
WHERE Driver.Name = 'John Doe' 
AND Task.Start_Date NOT BETWEEN '2023-01-01' AND '2023-12-31';
GO

-- �������� ������ ���� �������, ����������� ���������� � ������� �John Doe�, �Jane Smith� ��� �Bob Johnson�

USE TransportBD;
GO
SELECT Task.* 
FROM Task 
JOIN Driver ON Task.Driver_ID = Driver.Driver_ID 
WHERE Driver.Name IN ('John Doe', 'Jane Smith', 'Bob Johnson');
GO

-- �������� ������ ���� �������, ����������� ���������� � �������, ��������� �� �John Doe�, �Jane Smith� � �Bob Johnson�

USE TransportBD;
GO
SELECT Task.* 
FROM Task 
JOIN Driver ON Task.Driver_ID = Driver.Driver_ID 
WHERE Driver.Name NOT IN ('John Doe', 'Jane Smith', 'Bob Johnson');
GO


-- �������� ��� ������� ���������� � Car_ID ������ 1 �� 2020

USE TransportBD;
GO
UPDATE Car 
SET Year_of_Manufacture = 2020 
WHERE Car_ID = 1;
GO


-- �������� ����� ���������� � ������� Car � Car_ID ������ 8, ������ �BMW�, ������� �X5�, ����� ������� 2023 � VIN �9988FFUU�

USE TransportBD;
GO
INSERT INTO Car (Car_ID, Brand, Model, Year_of_Manufacture, VIN) 
VALUES (8, 'BMW', 'X5', 2023, '9988FFUU');
GO


-- ������� ���������� �� ������� Car, � �������� Car_ID ����� 8

USE TransportBD;
GO
DELETE FROM Car 
WHERE Car_ID = 8;
GO



-- �������� ������� ������ ��� ������� ����������, ��������������� �� ����������� �������� �������

USE TransportBD;
GO
SELECT Car_ID, AVG(Distance_Covered) as Average_Mileage 
FROM Mileage 
GROUP BY Car_ID 
ORDER BY Average_Mileage ASC;
GO


-- �������� ���������� ������� ��� ������� ��������, ��������������� �� �������� ���������� �������

USE TransportBD;
GO
SELECT Driver_ID, COUNT(Task_ID) as Task_Count 
FROM Task 
GROUP BY Driver_ID 
ORDER BY Task_Count DESC;
GO


-- ��������  ������ ��� ������� ����������, ������� ��������� 250 �� 

USE TransportBD;
GO
SELECT Car_ID, SUM(Distance_Covered) as Total_Mileage 
FROM Mileage 
GROUP BY Car_ID 
HAVING SUM(Distance_Covered) > 250;
GO



-- �������� ������ ���� �����������, ������� ������� �� ���� �� �������� �������

USE TransportBD;
GO
SELECT * FROM Car 
WHERE Car_ID NOT IN (SELECT Car_ID FROM Scheduled_Maintenance);
GO


-- �������� ������ ���� ���������, ������� ��������� ����� ���� �������

USE TransportBD;
GO
SELECT * FROM Driver 
WHERE Driver_ID IN (
    SELECT Driver_ID FROM Task 
    GROUP BY Driver_ID 
    HAVING COUNT(Task_ID) = 1
);
GO


-- �������� ������ ���� �����������, ������� �������� ����� 250 ��

USE TransportBD;
GO
SELECT * FROM Car 
WHERE Car_ID IN (
    SELECT Car_ID FROM Mileage 
    GROUP BY Car_ID 
    HAVING SUM(Distance_Covered) > 250
);
GO