CREATE TABLE [dbo].[tTraceHistoricalCPU]
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
[InsertDateTime] [datetime] NOT NULL CONSTRAINT [DF_tTraceHistoricalCPU_InsertDateTime] DEFAULT (getdate()),
[UpdateDateTime] [datetime] NOT NULL CONSTRAINT [DF_tTraceHistoricalCPU_UpdateDateTime] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE TRIGGER dbo.tuTraceHistoricalCPU_UpdateAudit
	ON dbo.tTraceHistoricalCPU
FOR UPDATE
AS
-- Keep Audit "Update" audit columns current (reflect data changes) for table: tTraceHistoricalCPU
UPDATE tbl
SET tbl.UpdateDateTime	= CURRENT_TIMESTAMP
FROM dbo.tTraceHistoricalCPU tbl 
JOIN (SELECT *,CHECKSUM(*) AS CSUM FROM inserted) i
	ON tbl.RowID = i.RowID
JOIN (SELECT *,CHECKSUM(*) AS CSUM FROM deleted) d
	ON i.RowID = d.RowID
WHERE i.CSUM != d.CSUM
AND SUSER_SNAME() NOT IN ('sa','PKX\prodsqlsvc')
GO
ALTER TABLE [dbo].[tTraceHistoricalCPU] ADD CONSTRAINT [PK_tTraceHistoricalCPU_RowID] PRIMARY KEY NONCLUSTERED  ([RowID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceHistoricalCPU_DatabaseName] ON [dbo].[tTraceHistoricalCPU] ([DatabaseName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceHistoricalCPU_InsertDateTime] ON [dbo].[tTraceHistoricalCPU] ([InsertDateTime]) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [IX_tTraceHistoricalCPU_MaxCPU] ON [dbo].[tTraceHistoricalCPU] ([MaxCPU] DESC) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceHistoricalCPU_ObjectName] ON [dbo].[tTraceHistoricalCPU] ([ObjectName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceHistoricalCPU_ServerName] ON [dbo].[tTraceHistoricalCPU] ([ServerName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceHistoricalCPU_UpdateDateTime] ON [dbo].[tTraceHistoricalCPU] ([UpdateDateTime]) ON [PRIMARY]
GO
