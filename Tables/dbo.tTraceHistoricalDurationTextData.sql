CREATE TABLE [dbo].[tTraceHistoricalDurationTextData]
(
[RowID] [bigint] NOT NULL IDENTITY(1, 1),
[TraceHistoricalDurationID] [bigint] NOT NULL,
[TextData] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[InsertDateTime] [datetime] NOT NULL CONSTRAINT [DF_tTraceHistoricalDurationTextData_InsertDateTime] DEFAULT (getdate()),
[UpdateDateTime] [datetime] NOT NULL CONSTRAINT [DF_tTraceHistoricalDurationTextData_UpdateDateTime] DEFAULT (getdate())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE TRIGGER dbo.tuTraceHistoricalDurationTextData_UpdateAudit
	ON dbo.tTraceHistoricalDurationTextData
FOR UPDATE
AS
-- Keep Audit "Update" audit columns current (reflect data changes) for table: tTraceHistoricalDurationTextData
UPDATE tbl
SET tbl.UpdateDateTime	= CURRENT_TIMESTAMP
FROM dbo.tTraceHistoricalDurationTextData tbl 
JOIN (SELECT *,CHECKSUM(*) AS CSUM FROM inserted) i
	ON tbl.RowID = i.RowID
JOIN (SELECT *,CHECKSUM(*) AS CSUM FROM deleted) d
	ON i.RowID = d.RowID
WHERE i.CSUM != d.CSUM
AND SUSER_SNAME() NOT IN ('sa','PKX\prodsqlsvc')
GO
ALTER TABLE [dbo].[tTraceHistoricalDurationTextData] ADD CONSTRAINT [PK_tTraceHistoricalDurationTextData_RowID] PRIMARY KEY NONCLUSTERED  ([RowID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceHistoricalDurationTextData_InsertDateTime] ON [dbo].[tTraceHistoricalDurationTextData] ([InsertDateTime]) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [IX_tTraceHistoricalDurationTextData_TraceHistoricalDurationID] ON [dbo].[tTraceHistoricalDurationTextData] ([TraceHistoricalDurationID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceHistoricalDurationTextData_UpdateDateTime] ON [dbo].[tTraceHistoricalDurationTextData] ([UpdateDateTime]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tTraceHistoricalDurationTextData] ADD CONSTRAINT [FK_tTraceHistoricalDurationTextData_TraceHistoricalDurationID] FOREIGN KEY ([TraceHistoricalDurationID]) REFERENCES [dbo].[tTraceHistoricalDuration] ([RowID])
GO
