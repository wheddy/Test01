IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'DS1\kgibson')
CREATE LOGIN [DS1\kgibson] FROM WINDOWS
GO
CREATE USER [DS1\kgibson] FOR LOGIN [DS1\kgibson]
GO
