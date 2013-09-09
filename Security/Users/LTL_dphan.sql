IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'LTL\dphan')
CREATE LOGIN [LTL\dphan] FROM WINDOWS
GO
CREATE USER [LTL\dphan] FOR LOGIN [LTL\dphan]
GO
