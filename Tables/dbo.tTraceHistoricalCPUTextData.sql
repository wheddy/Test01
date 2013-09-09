CREATE TABLE [dbo].[tTraceHistoricalCPUTextData]
(
[RowID] [bigint] NOT NULL IDENTITY(1, 1),
[TraceHistoricalCPUID] [bigint] NOT NULL,
[TextData] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[InsertDateTime] [datetime] NOT NULL CONSTRAINT [DF_tTraceHistoricalCPUTextData_InsertDateTime] DEFAULT (getdate()),
[UpdateDateTime] [datetime] NOT NULL CONSTRAINT [DF_tTraceHistoricalCPUTextData_UpdateDateTime] DEFAULT (getdate())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE TRIGGER dbo.tuTraceHistoricalCPUTextData_UpdateAudit
	ON dbo.tTraceHistoricalCPUTextData
FOR UPDATE
AS
-- Keep Audit "Update" audit columns current (reflect data changes) for table: tTraceHistoricalCPUTextData
UPDATE tbl
SET tbl.UpdateDateTime	= CURRENT_TIMESTAMP
FROM dbo.tTraceHistoricalCPUTextData tbl 
JOIN (SELECT *,CHECKSUM(*) AS CSUM FROM inserted) i
	ON tbl.RowID = i.RowID
JOIN (SELECT *,CHECKSUM(*) AS CSUM FROM deleted) d
	ON i.RowID = d.RowID
WHERE i.CSUM != d.CSUM
AND SUSER_SNAME() NOT IN ('sa','PKX\prodsqlsvc')
GO
ALTER TABLE [dbo].[tTraceHistoricalCPUTextData] ADD CONSTRAINT [PK_tTraceHistoricalCPUTextData_RowID] PRIMARY KEY NONCLUSTERED  ([RowID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceHistoricalCPUTextData_InsertDateTime] ON [dbo].[tTraceHistoricalCPUTextData] ([InsertDateTime]) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [IX_tTraceHistoricalCPUTextData_TraceHistoricalCPUID] ON [dbo].[tTraceHistoricalCPUTextData] ([TraceHistoricalCPUID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceHistoricalCPUTextData_UpdateDateTime] ON [dbo].[tTraceHistoricalCPUTextData] ([UpdateDateTime]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tTraceHistoricalCPUTextData] ADD CONSTRAINT [FK_tTraceHistoricalCPUTextData_TraceHistoricalCPUID] FOREIGN KEY ([TraceHistoricalCPUID]) REFERENCES [dbo].[tTraceHistoricalCPU] ([RowID])
GO
