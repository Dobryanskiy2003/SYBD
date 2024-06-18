/* Создание базы данных TransportBD */
USE master;
Go
IF DB_ID('TransportBD') IS NOT NULL
	DROP DATABASE TransportBD;
GO
CREATE DATABASE TransportBD
ON PRIMARY (NAME = TransportBD_dat, FILENAME = 'D:\SQL\TransportBD\TransportBD.mdf' ,
	SIZE = 5 MB, MAXSIZE = UNLIMITED,
	FILEGROWTH = 1 MB)
LOG ON (NAME = TransportBD_log, FILENAME = 'D:\SQL\TransportBD\TransportBD.ldf',
	SIZE = 1 MB, MAXSIZE = 30 MB,
	FILEGROWTH = 1 MB)
COLLATE Cyrillic_General_CI_AS;
GO