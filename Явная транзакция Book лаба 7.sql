USE Book;
GO
SET NOCOUNT ON;
BEGIN TRAN my_tran
INSERT Catalogs VALUES (6, 'Annapaтypa'); 
INSERT Catalogs VALUES(7, 'Безопасность');
PRINT @@TRANCOUNT;
SAVE TRAN point_one;
INSERT Catalogs VALUES (8, 'Web-дизайн'); 
ROLLBACK TRAN point_one;
COMMIT TRAN my_tran; 
SELECT * FROM Catalogs;