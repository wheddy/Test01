IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'ds1\dnorton')
CREATE LOGIN [ds1\dnorton] FROM WINDOWS
GO
CREATE USER [ds1\dnorton] FOR LOGIN [ds1\dnorton]
GO
