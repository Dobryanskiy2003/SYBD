/* Создание базы данных Transport2 */
USE master;
Go
IF DB_ID('Transport2') IS NOT NULL
	DROP DATABASE Transport;
GO
CREATE DATABASE Transport2
ON PRIMARY (NAME = Transport2_dat, FILENAME = 'D:\SQL\Transport2\Transport2.mdf' ,
	SIZE = 5 MB, MAXSIZE = UNLIMITED,
	FILEGROWTH = 1 MB)
LOG ON (NAME = Transport2_log, FILENAME = 'D:\SQL\Transport2\Transport2.ldf',
	SIZE = 1 MB, MAXSIZE = 30 MB,
	FILEGROWTH = 1 MB)
COLLATE Cyrillic_General_CI_AS;
GO