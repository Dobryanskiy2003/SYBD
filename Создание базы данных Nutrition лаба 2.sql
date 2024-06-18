/* Создание базы данных Nutrition */
USE master;
Go
IF DB_ID('Nutrition') IS NOT NULL
	DROP DATABASE Nutrition;
GO
CREATE DATABASE Nutrition
ON PRIMARY (NAME = Nutrition_dat, FILENAME = 'D:\SQL\Nutrition\Nutrition.mdf' ,
	SIZE = 5 MB, MAXSIZE = UNLIMITED,
	FILEGROWTH = 1 MB)
LOG ON (NAME = Nutrition_log, FILENAME = 'D:\SQL\Nutrition\Nutrition.ldf',
	SIZE = 1 MB, MAXSIZE = 30 MB,
	FILEGROWTH = 1 MB)
COLLATE Cyrillic_General_CI_AS;
GO