SET IMPLICIT_TRANSACTIONS ON;
SET NOCOUNT ON;
USE Book;
GO
INSERT Catalogs VALUES (9, '����������'); 
INSERT Catalogs VALUES(10, '��������������'); 
PRINT @@TRANCOUNT;
SAVE TRAN point_one;
INSERT Catalogs VALUES (11, 'Web-������'); 
ROLLBACK TRAN point_one;
COMMIT TRAN;
PRINT @@TRANCOUNT;
SELECT * FROM Catalogs;