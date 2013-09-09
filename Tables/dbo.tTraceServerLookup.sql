CREATE TABLE [dbo].[tTraceServerLookup]
(
[ID] [int] NOT NULL,
[ServerInstanceName] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ServerTraceFilePath] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ServerTraceFileName] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EncryptedConnectionString] [varbinary] (512) NOT NULL,
[EncryptedShareUserName] [varbinary] (512) NOT NULL,
[EncryptedSharePassword] [varbinary] (512) NOT NULL,
[AllowCPUTrace] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tTraceServerLookup_AllowCPUTrace] DEFAULT ('Y'),
[AllowDurationTrace] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tTraceServerLookup_AllowDurationTrace] DEFAULT ('Y'),
[AllowApplicationNameTrace] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tTraceServerLookup_AllowApplicationNameTrace] DEFAULT ('Y'),
[CPUTraceSuccessful] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tTraceServerLookup_CPUTraceSuccessful] DEFAULT ('N'),
[DurationTraceSuccessful] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tTraceServerLookup_DurationTraceSuccessful] DEFAULT ('N'),
[ApplicationNameTraceSuccessful] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tTraceServerLookup_ApplicationNameTraceSuccessful] DEFAULT ('N'),
[InsertDateTime] [datetime] NOT NULL CONSTRAINT [DF_tTraceServerLookup_InsertDateTime] DEFAULT (getdate()),
[UpdateDateTime] [datetime] NOT NULL CONSTRAINT [DF_tTraceServerLookup_UpdateDateTime] DEFAULT (getdate()),
[AllowMissingIndexes] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tTraceServerLookup_AllowMissingIndexes] DEFAULT ('N')
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE TRIGGER dbo.tTraceServerLookup_UpdateAudit
	ON dbo.tTraceServerLookup  
FOR UPDATE
AS
-- Keep Audit "Update" audit columns current (reflect data changes) for table: dbo.tTraceServerLookup  
UPDATE	tbl
SET tbl.UpdateDateTime = CURRENT_TIMESTAMP
FROM dbo.tTraceServerLookup   tbl 
JOIN (SELECT *,CHECKSUM(*) AS CSUM FROM inserted) i
	ON tbl.ID = i.ID
JOIN (SELECT *,CHECKSUM(*) AS CSUM FROM deleted) d
	ON i.ID = d.ID
WHERE i.CSUM != d.CSUM
AND SUSER_SNAME() NOT IN ('sa','PKX\prodsqlsvc')
GO
ALTER TABLE [dbo].[tTraceServerLookup] ADD CONSTRAINT [PK_tTraceServerLookup_ID] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tTraceServerLookup] ADD CONSTRAINT [UC_tTraceServerLookup_ServerInstanceName] UNIQUE NONCLUSTERED  ([ServerInstanceName]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tTraceServerLookup] ADD CONSTRAINT [UC_tTraceServerLookup_ServerTraceFileName] UNIQUE NONCLUSTERED  ([ServerTraceFileName]) ON [PRIMARY]
GO
