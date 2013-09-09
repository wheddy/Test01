IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'DS1\beddy')
CREATE LOGIN [DS1\beddy] FROM WINDOWS
GO
CREATE USER [DS1\beddy] FOR LOGIN [DS1\beddy]
GO
