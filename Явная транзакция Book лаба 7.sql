USE Book;
GO
SET NOCOUNT ON;
BEGIN TRAN my_tran
INSERT Catalogs VALUES (6, 'Annapa�ypa'); 
INSERT Catalogs VALUES(7, '������������');
PRINT @@TRANCOUNT;
SAVE TRAN point_one;
INSERT Catalogs VALUES (8, 'Web-������'); 
ROLLBACK TRAN point_one;
COMMIT TRAN my_tran; 
SELECT * FROM Catalogs;