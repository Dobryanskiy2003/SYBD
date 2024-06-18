/* Создание базы данных Book */
USE master;
Go
IF DB_ID('Book') IS NOT NULL
	DROP DATABASE Book;
GO
CREATE DATABASE Book
ON PRIMARY (NAME = Book_dat, FILENAME = 'D:\SQL\Book\book.mdf' ,
	SIZE = 5 MB, MAXSIZE = UNLIMITED,
	FILEGROWTH = 1 MB)
LOG ON (NAME = Book_log, FILENAME = 'D:\SQL\Book\book.ldf',
	SIZE = 1 MB, MAXSIZE = 30 MB,
	FILEGROWTH = 1 MB)
COLLATE Cyrillic_General_CI_AS;
GO