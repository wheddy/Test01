IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'TRANSSIS')
CREATE LOGIN [TRANSSIS] WITH PASSWORD = 'p@ssw0rd'
GO
CREATE USER [TRANSSIS] FOR LOGIN [TRANSSIS]
GO