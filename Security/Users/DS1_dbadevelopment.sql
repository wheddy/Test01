IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'DS1\DBADevelopment')
CREATE LOGIN [DS1\DBADevelopment] FROM WINDOWS
GO
CREATE USER [DS1\dbadevelopment] FOR LOGIN [DS1\DBADevelopment]
GO
