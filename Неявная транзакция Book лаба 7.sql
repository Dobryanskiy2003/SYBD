SET IMPLICIT_TRANSACTIONS ON;
SET NOCOUNT ON;
USE Book;
GO
INSERT Catalogs VALUES (9, 'Математика'); 
INSERT Catalogs VALUES(10, 'Обществознание'); 
PRINT @@TRANCOUNT;
SAVE TRAN point_one;
INSERT Catalogs VALUES (11, 'Web-дизайн'); 
ROLLBACK TRAN point_one;
COMMIT TRAN;
PRINT @@TRANCOUNT;
SELECT * FROM Catalogs;