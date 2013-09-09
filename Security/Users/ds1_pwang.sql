IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'ds1\pwang')
CREATE LOGIN [ds1\pwang] FROM WINDOWS
GO
CREATE USER [ds1\pwang] FOR LOGIN [ds1\pwang]
GO
