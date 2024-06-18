USE Nutrition;
GO
SET NOCOUNT ON;
BEGIN TRAN my_tran
INSERT Request_warehouse VALUES (60, '14/11/2023 10:29:00'); 
INSERT Request_warehouse VALUES(70, '28/11/2023 14:19:00');
PRINT @@TRANCOUNT;
SAVE TRAN point_one;
INSERT Request_warehouse VALUES (80, '12/11/2023 07:30:00'); 
ROLLBACK TRAN point_one;
COMMIT TRAN my_tran; 
SELECT * FROM Request_warehouse;