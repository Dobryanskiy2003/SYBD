-- ������� �������������, ������� ���������� ����� ������ ������� ����������

USE TransportBD;
GO
CREATE VIEW TotalMileage AS
SELECT Car_ID, SUM(Distance_Covered) as Total_Distance
FROM Mileage
GROUP BY Car_ID;
GO


-- ������� �������������, ������� ���������� ���������� �������, ����������� ������ ���������

USE TransportBD;
GO
CREATE VIEW TaskCount AS
SELECT Driver_ID, COUNT(Task_ID) as Number_of_Tasks
FROM Task
GROUP BY Driver_ID;
GO