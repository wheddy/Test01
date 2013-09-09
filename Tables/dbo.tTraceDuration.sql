CREATE TABLE [dbo].[tTraceDuration]
(
[RowID] [bigint] NOT NULL IDENTITY(1, 1),
[TextData] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DatabaseID] [int] NULL,
[TransactionID] [bigint] NULL,
[NTUserName] [nvarchar] (448) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NTDomainName] [nvarchar] (448) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HostName] [nvarchar] (448) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ClientProcessID] [nvarchar] (448) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ApplicationName] [nvarchar] (448) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LoginName] [nvarchar] (448) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SPID] [int] NULL,
[Duration] [bigint] NULL,
[StartTime] [datetime] NULL,
[EndTime] [datetime] NULL,
[Reads] [bigint] NULL,
[Writes] [bigint] NULL,
[CPU] [int] NULL,
[EventSubClass] [int] NULL,
[ObjectID] [int] NULL,
[IndexID] [int] NULL,
[ServerName] [nvarchar] (448) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EventClass] [int] NULL,
[ObjectType] [int] NULL,
[NestLevel] [int] NULL,
[State] [int] NULL,
[Error] [int] NULL,
[ObjectName] [nvarchar] (448) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DatabaseName] [nvarchar] (448) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DBUserName] [nvarchar] (448) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[InsertDateTime] [datetime] NOT NULL CONSTRAINT [DF_tTraceDuration_InsertDateTime] DEFAULT (getdate())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tTraceDuration] ADD CONSTRAINT [PK_tTraceDuration_RowID] PRIMARY KEY NONCLUSTERED  ([RowID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceDuration_DatabaseName] ON [dbo].[tTraceDuration] ([DatabaseName]) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [IX_tTraceDuration_Duration] ON [dbo].[tTraceDuration] ([Duration] DESC) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceDuration_HostName] ON [dbo].[tTraceDuration] ([HostName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceDuration_InsertDateTime] ON [dbo].[tTraceDuration] ([InsertDateTime]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceDuration_LoginName] ON [dbo].[tTraceDuration] ([LoginName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceDuration_ObjectName] ON [dbo].[tTraceDuration] ([ObjectName]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tTraceDuration_ServerName] ON [dbo].[tTraceDuration] ([ServerName]) ON [PRIMARY]
GO
