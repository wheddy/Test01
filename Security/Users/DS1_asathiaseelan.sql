IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'DS1\asathiaseelan')
CREATE LOGIN [DS1\asathiaseelan] FROM WINDOWS
GO
CREATE USER [DS1\asathiaseelan] FOR LOGIN [DS1\asathiaseelan]
GO
