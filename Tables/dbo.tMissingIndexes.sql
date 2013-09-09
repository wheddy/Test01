CREATE TABLE [dbo].[tMissingIndexes]
(
[DatabaseName] [nvarchar] (448) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TableName] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EqualityColumns] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[InequalityColumns] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IncludedColumns] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UniqueCompiles] [bigint] NULL,
[UserSeeks] [bigint] NULL,
[LastUserSeek] [datetime] NULL,
[AvgTotalUserCost] [float] NULL,
[AvgUserImpact] [float] NULL,
[ServerName] [nvarchar] (448) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[InsertDateTime] [datetime] NOT NULL CONSTRAINT [DF_tMissingIndexes_InsertDateTime] DEFAULT (getdate()),
[InsertDate] AS (CONVERT([char](10),[InsertDateTime],(101)))
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tMissingIndexes_DatabaseName] ON [dbo].[tMissingIndexes] ([DatabaseName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tMissingIndexes_LastUserSeek] ON [dbo].[tMissingIndexes] ([LastUserSeek]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tMissingIndexes_ServerName] ON [dbo].[tMissingIndexes] ([ServerName]) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [IX_tMissingIndexes_TableName] ON [dbo].[tMissingIndexes] ([TableName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tMissingIndexes_UserSeeks] ON [dbo].[tMissingIndexes] ([UserSeeks]) ON [PRIMARY]
GO
