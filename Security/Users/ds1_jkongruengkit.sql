IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'DS1\jkongruengkit')
CREATE LOGIN [DS1\jkongruengkit] FROM WINDOWS
GO
CREATE USER [ds1\jkongruengkit] FOR LOGIN [DS1\jkongruengkit]
GO
