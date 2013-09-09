IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'DS1\FreeBorders-Contractors')
CREATE LOGIN [DS1\FreeBorders-Contractors] FROM WINDOWS
GO
CREATE USER [DS1\FreeBorders-Contractors] FOR LOGIN [DS1\FreeBorders-Contractors]
GO
