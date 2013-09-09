IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'DS1\rdavenport')
CREATE LOGIN [DS1\rdavenport] FROM WINDOWS
GO
CREATE USER [DS1\rdavenport] FOR LOGIN [DS1\rdavenport]
GO
