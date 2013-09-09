IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'DS1\bmcdowell')
CREATE LOGIN [DS1\bmcdowell] FROM WINDOWS
GO
CREATE USER [DS1\bmcdowell] FOR LOGIN [DS1\bmcdowell]
GO
