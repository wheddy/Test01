IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'ltreportingservice')
CREATE LOGIN [ltreportingservice] WITH PASSWORD = 'p@ssw0rd'
GO
CREATE USER [ltReportingService] FOR LOGIN [ltreportingservice]
GO
