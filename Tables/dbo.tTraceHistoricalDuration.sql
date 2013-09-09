CREATE TABLE [dbo].[tTraceHistoricalDuration]
(
[RowID] [bigint] NOT NULL IDENTITY(1, 1),
[ObjectName] [nvarchar] (448) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExecutionCount] [int] NULL,
[LastStartTime] [datetime] NULL,
[MinCPU] [int] NULL,
[MinDuration] [bigint] NULL,
[MinReads] [bigint] NULL,
[MinWrites] [bigint] NULL,
[MaxCPU] [int] NULL,
[MaxDuration] [bigint] NULL,
[MaxReads] [bigint] NULL,
[MaxWrites] [bigint] NULL,
[DatabaseName] [nvarchar] (448) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ServerName] [nvarchar] (448) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[InsertDateTime] [datetime] NOT NULL CONSTRAINT [DF_tTraceHistoricalDuration_InsertDateTime] DEFAULT (getdate()),
[UpdateDateTime] [datetime] NOT NULL CONSTRAINT [DF_tTraceHistoricalDuration_UpdateDateTime] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE TRIGGER dbo.tuTraceHistoricalDuration_UpdateAudit
	ON dbo.tTraceHistoricalDuration
FOR UPDATE
AS
-- Keep Audit "Update" audit columns current (reflect data changes) for table: tTraceHistoricalDuration
UPDATE tbl
SET tbl.UpdateDateTime	= CURRENT_TIMESTAMP
FROM dbo.tTraceHistoricalDuration tbl 
JOIN (SELECT *,CHECKSUM(*) AS CSUM FROM inserted) i
	ON tbl.RowID = i.RowID
JOIN (SELECT *,CHECKSUM(*) AS CSUM FROM deleted) d
	ON i.RowID = d.RowID
WHERE i.CSUM != d.CSUM
AND SUSER_SNAME() NOT IN ('sa','PKX\prodsqlsvc')
GO
ALTER TABLE [dbo].[tTraceHistoricalDuration] ADD CONSTRAINT [PK_tTraceHistoricalDuration_RowID] PRIMARY KEY NONCLUSTERED  ([RowID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceHistoricalDuration_DatabaseName] ON [dbo].[tTraceHistoricalDuration] ([DatabaseName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceHistoricalDuration_InsertDateTime] ON [dbo].[tTraceHistoricalDuration] ([InsertDateTime]) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [IX_tTraceHistoricalDuration_MaxDuration] ON [dbo].[tTraceHistoricalDuration] ([MaxDuration] DESC) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceHistoricalDuration_ObjectName] ON [dbo].[tTraceHistoricalDuration] ([ObjectName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceHistoricalDuration_ServerName] ON [dbo].[tTraceHistoricalDuration] ([ServerName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceHistoricalDuration_UpdateDateTime] ON [dbo].[tTraceHistoricalDuration] ([UpdateDateTime]) ON [PRIMARY]
GO
